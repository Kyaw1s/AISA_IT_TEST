package my.aisa_it_test.services;

import lombok.RequiredArgsConstructor;
import my.aisa_it_test.entities.Recipe;
import my.aisa_it_test.entities.RecipeStatistics;
import my.aisa_it_test.repositories.RecipeStatisticsRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class RecipeStatisticsService {
    private final RecipeStatisticsRepository recipeStatisticsRepository;

    public RecipeStatistics getBestRecipeStatistics() {
        var best = recipeStatisticsRepository.findTopByOrderByPreparationNumberDesc();

        if (best.isPresent()) {
            return best.get();
        }

        throw new RuntimeException("There is no best recipe statistics");
    }

    @Transactional
    public void addRecipeStatistics(Recipe recipe) {
        RecipeStatistics recipeStatistics = new RecipeStatistics();
        recipeStatistics.setRecipe(recipe);

        recipeStatisticsRepository.save(recipeStatistics);
    }

    @Transactional
    public void increaseRecipePreparationNumber(Recipe recipe) {
        var recipeStatistics = recipeStatisticsRepository.findByRecipe(recipe);
        recipeStatistics.increasePreparationNumber();
        recipeStatisticsRepository.save(recipeStatistics);
    }
}
