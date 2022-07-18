<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List boardList = (List) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Board</title>
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}
		location.href = "./BoardWriteForm.doBo?id=<%=sessionId%>";
	}
</script>
</head>
<body>
	<jsp:include page="../menu.jsp" />

	<div class="container">
		<br><br><strong>Board</strong><hr><br>
		<form action="<c:url value="./BoardListAction.doBo"/>" method="post">
			<div align="right">
				<small>Total : <%=total_record %></small>
			</div>
			<div>
				<table class="table table-hover table-striped">
					<thead class="table-dark"><tr>
						<th>No</th>
						<th>Title</th>
						<th>Date</th>
						<th>View</th>
						<th>Writer</th>
					</tr></thead>
					<%
						for (int j = 0; j < boardList.size(); j++) {
							BoardDTO notice = (BoardDTO) boardList.get(j);
					%>
					<tr style="cursor:pointer;" onClick="location.href='./BoardViewAction.doBo?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>'">
						<td><%=notice.getNum()%></td>
						<td><%=notice.getSubject()%></td>
						<td><%=notice.getRegist_day()%></td>
						<td><%=notice.getHit()%></td>
						<td><%=notice.getName()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			
			<div align="right">
				<a href="#" onclick="checkForm(); return false;" class="btn btn-success btn-sm">Write</a>
			</div>
			
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<a href="<c:url value="./BoardListAction.doBo?pageNum=${i}" /> ">
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
			
			<div class="row" align="left">
				<div class="col-sm-2">
				<select name="items" class="txt form-select">
						<option value="subject">Title</option>
						<option value="content">Content</option>
						<option value="name">Writer</option>
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