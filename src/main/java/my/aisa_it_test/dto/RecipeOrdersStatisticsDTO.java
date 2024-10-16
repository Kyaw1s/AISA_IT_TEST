package my.aisa_it_test.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class RecipeOrdersStatisticsDTO {
    private String recipeName;
    private Long ordersNumber;
}
