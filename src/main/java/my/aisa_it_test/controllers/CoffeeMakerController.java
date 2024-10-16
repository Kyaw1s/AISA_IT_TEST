package my.aisa_it_test.controllers;

import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import my.aisa_it_test.services.CoffeeMakerService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/coffee-maker")
@RequiredArgsConstructor
public class CoffeeMakerController {
    private final CoffeeMakerService coffeeMakerService;

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Successful response"),
            @ApiResponse(responseCode = "400", description = "The recipe has not been found or the ingredients are insufficient")
    })
    @PostMapping("/{coffee-name}")
    public ResponseEntity<String> makeCoffee(@PathVariable("coffee-name") String coffeeName) {
        coffeeMakerService.make(coffeeName);
        return ResponseEntity.ok(coffeeName + " done!");
    }
}
