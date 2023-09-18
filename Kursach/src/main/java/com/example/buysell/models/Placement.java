package com.example.buysell.models;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.persistence.Table;
import lombok.*;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;


@Entity
@Table(name = "placements")
@Builder
@Getter
@Setter
@EqualsAndHashCode(exclude = {
        "desks"
})
@ToString(exclude = {
        "desks"
})
@AllArgsConstructor
@NoArgsConstructor
public class Placement {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column(name = "address")
    private String address;

    @OneToMany(mappedBy = "placement", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonManagedReference
    private Set<Desk> desks = new HashSet<>();
}
