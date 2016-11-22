package com.fruit.servlet.login;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.fruit.dao.mysql.MenuAuthorityMapper;
import com.fruit.model.MenuAuthority;
import com.fruit.model.vo.EmployeeVo;
import com.fruit.model.vo.MenuAuthorityVo;
import com.fruit.service.LoginService;

/**
 * Servlet implementation class CustomerLogin
 */
public final class BackLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final String INDEX_PAGE = "/fruit/back/index.do";
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MenuAuthorityMapper menuAuthorityMapper;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackLoginServlet() {
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
		
		//2、登录信息验证
		String loginName = request.getParameter("loginName");
		String password = request.getParameter("password");
		try {
			EmployeeVo employeeVo = loginService.backLogin(loginName, password);
			if(employeeVo.isLoginSuccess()){
				HttpSession session = request.getSession();
				session.setAttribute("employee", employeeVo);
				List<MenuAuthorityVo> myMenus = getMyMenuAuthority(employeeVo.getRole());
				if(null != myMenus && myMenus.size() > 0){
					session.setAttribute("employeeMenus", myMenus);
				}
				response.sendRedirect(INDEX_PAGE);
			}else{
				log.info("login failed :" + employeeVo.getLoginMessage());
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
	
	private List<MenuAuthorityVo> getMyMenuAuthority(Byte role){
		MenuAuthority condition = new MenuAuthority();
		condition.setRole(role);
		return menuAuthorityMapper.queryMenuSelective(condition);
	}

}
