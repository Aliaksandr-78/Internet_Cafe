package com.example.buysell.controllers;

import com.example.buysell.models.Desk;
import com.example.buysell.services.DeskService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class DeskController {
    private final DeskService deskService;
    public int ica;

    @GetMapping("/desk/main")
    public String tables(@RequestParam(name = "cafe", required = false) int cafe, Principal principal, Model model){
        ica = cafe;
        model.addAttribute("desks", deskService.listTables(ica));
        model.addAttribute("user", deskService.getUserByPrincipal(principal));
        return "desks";
    }

    @GetMapping("/desk/{id}")
    public String tableInfo(@PathVariable Long id, Principal principal, Model model){
        model.addAttribute("desk", deskService.getDeskById(id));
        model.addAttribute("user", deskService.getUserByPrincipal(principal));
        return "desk-info";
    }

    @PostMapping("/desk/create")
    public String createDesk(Desk desk){
        deskService.saveDesk(desk, ica);
        return "redirect:/desk/main?cafe="+ica;
    }

    @PostMapping("/desk/delete/{id}")
    public String deleteDesk(@PathVariable Long id){
        deskService.deleteDesk(id);
        return "redirect:/desk/main?cafe="+ica;
    }

    @PostMapping("/desk/occupy/{id}/{user}")
    public String occupyDesk(@PathVariable Long id, @PathVariable String user) {
        deskService.occupyDesk(id, user);
        return "redirect:/desk/main?cafe="+ica;
    }

    @PostMapping("/desk/clear/{id}")
    public String clearDesk(@PathVariable Long id) {
        deskService.clearDesk(id);
        return "redirect:/desk/main?cafe="+ica;
    }
}
