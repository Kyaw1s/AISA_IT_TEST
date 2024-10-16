package my.aisa_it_test.controllers;

import lombok.RequiredArgsConstructor;
import my.aisa_it_test.services.RecipeStatisticsService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/recipe/statistics")
public class RecipeStatisticsController {
    private final RecipeStatisticsService recipeStatisticsService;

    @GetMapping("/best")
    public ResponseEntity<String> getBestRecipe() {
        var statistics = recipeStatisticsService.getBestRecipeStatistics();
        return ResponseEntity.ok(String.format("The %s was made %d times", statistics.getRecipe().getName(),
                statistics.getPreparationNumber()));
    }
}
