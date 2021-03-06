package com.fruit.servlet.login;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.fruit.model.Customer;
import com.fruit.model.vo.CustomerVo;
import com.fruit.service.LoginService;

/**
 * Servlet implementation class CustomerLogin
 */
public final class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final String INDEX_PAGE = "/fruit/index.do";
	
	//private final String ERROR_PAGE = "";
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private LoginService loginService;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		//servlet中自动注入service
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
		         config.getServletContext());
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//1、验证,验证码及token的验证，防止机器恶意攻击登录
		/*String validateCode = request.getParameter("validateCode");
		String token = request.getParameter("token");
		if(null == validateCode || validateCode.trim().equals("")){
			response.sendRedirect(INDEX_PAGE);
			return;
		}
		if(null == token || token.trim().equals("")){
			response.sendRedirect(INDEX_PAGE);
			return;
		}
		
		if(!validateCode.equals(request.getSession().getAttribute(token))){
			response.sendRedirect(INDEX_PAGE);
			return;
		}*/
		
		//2、登录信息验证
		String loginName = request.getParameter("loginName");
		String password = request.getParameter("password");
		try {
			CustomerVo customerVo = loginService.login(loginName, password);
			if(customerVo.isLoginSuccess()){
				request.getSession().setAttribute("customer", (Customer) customerVo);
				response.sendRedirect(INDEX_PAGE);
			}else{
				log.info("login failed :" + customerVo.getLoginMessage());
			}
		} catch (NoSuchAlgorithmException e) {
			log.info("登录发生异常。", e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
