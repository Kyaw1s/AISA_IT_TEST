package my.aisa_it_test.repositories;

import my.aisa_it_test.entities.Recipe;
import my.aisa_it_test.entities.RecipeStatistics;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface RecipeStatisticsRepository extends CrudRepository<RecipeStatistics, Long> {
    Optional<RecipeStatistics> findTopByOrderByPreparationNumberDesc();
    RecipeStatistics findByRecipe(Recipe recipe);
}
