package my.aisa_it_test.repositories;

import my.aisa_it_test.dto.RecipeOrdersStatisticsDTO;
import my.aisa_it_test.entities.Recipe;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface RecipeRepository extends CrudRepository<Recipe, Long> {
    boolean existsByName(String name);
    Optional<Recipe> findByName(String name);

    @Query("select new my.aisa_it_test.dto.RecipeOrdersStatisticsDTO(r.name, count(os.id)) " +
            "from Recipe r left join OrderStatistics os " +
            "on r = os.recipe " +
            "group by r " +
            "order by count(os.id) desc")
    List<RecipeOrdersStatisticsDTO> findRecipesOrdersNumberDesc();
}
