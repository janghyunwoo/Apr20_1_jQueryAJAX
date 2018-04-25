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
	
	// ����
//	public void getAllMenu(HttpServletRequest req, HttpServletResponse res) {
//		req.setAttribute("menus", 
//			ss.getMapper(Mapper.class).getAllMenu()
//		);
//	}
	
	// XML����
	//		�ڹٺ� �ϳ� ��(���̺� ��ü�� ǥ���ϴ�)
	public Menus getAllMenu(HttpServletRequest req, HttpServletResponse res) {
		
		// select ����
		List<Menu> menus = ss.getMapper(Mapper.class).getAllMenu();
		
		// ���̺� ��ü�� ǥ���ϴ� ��ü ����
		Menus menus2 = new Menus(menus);
		
		// XML ��ü�� ��ȯ
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















