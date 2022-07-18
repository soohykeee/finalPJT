<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.CartDTO"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List cartList = (List) request.getAttribute("cartlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int totalPrice=0;
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Cart List</title>
</head>

<body>
	<jsp:include page="../menu.jsp" />

	<div class="container">
		<br><br><strong>Cart</strong><hr><br>
		<form action="<c:url value="./CartListAction.doCa"/>" method="post">
			<div align="right">
				<small>Total : <%=total_record %></small>
			</div>
			<div>
				<table class="table table-hover table-striped">
					<thead class="table-dark">
					<tr>
						<th>Product</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Remark</th>
					</tr>
					</thead>
					<%
						for (int j = 0; j < cartList.size(); j++) {
							CartDTO cart = (CartDTO) cartList.get(j);
							totalPrice+=cart.getpPrice();
					%>
					<tr>
						<td><%=cart.getpName()%></td>
						<td><%=cart.getpPrice()%></td>
						<td><%=cart.getAmout()%></td>
						<td><a href="#" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</a></td>
						<!-- Modal -->
						<div class="modal fade" id="deleteModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="deleteModalLabel" aria-hidden="true">
							<div class="modal-dialog" align="center">
								<div class="modal-content">
									<div class="modal-header">
										<div class="modal-title" id="deleteModalLabel">Delete Cart</div>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Are you sure you want to delete it from your shopping cart?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
										<button type="button" onclick="location.href='./CartDeleteAction.doCa?cartId=<%=cart.getCartId()%>'" class="btn btn-danger">Yes</button>
									</div>
								</div>
							</div>
						</div>
					</tr>
					
					<%
						}
					%>
					<tr>
						<th></th>
						<th>Total</th>
						<th></th>
						<th><%=totalPrice %> ￦</th>
					</tr>
				</table>
				
			</div>
			
			<div align="right">
				<a href="#" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#orderModal">Order</a>
				<!-- Modal -->
				<div class="modal fade" id="orderModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="orderModalLabel" aria-hidden="true">
					<div class="modal-dialog" align="center">
						<div class="modal-content">
							<div class="modal-header">
								<div class="modal-title" id="orderModalLabel">Order to Cart</div>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">Would you like to purchase the products?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
								<button type="button" onclick="location.href='./PurchaseCartAddForm.doPu?id=${sessionId }'" class="btn btn-primary">Yes</button>
							</div>
						</div>
					</div>
				</div>
				
				<a href="#" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#clearModal">Clear</a>
				<!-- Modal -->
				<div class="modal fade" id="clearModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="clearModalLabel" aria-hidden="true">
					<div class="modal-dialog" align="center">
						<div class="modal-content">
							<div class="modal-header">
								<div class="modal-title" id="clearModalLabel">Clear Cart</div>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">Would you like to empty your shopping cart?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
								<button type="button" onclick="location.href='./CartAllDeleteAction.doCa?userId=${sessionId }'" class="btn btn-danger">Yes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<br>
			
		</form>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>