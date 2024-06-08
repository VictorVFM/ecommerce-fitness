package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.dto.OrderDTO;
import com.victorhugo.ecommercefitness.model.Order;
import com.victorhugo.ecommercefitness.model.OrderItem;
import com.victorhugo.ecommercefitness.repositories.OrderRepository;
import com.victorhugo.ecommercefitness.service.exceptions.ResourceNotFoundException;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ClientService clientService;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private PaymentTypeService paymentTypeService;

    @Autowired OrderItemService orderItemService;



    public List<Order> findAll(){
        List<Order> orders = orderRepository.findByStatusTrue();
        return orderRepository.findByStatusTrue();
    }

    public Order findById(Long id) {
        Optional<Order> obj = orderRepository.findById(id);
        return obj.orElseThrow(() -> new ResourceNotFoundException(id,"Order"));
    }

    @Transactional
    public Order create(Order order) {
    Order savedOrder = orderRepository.save(order);
    for(OrderItem item: order.getOrderItems()){
        item.setOrder(savedOrder);
        orderItemService.create(item);
    }
        return orderRepository.save(order);
    }

    public void delete(Long id) {
        Optional<Order> obj = orderRepository.findById(id);
        if (obj.isPresent()) {
            orderRepository.delete(id);
        } else {
            throw new ResourceNotFoundException(id,"Order");
        }
    }


    public Order update(Long id, Order order){
        Optional<Order> optionalOrder = orderRepository.findById(id);
        if (optionalOrder.isPresent()) {
            Order entity = optionalOrder.get();
            updateData(entity, order);
            return orderRepository.save(entity);
        } else {
            throw new ResourceNotFoundException(id, "Order");
        }
    }

    public void updateData(Order entity, Order newEntity) {
        entity.setOrderStage(newEntity.getOrderStage());
        entity.setStatus(newEntity.getStatus());

    }

}
