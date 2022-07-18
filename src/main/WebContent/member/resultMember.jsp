<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>회원 정보</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<br><br><br><br>
		</div>
	</div>

	<div class="container" align="center">
		<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0"))
					out.println(" <h2 class='alert alert-success'>Membership information has been modified !</h2>");
				else if (msg.equals("1"))
					out.println(" <div class='alert alert-success'><h2>Congratulations on your membership !</h2><br>Enjoy Shopping !</div>");
				else if (msg.equals("2")) {
					String loginId = (String) session.getAttribute("sessionId");
					out.println(" <div class='alert alert-success'><h2>Welcome " + loginId + " !</h2><br>Enjoy Shopping !</div>");
				}
				
			} else {
				out.println("<div class='alert alert-danger'><h2>Your withdrawal has been completed.</h2><br>Thank you for using 'Soohykeee'</div>");
			}
		%>
		<br><br>
		<%
			String msg1 = request.getParameter("msg");
			if(msg1 != null){
		%>
			<a href="<c:url value="/welcome.jsp"/>" class="btn btn-secondary btn-sm">Go Shopping !</a>
		<%} %>
	</div>	
</body>
</html>