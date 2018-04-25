package com.kwon.ajax;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DAO {

	@Autowired
	private SqlSession ss;
	
	// 기존
//	public void getAllMenu(HttpServletRequest req, HttpServletResponse res) {
//		req.setAttribute("menus", 
//			ss.getMapper(Mapper.class).getAllMenu()
//		);
//	}
	
	// XML응답
	//		자바빈 하나 더(테이블 자체를 표현하는)
	public Menus getAllMenu(HttpServletRequest req, HttpServletResponse res) {
		
		// select 수행
		List<Menu> menus = ss.getMapper(Mapper.class).getAllMenu();
		
		// 테이블 자체를 표현하는 객체 생성
		Menus menus2 = new Menus(menus);
		
		// XML 객체를 반환
		return menus2;
	}
	
	public Menus sMenuByPrice(HttpServletRequest req, HttpServletResponse res, Menu m) {
		
		
		return new Menus(ss.getMapper(Mapper.class).searchMenuByPrice(m));
	}

	public Menus sMenuByName(HttpServletRequest req, HttpServletResponse res, Menu m) {
		
		
		return new Menus(ss.getMapper(Mapper.class).searchMenuByName(m));
	}
	
	
	public Students getAllStudent(HttpServletRequest request, HttpServletResponse response )
	{
		return new Students(ss.getMapper(Mapper.class).getAllStudent());
	}
}















