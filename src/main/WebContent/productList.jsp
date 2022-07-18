<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>상품 페이지</title>
<%
	String category = request.getParameter("category");
	String searchWord = request.getParameter("searchWord");
%>
</head>
<body>

	<jsp:include page="menu.jsp" />
	
	
 	<div class="container">
 		<jsp:include page="category.jsp" />
 		<br>
 		<div class="row row-cols-3" align="center">
 			<%@ include file="dbconn.jsp" %>
 			<%
 				PreparedStatement pstmt = null;
 				ResultSet rs = null;
 				String sql=null;
 				if(searchWord == null){
	 				sql = "select * from product where p_category = ?";
	 				pstmt = conn.prepareStatement(sql);
	 				pstmt.setString(1,category);
 				} else {
 					sql = "SELECT * FROM product where p_name  like '%" + searchWord + "%' or p_brand like '%" + searchWord + "%'";
 					pstmt = conn.prepareStatement(sql);
 				}
 				
 				rs = pstmt.executeQuery();
 				while(rs.next()) {
 			%>
 			<div class="col">
 				<a style="text-decoration: none;" href="./product.jsp?id=<%=rs.getString("p_id")%>">
 					<img src="resources/images/<%=rs.getString("p_fileName") %>" width="100%" class="rounded img-thumbnail">
 					<strong style="color:black"><%=rs.getString("p_name") %></strong><br>
 					<span style="color:grey"><%=rs.getString("p_brand") %></span><br>
 					<span style="color:black"><small><i><%=rs.getString("p_unitPrice") %>￦</i></small></span>
 				</a>
 				<br><br>
 			</div>
 			<%
 				}
 			
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
 			%>
 			
 		</div>
 		
 	<br><hr>
 	</div>

	<jsp:include page="footer.jsp" />	
	
</body>
</html>