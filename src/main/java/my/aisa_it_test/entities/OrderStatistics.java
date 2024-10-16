package my.aisa_it_test.entities;

import jakarta.persistence.*;
import lombok.Data;
import my.aisa_it_test.entities.id.OrderStatisticsId;

import java.time.LocalDateTime;

@Entity
@Table(name = "order_statistics")
@IdClass(OrderStatisticsId.class)
@Data
public class OrderStatistics {
    @Id
    @GeneratedValue
    private Long id;

    @Id
    @Column(name = "date_time")
    private LocalDateTime dateTime;

    @ManyToOne
    private Recipe recipe;
}
