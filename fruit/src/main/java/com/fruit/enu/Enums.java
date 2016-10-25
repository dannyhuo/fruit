package com.fruit.enu;


public class Enums {
	
	
	public static enum GOODS_CATEGORY {
		JIN_KOU((byte)1,"进口类"),
		GUO_CHAN((byte)2,"国产类"),
		JIANG_GUO((byte)3,"浆果类"),
		GUA_GUO((byte)4,"瓜果类"),
		JU_GUO((byte)5,"橘果类"),
		HE_GUO((byte)6,"核果类"),
		REN_GUO((byte)7,"仁果类"),
		QI_TA((byte)8,"其它类");
		
		private byte code;
		private String cnName;

		GOODS_CATEGORY(byte code, String cnName){
			this.code = code;
			this.cnName = cnName;
		}
		public byte getCode(){
			return this.code;
		}
		public String getCnName(){
			return this.cnName;
		}
		
		public static String getCnName(byte code){
			for(GOODS_CATEGORY item: GOODS_CATEGORY.values()){
				if(item.getCode() == code){
					return item.getCnName();
				}
			}
			return null;
		}
		
		public static Byte searchCode(String key){
			for(GOODS_CATEGORY item: GOODS_CATEGORY.values()){
				if(item.getCnName().equals(key)){
					return item.getCode();
				}
			}
			return null;
		}
		
		public static Byte searchCodeLike(String key){
			for(GOODS_CATEGORY item: GOODS_CATEGORY.values()){
				if(item.getCnName().indexOf(key) != -1){
					return item.getCode();
				}
			}
			return null;
		}
		
	}
}
