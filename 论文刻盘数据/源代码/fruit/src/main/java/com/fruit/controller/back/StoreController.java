package com.fruit.controller.back;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.enu.Enums.EMPLOYEE_ROLE;
import com.fruit.enu.Enums.ORDER_OUT_STORE_STATUS;
import com.fruit.enu.Enums.ORDER_STATUS;
import com.fruit.enu.Enums.PURCHASE_STATUS;
import com.fruit.model.vo.EmployeeVo;
import com.fruit.model.vo.FruitOrderDetailVo;
import com.fruit.model.vo.FruitOrderVo;
import com.fruit.model.vo.GoodsInventoryVo;
import com.fruit.model.vo.PurchaseOrderDetailVo;
import com.fruit.model.vo.PurchaseOrderVo;
import com.fruit.model.vo.RepostoryVo;
import com.fruit.service.DeliveryAddressService;
import com.fruit.service.EmployeeService;
import com.fruit.service.FruitOrderDetailService;
import com.fruit.service.FruitOrderService;
import com.fruit.service.GoodsInventoryService;
import com.fruit.service.PurchaseOrderDetailService;
import com.fruit.service.PurchaseOrderService;
import com.fruit.service.RepostoryService;
import com.fruit.util.IDManager;

@Controller
@RequestMapping("/back/storeController")
public class StoreController {
	
	@Autowired
	private FruitOrderService fruitOrderService;
	
	@Autowired
	private DeliveryAddressService deliveryAddressService;
	
	@Autowired
	private FruitOrderDetailService fruitOrderDetailService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private RepostoryService repostoryService;
	
	@Autowired
	private PurchaseOrderService purchaseOrderService;
	
	@Autowired
	private PurchaseOrderDetailService purchaseOrderDetailService;
	
	@Autowired
	private GoodsInventoryService goodsInventoryService;
	

	/**
	 * 出库管理
	 * @return
	 */
	@RequestMapping("/outStore")
	public ModelAndView outStore(){
		ModelAndView mav = new ModelAndView("/webpage/back/storage/outStore");
		
		mav.addObject("outStoreOrders", getFruitOrder());
		return mav;
	}
	
	/**
	 * 获取出库订单数据
	 * @return
	 */
	private List<FruitOrderVo> getFruitOrder(){
		Map<String, Object> params = new HashMap<>();
		params.put("status", ORDER_STATUS.WAIT_PAY.getCode());
		params.put("startRow", 0);
		params.put("pageSize", 5);
		List<FruitOrderVo> orders = fruitOrderService.querySelective(params);
		if(null != orders && orders.size() > 0){
			for (FruitOrderVo fruitOrderVo : orders) {
				fruitOrderVo.setDeliveryAddress(deliveryAddressService.selectByPrimaryKey(fruitOrderVo.getAddressId()));
				
				Map<String, Object> detailParams = new HashMap<String, Object>();
				detailParams.put("orderId", fruitOrderVo.getOrderId());
				fruitOrderVo.setOrderDetails(fruitOrderDetailService.querySelective(detailParams));
			}
		}
		return orders;
	}
	
	/**
	 * 商品出库
	 * @return
	 */
	@RequestMapping("/goodsOutStore")
	public ModelAndView goodsOutStore(GoodsInventoryVo goodsInventoryVo){
		ModelAndView mav = new ModelAndView("/webpage/back/storage/inStore");
		
		//出库操作
		Map<String, Object> params = new HashMap<>();
		params.put("goodsId", goodsInventoryVo.getGoodsId());
		List<GoodsInventoryVo> goodesInventories = goodsInventoryService.querySelective(params);
		if(null != goodesInventories && goodesInventories.size() > 0){
			GoodsInventoryVo vo = goodesInventories.get(0);
			short newQuantity = (short) (vo.getQuantity().shortValue() - goodsInventoryVo.getQuantity().shortValue());
			if(newQuantity > 0){
				vo.setQuantity(newQuantity);
				goodsInventoryService.updateByPrimaryKeySelective(vo);
			}
		}
		
		//修改订单出库状态
		FruitOrderDetailVo fruitOrderDetailVo = new FruitOrderDetailVo();
		fruitOrderDetailVo.setOrderDetailId(goodsInventoryVo.getOrderDetailId());
		fruitOrderDetailVo.setStatus(ORDER_OUT_STORE_STATUS.OUT_STORED.getCode());
		fruitOrderDetailService.updateByPrimaryKeySelective(fruitOrderDetailVo);
		
		//查询订单
		mav.addObject("outStoreOrders", getFruitOrder());
		return mav;
	}
	
	
	/**
	 * 入库管理
	 * @return
	 */
	@RequestMapping("/inStore")
	public ModelAndView inStore(){
		ModelAndView mav = new ModelAndView("/webpage/back/storage/inStore");
		mav.addObject("purchaseOrders", getPurchaseOrder());
		return mav;
	}
	
