package com.victorhugo.ecommercefitness.controller;

import com.victorhugo.ecommercefitness.model.Ingredient;
import com.victorhugo.ecommercefitness.service.IngredientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/ingredients")
public class IngredientController {

    @Autowired
    private IngredientService ingredientService;


    @PostMapping
    public ResponseEntity<Ingredient> create(@RequestBody Ingredient ingredient){
        Ingredient createdIngredient = ingredientService.create(ingredient);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdIngredient);
    }


    @GetMapping
    public ResponseEntity<List<Ingredient>> findAll(){
        List<Ingredient> ingredients = ingredientService.findAll();
        return ResponseEntity.ok(ingredients);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Ingredient> findById(@PathVariable Long id){
        Ingredient ingredient = ingredientService.findById(id);
        return ResponseEntity.ok(ingredient);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Ingredient> update(@PathVariable Long id, @RequestBody Ingredient ingredient){
        Ingredient updatedIngredient = ingredientService.update(id, ingredient);
        return ResponseEntity.ok(updatedIngredient);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        ingredientService.delete(id);
        return ResponseEntity.noContent().build();
    }

}
