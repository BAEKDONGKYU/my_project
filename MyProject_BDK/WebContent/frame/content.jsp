<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	ArrayList<ProductDTO> pArr = null;  
	
	if(request.getParameter("pSearch") == null) {
		//상품을 꺼내오기 위해 DAO 객체 생성
		ProductDAO dao = new ProductDAO();
		pArr = dao.allProductList("");

		
	}
	
	else {
		String keyWord = request.getParameter("pSearch");
		ProductDAO dao = new ProductDAO();
		pArr = dao.allProductList(keyWord);
	}
	


%>    
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function () {
		$(".cart").click(function () {
			var cartKey = $("#p_num").val();
			var cartValue = $("#p_name").val();
			$("#cartForm").submit();
			alert("장바구니에 상품을 추가 했습니다.");
		});
		
		$("#pSearch_button").click(function () {
			var searchValue = $("#pSearch").val();
			if(searchValue == "") {
				alert("검색할 제품을 입력해주세요");
				$("#pSearch").focus();
				return;
			}
			
		});
		
	});
</script>
<title></title>
</head>
<body>
	<div class="container">
	
		 <div id="body">
			<div class="container">
				<div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-left: 80px">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img src="images/banner/banner_1.jpg" alt="banner_1">
						</div>
	
						<div class="item">
							<img src="images/banner/banner_2.jpg" alt="banner_2">
						</div>
						<div class="item">
							<img src="images/banner/banner_3.jpg" alt="banner_3">
						</div>
					</div>
				</div>
			</div>
		  </div> 
	
	
	
	
		<div id="header">
			<form class="form-inline" id="searchForm">
				<input class="form-control" type="text" placeholder="음식을 입력해주세요" name="pSearch" id="pSearch" method="post" action="/MyProject_BDK/frame/content.jsp"> 
				<input type="button" class="btn btn-suceess" id="pSearch_button" value="검색">
			</form>
			<ul id="navigation">
				<li class="selected"><a href="index.html">NEW</a></li>
				<li><a href="*">BEST</a></li>
				<li><a href="*">SALE</a></li>
				<li><a href="*">국</a></li>
				<li><a href="*">반찬</a></li>
				<li><a href="*">메인요리</a></li>
			</ul>
		</div>
		
		<div class="tab-head">
			<div class=" con-w3l">
				<div class="col-md-2 m-wthree">
<%
					for(int i=0; i<pArr.size(); i++) {
						
						if(i%3 == 0) {
%>
						<div class="clearfix"></div>
						</div>
						<div class="col-md-3 m-wthree">	
<% 							
						}
%>
					 	<div class="col-m">
							<input type="hidden" id="p_name" value="<%=pArr.get(i).getP_name() %>">
							<input type="hidden" id="p_num" value="<%=pArr.get(i).getP_num() %>"> 								
							<a href="#" data-toggle="modal" data-target="#myModal1" class="offer-img">
								<img src="images/<%=pArr.get(i).getP_category() %>/<%=pArr.get(i).getP_num() %>.jpg" class="img-responsive" alt="">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6><a href="*"><%=pArr.get(i).getP_name() %></a></h6>							
								</div>
								<div class="mid-2">
									<p>
										<em class="item_price" style="margin-right: 170px"><%=pArr.get(i).getP_price() %></em>
										<img alt="cart" src="images/cart.png" class="cart">
									</p>
									<div class="clearfix"></div>
								</div>
								<!-- <div class="add">
									 <button class="btn btn-danger my-cart-btn my-cart-b " data-id="1" data-name="Moong" data-summary="summary 1" data-price="1.50" data-quantity="1" data-image="images/of.png">Add to Cart</button>
								</div> -->
											
							</div>
						</div> 
						
						<%-- <div class="col-m">
							<form action="http://localhost:8090/MyProject_BDK/cart/addCart.jsp" method="post" id="cartForm">							
								<a href="#" data-toggle="modal" data-target="#myModal1" class="offer-img">
									<img src="images/<%=pArr.get(i).getP_category() %>/<%=pArr.get(i).getP_num() %>.jpg" class="img-responsive" alt="">
								</a>
								<div class="mid-1">
									<div class="women">
										<h6><a href="*"><%=pArr.get(i).getP_name() %></a></h6>							
									</div>
									<div class="mid-2">
										<p>
											<em class="item_price" style="margin-right: 170px"><%=pArr.get(i).getP_price() %></em>
											<img alt="cart" src="images/cart.png" class="cart">
										</p>
										<div class="clearfix"></div>
									</div>
									
									<!-- <div class="add">
										 <button class="btn btn-danger my-cart-btn my-cart-b " data-id="1" data-name="Moong" data-summary="summary 1" data-price="1.50" data-quantity="1" data-image="images/of.png">Add to Cart</button>
									</div> -->
												
								</div>
							</form>
						</div>
						 --%>
						
						
<% 						

					}
%>						
				</div>				
			</div> <!-- con-w3l -->
		</div> <!-- tab-head -->
	</div> <!-- container -->
	
</body>
</html>