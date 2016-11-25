package com.fruit.controller.back;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.enu.Enums.EMPLOYEE_ROLE;
import com.fruit.model.Supplier;
import com.fruit.model.vo.EmployeeVo;
import com.fruit.model.vo.SupplierVo;
import com.fruit.service.EmployeeService;
import com.fruit.service.SupplierService;

@Controller
@RequestMapping("/back/supplierController")
public class SupplierController {
	
	@Autowired
	private SupplierService supplierService;
	
	@Autowired
	private EmployeeService employeeService;
	

	/**
	 * 供应商管理界面
	 * @return
	 */
	@RequestMapping("/toSupplier")
	public ModelAndView toSupplier(){
		ModelAndView mav = new ModelAndView("/webpage/back/supplier/supplier");
		
		Map<String, Object> params = new HashMap<>();
		params.put("role", EMPLOYEE_ROLE.BUYER.getCode());
		List<EmployeeVo> buyers = employeeService.querySelective(params);
		
		mav.addObject("buyers", buyers);
		return mav;
	}
	
	/**
	 * 供应商管理界面
	 * @return
	 */
	@RequestMapping("/addSupplier")
	public ModelAndView addSupplier(SupplierVo supplierVo, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/back/supplier/supplier");
		
		//1、新增供应商
		supplierService.insertSelective(supplierVo);
		
		//2、查询采购员
		Map<String, Object> params = new HashMap<>();
		params.put("employeeId", EMPLOYEE_ROLE.BUYER.getCode());
		List<EmployeeVo> buyers = employeeService.querySelective(params);
		mav.addObject("buyers", buyers);
		
		//3、查询供应商
		Map<String, Object> supplierParams = new HashMap<>();
		//params.put("", "");
		List<Supplier> suppliers = supplierService.querySelective(supplierParams);
		mav.addObject("suppliers", suppliers);
		
		return mav;
	}
	
	
	
}
