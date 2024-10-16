package my.aisa_it_test.controllers;

import lombok.RequiredArgsConstructor;
import my.aisa_it_test.services.CoffeeMakerService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/coffee-maker")
@RequiredArgsConstructor
public class CoffeeMakerController {
    private final CoffeeMakerService coffeeMakerService;

    @GetMapping("/{coffee-name}")
    public ResponseEntity<String> makeCoffee(@PathVariable("coffee-name") String coffeeName) {
        coffeeMakerService.make(coffeeName);
        return ResponseEntity.ok(coffeeName + " done!");
    }
}
