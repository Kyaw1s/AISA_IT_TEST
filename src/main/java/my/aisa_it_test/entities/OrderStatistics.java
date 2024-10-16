package my.aisa_it_test.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Table(name = "order_statistics")
@Data
public class OrderStatistics {
    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "date_time")
    private LocalDateTime dateTime;

    @ManyToOne
    private Recipe recipe;
}
