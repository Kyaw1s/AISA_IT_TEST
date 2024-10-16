package my.aisa_it_test.dto;

import lombok.Data;

@Data
public class IngredientDTO {
    private String name;
    private Long quantityInGrams = 0L;
}
