package my.aisa_it_test.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import lombok.Data;

@Entity
@Data
@Table(name = "ingredients")
public class Ingredient {
    @Id
    @GeneratedValue
    private Long id;
    private String name;
    @Min(0)
    private Long gramsAvailable;

    public void increaseAvailableGrams(Long quantityInGrams) {
        gramsAvailable += quantityInGrams;
    }
}
