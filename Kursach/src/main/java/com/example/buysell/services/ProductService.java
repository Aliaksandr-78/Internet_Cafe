package com.example.buysell.services;

import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.repositories.ProductRepository;
import com.example.buysell.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public List<Product> listProducts(int cafe) {
        if (cafe != 0) return productRepository.findByCafe(cafe);
        return productRepository.findAll();
    }

    public void saveProduct(Product product, int ica) {
        product.setCafe(ica);
        log.info("Saving new {}", product);
        productRepository.save(product);
    }

    public User getUserByPrincipal(Principal principal){
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteProduct(Long id){ productRepository.deleteById(id); }

    public Product getProductById(Long id){ return productRepository.findById(id).orElse(null); }
}
