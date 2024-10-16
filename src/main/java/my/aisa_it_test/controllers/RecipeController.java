package my.aisa_it_test.controllers;

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

    @PostMapping
    public ResponseEntity<String> createRecipe(@RequestBody RecipeDTO recipeDTO) {
        recipeService.add(recipeDTO);
        return ResponseEntity.ok("Recipe added");
    }
}
