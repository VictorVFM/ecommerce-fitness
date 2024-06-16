package com.victorhugo.ecommercefitness.enums.Employee;

public enum OrderStage {

    NOVO("Novo"),
    CONFIRMADO("Confirmado"),
    EM_PREPARO("Em preparo"),
    EM_ROTA_DE_ENTREGA("Em rota de entrega"),
    ENTREGUE("Entregue"),
    CANCELADO("Cancelado")    ;

    private final String description;

    OrderStage(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
