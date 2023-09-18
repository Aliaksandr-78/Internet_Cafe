package com.example.buysell.repositories;

import com.example.buysell.models.Placement;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PlacementRepository extends JpaRepository<Placement, Long> {
    List<Placement> findByAddress(String address);
}
