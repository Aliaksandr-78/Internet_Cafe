package com.example.buysell.services;

import com.example.buysell.models.Placement;
import com.example.buysell.models.User;
import com.example.buysell.repositories.PlacementRepository;
import com.example.buysell.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class PlacementService {
    private final PlacementRepository placementRepository;
    private final UserRepository userRepository;
    public List<Placement> listPlacements(String address) {
        if (address != null) return placementRepository.findByAddress(address);
        return placementRepository.findAll();
    }

    public void savePlacement(Placement placement){
        log.info("Saving new {}", placement);
        placementRepository.save(placement);
    }

    public User getUserByPrincipal(Principal principal){
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deletePlacement(Long id){

        placementRepository.deleteById(id);
    }

    public Placement getPlacementById(Long id){
        return placementRepository.findById(id).orElse(null);
    }
}
