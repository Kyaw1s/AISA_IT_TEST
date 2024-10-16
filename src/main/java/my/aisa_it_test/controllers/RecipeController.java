package my.aisa_it_test.controllers;

import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import my.aisa_it_test.dto.RecipeDTO;
import my.aisa_it_test.services.RecipeService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/recipe")
@RequiredArgsConstructor
public class RecipeController {
    private final RecipeService recipeService;

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Successful response"),
            @ApiResponse(responseCode = "400", description = "Recipe already exists or some ingredients does not exists")
    })
    @PostMapping
    public ResponseEntity<String> createRecipe(@RequestBody RecipeDTO recipeDTO) {
        recipeService.add(recipeDTO);
        return ResponseEntity.ok("Recipe added");
    }
}
