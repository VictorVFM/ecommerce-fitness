package com.victorhugo.ecommercefitness.enums.Employee;

public enum EmployeePosition {
    COZINHEIRO("Cozinheiro"),
    ADMINISTRADOR("Administrador"),
    ENTREGADOR("Entregador");

    private final String description;

    EmployeePosition(String description) {
        this.description = description;
    }

    public String getDescricao() {
        return description;
    }
}
