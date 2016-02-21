package com.xuetu.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xuetu.entity.Coupon;
import com.xuetu.service.CouService2;

@WebServlet("/CouponListServlet")
public class CouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ceshi gaiwenjain shi fouzou ");
		HttpSession session = request.getSession();
		int attribute = (int)session.getAttribute("storeNameId");
		CouService2 loginService = new CouService2();
		List<Coupon> coupinLost= loginService.getListCoupon(attribute);
		System.out.println(coupinLost);
		session.setAttribute("listCoupon", coupinLost);
		request.getRequestDispatcher("cat_manage.jsp").forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
