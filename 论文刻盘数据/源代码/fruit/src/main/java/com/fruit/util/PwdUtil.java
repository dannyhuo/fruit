package com.fruit.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import com.thoughtworks.xstream.core.util.Base64Encoder;

public class PwdUtil {
	
	/**
	 * 密码加密，带加权因子
	 * @param password
	 * @param rank
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws NoSuchAlgorithmException
	 */
	public static String password(String password, String rank) 
			throws UnsupportedEncodingException, NoSuchAlgorithmException{
		byte[] encBytes = encode(password, rank);
		if(null == encBytes){
			return null;
		}
		MessageDigest md5;
		md5 = MessageDigest.getInstance("MD5");
		Base64Encoder base64Encoder = new Base64Encoder();
		return base64Encoder.encode(md5.digest(encBytes));
	}
	
	/**
	 * 密码加密，不带加权因子
	 * @param password
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws NoSuchAlgorithmException
	 */
	public static String password(String password) 
			throws UnsupportedEncodingException, NoSuchAlgorithmException{
		return password(password, null);
	}
	
	
	/**
	 * 生成指定长度的密码加严因子
	 * @param len
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String generank(int len) 
			throws UnsupportedEncodingException{
		Random random = new Random();
		byte[] rank = new byte[len];
		for(int i = 0; i < len; i++){
			rank[i] = (byte) random.nextInt(128);
		}
		return new String(rank,"utf-8");
	}
	
	/**
	 * 生成默认6位密码加严因子
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String generank() 
			throws UnsupportedEncodingException{
		return generank(6);
	}
	
	/**
	 * 根据密码生成加严因子
	 * @param password
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String generank(String password) 
			throws UnsupportedEncodingException{
		int plen = 0;
		if(null == password || password.equals("") || (plen = password.length()) < 6){
			return generank();
		}
		return generank(plen);
	}
	
	
	/**
	 * 将密码转换成为加密的字节数组
	 * @param password
	 * @param rank
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	private static byte[] encode(String password, String rank) 
			throws UnsupportedEncodingException{
		if(null == password || password.trim().equals("")){
			return null;
		}else if(null == rank || rank.trim().equals("")){
			return password.getBytes("utf-8");
		}
		
		byte[] pwdBytes = password.getBytes("utf-8");
		
		byte[] rankBytes = rank.getBytes("utf-8");
		
		int pwdLen = pwdBytes.length;
		int rankLen = rankBytes.length;
		
		byte[] encBytes = new byte[pwdLen];
		
		for(int i = 0; i < pwdLen; i += rankLen){
			int e = 0;
			for(int r = 0; r < rankLen && (e = r + i) < pwdLen; r++){
				encBytes[e] = (byte) (pwdBytes[e] ^ rankBytes[r]);
			}
		}
		
		return encBytes;
	}
	
	
	
	
	public static void main(String[] args) {
		try {
			/*System.out.println(password("abcdekfdjk", generank("abcdekfdjk")));
			System.out.println(generank("abcdekfdjk"));
			
			System.out.println(password("abcdekfdjk","Sb&eL1"));*/
			
			String s = generank("abcdekfdjk");
			byte[] b = s.getBytes("utf-8");
			System.out.println(b);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}/* catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}

	
}
