package com.example.buysell.controllers;

import com.example.buysell.models.Product;
import com.example.buysell.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;
    private int ica;

    @GetMapping("/product/main")
    public String products(@RequestParam(name = "cafe", required = false) int cafe, Principal principal, Model model){
        ica = cafe;
        model.addAttribute("products", productService.listProducts(ica));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "products";
    }

    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable Long id, Principal principal, Model model){
        model.addAttribute("product", productService.getProductById(id));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "product-info";
    }

    @PostMapping("/product/create")
    public String createProduct(Product product){
        productService.saveProduct(product, ica);
        return "redirect:/product/main?cafe="+ica;
    }

    @DeleteMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id){
        productService.deleteProduct(id);
        return "redirect:/product/main?cafe="+ica;
    }
}
