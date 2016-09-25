package com.fruit.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.jexl2.Main;

import com.thoughtworks.xstream.core.util.Base64Encoder;

public class PassWordUtil {
	
	public static String password(String password){
		String encode = null;
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
			Base64Encoder base64Encoder = new Base64Encoder();
			encode = base64Encoder.encode(md5.digest(password.getBytes("utf-8")));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return encode;
	}
	
	public static void main(String[] args) {
		System.out.println(password("abd"));
	}

}
