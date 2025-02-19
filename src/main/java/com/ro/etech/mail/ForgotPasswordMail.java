package com.ro.etech.mail;

import com.ro.etech.util.Env;
import io.rocketbase.mail.model.HtmlTextEmail;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;

public class ForgotPasswordMail extends Mailable {

    private String to;
    private String verificationCode;

    public ForgotPasswordMail(String to, String verificationCode) {
        this.to = to;
        this.verificationCode = verificationCode;
    }

    @Override
    public void build(Message message) throws MessagingException {

        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject("Please Reset Your Password");

        String appUrl = Env.get("app_url");
        String verifyUrl = appUrl + "/reset-password?&token=" + verificationCode;

        HtmlTextEmail content = getEmailTemplateBuilder()
                .header()
                .logo("http://localhost:8080/etech/assets/img/logo.png").logoHeight(41)
                .and()
                .text("Welcome, " + to).h1().center().and()
                .text("To reset your password click on the button below.").center().and()
                .text("If you did not make this request, then you can ignore this email.").center().and()
                .button("Reset Your Password", verifyUrl).blue().and()
                .text("If you have trouble paste this link into your browser").center().and()
                .html("<a href=\"" + verifyUrl + "\">" + verifyUrl + "</a>").and()
                .copyright(appUrl).url(appUrl).suffix(". All rights reserved.")
                .build();

        message.setContent(content.getHtml(), "text/html");

    }
}
