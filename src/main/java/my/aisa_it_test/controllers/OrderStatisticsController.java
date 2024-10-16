package my.aisa_it_test.controllers;

import lombok.RequiredArgsConstructor;
import my.aisa_it_test.dto.RecipeOrdersStatisticsDTO;
import my.aisa_it_test.services.OrderStatisticsService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/orders/statistics")
public class OrderStatisticsController {
    private final OrderStatisticsService orderStatisticsService;

    @GetMapping("/most-popular")
    public ResponseEntity<RecipeOrdersStatisticsDTO> getMostPopularRecipe() {
        return ResponseEntity.ok(orderStatisticsService.getMostPopularRecipe());
    }

    @GetMapping
    public ResponseEntity<List<RecipeOrdersStatisticsDTO>> getMostPopularRecipeList() {
        return ResponseEntity.ok(orderStatisticsService.getRecipesOrdersNumberDesc());
    }
}
