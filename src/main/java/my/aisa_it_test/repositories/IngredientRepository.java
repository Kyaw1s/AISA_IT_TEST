package my.aisa_it_test.repositories;


import my.aisa_it_test.entities.Ingredient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface IngredientRepository extends CrudRepository<Ingredient, Long> {
    boolean existsByName(String name);
    Optional<Ingredient> findByName(String name);
}
