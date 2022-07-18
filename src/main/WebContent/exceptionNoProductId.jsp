<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="utf-8">
<title>상품 아이디 오류</title>
</head>
<body>

	<jsp:include page="menu.jsp" />
	<div class="container">
		<br><br>
		<h2 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h2>
	</div>
	
	<div class="container">
		<p><%=request.getRequestURL() %>?<%=request.getQueryString() %>
		<p><a href="<c:url value="/welcome.jsp"/>" class="btn btn-secondary">처음으로</a>
	</div>
</body>
</html>