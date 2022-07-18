<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.ProductDTO"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List productList = (List) request.getAttribute("productlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>관리자 페이지</title>
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId!='admin'}) {
			alert("관리자만 접근이 가능합니다.");
			return false;
		}
		location.href = "./ProductAdminWriteAction.doPr";
	}
</script>
</head>
<body>

	<jsp:include page="../menu.jsp" />
	
	
	<div class="container">
		<br><br><strong>Admin Page</strong><hr>
	</div>
	
	<div class="container">
		<form action="<c:url value="./ProductAdminListAction.doPr"/>" method="post">
				<div align="right">
					<small>Total : <%=total_record %></small>
				</div>
			<div>
				<table class="table table-striped table-hover">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Brand</th>
						<th>Category</th>
						<th>Price</th>
					</tr>
					<%
						for (int j = 0; j < productList.size(); j++) {
							ProductDTO p = (ProductDTO) productList.get(j);
					%>
					<tr style="cursor:pointer;" onClick="location.href='./ProductAdminViewAction.doPr?pid=<%=p.getProductId()%>&pageNum=<%=pageNum%>'">
						<td><%=p.getProductId()%></td>
						<td><%=p.getName()%></td>
						<td><%=p.getBrand()%></td>
						<td><%=p.getCategory()%></td>
						<td><%=p.getUnitPrice()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			
			<div align="right">
				<a href="./ProductAdminWriteForm.doPr" class="btn btn-success btn-sm">Add</a>
			</div>
			
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<a href="<c:url value="./ProductAdminListAction.doPr?pageNum=${i}" /> ">
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='4C5317'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4C5317'> [${i}]</font>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
			
			<br>
			
			<div class="row" align="center">
				<div class="col-sm-3">
				<select name="items" class="txt form-select">
						<option value="p_name">Name</option>
						<option value="p_brand">Brand</option>
						<option value="p_category">Category</option>
				</select> 
				</div>
				<div class="col d-flex">
					<input class="form-control" name="text" type="text" /> &nbsp;
					<input type="submit" id="btnAdd" class="btn btn-light" value="Search" />
				</div>
			</div>
			
			
		</form>
		<hr>
	</div>
	
	<jsp:include page="../footer.jsp" />

</body>
</html>