package com.victorhugo.ecommercefitness.controller;

import com.victorhugo.ecommercefitness.model.Food;
import com.victorhugo.ecommercefitness.model.Ingredient;
import com.victorhugo.ecommercefitness.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/foods")
public class FoodController {

    @Autowired
    private FoodService foodService;

    @PostMapping
    public ResponseEntity<Food> create(@RequestBody Food food){
        Food createdFood = foodService.create(food);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdFood);
    }

    @GetMapping
    public ResponseEntity<List<Food>> findAll(){
        List<Food> foods = foodService.findAll();
        return ResponseEntity.ok(foods);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Food> findById(@PathVariable Long id){
        Food food = foodService.findById(id);
        return ResponseEntity.ok(food);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Food> update(@PathVariable Long id, @RequestBody Food food){
        Food updatedFood = foodService.update(id, food);
        return ResponseEntity.ok(updatedFood);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        foodService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
