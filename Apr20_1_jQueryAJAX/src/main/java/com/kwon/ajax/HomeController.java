package com.kwon.ajax;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	@Autowired private DAO dao;

	@RequestMapping(value = "/menu.get", 
			method = RequestMethod.GET, 
			produces = "application/xml; charset=utf-8") //나오는 결과물이 xml
	public @ResponseBody Menus menuGet(HttpServletRequest req, //@ResponseBody :
			HttpServletResponse res) {
		return dao.getAllMenu(req, res);
	}
	
	//http://localhost:8090/ajax/menu.search.price?m_price=5000
	@RequestMapping(value = "/menu.search.price", 
			method = RequestMethod.GET, 
			produces = "application/xml; charset=utf-8") //나오는 결과물이 xml
	public @ResponseBody Menus msp(Menu m,HttpServletRequest req, 
			HttpServletResponse res) {
		return dao.sMenuByPrice(req, res, m);
	}

	@RequestMapping(value = "/menu.search.name", 
			method = RequestMethod.GET, 
			produces = "application/xml; charset=utf-8") //나오는 결과물이 xml
	public @ResponseBody Menus nmser(Menu m,HttpServletRequest req, 
			HttpServletResponse res) {

		try {
			//클라이언트에서 utf-8로 인코딩 된 문자열 다시 디코딩으로 복구한다.
			m.setM_name(URLDecoder.decode(m.getM_name(), "utf-8"));
			return dao.sMenuByName(req, res, m);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			return new Menus();
		}
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, 
							HttpServletResponse res) {
		return "index";
	}
	
	@RequestMapping(value = "/student.getAll", 
			method = RequestMethod.GET,  
			produces = "application/json; charset=utf-8") //XML 대신 JSON으로 수정
	public @ResponseBody Students sGA(HttpServletRequest request, HttpServletResponse response) {
		
		return dao.getAllStudent(request, response);
	}
	
	@RequestMapping(value = "/student.getAllJSONP", 
			method = RequestMethod.GET,  
			produces = "application/json; charset=utf-8") //XML 대신 JSON으로 수정
	public @ResponseBody String sGAP(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cb = request.getParameter("callback");
			Students ss = dao.getAllStudent(request, response);
			
			// java 객체를 json으로 바꿔줄 객체
			ObjectMapper om = new ObjectMapper();
			
			String resBody = cb +"("+
					new String(om.writeValueAsString(ss))
					+")";
			
			return resBody;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
    
}



