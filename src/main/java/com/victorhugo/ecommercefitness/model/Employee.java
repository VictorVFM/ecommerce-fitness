package com.victorhugo.ecommercefitness.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.victorhugo.ecommercefitness.enums.Employee.EmployeeGender;
import com.victorhugo.ecommercefitness.enums.Employee.EmployeeRole;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


import java.util.Collection;
import java.util.Date;
import java.util.List;


@Entity
@Table(name = "Funcionario")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Employee extends User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nome", nullable = false, length = 60)
    private String name;

    @Column(name = "sexo", nullable = false, length = 1)
    @Enumerated(EnumType.STRING)
    private EmployeeGender gender;

    @Column(name = "data_nascimento", nullable = false)
    @JsonFormat(pattern = "dd/MM/yyyy", locale = "pt-BR", timezone = "America/Sao_Paulo")
    private Date birthDate;

    @Column(name = "cpf", nullable = false, length = 11, unique = true)
    private String cpf;

    @Column(name = "email", nullable = false, length = 100, unique = true)
    private String email;

    @Column(name = "telefone", nullable = false, length = 11, unique = true)
    private String phone;

    @JsonIgnore
    @Column(name = "senha", nullable = false, length = 255)
    private String password;

    @Column(name = "funcao", nullable = false, length = 40)
    @Enumerated(EnumType.STRING)
    private EmployeeRole role;

    @Column(name = "status", nullable = false)
    private boolean status = true;

    public Employee(String name, EmployeeGender gender, Date birthDate, String cpf, String email, String phone, String password, EmployeeRole role) {
        this.name = name;
        this.gender = gender;
        this.birthDate = birthDate;
        this.cpf = cpf;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.role = role;
    }


    @JsonIgnore
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        if(this.role == EmployeeRole.ADMINISTRADOR){
            return  List.of(new SimpleGrantedAuthority("ROLE_ADMINISTRADOR"),
            new SimpleGrantedAuthority("ROLE_COZINHEIRO"));
        }else if(this.role == EmployeeRole.COZINHEIRO){
            return List.of(new SimpleGrantedAuthority("ROLE_COZINHEIRO"));
        }else if(this.role == EmployeeRole.ENTREGADOR){
            return List.of(new SimpleGrantedAuthority("ROLE_ENTREGADOR"));
        }else return null;

    }
    @JsonIgnore
    @Override
    public String getUsername() {
        return email;
    }
    @JsonIgnore
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
    @JsonIgnore
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
    @JsonIgnore
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        if(this.status == false){
            return  false;
        }
        return true;
    }
}
