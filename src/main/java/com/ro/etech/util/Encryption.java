package com.ro.etech.util;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;

public class Encryption {
    public static String encrypt(String source) {
        String md5 = "";
        try {
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(source.getBytes(), 0, source.length());
            BigInteger integer = new BigInteger(1,digest.digest());
            md5 = integer.toString(16);
        } catch (Exception ex) {
            return null;
        }
        return md5;
    }
}
