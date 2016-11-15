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
	
	
	public static enum SHOPPING_CART_STATUS {
		ADDED((byte)0,"添加"),
		BOUGHT((byte)1,"已购买"),
		DELETED((byte)2,"主动删除");
		
		private byte code;
		private String cnName;

		SHOPPING_CART_STATUS(byte code, String cnName){
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
			for(SHOPPING_CART_STATUS item: SHOPPING_CART_STATUS.values()){
				if(item.getCode() == code){
					return item.getCnName();
				}
			}
			return null;
		}
		
		public static Byte getCodeByName(String key){
			for(SHOPPING_CART_STATUS item: SHOPPING_CART_STATUS.values()){
				if(item.getCnName().equals(key)){
					return item.getCode();
				}
			}
			return null;
		}
	}
	
	
	public static enum ORDER_STATUS {
		WAIT_PAY((byte)0,"待支付"),
		PAIED((byte)1,"已支付"),
		UNPAY_CANCEL((byte)2,"未支付取消"),
		REFUND((byte)3,"申请退款"),
		REFUNDING((byte)4,"退款处理中"),
		REFUNDED((byte)5,"退款完成");
		
		private byte code;
		private String cnName;

		ORDER_STATUS(byte code, String cnName){
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
			for(ORDER_STATUS item: ORDER_STATUS.values()){
				if(item.getCode() == code){
					return item.getCnName();
				}
			}
			return null;
		}
		
		public static Byte getCodeByName(String key){
			for(ORDER_STATUS item: ORDER_STATUS.values()){
				if(item.getCnName().equals(key)){
					return item.getCode();
				}
			}
			return null;
		}
	}
}
