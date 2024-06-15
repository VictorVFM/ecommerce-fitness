package com.victorhugo.ecommercefitness.repositories;

import com.victorhugo.ecommercefitness.model.Order;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;


import java.util.List;

public interface OrderRepository extends JpaRepository<Order,Long> {

    @Transactional
    @Modifying
    @Query("UPDATE Order o SET o.status = false WHERE o.id = ?1")
    void delete(Long orderId);

    @Query("SELECT o FROM Order o JOIN Client c  ON o.client.id = c.id WHERE c.email = :email")
    List<Order> findByEmailClient(String email);

    @Query("SELECT COUNT(o) " +
            "FROM Order o " +
            "WHERE YEAR(o.orderDate) = YEAR(CURRENT_DATE) " +
            "GROUP BY MONTH(o.orderDate) " +
            "ORDER BY MONTH(o.orderDate)")
    List<Long> countOrdersByMonthInCurrentYear();

    List<Order> findByStatusTrue();
}
