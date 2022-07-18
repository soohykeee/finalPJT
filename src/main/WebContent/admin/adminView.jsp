<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.ProductDTO"%>
<%
	ProductDTO p = (ProductDTO) request.getAttribute("product");
	String pid = request.getAttribute("pid").toString();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="./resources/js/productValidation.js"></script>
<title>AddProduct</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="container">
		<br><br><strong>Product Info</strong><hr>
	</div>

	<div class="container">
		<form name="newUpdate" action="ProductAdminUpdateAction.doPr?pid=<%=p.getProductId()%>&pageNum=<%=nowpage%>" class="form-horizontal" method="post" onsubmit="return checkForm()" enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-4">
					<img src="resources/images/<%=p.getFileName()%>" alt="image" style="width :100%" />
				</div>
				<br>
				
				<div class="col">
					<div class="form-group row">
						<label class="col-sm-2">Product ID</label>
						<div class="col-sm-4">
							<input type="text" id="productId" name="productId" class="form-control" value="<%=p.getProductId() %>">
						</div>
					</div>
					<br>
					
					<div class="form-group row">
						<label class="col-sm-2">Product Name</label>
						<div class="col-sm-10">
							<input type="text" id="name" name="name" class="form-control" value="<%=p.getName()%>" >
						</div>
					</div>
					<br>
					
					<div class="form-group row">
						<label class="col-sm-2">Price</label>
						<div class="col-sm-4">
							<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=p.getUnitPrice()%>" >
						</div>
					</div>
					<br>
					
					<div class="form-group row">
						<label class="col-sm-2">Description</label>
						<div class="col">
							<textarea name="description" cols="100" rows="6" class="form-control"><%=p.getDescription() %></textarea>
						</div>
					</div>
					<br>
					
					<div class="form-group row">
						<label class="col-sm-2">Brand</label>
						<div class="col-sm-4">
							<input type="text" name="brand" class="form-control" value="<%=p.getBrand() %>" >
						</div>
					</div>
					<br>
					
					<div class="form-group row">
						<label class="col-sm-2">Category</label>
						<div class="col">
							<% if(p.getCategory().equals("outer")) {%>
								<input type="radio" name="category" value="outer" checked="checked">outer
								<input type="radio" name="category" value="top">Top
								<input type="radio" name="category" value="bottom">Bottom
								<input type="radio" name="category" value="bag">Bag
								<input type="radio" name="category" value="accessory">Accessory
							<%} %>
							<% if(p.getCategory().equals("top")) {%>
								<input type="radio" name="category" value="outer">Outer
								<input type="radio" name="category" value="top" checked="checked">Top
								<input type="radio" name="category" value="bottom">Bottom
								<input type="radio" name="category" value="bag">Bag
								<input type="radio" name="category" value="accessory">Accessory
							<%} %>
							<% if(p.getCategory().equals("bottom")) {%>
								<input type="radio" name="category" value="outer">Outer
								<input type="radio" name="category" value="top">Top
								<input type="radio" name="category" value="bottom" checked="checked">Bottom
								<input type="radio" name="category" value="bag">Bag
								<input type="radio" name="category" value="accessory">Accessory
							<%} %>
							<% if(p.getCategory().equals("bag")) {%>
								<input type="radio" name="category" value="outer">Outer
								<input type="radio" name="category" value="top">Top
								<input type="radio" name="category" value="bottom">Bottom
								<input type="radio" name="category" value="bag" checked="checked">Bag
								<input type="radio" name="category" value="accessory">Accessory
							<%} %>
							<% if(p.getCategory().equals("accessory")) {%>
								<input type="radio" name="category" value="outer">Outer
								<input type="radio" name="category" value="top">Top
								<input type="radio" name="category" value="bottom">Bottom
								<input type="radio" name="category" value="bag">Bag
								<input type="radio" name="category" value="accessory" checked="checked">Accessory
							<%} %>
						</div>
					</div>
					<br>
					
					<div class="form-group row">
						<label class="col-sm-2">Number Of Stock</label>
						<div class="col-sm-4">
							<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=p.getUnitsInStock() %>" >
						</div>
					</div>
					<br>
					
					<div class="form-group row">
						<label class="col-sm-2">Size</label>
						<div class="col">
							<% if(p.getSize().equals("S")) {%>
								<input type="radio" name="size" value="S" checked="checked">S
								<input type="radio" name="size" value="M">M
								<input type="radio" name="size" value="L">L
								<input type="radio" name="size" value="XL">XL
								<input type="radio" name="size" value="FREE">FREE
							<%} %>
							<% if(p.getSize().equals("M")) {%>
								<input type="radio" name="size" value="S">S
								<input type="radio" name="size" value="M" checked="checked">M
								<input type="radio" name="size" value="L">L
								<input type="radio" name="size" value="XL">XL
								<input type="radio" name="size" value="FREE">FREE
							<%} %>
							<% if(p.getSize().equals("L")) {%>
								<input type="radio" name="size" value="S">S
								<input type="radio" name="size" value="M">M
								<input type="radio" name="size" value="L" checked="checked">L
								<input type="radio" name="size" value="XL">XL
								<input type="radio" name="size" value="FREE">FREE
							<%} %>
							<% if(p.getSize().equals("XL")) {%>
								<input type="radio" name="size" value="S">S
								<input type="radio" name="size" value="M">M
								<input type="radio" name="size" value="L">L
								<input type="radio" name="size" value="XL" checked="checked">XL
								<input type="radio" name="size" value="FREE">FREE
							<%} %>
							<% if(p.getSize().equals("FREE")) {%>
								<input type="radio" name="size" value="S">S
								<input type="radio" name="size" value="M">M
								<input type="radio" name="size" value="L">L
								<input type="radio" name="size" value="XL">XL
								<input type="radio" name="size" value="FREE" checked="checked">FREE
							<%} %>
						</div>
					</div>
					<br>
					
					<div class="form-group row">
						<label class="col-sm-2">Image</label>
						<div class="col">
							<input type="file" name="productImage" class="form-control">
						</div>
					</div>
					<br>
					
					<div class="form-group row">
						<div align="right">
							<a href="./ProductAdminListAction.doPr?pageNum=<%=nowpage%>" class="btn btn-light">List</a>
							
							<a href="#" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete</a>
							 <!-- Modal -->
							<div class="modal fade" id="deleteModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="deleteModalLabel" aria-hidden="true">
								<div class="modal-dialog" align="center">
									<div class="modal-content">
										<div class="modal-header">
											<div class="modal-title" id="deleteModalLabel">Delete Product</div>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Are you sure you want to delete this product?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
											<button type="button" onclick="location.href='./ProductAdminDeleteAction.doPr?pid=<%=p.getProductId()%>&pageNum=<%=nowpage%>'" class="btn btn-danger">Yes</button>
										</div>
									</div>
								</div>
							</div>
							
							<input type="button" class="btn btn-success" value="Modify" data-bs-toggle="modal" data-bs-target="#modifyModal">
							<!-- Modal -->
							<div class="modal fade" id="modifyModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="modifyModalLabel" aria-hidden="true">
								<div class="modal-dialog" align="center">
									<div class="modal-content">
										<div class="modal-header">
											<div class="modal-title" id="modifyModalLabel">Modify Board</div>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Do you want to modify this product?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
											<button type="submit" class="btn btn-success">Yes</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>
				</div>
			</div>
			<br>
		</form>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>


