package com.victorhugo.ecommercefitness.enums.Employee;

public enum EmployeeRole {
    COZINHEIRO("Cozinheiro"),
    ADMINISTRADOR("Administrador"),
    ENTREGADOR("Entregador");

    private final String description;

    EmployeeRole(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
