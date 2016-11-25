package com.fruit.util;

import java.util.Calendar;
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
	
	/**
	 * 获取指定长度的时间戳
	 * @param len
	 * @return
	 */
	public static String getTimeStamp(int len){
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		int year = calendar.get(Calendar.YEAR);
		String yearStr = year + "";
		int month = calendar.get(Calendar.MONTH) + 1;
		String monthStr = month > 9 ? month+"" : ("0" + month);
		int date = calendar.get(Calendar.DATE);
		String dateStr = date > 9 ? date+"" : "0" + date;
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		String hourStr = hour > 9 ? hour+"" : "0" + hour;
		int minute = calendar.get(Calendar.MINUTE);
		String minuteStr = minute > 9 ? minute+"" : "0" + minute;
		int second = calendar.get(Calendar.SECOND);
		String secondStr = second > 9 ? second+"" : "0" + second;
		if(len <= 4){
			return yearStr;
		}else if(len <= 6){
			return yearStr + month;
		}else if(len <= 8){
			return yearStr + monthStr + dateStr;
		}else if(len <= 10){
			return yearStr + monthStr + dateStr + hourStr;
		}else if(len <= 12){
			return yearStr + monthStr + dateStr + hourStr + minuteStr;
		}else{
			return yearStr + monthStr + dateStr + hourStr + minuteStr + secondStr;
		}
	}
	
}
