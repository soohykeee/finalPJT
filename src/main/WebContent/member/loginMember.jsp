<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Login</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	
	
	<div class="container" align="center" style="width:400px;">
		<br><br><br><br>
		<div class="col">
			<h3 class="form-signin-heading">Login</h3>
			<br>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="processLoginMember.jsp" method="post">
				<hr>
				<div class="form-group row">
					<label for="inputUserName" class="col-sm-3 sr-only">ID</label> 
					<div class="col">
						<input type="text" class="form-control" placeholder="ID" name='id' required autofocus>
					</div>
				</div>
				<br>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-3 sr-only">PW</label> 
					<div class="col">
						<input type="password" class="form-control" placeholder="Password" name='password' required>
					</div>
				</div>
				<hr>
				<button class="btn btn-light btn-block " type="submit">login</button>

			</form>
		</div>
	</div>
</body>
</html>