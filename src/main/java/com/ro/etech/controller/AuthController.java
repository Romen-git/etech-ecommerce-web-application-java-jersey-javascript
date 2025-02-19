package com.ro.etech.controller;

import com.ro.etech.dto.AuthDTO;
import com.ro.etech.dto.ForgotPasswordDTO;
import com.ro.etech.dto.ResetPasswordDTO;
import com.ro.etech.entity.User;
import com.ro.etech.mail.ForgotPasswordMail;
import com.ro.etech.mail.VerificationMail;
import com.ro.etech.provider.MailServiceProvider;
import com.ro.etech.service.UserService;
import com.ro.etech.util.Encryption;
import com.ro.etech.util.HibernateUtil;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.apache.tomcat.util.json.JSONParser;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.net.URI;
import java.sql.Timestamp;
import java.util.Optional;
import java.util.UUID;

@Path("/auth")
public class AuthController {

    @Path("/forgot-password")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response forgotPasswordLink(ForgotPasswordDTO forgotPasswordDTO) {
        UserService userService = new UserService();
        Optional<User> byEmail = userService.getByEmail(forgotPasswordDTO.getEmail());

        if (byEmail.isEmpty()) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Invalid Email.").build();
        }

        User user = byEmail.get();

        String verificationCode = UUID.randomUUID().toString();

        user.setVerification_code(verificationCode);
        userService.update(user);
        ForgotPasswordMail mail = new ForgotPasswordMail(user.getEmail(), verificationCode);
        MailServiceProvider.getInstance().sendMail(mail);
        return Response.ok().entity("Email has been Sent.").build();

    }

    @Path("/reset-password")
    @POST
    @Consumes("application/json")
    @Produces("application/json")
    public Response resetPassword(ResetPasswordDTO resetPasswordDTO) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Optional<User> op = session.createQuery("SELECT u FROM User u WHERE u.verification_code=:vc", User.class)
                .setParameter("vc", resetPasswordDTO.getToken()).uniqueResultOptional();
        if (op.isPresent()) {
            User user = op.get();
            Transaction tr = session.beginTransaction();
            if (!op.get().isActive()) {
                user.setEmail_verified_at(new Timestamp(System.currentTimeMillis()).toString());
                user.setActive(true);
            }
            user.setPassword(Encryption.encrypt(resetPasswordDTO.getNewPassword()));
            session.merge(user);
            tr.commit();
            session.close();
            return Response.status(Response.Status.FOUND).location(URI.create("login")).build();
        } else {
            return Response.status(Response.Status.BAD_REQUEST).entity("Invalid link or User can't be found.").build();
        }

    }

}
