package my.aisa_it_test.services;

import lombok.RequiredArgsConstructor;
import my.aisa_it_test.entities.Ingredient;
import my.aisa_it_test.entities.Recipe;
import my.aisa_it_test.exceptions.InsufficientGramsException;
import my.aisa_it_test.repositories.IngredientRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class IngredientService {
    private final IngredientRepository ingredientRepository;

    public Optional<Ingredient> findByName(String name) {
        return ingredientRepository.findByName(name);
    }

    public boolean ingredientExists(String name) {
        return ingredientRepository.existsByName(name);
    }

    @Transactional
    public void addIngredient(String name, Long quantityInGrams) {
        if(ingredientExists(name)) {
            throw new RuntimeException("Ingredient already exists");
        }

        Ingredient ingredient = new Ingredient();
        ingredient.setName(name);
        ingredient.setGramsAvailable(quantityInGrams);

        ingredientRepository.save(ingredient);
    }

    @Transactional
    public void increaseAvailableGrams(String name, Long quantityInGrams) {
        Optional<Ingredient> optionalIngredient = ingredientRepository.findByName(name);
        if(optionalIngredient.isEmpty()) {
            throw new RuntimeException("Ingredient does not exist");
        }

        Ingredient ingredient = optionalIngredient.get();
        ingredient.increaseAvailableGrams(quantityInGrams);

        ingredientRepository.save(ingredient);
    }

    @Transactional
    public void spendAvailableGrams(Recipe recipe) {
        var recipeIngredients = recipe.getIngredients();
        for(var recipeIngredient : recipeIngredients) {
            var ingredient = recipeIngredient.getIngredient();

            Long gramsInRecipe = recipeIngredient.getQuantityInGrams();
            Long availableGrams = ingredient.getGramsAvailable();

            if(gramsInRecipe <= availableGrams) {
                ingredient.setGramsAvailable(availableGrams - gramsInRecipe);
                ingredientRepository.save(ingredient);
            } else {
                throw new InsufficientGramsException("There are not enough available grams for the ingredient: "
                        + ingredient.getName());
            }
        }
    }
}
