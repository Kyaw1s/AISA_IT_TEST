package my.aisa_it_test.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Data
@Table(name = "recipes")
public class Recipe {
    @Id
    @GeneratedValue
    private Long id;

    private String name;
    @ManyToMany
    private List<RecipeIngredient> ingredients;
}
