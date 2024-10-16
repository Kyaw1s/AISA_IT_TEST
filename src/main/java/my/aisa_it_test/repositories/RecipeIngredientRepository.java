package my.aisa_it_test.repositories;

import my.aisa_it_test.entities.RecipeIngredient;
import org.springframework.data.repository.CrudRepository;

public interface RecipeIngredientRepository extends CrudRepository<RecipeIngredient, Long> {
}
