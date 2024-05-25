package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.model.CategoryFood;
import com.victorhugo.ecommercefitness.model.Ingredient;
import com.victorhugo.ecommercefitness.repositories.CategoryFoodRepository;
import com.victorhugo.ecommercefitness.service.exceptions.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryFoodService {

    @Autowired
    CategoryFoodRepository categoryFoodRepository;


    public List<CategoryFood> findAll() {
        return categoryFoodRepository.findByStatusTrue();
    }

    public CategoryFood findById(Long id) {
        Optional<CategoryFood> optionalCategoryFood = categoryFoodRepository.findById(id);
        return optionalCategoryFood.orElseThrow(() -> new ResourceNotFoundException(id, "CategoryFood"));
    }

    public CategoryFood create(CategoryFood categoryFood) {
        return categoryFoodRepository.save(categoryFood);
    }

    public void delete(Long id) {
        Optional<CategoryFood> obj = categoryFoodRepository.findById(id);
        if(obj.isPresent()){
            categoryFoodRepository.delete(id);
        } else {
            throw new ResourceNotFoundException(id, "CategoryFood");
        }
    }


    public CategoryFood update(Long id, CategoryFood categoryFood) {
        Optional<CategoryFood> optionalCategoryFood = categoryFoodRepository.findById(id);
        if (optionalCategoryFood.isPresent()) {
            CategoryFood entity = optionalCategoryFood.get();
            updateData(entity, categoryFood);
            return categoryFoodRepository.save(entity);
        } else {
            throw new ResourceNotFoundException(id, "CategoryFood");
        }
    }

    private void updateData(CategoryFood entity, CategoryFood newCategoryFood) {
        entity.setName(newCategoryFood.getName());
        entity.setUrl_image(newCategoryFood.getUrl_image());
        entity.setStatus(newCategoryFood.getStatus());
    }

}
