package my.aisa_it_test.entities.id;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class OrderStatisticsId implements Serializable {
    private Long id;
    private LocalDateTime dateTime;
}
