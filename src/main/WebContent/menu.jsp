<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<div class="container-fluid " align="center">
	<div class="collapse" id="collapseExample" style="width:500px;">
		<form name="productSearch" class="d-flex" action="<c:url value="/ProductSearchListAction.doPr"/>">
			<input class="form-control" type="search" name="searchWord" placeholder="Search" aria-label="Search" >&nbsp;
			<button class="btn btn-outline-dark btn-sm" type="submit">Search</button>
		</form>
	</div>
</div>

<nav class="navbar navbar-expand navbar-light justify-content-around">
	<ul class="navbar-nav mr-auto">
		<li class="nav-item dropdown">
			<a class="nav-link" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"><small>About</small></a>
			<ul class="dropdown-menu" aria-labelledby="navbarDarkDropdownMenuLink">
				<li><small><a class="dropdown-item" href="<c:url value="/contact.jsp"/>">Contact</a></small></li>
				<li><small><a class="dropdown-item" href="<c:url value="/archives.jsp"/>">Archives</a></small></li>
			</ul>
		</li>
		<li class="nav-item">
			<small><a class="nav-link" href="<c:url value="/shop.jsp"/>">Shop</a></small>
		</li>
		<li class="nav-item">
			<small><a class="nav-link" href="<c:url value="/BoardListAction.doBo?pageNum=1"/>">Board</a></small>
		</li>
	</ul>

	<h2><a href="<c:url value="/welcome.jsp"/>" class="nav-link" style="color:black; font-family: fantasy;">Soohykeee</a></h2>
	<div>
	
		<ul class="navbar-nav mr-auto">
			
			<c:choose>
				<c:when test="${empty sessionId}">
					<li class="nav-item">
						<small><a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">Login</a></small>
					</li>
					<li class="nav-item">
						<small><a class="nav-link" href="<c:url value="/member/addMember.jsp"/>">Join</a></small>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"><small>[<%=sessionId %>님]</small></a>
						<ul class="dropdown-menu" aria-labelledby="navbarDarkDropdownMenuLink">
							<li><small><a class="dropdown-item" href="<c:url value="/CartListAction.doCa?id=${sessionId}"/>">Cart</a></small></li>
							<li><small><a class="dropdown-item" href="<c:url value="/PurchaseListAction.doPu?id=${sessionId}"/>">Order</a></small></li>
							<li><small><a class="dropdown-item" href="<c:url value="/member/updateMember.jsp"/>">MyPage</a></small></li>
							<li><small><a class="dropdown-item" href="<c:url value="/member/logoutMember.jsp"/>">Logout</a></small></li>
						</ul>
					</li>
				</c:otherwise>
			</c:choose>
			
			<li class="nav-item">
			 	<small><a class="nav-link" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">Search</a></small>
			</li>
			
			<c:if test="${sessionId=='admin'}">
				<li class="nav-item">
					<small><a class="nav-link" href="<c:url value="/ProductAdminListAction.doPr?pageNum=1"/>">Admin</a></small>
				</li>
			</c:if>
		</ul>
		
	</div>
	
</nav>


