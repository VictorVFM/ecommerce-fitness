package com.victorhugo.ecommercefitness.model;

import jakarta.persistence.*;
import lombok.*;

import java.net.URL;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "Comida")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Food {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nome", nullable = false, length = 50)
    private String name;

    @Column(name = "preco", nullable = false)
    private Double price;

    @Column(name = "kcal", nullable = false)
    private int kcal;

    @Column(name = "id_categoria", nullable = false)
    private Long id_CategoryFood;

    @ManyToMany
    @JoinTable(
            name = "ComidaIngrediente",
            joinColumns = @JoinColumn(name = "id_Comida"),
            inverseJoinColumns = @JoinColumn(name = "id_Ingrediente")
    )
    private List<Ingredient> ingredients;

    @Column(name = "imagem", nullable = false)
    private String url_image;

    @Column(name = "status", nullable = false)
    private Boolean status = true;

    public Food(Long id) {
        this.id = id;
    }
}
