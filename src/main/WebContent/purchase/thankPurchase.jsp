<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Archives</title>
</head>
<body>

	<jsp:include page="/menu.jsp" />
	
	<br>

	<div class="container" align="center">
		<br><br><br><br>
		<h2><strong>Thank you for your order !</strong></h2>
		I'll send you the product as soon as possible
		<br><br><br>
		<a href="<c:url value="/welcome.jsp"/>" class="btn btn-Info">Go Home !</a>
		<br><br><br><hr>
	</div>
	
	
	<jsp:include page="/footer.jsp" />
</body>

</html>