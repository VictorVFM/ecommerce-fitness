package com.victorhugo.ecommercefitness.service.exceptions;

public class ResourceNotFoundException extends RuntimeException{

    private static final long serialVersionUID = 1L;

    public ResourceNotFoundException(Object id,String resource) {
        super(resource + " not found with ID " + id);
    }

}