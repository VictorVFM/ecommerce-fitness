package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.model.Ingredient;
import com.victorhugo.ecommercefitness.repositories.IngredientRepository;
import com.victorhugo.ecommercefitness.service.exceptions.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class IngredientService {

    @Autowired
    private IngredientRepository ingredientRepository;

    public List<Ingredient> findAll() {
        return ingredientRepository.findByStatusTrue();
    }

    public Ingredient findById(Long id) {
        Optional<Ingredient> optionalIngredient = ingredientRepository.findById(id);
        return optionalIngredient.orElseThrow(() -> new ResourceNotFoundException(id, "Ingredient"));
    }

    public Ingredient create(Ingredient ingredient) {
        return ingredientRepository.save(ingredient);
    }

    public void delete(Long id) {
        Optional<Ingredient> obj = ingredientRepository.findById(id);
        if(obj.isPresent()){
            ingredientRepository.delete(id);
        } else {
            throw new ResourceNotFoundException(id, "Ingredient");
        }
    }

    public Ingredient update(Long id, Ingredient ingredient) {
        Optional<Ingredient> optionalIngredient = ingredientRepository.findById(id);
        if (optionalIngredient.isPresent()) {
            Ingredient entity = optionalIngredient.get();
            updateData(entity, ingredient);
            return ingredientRepository.save(entity);
        } else {
            throw new ResourceNotFoundException(id, "Ingredient");
        }
    }

    private void updateData(Ingredient entity, Ingredient newIngredient) {
        entity.setName(newIngredient.getName());
        entity.setId_Supplier(newIngredient.getId_Supplier());
        entity.setQuantity(newIngredient.getQuantity());
        entity.setStatus(newIngredient.getStatus());
    }
}