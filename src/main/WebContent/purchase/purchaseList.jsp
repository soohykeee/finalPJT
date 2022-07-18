<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.PurchaseDTO"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List purchaseList = (List) request.getAttribute("purchaselist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Purchase List</title>
</head>

<body>

	<jsp:include page="../menu.jsp" />

	<div class="container">
		<br><br><strong>Order</strong><hr><br>
		<form action="<c:url value="./PurchaseListAction.doPu?id=${sessionId }"/>" method="post">
			<div align="right">
				<small>Total : <%=total_record %></small>
			</div>
			
			<div>
				<table class="table table-hover table-striped">
					<thead class="table-dark"><tr>
						<th>No</th>
						<th>Product</th>
						<th>Price</th>
						<th>Recipient</th>
						<th>ShipAddress</th>
						<th>Date</th>
					</tr></thead>
					<%
						for (int j = 0; j < purchaseList.size(); j++) {
							PurchaseDTO purchase = (PurchaseDTO) purchaseList.get(j);
					%>
					<tr style="cursor:pointer;" onClick="location.href='./PurchaseViewAction.doPu?purchaseId=<%=purchase.getPurchaseId()%>'">
						<td><%=purchase.getPurchaseId() %></td>
						<td><%=purchase.getpName() %></td>
						<td><%=purchase.getpPrice() %></td>
						<td><%=purchase.getShipName() %></td>
						<td><%=purchase.getShipAddress() %></td>
						<td><%=purchase.getPurchaseDate() %></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<br>
			
			
			<div class="row" align="right">
				<div class="col">
					<input type="date" name="startDate"></input>
					~
					<input type="date" name="endDate"></input>
					<input type="submit" id="btnAdd" class="btn btn-light" value="검색" />
				</div>
			</div>
			
		</form>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />

</body>
</html>