<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.PurchaseDTO"%>
<%
	PurchaseDTO purchase = (PurchaseDTO) request.getAttribute("purchase");
	int purchaseId = ((Integer) request.getAttribute("purchaseId")).intValue();
%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Purchase Info</title>
</head>
<body>

	<jsp:include page="../menu.jsp" />
	<div class="container">
		<br><h3><strong>Order Info</strong></h3><hr>
	</div>

	<div class="container" align="center">
		<div class="row-sm"><i>Order Info</i><hr></div>
		<div class="row">
			<div class="col"><strong>Order No</strong></div>
			<div class="col"><small><%=purchase.getPurchaseId() %></small></div>
		</div>
		<br>
		<div class="row">
			<div class="col"><strong>Product</strong></div>
			<div class="col"><small><%=purchase.getpName() %></small></div>
		</div>
		<br>
		<div class="row">
			<div class="col"><strong>Total Price</strong></div>
			<div class="col"><small><%=purchase.getpPrice() %></small></div>
		</div>
		<br>
		<div class="row">
			<div class="col"><strong>Order Date</strong></div>
			<div class="col"><small><%=purchase.getPurchaseDate() %></small></div>
		</div>
		<br>
		<hr><div class="row-sm"><i>Orderer Info</i><hr></div>
		<div class="row">
			<div class="col"><strong>Name</strong></div>
			<div class="col"><small><%=purchase.getuName() %></small></div>
		</div>
		<br>
		<div class="row">
			<div class="col"><strong>Phone</strong></div>
			<div class="col"><small><%=purchase.getuPhone() %></small></div>
		</div>
		<br>
		<div class="row">
			<div class="col"><strong>Address</strong></div>
			<div class="col"><small><%=purchase.getuAddress() %></small></div>
		</div>
		<br>
		<hr><div class="row-sm"><i>Recipient Info</i><hr></div>
		<div class="row">
			<div class="col"><strong>Name</strong></div>
			<div class="col"><small><%=purchase.getShipName() %></small></div>
		</div>
		<br>
		<div class="row">
			<div class="col"><strong>Phone</strong></div>
			<div class="col"><small><%=purchase.getShipPhone() %></small></div>
		</div>
		<br>
		<div class="row">
			<div class="col"><strong>Address</strong></div>
			<div class="col"><small><%=purchase.getShipAddress() %></small></div>
		</div>
		<br>
		<hr>
		<div class="form-group row">
			<div class="col-sm-offset-2" align="right">
				<c:set var="userId" value="<%=purchase.getUserId()%>" />
				<c:if test="${sessionId==userId}">
					<a href="#"	class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#cancelModal">Cancel</a> 
					<!-- Modal -->
					<div class="modal fade" id="cancelModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="cancelModalLabel" aria-hidden="true">
						<div class="modal-dialog" align="center">
							<div class="modal-content">
								<div class="modal-header">
									<div class="modal-title" id="cancelModalLabel">Cancel Order</div>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">Are you sure you want to cancel this order?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
									<button type="button" onclick="location.href='./PurchaseDeleteAction.doPu?purchaseId=<%=purchase.getPurchaseId()%>'" class="btn btn-danger">Yes</button>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<a href="./PurchaseListAction.doPu?id=${sessionId }" class="btn btn-light btn-sm">List</a>
			</div>
		</div>		

		
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>