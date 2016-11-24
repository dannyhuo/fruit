package com.fruit.controller.back;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.model.Supplier;
import com.fruit.model.vo.EmployeeVo;
import com.fruit.model.vo.GoodsVo;
import com.fruit.model.vo.PurchaseOrderDetailVo;
import com.fruit.model.vo.PurchaseOrderVo;
import com.fruit.service.GoodsService;
import com.fruit.service.PurchaseOrderDetailService;
import com.fruit.service.PurchaseOrderService;
import com.fruit.service.SupplierService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/back/purchaseController")
public class PurchaseController {
	
	@Autowired
	private PurchaseOrderService purchaseOrderService;
	
	@Autowired
	private PurchaseOrderDetailService purchaseOrderDetailService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private SupplierService supplierService;
	
	/**
	 * 采购管理
	 * @param request
	 * @return
	 */
	@RequestMapping("/purchase")
	public ModelAndView purchaseManage(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/back/purchase/purchaseManage");
		getPurcharseDetail(mav);
		return mav;
	}
	
	/**
	 * 新增采购
	 * @param request
	 * @return
	 */
	@RequestMapping("/toPurchase")
	public ModelAndView addPurchase(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/back/purchase/purchase");
		Map<String, Object> params = new HashMap<>();
		params.put("startRow", 0);
		params.put("pageSize", 10);
		
		List<PurchaseOrderVo> purchaseOrders = purchaseOrderService.querySelective(params);
		if(null != purchaseOrders && purchaseOrders.size() > 0){
			for (PurchaseOrderVo purchaseOrderVo : purchaseOrders) {
				Map<String, Object> detailParam = new HashMap<>();
				detailParam.put("purchaseOrderId", purchaseOrderVo.getPurchaseOrderId());
				List<PurchaseOrderDetailVo> details = purchaseOrderDetailService.querySelective(detailParam);
				if(null != details){
					purchaseOrderVo.setPurchaseOrderDetails(details);
				}
			}
		}
		mav.addObject("purchaseOrders", purchaseOrders);
		
		EmployeeVo employeeVo = (EmployeeVo)request.getSession().getAttribute("employee");
		if(null != employeeVo){
			queryBaseData(mav, employeeVo.getEmployeeId());
		}
		return mav;
	}
	
	
	/**
	 * 提交采购单
	 * @param request
	 * @return
	 */
	@RequestMapping("/doPurchase")
	public ModelAndView doPurchase(PurchaseOrderVo purchaseOrderVo, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/back/purchase/purchaseManage");
		//1、构建采购单对象
		String detailJson = purchaseOrderVo.getPurchaseOrderDetailsJson();
		JSONArray detailJsonArray = JSONArray.fromObject(detailJson);
		List<PurchaseOrderDetailVo> purchaseOrderDetails = (List<PurchaseOrderDetailVo>) JSONArray.toCollection(detailJsonArray, PurchaseOrderDetailVo.class);
		purchaseOrderVo.setPurchaseOrderDetails(purchaseOrderDetails);
		
		//2、获取用户（采购员）信息
		EmployeeVo employeeVo = (EmployeeVo)request.getSession().getAttribute("employee");
		purchaseOrderVo.setEmployeeId(employeeVo.getEmployeeId());
		
		//3、保存采购单
		purchaseOrderService.savePurchaseOrder(purchaseOrderVo);
		
		//4、查询采购单位
		getPurcharseDetail(mav);
		
		return mav;
	}
	
	private void queryBaseData(ModelAndView mav, Long employeeId){
		//商品
		Map<String, Object> params = new HashMap<>();
		params.put("startRow", 0);
		params.put("pageSize", 100);
		List<GoodsVo> goodses = goodsService.selectByParam(params);
		mav.addObject("goodses", goodses);
		
		//供应商
		Map<String, Object> params2 = new HashMap<>();
		params.put("employeeId", employeeId);
		List<Supplier> suppliers = supplierService.querySelective(params2);
		mav.addObject("suppliers", suppliers);
		
		//采购单及采购明细
		getPurcharseDetail(mav);
	}
	
	
	/**
	 * 查询采购单及采购明细
	 * @param mav
	 */
	private void getPurcharseDetail(ModelAndView mav){
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
		mav.addObject("purchaseOrders", purchases);
	}

}
