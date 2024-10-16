package my.aisa_it_test.entities;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "recipe_statistics")
@Data
public class RecipeStatistics {
    @Id
    @GeneratedValue
    private Long id;

    @OneToOne
    private Recipe recipe;

    private Long preparationNumber = 0L;

    public void increasePreparationNumber() {
        preparationNumber++;
    }
}
