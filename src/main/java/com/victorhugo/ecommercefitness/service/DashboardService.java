package com.victorhugo.ecommercefitness.service;

import com.victorhugo.ecommercefitness.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class DashboardService {

    @Autowired
    OrderRepository orderRepository;

    public int[] countOrdersByMonthInCurrentYear(){
        List<Integer[]> listObjects = orderRepository.countOrdersByMonthInCurrentYear();
        int lastIndex = (int) (listObjects.stream().count()-1);
        Integer lastMonth = listObjects.get(lastIndex)[0];
        int[] orders = new int[lastMonth];
        Integer index = 0;
        Integer value = 0;
        for(Integer[] integers : listObjects){
            index = integers[0]-1;
            value = integers[1];
            orders[index] =value;
        }

        return orders;
    }
}
