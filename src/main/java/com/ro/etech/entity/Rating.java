package com.ro.etech.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "rating")
public class Rating {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private Product product;

    private Integer rating_value;

    public Rating() {
    }

    public Rating(Product product, Integer rating_value) {
        this.product = product;
        this.rating_value = rating_value;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getRating_value() {
        return rating_value;
    }

    public void setRating_value(Integer rating_value) {
        this.rating_value = rating_value;
    }
}
