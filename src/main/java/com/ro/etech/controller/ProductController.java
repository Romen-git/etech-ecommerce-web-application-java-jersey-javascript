package com.ro.etech.controller;

import com.ro.etech.dto.ProductCategoryDTO;
import com.ro.etech.dto.ProductDTO;
import com.ro.etech.service.ProductService;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Path("/api/product")
public class ProductController {

    @GET
    @Path("/category")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllCategories() {
        List<ProductCategoryDTO> list = new ArrayList<>();
        ProductService productService = new ProductService();
        productService.getAllCategories().forEach(productCategory -> {
            ProductCategoryDTO dto = new ProductCategoryDTO();
            dto.setImage_url(productCategory.getImage_url());
            dto.setName(productCategory.getName());

            list.add(dto);
        });
        return Response.ok().entity(list).build();
    }

    @GET
    @Path("/latest")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getLatest() {
        List<ProductDTO> list = new ArrayList<>();
        ProductService productService = new ProductService();
        productService.getLatest().forEach(product -> {
            ProductDTO dto = new ProductDTO();
            dto.setId(product.getId());
            dto.setName(product.getName());
            dto.setPrice(product.getPrice());
            dto.setCategory(product.getCategory().getName());
            dto.setStock(product.getStock());
            dto.setDescription(product.getDescription());
            dto.setImages(product.getImages());
            dto.setCreatedAt(DateTimeFormatter.ofPattern("yyyy-MM-dd").format(product.getCreatedAt()));
            list.add(dto);
        });
        return Response.ok().entity(list).build();
    }

    @GET
    @Path("/top-selling")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getTopSelling() {
        ProductService productService = new ProductService();
        List<ProductDTO> topSellingProducts = productService.getTopSelling().stream().map(product -> {
            ProductDTO dto = new ProductDTO();
            dto.setId(product.getId());
            dto.setName(product.getName());
            dto.setPrice(product.getPrice());
            dto.setImages(product.getImages());
            dto.setUnitsSold(product.getUnitsSold());
            dto.setRating(product.getRating());
            return dto;
        }).collect(Collectors.toList());
        return Response.ok().entity(topSellingProducts).build();
    }

    @POST
    @Path("/{productId}/view")
    public Response addRecentlyViewedProduct(@PathParam("productId") Long productId, @QueryParam("userId") Long userId) {
        ProductService productService = new ProductService();
        productService.addRecentlyViewedProduct(userId, productId);
        return Response.ok().build();
    }

    @GET
    @Path("/recently-viewed")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getRecentlyViewedProducts(@QueryParam("userId") Long userId) {
        ProductService productService = new ProductService();
        List<ProductDTO> recentlyViewedProducts = productService.getRecentlyViewedProducts(userId).stream()
                .map(product -> {
                    ProductDTO dto = new ProductDTO();
                    dto.setId(product.getId());
                    dto.setName(product.getName());
                    dto.setPrice(product.getPrice());
                    dto.setImages(product.getImages());
                    dto.setRating(product.getRating());
                    return dto;
                }).collect(Collectors.toList());
        return Response.ok().entity(recentlyViewedProducts).build();
    }
}
