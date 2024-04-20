package com.victorhugo.ecommercefitness.repositories;

import com.victorhugo.ecommercefitness.model.Food;
import com.victorhugo.ecommercefitness.model.Ingredient;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface FoodRepository extends JpaRepository<Food, Long> {
    @Transactional
    @Modifying
    @Query("UPDATE Food f SET f.status = false WHERE f.id = ?1")
    void delete(Long foodId);

    List<Food> findByStatusTrue();
}
