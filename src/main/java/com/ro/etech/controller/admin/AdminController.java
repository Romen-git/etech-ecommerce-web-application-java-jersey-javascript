package com.ro.etech.controller.admin;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/admin")
public class AdminController {



    @GET
    @Path("/editproduct/{id}")
    @Produces(MediaType.TEXT_HTML)
    public Viewable editproduct(@PathParam("id") Long id,@Context HttpServletRequest request) {
        HttpSession session=request.getSession();
        session.setAttribute("selectedProduct",id);
        return new Viewable("/frontend/admin/edit-product");

    }

    @GET
    @Path("/addproduct")
    @Produces(MediaType.TEXT_HTML)
    public Viewable addproduct(){
        return new Viewable("/frontend/admin/add-product");
    }

    @GET
    @Path("/account")
    @Produces(MediaType.TEXT_HTML)
    public Viewable adminaccount(){
        return new Viewable("/frontend/admin/accounts");
    }

    @GET
    @Path("/addcategory")
    @Produces(MediaType.TEXT_HTML)
    public Viewable addCategory(){
        return new Viewable("/frontend/admin/add-category");
    }

}
