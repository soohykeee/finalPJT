<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<%@ page import="java.sql.*" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>상품 상세 페이지</title>
<script type="text/javascript">
	function addToCart(){
		alert("해당 상품이 장바구니에 담겼습니다.");
	}
</script>
</head>
<body>

	<jsp:include page="menu.jsp"/>
	
	<%@ include file="dbconn.jsp" %>
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String productId = request.getParameter("id");
				
		String sql = "select * from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
				
		while(rs.next()){
	%>
	<br><br>
	<div class="container" style="width:1000px">
		<div class="row">
			<div class="col-md-6">
				<img src="resources/images/<%=rs.getString("p_fileName") %>" width="100%" height="100%" class="rounded">
			</div>
			
			<div class="col align-self-center">
				<strong><%=rs.getString("p_name") %></strong>
				<br><hr>
				
				Info.<br>
				<small><%=rs.getString("p_description") %></small>
				<br><br>
				
				<small>Brand : <%=rs.getString("p_brand") %></small>
				<br><br>
				
				<small>Size : <%=rs.getString("p_size") %></small>
				<br><br>
				
				
				<small>Price : <%=rs.getString("p_unitPrice") %>￦</small>
				<br><br><br><br><br>
				
				<c:if test="${sessionId!=null }">
					<div align="right">
						<form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id") %>" method="post">
							<a href="#" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#buyModal">Buy Now</a>
							<!-- Modal -->
							<div class="modal fade" id="buyModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="buyModalLabel" aria-hidden="true">
								<div class="modal-dialog" align="center">
									<div class="modal-content">
										<div class="modal-header">
											<div class="modal-title" id="buyModalLabel">Buy Product</div>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Would you like to purchase the product?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
											<button type="button" onclick="location.href='./PurchaseAddForm.doPu?id=${sessionId }&pid=<%=rs.getString("p_id") %>'" class="btn btn-primary">Yes</button>
										</div>
									</div>
								</div>
							</div>
							
							<a href="#" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#cartModal">Cart</a>
							<!-- Modal -->
							<div class="modal fade" id="cartModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="cartModalLabel" aria-hidden="true">
								<div class="modal-dialog" align="center">
									<div class="modal-content">
										<div class="modal-header">
											<div class="modal-title" id="cartModalLabel">Add To Cart</div>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Would you like to put the goods in your shopping cart?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
											<button type="button" onclick="location.href='./CartAddAction.doCa?userId=${sessionId }&productId=<%=rs.getString("p_id") %>'" class="btn btn-primary">Yes</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</c:if>
				
			</div>
		</div>
	<br><br>
	<hr>
	</div>

	<% 
		}
			
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();		
	%>
	
	<jsp:include page="footer.jsp" />
</body>
</html>