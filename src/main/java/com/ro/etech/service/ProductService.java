package com.ro.etech.service;

import com.ro.etech.entity.Product;
import com.ro.etech.entity.ProductCategory;
import com.ro.etech.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
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

    public List<ProductCategory> getAllCategories() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("SELECT pc FROM ProductCategory  pc", ProductCategory.class).getResultList();
    }

    public void deleteCategory(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        ProductCategory category = session.get(ProductCategory.class, id);
        Transaction transaction = session.beginTransaction();
        session.remove(category);
        transaction.commit();
        session.close();
    }

    public void deleteImages(Product product,String image ,Long id) {
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
