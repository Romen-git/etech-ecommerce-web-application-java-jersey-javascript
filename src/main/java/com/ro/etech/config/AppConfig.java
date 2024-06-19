package com.ro.etech.config;

import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.mvc.jsp.JspMvcFeature;

public class AppConfig extends ResourceConfig {
    public AppConfig(){
        packages("com.ro.etech.controller");
        packages("com.ro.etech.middleware");

        register(JspMvcFeature.class);
        register(MultiPartFeature.class);
        register(DependencyBinder.class);
        property(JspMvcFeature.TEMPLATE_BASE_PATH,"/WEB-INF/views");
    }
}
