package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.dto.OrderDTO;
import com.victorhugo.ecommercefitness.model.Client;
import com.victorhugo.ecommercefitness.model.Order;
import com.victorhugo.ecommercefitness.repositories.OrderRepository;
import com.victorhugo.ecommercefitness.service.exceptions.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
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



    public List<Order> findAll(){return orderRepository.findByStatusTrue();}

    public Order findById(Long id) {
        Optional<Order> obj = orderRepository.findById(id);
        return obj.orElseThrow(() -> new ResourceNotFoundException(id,"Order"));
    }

    public Order create(OrderDTO order) {
        Order newOrder;
        newOrder = new Order(
                clientService.findById(order.id_Client()),
                employeeService.findById(order.id_Employee()),
                paymentTypeService.findById(order.id_PaymentType()),
                order.address());
        return orderRepository.save(newOrder);
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
