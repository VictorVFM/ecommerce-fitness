package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.model.Food;
import com.victorhugo.ecommercefitness.model.Ingredient;
import com.victorhugo.ecommercefitness.repositories.FoodRepository;
import com.victorhugo.ecommercefitness.service.exceptions.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FoodService {

    @Autowired
    private FoodRepository foodRepository;

    public List<Food> findAll() {
        return foodRepository.findByStatusTrue();
    }

    public Food findById(Long id) {
        Optional<Food> optionalFood = foodRepository.findById(id);
        return optionalFood.orElseThrow(() -> new ResourceNotFoundException(id, "Food"));
    }

    public Food create(Food food) {
        return foodRepository.save(food);
    }

    public void delete(Long id) {
        Optional<Food> obj = foodRepository.findById(id);
        if(obj.isPresent()){
            foodRepository.delete(id);
        } else {
            throw new ResourceNotFoundException(id, "Food");
        }
    }

    public Food update(Long id, Food food) {
        Optional<Food> optionalFood = foodRepository.findById(id);
        if (optionalFood.isPresent()) {
            Food entity = optionalFood.get();
            updateData(entity, food);
            return foodRepository.save(entity);
        } else {
            throw new ResourceNotFoundException(id, "Food");
        }
    }

    private void updateData(Food entity, Food newFood) {
        entity.setName(newFood.getName());
        entity.setPrice(newFood.getPrice());
        entity.setKcal(newFood.getKcal());
        entity.setId_CategoryFood(newFood.getId_CategoryFood());
        entity.setUrl_image(newFood.getUrl_image());
        entity.setStatus(newFood.getStatus());
    }

}
