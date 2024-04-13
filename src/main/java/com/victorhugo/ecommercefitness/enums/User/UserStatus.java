package com.victorhugo.ecommercefitness.enums.User;

public enum UserStatus {

    ACTIVE("Ativo"), INACTIVE("Inativo");
    private String value;

    private UserStatus(String value){
        this.value = value;
    }

    public String getValue(){
        return value;
    }
}
