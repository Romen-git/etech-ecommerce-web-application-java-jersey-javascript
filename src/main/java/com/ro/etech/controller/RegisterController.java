package com.ro.etech.controller;

import com.ro.etech.dto.RegisterDTO;
import com.ro.etech.entity.User;
import com.ro.etech.mail.VerificationMail;
import com.ro.etech.provider.MailServiceProvider;
import com.ro.etech.service.UserService;
import com.ro.etech.util.Encryption;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.Optional;
import java.util.UUID;


@Path("/signin")
public class RegisterController {


    @GET
    public Viewable index() {
        return new Viewable("/frontend/auth/signup");
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response register(RegisterDTO registerDTO){
        UserService userService = new UserService();
        Optional<User> byEmail = userService.getByEmail(registerDTO.getEmail());
        if (byEmail.isPresent()){
            return Response.status(Response.Status.BAD_REQUEST).entity("Email already exists.").build();
        }else {

            User user = new User();
            //user.setName(registerDTO.getName());
            user.setFirstname(registerDTO.getFirstname());
            user.setLastname(registerDTO.getLastname());
            user.setUsername(registerDTO.getUsername());
            user.setEmail(registerDTO.getEmail());
            user.setPassword(Encryption.encrypt(registerDTO.getPassword()));

            String verificationCode = UUID.randomUUID().toString();

            user.setVerification_code(verificationCode);
            userService.save(user);
            VerificationMail mail = new VerificationMail(user.getEmail(),verificationCode);
            MailServiceProvider.getInstance().sendMail(mail);

            return Response.ok().entity("Register Success").build();
        }

    }
}
