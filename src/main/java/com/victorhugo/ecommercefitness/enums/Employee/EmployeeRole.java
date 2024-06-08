package com.victorhugo.ecommercefitness.enums.Employee;

public enum EmployeeRole {

    ADMINISTRADOR("Administrador"),
    COZINHEIRO("Cozinheiro"),
    ENTREGADOR("Entregador");

    private final String description;

    EmployeeRole(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
