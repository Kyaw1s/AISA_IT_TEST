package my.aisa_it_test.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CoffeeMakerService {
    private final RecipeService recipeService;
    private final OrderStatisticsService orderStatisticsService;

    @Transactional
    public void make(String recipeName) {
        recipeService.apply(recipeName);
        orderStatisticsService.createOrdersStatistics(recipeName);
    }
}
