package com.victorhugo.ecommercefitness.repositories;

import com.victorhugo.ecommercefitness.model.CategoryFood;
import com.victorhugo.ecommercefitness.model.Ingredient;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryFoodRepository extends JpaRepository<CategoryFood,Long> {
    @Transactional
    @Modifying
    @Query("UPDATE CategoryFood c SET c.status = false WHERE c.id = ?1")
    void delete(Long categoryFoodId);
    List<CategoryFood> findByStatusTrue();


}

