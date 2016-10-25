package com.fruit.controller.back;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.model.vo.GoodsTypeVo;
import com.fruit.model.vo.GoodsVo;
import com.fruit.service.GoodsService;
import com.fruit.service.GoodsTypeService;
import com.fruit.util.IDManager;

@Controller
@RequestMapping(value = "/goodsManagement")
public class GoodsManagement {

	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private GoodsTypeService goodsTypeService;
	
	@RequestMapping(value = "/goodsup")
	public ModelAndView goodsIndex(){
		ModelAndView mav = new ModelAndView("/webpage/back/goods/goodsUp");
		mav.addObject("goodsType", goodsTypeService.selectByParam(new GoodsTypeVo()));
		return mav;
	}
	
	
	@RequestMapping(value = "/doGoodsup")
	public ModelAndView goodsUp(@RequestParam(value = "file", required = false) MultipartFile file, 
			 HttpServletRequest request, GoodsVo goodsVo){
		
		//将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if(multipartResolver.isMultipart(request)){
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
           
            //获取multiRequest 中所有的文件名
            Iterator<String> iter=multiRequest.getFileNames();
             
            while(iter.hasNext()){
                //一次遍历所有文件
                MultipartFile upFile = multiRequest.getFile(iter.next().toString());
                if(upFile != null){
                	//上传文件所在的目录
                    String path = request.getSession().getServletContext().getRealPath("/webpage/goods_imgs");
                    //上传前的文件名
                    String upFileName = upFile.getOriginalFilename();
                    //上传后的文件名
                    goodsVo.setGoodsImageUrl(IDManager.generHaxi(16) + upFileName.substring(upFileName.lastIndexOf(".")));
                    //上传
                    try {
                    	upFile.transferTo(new File(path, goodsVo.getGoodsImageUrl()));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                }
            }
        }
        
        goodsVo.setEmployeeId(1L);
        
        goodsService.insertSelective(goodsVo);
        
		return goodsList(goodsVo);
	}
	
	
	@RequestMapping(value="/goodsList")
	public ModelAndView goodsList(GoodsVo goodsVo){
		ModelAndView mav = new ModelAndView("/webpage/back/goods/goodsList");
		
		mav.addObject("listGoodses", goodsService.selectByParam(goodsVo));
		
		return mav;
	}
	
	@RequestMapping(value="/goodsSearch")
	public ModelAndView goodsSearch(GoodsVo goodsVo){
		ModelAndView mav = new ModelAndView("/webpage/back/goods/goodsList");
		
		mav.addObject("listGoodses", goodsService.searchByKeyWords(goodsVo));
		
		mav.addObject("keyWords", goodsVo.getKeyWords());
		
		return mav;
	}
	
	
	
}
