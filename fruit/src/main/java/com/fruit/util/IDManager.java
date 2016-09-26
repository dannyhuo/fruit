package com.fruit.util;

import java.util.Random;

/**
 * The id manager<br>
 * For generate all kinds of id
 * @author Danny.Huo
 * @version 1.0
 *
 */
public class IDManager {
	private static final char[] idChars = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
	
	/**
	 * Generate the id , default length is 32 bit
	 * @return {String}
	 */
	public static String generId(){
		return generHaxi(32);
	}
	
	/**
	 * Generate an 32 bit hexadecimal number's string
	 * @return {String}
	 */
	public static String generHaxi32(){
		String time = Long.toHexString(System.currentTimeMillis());
		int missLen = 32 - time.length();
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for(int i = 0; i < missLen; i++){
			sb.append(idChars[random.nextInt(16)]);
		}
		return time + sb.toString();
	};
	
	/**
	 * Generate an 42 bit hexadecimal number's string
	 * @return {String}
	 */
	public static String generHaxi42(){
		return generHaxi(42);
	}
	
	/**
	 * Generate an auto bit hexadecimal number's string
	 * @param len the string length
	 * @return {String}
	 */
	public static String generHaxi(int len){
		String time = Long.toHexString(System.currentTimeMillis());
		int missLen = len - time.length();
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for(int i = 0; i < missLen; i++){
			sb.append(idChars[random.nextInt(16)]);
		}
		return time + sb.toString();
	}
	
}
