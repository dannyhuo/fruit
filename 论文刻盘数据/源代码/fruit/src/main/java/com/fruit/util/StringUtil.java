package com.fruit.util;


public class StringUtil {
	
	
	/**
	 * 将n个字符串拼接起来<br>
	 * 无参数或参数为空或空白，则返回null
	 * @param strings 要拼接到一起的字符串
	 * @return {String}
	 */
	public static String join(String ...strings){
		int length = strings.length;
		StringBuilder retSb = null;
		if(length > 0){
			retSb = new StringBuilder();
			for(int i = 0; i < length; i++){
				if(null != strings[i] && !"".equals(strings[i])){
					retSb.append(strings[i]);
				}
			}
			if(retSb.length() > 0){
				return retSb.toString();
			}
		}
		return null;
	}
	
	/**
	 * 将n个字符串用指定字符连接起来
	 * @param ch 连接的字符
	 * @param strings
	 * @return {String}
	 */
	public static String join(char ch, String ...strings){
		int length = strings.length;
		StringBuilder retSb = null;
		if(length > 0){
			retSb = new StringBuilder();
			for(int i = 0; i < length; i++){
				if(null != strings[i] && !"".equals(strings[i])){
					retSb.append(strings[i]);
					if(i < (length - 1)){
						retSb.append(ch);
					}
				}
			}
			int retSbLength = retSb.length();
			if(retSbLength > 0){
				return retSb.toString();
			}
		}
		return null;
	}
}
