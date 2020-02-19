<%@page import="cart.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	

	//로그인 아이디 가져오기
	String userId = (String)session.getAttribute("id");
	//파라미터로 넘겨 받은 값들 가지고 와서 cartDAO 객체 생성후
	//cartDAO에 추가
	
	
	String pName = request.getParameter("p_name"); // 상품 이름
	String pPrice = request.getParameter("p_price"); // 상품 가격
	String pNum = request.getParameter("p_num"); // 상품 고유번호
	int cartStock = 1;
	
	CartDAO cDAO = new CartDAO();
	int result = cDAO.addCart(userId, pNum, cartStock);
	
	System.out.println("Cart추가 성공 여부 : " + result);
	
%>
