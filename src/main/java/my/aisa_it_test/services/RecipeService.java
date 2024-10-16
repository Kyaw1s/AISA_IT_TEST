package my.aisa_it_test.services;

import lombok.RequiredArgsConstructor;
import my.aisa_it_test.dto.IngredientDTO;
import my.aisa_it_test.dto.RecipeDTO;
import my.aisa_it_test.entities.Ingredient;
import my.aisa_it_test.entities.Recipe;
import my.aisa_it_test.entities.RecipeIngredient;
import my.aisa_it_test.entities.RecipeStatistics;
import my.aisa_it_test.repositories.IngredientRepository;
import my.aisa_it_test.repositories.RecipeIngredientRepository;
import my.aisa_it_test.repositories.RecipeRepository;
import my.aisa_it_test.repositories.RecipeStatisticsRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class RecipeService {
    private final RecipeRepository recipeRepository;
    private final IngredientRepository ingredientRepository;
    private final RecipeIngredientRepository recipeIngredientRepository;
    private final IngredientService ingredientService;
    private final RecipeStatisticsService recipeStatisticsService;

    @Transactional
    public void add(RecipeDTO recipeDTO) {
        if(recipeRepository.existsByName(recipeDTO.getName())) {
            throw new RuntimeException("recipe already exists");
        }

        Recipe recipe = new Recipe();

        var ingredients = recipeDTO.getIngredients();
        List<RecipeIngredient> recipeIngredients = new ArrayList<>(ingredients.size());

        for(IngredientDTO ingredientDTO : ingredients) {
            Optional<Ingredient> optionalIngredient = ingredientRepository.findByName(ingredientDTO.getName());

            if(optionalIngredient.isEmpty()) {
                throw new RuntimeException("ingredient not found");
            }

            RecipeIngredient recipeIngredient = new RecipeIngredient();
            recipeIngredient.setQuantityInGrams(ingredientDTO.getQuantityInGrams());
            recipeIngredient.setIngredient(optionalIngredient.get());

            recipeIngredientRepository.save(recipeIngredient);
            recipeIngredients.add(recipeIngredient);
        }

        recipe.setIngredients(recipeIngredients);
        recipe.setName(recipeDTO.getName());
        recipeRepository.save(recipe);

        recipeStatisticsService.addRecipeStatistics(recipe);
    }

    @Transactional
    public void apply(String recipeName) {
        Optional<Recipe> recipe = recipeRepository.findByName(recipeName);
        if(recipe.isEmpty()) {
            throw new RuntimeException("recipe not found");
        }

        ingredientService.spendAvailableGrams(recipe.get());
        recipeStatisticsService.increaseRecipePreparationNumber(recipe.get());
    }
}
