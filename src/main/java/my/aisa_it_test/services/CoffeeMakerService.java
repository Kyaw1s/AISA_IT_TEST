package my.aisa_it_test.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CoffeeMakerService {
    private final RecipeService recipeService;
    private final OrderStatisticsService orderStatisticsService;

    public void make(String recipeName) {
        recipeService.apply(recipeName);
        orderStatisticsService.createOrdersStatistics(recipeName);
    }
}
