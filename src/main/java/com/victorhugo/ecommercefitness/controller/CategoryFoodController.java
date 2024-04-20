package com.victorhugo.ecommercefitness.controller;

import com.victorhugo.ecommercefitness.model.CategoryFood;
import com.victorhugo.ecommercefitness.model.Ingredient;
import com.victorhugo.ecommercefitness.repositories.CategoryFoodRepository;
import com.victorhugo.ecommercefitness.service.CategoryFoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/categoriesFood")
public class CategoryFoodController {

    @Autowired
    private CategoryFoodService categoryFoodService;

    @PostMapping
    public ResponseEntity<CategoryFood> create(@RequestBody CategoryFood categoryFood){
        CategoryFood createdCategoryFood = categoryFoodService.create(categoryFood);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdCategoryFood);
    }

    @GetMapping
    public ResponseEntity<List<CategoryFood>> findAll(){
        List<CategoryFood> categoriesFood = categoryFoodService.findAll();
        return ResponseEntity.ok(categoriesFood);
    }

    @GetMapping("/{id}")
    public ResponseEntity<CategoryFood> findById(@PathVariable Long id){
        CategoryFood categoryFood = categoryFoodService.findById(id);
        return ResponseEntity.ok(categoryFood);
    }

    @PutMapping("/{id}")
    public ResponseEntity<CategoryFood> update(@PathVariable Long id, @RequestBody CategoryFood categoryFood){
        CategoryFood updatedCategoryFood = categoryFoodService.update(id, categoryFood);
        return ResponseEntity.ok(updatedCategoryFood);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        categoryFoodService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
