package com.ro.etech.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.Properties;

public class HibernateUtil {
    private static final SessionFactory SESSION_FACTORY = buildSessionfactory();

    private static SessionFactory buildSessionfactory() {

        try {

            Configuration configuration = new Configuration();

            Properties properties = new Properties();
            properties.load(HibernateUtil.class.getResourceAsStream("/db.properties"));

            configuration.setProperties(properties);
            configuration.configure();

            return configuration.buildSessionFactory();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError();

        }
    }


    public static SessionFactory getSessionFactory() {
        return SESSION_FACTORY;
    }

    public static void close() {
        getSessionFactory().close();

    }
}
