package com.ro.etech.controller.admin;

import com.ro.etech.service.FileUploadService;
import jakarta.servlet.ServletContext;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.glassfish.jersey.server.mvc.Viewable;

import java.io.InputStream;

@Path("/admin/product")
public class ProductController {

    @Context
    ServletContext context;

    @GET
    @Produces(MediaType.TEXT_HTML)
    public Viewable view(){
        return new Viewable("/frontend/admin/products");
    }

    @Path("/upload-image")
    @POST
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    @Produces(MediaType.APPLICATION_JSON)
    public Response action(@FormDataParam("file") InputStream is,
                           @FormDataParam("file") FormDataContentDisposition fileMetaData) {
        FileUploadService uploadService = new FileUploadService(context);
        //FileUploadService.FileItem fileItem = uploadService.upload("slider/s1",is, fileMetaData);
        uploadService.delete("abc");

        return Response.ok().entity("").build();
    }
}
