package com.fruit.enu;


public class Enums {
	
	/**
	 * 水果品类枚举
	 * @author huoqiang
	 *
	 */
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
	
	/**
	 * 购物车商品状态枚举
	 * @author huoqiang
	 *
	 */
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
	
	/**
	 * 订单状态枚举
	 * @author huoqiang
	 *
	 */
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
	
	/**
	 * 订单出库状态枚举
	 * @author huoqiang
	 *
	 */
	public static enum ORDER_OUT_STORE_STATUS {
		WAIT_OUT_STORE((byte)0,"待出库"),
		OUT_STORED((byte)1,"已出库");
		
		private byte code;
		private String cnName;

		ORDER_OUT_STORE_STATUS(byte code, String cnName){
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
			for(ORDER_OUT_STORE_STATUS item: ORDER_OUT_STORE_STATUS.values()){
				if(item.getCode() == code){
					return item.getCnName();
				}
			}
			return null;
		}
		
		public static Byte getCodeByName(String key){
			for(ORDER_OUT_STORE_STATUS item: ORDER_OUT_STORE_STATUS.values()){
				if(item.getCnName().equals(key)){
					return item.getCode();
				}
			}
			return null;
		}
	}
	
	/**
	 * 雇员角色枚举
	 * @author huoqiang
	 *
	 */
	public static enum EMPLOYEE_ROLE {
		ADMIN((byte)0,"管理员"),
		OPERATION_SPECIALIST((byte)1,"运营专员"),
		ORDER_RECEIVERS((byte)2,"接单员"),
		REPOSTORY_ADMIN((byte)3,"仓管员"),
		BUYER((byte)4,"采购员");
		
		private byte code;
		private String cnName;

		EMPLOYEE_ROLE(byte code, String cnName){
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
			for(EMPLOYEE_ROLE item: EMPLOYEE_ROLE.values()){
				if(item.getCode() == code){
					return item.getCnName();
				}
			}
			return null;
		}
		
		public static Byte getCodeByName(String key){
			for(EMPLOYEE_ROLE item: EMPLOYEE_ROLE.values()){
				if(item.getCnName().equals(key)){
					return item.getCode();
				}
			}
			return null;
		}
	}
	
	/**
	 * 雇员角色枚举
	 * @author huoqiang
	 *
	 */
	public static enum EMPLOYEE_STATUS {
		WAIT_ENTRY((byte)0,"待入职"),
		INTERN((byte)1,"实习生"),
		PROBATION((byte)2,"试用期"),
		OFFICIAL((byte)3,"正式员工"),
		DIMISSION((byte)4,"离职"),
		GET_FIRED((byte)5,"被解雇");
		
		private byte code;
		private String cnName;

		EMPLOYEE_STATUS(byte code, String cnName){
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
			for(EMPLOYEE_STATUS item: EMPLOYEE_STATUS.values()){
				if(item.getCode() == code){
					return item.getCnName();
				}
			}
			return null;
		}
		
		public static Byte getCodeByName(String key){
			for(EMPLOYEE_STATUS item: EMPLOYEE_STATUS.values()){
				if(item.getCnName().equals(key)){
					return item.getCode();
				}
			}
			return null;
		}
	}
	
	
	/**
	 * 采购状态
	 * @author huoqiang
	 *
	 */
	public static enum PURCHASE_STATUS {
		WAIT_SUPPLY((byte)0,"待供货"),
		SUPPLIED((byte)1,"已供货");
		
		private byte code;
		private String cnName;

		PURCHASE_STATUS(byte code, String cnName){
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
			for(PURCHASE_STATUS item: PURCHASE_STATUS.values()){
				if(item.getCode() == code){
					return item.getCnName();
				}
			}
			return null;
		}
		
		public static Byte getCodeByName(String key){
			for(PURCHASE_STATUS item: PURCHASE_STATUS.values()){
				if(item.getCnName().equals(key)){
					return item.getCode();
				}
			}
			return null;
		}
	}
}
