<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) request.getAttribute("name");
	
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="./resources/js/productValidation.js"></script>
<title>Board</title>
</head>

<body>
	<jsp:include page="../menu.jsp" />
	<div class="container">
		<br><br><strong>Add Product</strong><hr>
	</div>
	<div class="container" align="center" style="width:800px;">
		<form name="newProduct" action="./ProductAdminWriteAction.doPr" class="form-horizontal" method="post" onsubmit="return checkForm()" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Product ID</label>
				<div class="col-sm-7">
					<input name="productId" id="productId" type="text" class="form-control" >
				</div>
			</div>
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Product Name</label>
				<div class="col-sm-7">
					<input name="name" id="name" type="text" class="form-control" >
				</div>
			</div>
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Price</label>
				<div class="col-sm-7">
					<input name="unitPrice" id="unitPrice" type="text" class="form-control" >
				</div>
			</div>
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Description</label>
				<div class="col">
					<textarea name="description" id="description" cols="50" rows="8" class="form-control" ></textarea>
				</div>
			</div>
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Brand</label>
				<div class="col-sm-5">
					<input name="brand" id="brand" type="text" class="form-control" >
				</div>
			</div>
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Category</label>
				<div class="col-sm-8" align="left">
					<input type="radio" name="category" value="outer">Outer
					<input type="radio" name="category" value="top">Top
					<input type="radio" name="category" value="bottom">Bottom
					<input type="radio" name="category" value="bag">Bag
					<input type="radio" name="category" value="accessory">Accessory
				</div>
			</div>
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Number Of Stock</label>
				<div class="col-sm-5">
					<input name="unitsInStock" id="unitsInStock" type="text" class="form-control" >
				</div>
			</div>
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Size</label>
				<div class="col-sm-5" align="left">
					<input type="radio" name="size" value="S">S
					<input type="radio" name="size" value="M">M
					<input type="radio" name="size" value="L">L
					<input type="radio" name="size" value="XL">XL
					<input type="radio" name="size" value="FREE">FREE
				</div>
			</div>
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Image</label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
			<br>
			
			
			<div class="form-group row" align="right">
				<div class="col">
					<a href="./ProductAdminListAction.doPr?pageNum=1" class="btn btn-light">List</a>
					
					<input type="reset" class="btn btn-danger" value="Clear">
					
					<input type="button" class="btn btn-primary" value="Add" data-bs-toggle="modal" data-bs-target="#addModal">
					<!-- Modal -->
					<div class="modal fade" id="addModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="addModalLabel" aria-hidden="true">
						<div class="modal-dialog" align="center">
							<div class="modal-content">
								<div class="modal-header">
									<div class="modal-title" id="addModalLabel">Add Product</div>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">Do you want to register this product?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
									<button type="button" onclick="CheckAddProduct()" class="btn btn-success">Yes</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		
		<hr>
		
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>



