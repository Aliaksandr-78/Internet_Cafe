package com.example.buysell.controllers;

import com.example.buysell.models.Placement;
import com.example.buysell.services.PlacementService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class PlacementController {
    private final PlacementService placementService;

    @GetMapping("/placement")
    public String placements(@RequestParam(name = "searchWord", required = false) String address, Principal principal, Model model){
        model.addAttribute("placements", placementService.listPlacements(address));
        model.addAttribute("user", placementService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", address);
        return "placements";
    }

    @GetMapping("/placement/{id}")
    public String placementInfo(@PathVariable Long id, Principal principal, Model model){
        model.addAttribute("placement", placementService.getPlacementById(id));
        model.addAttribute("user", placementService.getUserByPrincipal(principal));
        return "placement-info";
    }

    @PostMapping("/placement/create")
    public String createPlacement(Placement placement){
        placementService.savePlacement(placement);
        return "redirect:/placement";
    }

    @PostMapping("/placement/delete/{id}")
    public String deletePlacement(@PathVariable Long id){
        placementService.deletePlacement(id);
        return "redirect:/placement";
    }
}
