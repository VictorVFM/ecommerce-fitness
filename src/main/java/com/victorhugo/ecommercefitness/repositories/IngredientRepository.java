package com.victorhugo.ecommercefitness.repositories;

import com.victorhugo.ecommercefitness.model.Employee;
import com.victorhugo.ecommercefitness.model.Ingredient;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IngredientRepository extends JpaRepository<Ingredient,Long> {
    @Transactional
    @Modifying
    @Query("UPDATE Ingredient i SET i.status = false WHERE i.id = ?1")
    void delete(Long ingredientId);

    List<Ingredient> findByStatusTrue();
}
