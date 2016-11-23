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
	
	@RequestMapping("/toPurchase")
	public ModelAndView toPurchase(HttpServletRequest request){
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
	 * 提交采购
	 * @param request
	 * @return
	 */
	@RequestMapping("/purchase")
	public ModelAndView purchase(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/back/purchase/purchase");
		
		return mav;
	}
	
	private void queryBaseData(ModelAndView mav, Long employeeId){
		GoodsVo goodsVo = new GoodsVo();
		goodsVo.setPageNo(1);
		goodsVo.setPageSize(100);
		List<GoodsVo> goodses = goodsService.selectByParam(goodsVo);
		mav.addObject("goodses", goodses);
		
		Map<String, Object> params = new HashMap<>();
		params.put("employeeId", employeeId);
		List<Supplier> suppliers = supplierService.querySelective(params);
		mav.addObject("suppliers", suppliers);
	}

}
