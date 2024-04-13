package com.victorhugo.ecommercefitness.enums.Employee;


    public enum EmployeeGender {

        M("Masculino"),
        F("Feminino");

        private String gender;

        EmployeeGender(String gender){this.gender = gender;}

        public String getGender(){return gender;}

    }

