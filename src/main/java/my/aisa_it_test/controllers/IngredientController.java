package my.aisa_it_test.controllers;

import lombok.RequiredArgsConstructor;
import my.aisa_it_test.dto.IngredientDTO;
import my.aisa_it_test.services.IngredientService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController()
@RequestMapping("/ingredients")
@RequiredArgsConstructor
public class IngredientController {
    private final IngredientService ingredientService;


    @PostMapping
    public ResponseEntity<String> addIngredient(@RequestBody IngredientDTO ingredientDTO) {
        ingredientService.addIngredient(ingredientDTO.getName(), ingredientDTO.getQuantityInGrams());
        return ResponseEntity.ok("Ingredient added");
    }

    @PatchMapping("/increase")
    public ResponseEntity<String> increaseQuantityInGrams(@RequestBody IngredientDTO ingredientDTO) {
        ingredientService.increaseAvailableGrams(ingredientDTO.getName(), ingredientDTO.getQuantityInGrams());
        return ResponseEntity.ok("The number has been increased");
    }
}
