package com.ro.etech.config;

import com.ro.etech.util.Encryption;
import com.ro.etech.util.JwtTokenUtil;
import jakarta.inject.Singleton;
import org.glassfish.hk2.utilities.binding.AbstractBinder;

public class DependencyBinder extends AbstractBinder {
    @Override
    protected void configure() {
        System.out.println("DependencyBinder...");
        bind(Encryption.class).to(Encryption.class).in(Singleton.class);
        bind(JwtTokenUtil.class).to(JwtTokenUtil.class).in(Singleton.class);
    }
}
