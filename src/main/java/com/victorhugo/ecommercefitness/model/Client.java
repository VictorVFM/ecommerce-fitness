package com.victorhugo.ecommercefitness.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
@Entity
@Table(name = "Cliente")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Client extends User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nome", nullable = false, length = 100)
    private String name;

    @Column(name = "email", nullable = false, length = 100, unique = true)
    private String email;

    @Column(name = "documento", nullable = false, length = 14, unique = true)
    private String document;

    @Column(name = "telefone", nullable = false, length = 11, unique = true)
    private String phone;

    @Column(name = "senha", nullable = false, length = 255)
    private String password;

    @ManyToOne
    @JoinColumn(name = "id_tipo")
    private ClientType type;

    @Column(name = "status", nullable = false)
    private Boolean status = true;

    @JsonIgnore
    @OneToMany(mappedBy = "client", cascade = CascadeType.ALL)
    private List<Address> addresses = new ArrayList<>();

    public Client(String name, String email, String document, String phone, String password, ClientType type) {
        this.name = name;
        this.email = email;
        this.document = document;
        this.phone = phone;
        this.password = password;
        this.type = type;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return  List.of(new SimpleGrantedAuthority("CLIENTE_NORMAL"));
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

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
