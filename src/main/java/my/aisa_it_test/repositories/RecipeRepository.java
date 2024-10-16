package my.aisa_it_test.repositories;

import my.aisa_it_test.entities.Recipe;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface RecipeRepository extends CrudRepository<Recipe, Long> {
    boolean existsByName(String name);
    Optional<Recipe> findByName(String name);
}