	/**
	 * 获取采购单
	 */
	private List<PurchaseOrderVo> getPurchaseOrder(){
		Map<String, Object> params = new HashMap<>();
		params.put("startRow", 0);
		params.put("pageSize", 5);
		List<PurchaseOrderVo> purchases = purchaseOrderService.querySelective(params);
		for (PurchaseOrderVo purchaseOrderVo : purchases) {
			Map<String, Object> detailParams = new HashMap<>();
			detailParams.put("purchaseOrderId", purchaseOrderVo.getPurchaseOrderId());
			List<PurchaseOrderDetailVo> details = purchaseOrderDetailService.querySelective(detailParams);
			purchaseOrderVo.setPurchaseOrderDetails(details);
		}
		return purchases;
	}
	
	/**
	 * 商品入库
	 * @return
	 */
	@RequestMapping("/goodsInStore")
	public ModelAndView goodsInStore(GoodsInventoryVo goodsInventoryVo){
		ModelAndView mav = new ModelAndView("/webpage/back/storage/inStore");
		goodsInventoryVo.setGoodsBatchNo(Long.parseLong(IDManager.getTimeStamp(8)));
		Date curDate = new Date();
		curDate.setTime(System.currentTimeMillis() + 1000 * 60 * 60 * 24 * 7);
		goodsInventoryVo.setExpiredTime(curDate);//默认七天过期
		
		goodsInventoryVo.setSellingQuantity(goodsInventoryVo.getQuantity());
		
		//入库操作
		Map<String, Object> params = new HashMap<>();
		params.put("repostoryId", goodsInventoryVo.getRepostoryId());
		params.put("goodsId", goodsInventoryVo.getGoodsId());
		List<GoodsInventoryVo> goodesInventories = goodsInventoryService.querySelective(params);
		if(null != goodesInventories && goodesInventories.size() > 0){
			GoodsInventoryVo vo = goodesInventories.get(0);
			short newQuantity = (short) (goodsInventoryVo.getQuantity().shortValue() + vo.getQuantity().shortValue());
			short newCanSellQuantity = (short) (goodsInventoryVo.getQuantity().shortValue() + vo.getSellingQuantity().shortValue());
			vo.setQuantity(newQuantity);
			vo.setSellingQuantity(newCanSellQuantity);
			vo.setGoodsBatchNo(goodsInventoryVo.getGoodsBatchNo());
			vo.setExpiredTime(goodsInventoryVo.getExpiredTime());
			goodsInventoryService.updateByPrimaryKeySelective(vo);
		}else{
			goodsInventoryService.insertSelective(goodsInventoryVo);
		}
		
		//修改入库状态
		PurchaseOrderDetailVo purchaseOrderDetailVo = new PurchaseOrderDetailVo();
		purchaseOrderDetailVo.setPurchaseOrderDetailId(goodsInventoryVo.getPurchaseOrderDetailId());
		purchaseOrderDetailVo.setStatus(PURCHASE_STATUS.SUPPLIED.getCode());
		purchaseOrderDetailService.updateByPrimaryKeySelective(purchaseOrderDetailVo);
		
		//查询采购单
		mav.addObject("purchaseOrders", getPurchaseOrder());
		return mav;
	}
	
	
	/**
	 * 新增仓库－去新增页面
	 * @return
	 */
	@RequestMapping("/toAddRepostory")
	public ModelAndView toAddRepostory(){
		ModelAndView mav = new ModelAndView("/webpage/back/storage/addRepostory");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("employeeId", EMPLOYEE_ROLE.REPOSTORY_ADMIN.getCode());
		List<EmployeeVo> repostoryAdmins = employeeService.querySelective(params);
		
		mav.addObject("repostoryAdmins",repostoryAdmins);
		
		return mav;
	}
	
	/**
	 * 新增仓库-提交
	 * @return
	 */
	@RequestMapping("/addRepostory")
	public ModelAndView addRepostory(RepostoryVo repostoryVo){
		ModelAndView mav = new ModelAndView("/webpage/back/storage/addRepostory");
		
		repostoryVo.setStartUsingDate(new Date());
		repostoryService.insertSelective(repostoryVo);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("employeeId", EMPLOYEE_ROLE.REPOSTORY_ADMIN.getCode());
		List<EmployeeVo> repostoryAdmins = employeeService.querySelective(params);
		mav.addObject("repostoryAdmins",repostoryAdmins);
		
		return mav;
	}
	
}
