package com.ro.etech.controller;

import com.ro.etech.dto.AuthDTO;
import com.ro.etech.dto.AuthResponseDTO;
import com.ro.etech.entity.User;
import com.ro.etech.service.UserService;
import com.ro.etech.util.Encryption;
import com.ro.etech.util.JwtTokenUtil;
import jakarta.inject.Inject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.Date;
import java.util.Optional;

@Path("/login")
public class LoginController {

    @Inject
    JwtTokenUtil tokenUtil;

    @GET
    public Viewable index() {
        return new Viewable("/frontend/auth/login");
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response loginAction(AuthDTO authDTO, @Context HttpServletRequest request){
        UserService userService = new UserService();
        Optional<User> byEmail = userService.getByEmail(authDTO.getEmail());
        System.out.println(byEmail);
        if (byEmail.isPresent()){
            User user = byEmail.get();
            System.out.println();
            if (user.getPassword().equals(Encryption.encrypt(authDTO.getPassword()))){
                if (user.isActive() && !user.getEmail_verified_at().isEmpty()){
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);

                    String accessToken = tokenUtil.generateAccessToken(user);
                    String refreshToken = tokenUtil.generateRefreshToken(user);
                    Date expireDate = tokenUtil.getExpireDateFromToken(accessToken);

                    AuthResponseDTO dto = new AuthResponseDTO(accessToken,refreshToken,String.valueOf(expireDate.getTime()));
                    System.out.println("okkk");
                    return Response.ok().entity(dto).build();
                }else {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user.getId());
                    System.out.println("okkk1");
                    return Response.status(Response.Status.FORBIDDEN).build();
                }

            }else {
                System.out.println("okkk2");
                return Response.status(Response.Status.UNAUTHORIZED).entity("Invalid Email or Password").build();
            }
        }else {
            System.out.println("okkk3");
            return Response.status(Response.Status.UNAUTHORIZED).entity("Invalid Email or Password").build();
        }
    }
    @POST
    @Path("/refresh-token")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public Response refreshToken(@FormParam("token") String refreshToken){
        UserService userService = new UserService();
        Optional<User> user = userService.getByEmail(tokenUtil.getUsernameFromToken(refreshToken));
        if (user.isEmpty() || !tokenUtil.validateToken(refreshToken,user.get())){
            return Response.status(Response.Status.UNAUTHORIZED).entity("Invalid refresh token").build();
        }else {
            String accessToken = tokenUtil.generateAccessToken(user.get());
            Date expireIn = tokenUtil.getExpireDateFromToken(accessToken);

            AuthResponseDTO dto = new AuthResponseDTO(accessToken,refreshToken,String.valueOf(expireIn.getTime()));
            return Response.ok().entity(dto).build();
        }
    }
}
