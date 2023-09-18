package com.example.buysell.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "products")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "cafe")
    private int cafe;
    @Column(name = "name")
    private String name;
    @Column(name = "structure")
    private String structure;
    @Column(name = "weight")
    private float weight;
}
