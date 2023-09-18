package com.example.buysell.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "desks")
@Builder
@Getter
@Setter
@EqualsAndHashCode(exclude = {
        "placement"
})
@ToString(exclude = {
        "placement"
})
@AllArgsConstructor
@NoArgsConstructor
public class Desk {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column(name = "cafe")
    private int cafe;

    @Column(name = "number")
    private int number;

    @Column(name = "status")
    private String status;

    @Column(name = "category")
    private String category;

    @Column(name = "user")
    private String user;

    @ManyToOne
    @JoinColumn(name = "id_placement")
    @JsonBackReference
    private Placement placement;

}
