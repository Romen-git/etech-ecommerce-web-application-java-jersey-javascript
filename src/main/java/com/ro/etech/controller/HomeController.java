package com.ro.etech.controller;

import com.ro.etech.annotation.ApiSecure;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/")
public class HomeController {
    @GET
    public Viewable index() {
        return new Viewable("/frontend/index");


    }

    @Path("/home")
    @GET
    @Produces(MediaType.TEXT_HTML)
    public Viewable home() {
        return new Viewable("/frontend/index");
    }


    @Path("/cart")
    @GET
    @Produces(MediaType.TEXT_HTML)
    public Viewable cart() {
        return new Viewable("/frontend/cart");
    }

    @Path("/checkout")
    @GET
    @Produces(MediaType.TEXT_HTML)
    public Viewable checkout() {
        return new Viewable("/frontend/checkout");
    }

    @Path("/shop")
    @GET
    @Produces(MediaType.TEXT_HTML)
    public Viewable shop() {
        return new Viewable("/frontend/shop");
    }

    @Path("/single-product")
    @GET
    @Produces(MediaType.TEXT_HTML)
    public Viewable singleproduct() {
        return new Viewable("/frontend/single-product");
    }

    @Path("/account")
    @GET
    @Produces(MediaType.TEXT_HTML)
    public Viewable account() {
        return new Viewable("/frontend/account");
    }

    @Path("/category")
    @GET
    @Produces(MediaType.TEXT_HTML)
    public Viewable category() {
        return new Viewable("/frontend/category");
    }

}
