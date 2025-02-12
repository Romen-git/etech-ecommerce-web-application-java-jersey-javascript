package com.ro.etech.dto;

import java.util.List;

public class PaginatedProductResponseDTO {

    private List<ProductDTO> products;
    private long totalProducts;
    private int totalPages;

    public PaginatedProductResponseDTO(List<ProductDTO> products, long totalProducts, int totalPages) {
        this.products = products;
        this.totalProducts = totalProducts;
        this.totalPages = totalPages;
    }

    public List<ProductDTO> getProducts() {
        return products;
    }

    public void setProducts(List<ProductDTO> products) {
        this.products = products;
    }

    public long getTotalProducts() {
        return totalProducts;
    }

    public void setTotalProducts(long totalProducts) {
        this.totalProducts = totalProducts;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }


}
