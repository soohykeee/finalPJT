<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) request.getAttribute("name");
	String phone = (String) request.getAttribute("phone");
	String address = (String) request.getAttribute("address");
	
	String pId = (String) request.getAttribute("pId");
	String pName = (String) request.getAttribute("pName");
	int pPrice = (int) request.getAttribute("pPrice");
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Purchase Add</title>
<script type="text/javascript">
	function checkForm() {
		if (!document.newPurchase.shipName.value) {
			alert("배송받는 분 성함을 입력하세요.");
			return false;
		}

		if (!document.newPurchase.shipPhone.value) {
			alert("배송받는 분 번호를 입력하세요.");
			return false;
		}

		if (!document.newPurchase.shipAddress.value) {
			alert("배송지 주소를 입력하세요.");
			return false;
		}
	}
</script>
</head>

<body>

	<jsp:include page="../menu.jsp" />
	<div class="container">
		<br><h3>Order</h3><hr>
	</div>
	
	<div class="container" align="center">
		<form name="newPurchase" action="./PurchaseAddAction.doPu" class="form-horizontal" method="post" onsubmit="return checkForm()">
			<input name="userId" type="hidden" class="form-control" value="${sessionId}" readonly>
			<input name="productId" type="hidden" class="form-control" value="<%=pId %>" readonly>
			
			<div class="row-sm">Product Info<hr></div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Product</label>
				<div class="col-sm-6">
					<input name="pName" type="text" class="form-control" value="<%=pName %>" readonly>
				</div>
			</div>
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Price</label>
				<div class="col-sm-6">
					<input name="pPrice" type="text" class="form-control" value="<%=pPrice %>" readonly>
				</div>
			</div>
			<br>
			
			<div class="row-sm">Orderer Info<hr></div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Name</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="<%=name %>" readonly>
				</div>
			</div>
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Phone</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" value="<%=phone %>" readonly>
				</div>
			</div>
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Address</label>
				<div class="col-sm-6">
					<input name="address" type="text" class="form-control" value="<%=address %>" readonly>
				</div>
			</div>
			<br>
			
			<div class="row-sm">Recipient Info<hr></div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Name</label>
				<div class="col-sm-3">
					<input name="shipName" type="text" class="form-control">
				</div>
			</div>
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Phone</label>
				<div class="col-sm-3">
					<input name="shipPhone" type="text" class="form-control">
				</div>
			</div>
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Address</label>
				<div class="col-sm-6">
					<input name="shipAddress" type="text" class="form-control">
				</div>
			</div>
			<br>
			
			
			<div class="form-group row" align="right">
				<div class="col-sm-offset-2">
					<input type="submit" class="btn btn-info btn-sm" value="주문하기">			
					<a href="./welcome.jsp" class="btn btn-light btn-sm">취소</a>
				</div>
			</div>

		</form>


		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>