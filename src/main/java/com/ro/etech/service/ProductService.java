package com.ro.etech.service;

import com.ro.etech.dto.ProductDTO;
import com.ro.etech.entity.Product;
import com.ro.etech.entity.ProductCategory;
import com.ro.etech.entity.User;
import com.ro.etech.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    public Product getById(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.get(Product.class, id);
    }

    public List<Product> getAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("SELECT p FROM Product  p", Product.class).getResultList();
    }

    public List<Product> getAll(boolean active) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("SELECT p FROM Product  p WHERE p.active=:active", Product.class)
                .setParameter("active", active)
                .getResultList();
    }

    public List<Product> getProducts(int page, int size) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "SELECT p FROM Product  p";
        Query<Product> query = session.createQuery(hql, Product.class);
        query.setFirstResult((page - 1) * size);
        query.setMaxResults(size);
        List<Product> products = query.getResultList();
        session.close();
        return products;
    }

    public long getProductCount() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "SELECT COUNT(p.id) FROM Product p";
        Query<Long> query = session.createQuery(hql, Long.class);
        long count = query.getSingleResult();
        session.close();
        return count;
    }

    public List<Product> getLatest() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            LocalDateTime oneYearAgo = LocalDateTime.now().minusYears(2);
            return session.createQuery("SELECT p FROM Product p JOIN FETCH p.category WHERE p.active = :active AND " +
                            "p.CreatedAt >= :oneYearAgo ORDER BY p.CreatedAt DESC", Product.class)
                    .setParameter("oneYearAgo", oneYearAgo)
                    .setParameter("active", true).getResultList();
        }
    }

    public List<Product> getTopSelling(Integer setMax) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            LocalDateTime oneYearAgo = LocalDateTime.now().minusYears(2);
            Query<Product> topSellingProductsQuery = session.createQuery("SELECT p FROM Product p JOIN FETCH p.category WHERE " +
                            "p.active = :active AND " +
                            "p.CreatedAt >= :oneYearAgo AND p.unitsSold >= :threshold ORDER BY p.unitsSold DESC", Product.class)
                    .setParameter("oneYearAgo", oneYearAgo)
                    .setParameter("active", true)
                    .setParameter("threshold", 10);
            if (setMax != null) {
                topSellingProductsQuery.setMaxResults(3);
            }
            List<Product> topSellingProducts = topSellingProductsQuery.getResultList();

            if (topSellingProducts.isEmpty()) {
                return getLatest();
            }
            return topSellingProducts;
        }
    }

    public List<Product> getTopNew(Integer setMax) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Product> topNewProductsQuery = session.createQuery("SELECT p FROM Product p JOIN FETCH p.category WHERE " +
                            "p.active = :active " +
                            "ORDER BY p.CreatedAt DESC", Product.class)
                    .setParameter("active", true);
            if (setMax != null) {
                topNewProductsQuery.setMaxResults(3);
            }
            List<Product> topNewProducts = topNewProductsQuery.getResultList();

            if (topNewProducts.isEmpty()) {
                return getLatest();
            }
            return topNewProducts;
        }
    }

    public void addRecentlyViewedProduct(Long userId, Long productId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        //fetch user and product from database
        User user = session.get(User.class, userId);
        Product product = session.get(Product.class, productId);

        if (user != null && product != null) {
            //add product to recently viewed list for the user
            List<Product> recentlyViewedProducts = user.getRecentlyViewedProducts();
            recentlyViewedProducts.add(0, product); //add product at the start of the list

            //limit the number of recently viewed products
            if (recentlyViewedProducts.size() > 3) {
                recentlyViewedProducts.remove(recentlyViewedProducts.size() - 1);
            }

            user.setRecentlyViewedProducts(recentlyViewedProducts);
            session.merge(user);
        }

        transaction.commit();
        session.close();
    }

    public List<Product> getRecentlyViewedProducts(Long userId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        User user = session.get(User.class, userId);
        List<Product> recentlyViewedProducts = user != null ? user.getRecentlyViewedProducts() : null;
        session.close();
        return recentlyViewedProducts;
    }

    public List<ProductDTO> getAllProductDTO(List<Product> products) {
        List<ProductDTO> productDTOList = new ArrayList<>();

        products.forEach(product -> {
            ProductDTO dto = new ProductDTO();
            dto.setId(product.getId());
            dto.setName(product.getName());
            dto.setPrice(product.getPrice());
            dto.setCategory(product.getCategory().getName());
            dto.setStock(product.getStock());
            dto.setDescription(product.getDescription());
            dto.setImages(product.getImages());
            dto.setCreatedAt(DateTimeFormatter.ofPattern("yyyy-MM-dd").format(product.getCreatedAt()));
            productDTOList.add(dto);
        });
        return productDTOList;
    }

    public void save(Product product) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.persist(product);
        transaction.commit();
        session.close();
    }

    public void update(Product product) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.merge(product);
        transaction.commit();
        session.close();
    }

    public void delete(Product product) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.remove(product);
        transaction.commit();
        session.close();
    }

    public void delete(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Product product = session.get(Product.class, id);
        Transaction transaction = session.beginTransaction();
        session.remove(product);
        transaction.commit();
        session.close();
    }

    public ProductCategory getCategory(String name) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("SELECT c FROM ProductCategory c WHERE c.name=:name", ProductCategory.class)
                .setParameter("name", name)
                .getSingleResult();
    }

    public List<ProductCategory> getAllCategories(Integer limit) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "SELECT pc FROM ProductCategory pc";
        Query<ProductCategory> query = session.createQuery(hql, ProductCategory.class);

        //apply limit if provided
        if (limit != null && limit > 0) {
            query.setMaxResults(limit);
        }

        List<ProductCategory> categories = query.getResultList();
        session.close();
        return categories;
    }

    public void deleteCategory(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        ProductCategory category = session.get(ProductCategory.class, id);
        Transaction transaction = session.beginTransaction();
        session.remove(category);
        transaction.commit();
        session.close();
    }

    public void deleteImages(Product product, String image, Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        product.removeImage(image);
        session.merge(product);
        session.createNativeQuery("DELETE FROM product_image WHERE product_id = :productId")
                .setParameter("productId", id)
                .executeUpdate();
        transaction.commit();
        session.close();
        /*Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        product.removeImage(image);
        session.merge(product);
        transaction.commit();
        session.close();*/
    }

    public String convertInputStreamToString(InputStream is) {
        StringBuilder stringBuilder = new StringBuilder();

        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                stringBuilder.append(line);
            }
        } catch (IOException e) {
            e.printStackTrace(); // Handle the exception according to your needs
        }

        return stringBuilder.toString();
    }

    public void saveCategory(ProductCategory productCategory) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.persist(productCategory);
        transaction.commit();
        session.close();
    }
}
