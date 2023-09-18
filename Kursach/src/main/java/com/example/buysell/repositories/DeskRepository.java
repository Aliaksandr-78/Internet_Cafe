package com.example.buysell.repositories;

import com.example.buysell.models.Desk;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DeskRepository extends JpaRepository<Desk, Long> {
    List<Desk> findByCafe( int cafe );
}
