package my.aisa_it_test.services;

import lombok.RequiredArgsConstructor;
import my.aisa_it_test.dto.RecipeOrdersStatisticsDTO;
import my.aisa_it_test.entities.OrderStatistics;
import my.aisa_it_test.entities.Recipe;
import my.aisa_it_test.repositories.OrderStatisticsRepository;
import my.aisa_it_test.repositories.RecipeRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class OrderStatisticsService {
    private final OrderStatisticsRepository orderStatisticsRepository;
    private final RecipeRepository recipeRepository;
    private final RecipeService recipeService;

    public RecipeOrdersStatisticsDTO getMostPopularRecipe() {
        RecipeOrdersStatisticsDTO mostPopular = getRecipesOrdersNumberDesc().get(0);

        if(mostPopular == null) {
            mostPopular = new RecipeOrdersStatisticsDTO("", 0L);
        }

        return mostPopular;
    }

    public List<RecipeOrdersStatisticsDTO> getRecipesOrdersNumberDesc() {
        return recipeRepository.findRecipesOrdersNumberDesc();
    }

    public void createOrdersStatistics(String recipeName) {
        Optional<Recipe> recipe = recipeService.findByName(recipeName);

        if(recipe.isEmpty()) {
            throw new RuntimeException("recipe not found");
        }

        OrderStatistics orderStatistics = new OrderStatistics();
        orderStatistics.setRecipe(recipe.get());
        orderStatistics.setDateTime(LocalDateTime.now());

        orderStatisticsRepository.save(orderStatistics);
    }
}
