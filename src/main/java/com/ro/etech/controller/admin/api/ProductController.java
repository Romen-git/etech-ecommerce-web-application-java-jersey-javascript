package com.ro.etech.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ro.etech.dto.ProductCategoryDTO;
import com.ro.etech.dto.ProductDTO;
import com.ro.etech.entity.Product;
import com.ro.etech.entity.ProductCategory;
import com.ro.etech.service.FileUploadService;
import com.ro.etech.service.ProductService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.glassfish.jersey.media.multipart.ContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataBodyPart;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Path("/admin/api/product")
public class ProductController {

    @Context
    private ServletContext context;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAll() {
        List<ProductDTO> list = new ArrayList<>();
        ProductService productService = new ProductService();
        productService.getAll().forEach(product -> {
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
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getById(@PathParam("id") Long id) {
        ProductService productService = new ProductService();
        Product product = productService.getById(id);
        ProductDTO dto = new ProductDTO();
        dto.setId(product.getId());
        dto.setName(product.getName());
        dto.setPrice(product.getPrice());

        dto.setImages(product.getImages());
        dto.setCreatedAt(DateTimeFormatter.ofPattern("yyyy-MM-dd").format(product.getCreatedAt()));
        return Response.ok().entity(dto).build();
    }

    @POST
    @Path("/{id}/upload-image")
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    @Produces(MediaType.APPLICATION_JSON)
    public Response upload(@PathParam("id") String id, @FormDataParam("file[]") FormDataBodyPart body) {
        System.out.println("okkk");
        List<FileUploadService.FileItem> items = new ArrayList<>();
        FileUploadService uploadService = new FileUploadService(context);
        ProductService productService = new ProductService();
        Product product = productService.getById(Long.valueOf(id));
        System.out.println(body.getParent().getBodyParts());
        body.getParent().getBodyParts().forEach(part -> {
            InputStream is = part.getEntityAs(InputStream.class);
            ContentDisposition meta = part.getContentDisposition();
            FileUploadService.FileItem fileItem = uploadService.upload("product/" + id, is, meta);
            items.add(fileItem);
            product.getImages().add(fileItem.getPath());
            product.setActive(true);
        });

        productService.update(product);
        return Response.ok().entity(items).build();
    }

    @PUT
    @Path("/{id}/upload-image/{url}")
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    @Produces(MediaType.APPLICATION_JSON)
    public Response updateImages(@PathParam("id") String id, @FormDataParam("file[]") FormDataBodyPart body, @PathParam("url") String url) {
        System.out.println("okkk");
        List<FileUploadService.FileItem> items = new ArrayList<>();
        FileUploadService uploadService = new FileUploadService(context);
        ProductService productService = new ProductService();
        Product product = productService.getById(Long.valueOf(id));
        System.out.println(body.getParent().getBodyParts());
        List<String> urls = List.of(URLDecoder.decode(url).split(","));
        List<String> getimages = product.getImages();
        getimages.forEach(image -> {
            final boolean[] stay = {false};
            urls.forEach(url1 -> {
                if (image.equals(url1)) {
                    stay[0] = true;
                }
            });
            if (!stay[0]) {
                int startIndex = image.indexOf("/upload/product/" + id + "/");


                if (startIndex != -1) {
                    String urlIndex = "/upload/product/" + id + "/";
                    startIndex += urlIndex.length();

                    uploadService.delete(image.substring(startIndex));

                } else {
                    System.out.println("Substring not found in the image string.");
                }

            }


        });
        body.getParent().getBodyParts().forEach(part -> {
            InputStream is = part.getEntityAs(InputStream.class);
            ContentDisposition meta = part.getContentDisposition();
            FileUploadService.FileItem fileItem = uploadService.upload("product/" + id, is, meta);
            items.add(fileItem);
            getimages.add(fileItem.getPath());

        });


        productService.update(product);
        return Response.ok().entity(items).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response save(ProductDTO productDTO) {
        ProductService productService = new ProductService();
        Product product = new Product();
        product.setName(productDTO.getName());
        product.setPrice(productDTO.getPrice());
        product.setDescription(productDTO.getDescription());
        product.setStock(productDTO.getStock());
        product.setCategory(productService.getCategory(productDTO.getCategory()));
        product.setActive(false);

        productService.save(product);
        ObjectNode jsonNodes = new ObjectMapper().createObjectNode();
        jsonNodes.put("pid", product.getId());

        return Response.ok().entity(jsonNodes).build();
    }

    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response update(ProductDTO productDTO) {
        ProductService productService = new ProductService();
        Product product = productService.getById(productDTO.getId());
        product.setName(productDTO.getName());
        product.setPrice(productDTO.getPrice());
        product.setDescription(productDTO.getDescription());
        product.setStock(productDTO.getStock());
        product.setCategory(productService.getCategory(productDTO.getCategory()));

        productService.update(product);

        ObjectNode jsonNodes = new ObjectMapper().createObjectNode();
        jsonNodes.put("pid", product.getId());
        return Response.ok().entity(jsonNodes).build();
    }

    @DELETE
    @Path("/{id}")
    public Response delete(@PathParam("id") Long id) {
        ProductService productService = new ProductService();
        productService.delete(id);
        return Response.ok().build();
    }

    @GET
    @Path("/category")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllCategories() {
        List<ProductCategoryDTO> list = new ArrayList<>();
        ProductService productService = new ProductService();
        productService.getAllCategories().forEach(productCategory -> {
            ProductCategoryDTO dto = new ProductCategoryDTO();
            dto.setId(productCategory.getId());
            dto.setName(productCategory.getName());

            list.add(dto);
        });
        return Response.ok().entity(list).build();
    }

    @GET
    @Path("/selectedproduct")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getSelectedProduct(@Context HttpServletRequest request) {
        ProductService productService = new ProductService();
        HttpSession session = request.getSession();
        Product product = productService.getById((Long) session.getAttribute("selectedProduct"));
        ProductDTO dto = new ProductDTO();
        dto.setId(product.getId());
        dto.setName(product.getName());
        dto.setPrice(product.getPrice());
        dto.setDescription(product.getDescription());
        dto.setCategory(product.getCategory().getId().toString());

        dto.setCreatedAt(DateTimeFormatter.ofPattern("yyyy-MM-dd").format(product.getCreatedAt()));
        System.out.println("okkk");
        return Response.ok().entity(dto).build();
    }

    @DELETE
    @Path("/category/{id}")
    public Response deleteCategory(@PathParam("id") Long id) {
        ProductService productService = new ProductService();
        productService.deleteCategory(id);
        return Response.ok().build();
    }

    @GET
    @Path("/images/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllImages(@PathParam("id") Long id) {

        ProductService productService = new ProductService();
        List<String> list = productService.getById(id).getImages();
        return Response.ok().entity(list).build();
    }

    @POST
    @Path("/category")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response saveCategory(ProductCategoryDTO productCategoryDTO) {
        ProductService productService = new ProductService();
        ProductCategory productCategory = new ProductCategory();
        productCategory.setName(productCategoryDTO.getName());

        productService.saveCategory(productCategory);
        ObjectNode jsonNodes = new ObjectMapper().createObjectNode();
        jsonNodes.put("pid", productCategory.getId());

        return Response.ok().entity(jsonNodes).build();
    }
}
