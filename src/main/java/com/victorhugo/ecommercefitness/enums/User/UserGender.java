package com.victorhugo.ecommercefitness.enums.User;


    public enum UserGender {

        MALE("M"),
        FEMALE("F");

        private String gender;

        UserGender(String gender){this.gender = gender;}

        public String getGender(){return gender;}

    }

