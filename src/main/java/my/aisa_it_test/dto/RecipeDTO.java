package my.aisa_it_test.dto;

import lombok.Data;

import java.util.List;

@Data
public class RecipeDTO {
    private String name;
    private List<IngredientDTO> ingredients;
}
