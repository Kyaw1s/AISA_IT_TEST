package my.aisa_it_test.controllers;

import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import my.aisa_it_test.dto.IngredientDTO;
import my.aisa_it_test.dto.QuantityDTO;
import my.aisa_it_test.services.IngredientService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/ingredients")
@RequiredArgsConstructor
public class IngredientController {
    private final IngredientService ingredientService;

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Successful response"),
            @ApiResponse(responseCode = "400", description = "Ingredient already exists")
    })
    @PostMapping
    public ResponseEntity<String> addIngredient(@RequestBody IngredientDTO ingredientDTO) {
        ingredientService.addIngredient(ingredientDTO.getName(), ingredientDTO.getQuantityInGrams());
        return ResponseEntity.ok("Ingredient added");
    }

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Successful response"),
            @ApiResponse(responseCode = "400", description = "Ingredient does not exists")
    })
    @PatchMapping("/{name}")
    public ResponseEntity<String> increaseQuantityInGrams(@PathVariable String name, @RequestBody QuantityDTO quantityDTO) {
        ingredientService.increaseAvailableGrams(name, quantityDTO.getQuantityInGrams());
        return ResponseEntity.ok("The number has been increased");
    }
}
