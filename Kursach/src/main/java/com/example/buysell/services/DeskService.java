package com.example.buysell.services;

import com.example.buysell.models.Desk;
import com.example.buysell.models.User;
import com.example.buysell.repositories.DeskRepository;
import com.example.buysell.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class DeskService {
    private final DeskRepository deskRepository;
    private final UserRepository userRepository;
    public List<Desk> listTables(int cafe) {
        if (cafe != 0) return deskRepository.findByCafe(cafe);
        else return deskRepository.findAll();
    }

    public void saveDesk(Desk desk, int ica) {
        desk.setCafe(ica);
        log.info("Saving new {}", desk);
        deskRepository.save(desk);
    }

    public User getUserByPrincipal(Principal principal){
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void occupyDesk(Long id, String user) {
        Desk desk = deskRepository.findById(id).orElse(null);
        if (desk != null) {
            desk.setStatus("занят");
            desk.setUser(user);
            log.info("Table number = {} occupied", desk.getNumber());
        }
        deskRepository.save(desk);
    }

    public  void clearDesk(Long id) {
        Desk desk = deskRepository.findById(id).orElse(null);
        if(desk != null){
            desk.setStatus("свободен");
            desk.setUser(null);
            log.info("Table number = {} clear", desk.getNumber());
        }
        deskRepository.save(desk);
    }

    public void deleteDesk(Long id){
        deskRepository.deleteById(id);
    }

    public Desk getDeskById(Long id){ return deskRepository.findById(id).orElse(null); }
}
