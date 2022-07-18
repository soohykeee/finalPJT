<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="mvc.model.BoardDTO"%>

<%
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Board</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="container">
		<br><br><strong>Board Info</strong><hr><br>
	</div>

	<div class="container" align="center" >
		<form name="newUpdate" action="BoardUpdateAction.doBo?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Name</label>
				<c:set var="userId" value="<%=notice.getId()%>" />
				<c:if test="${sessionId==userId}">
					<div class="col-sm-3">
						<input name="name" class="form-control"	value=" <%=notice.getName()%>" readonly>
					</div>
				</c:if>
				<c:if test="${sessionId!=userId }">
					<div class="col-sm-3">
						<input name="name" class="form-control"	value=" <%=notice.getName()%>" readonly>
					</div>
				</c:if>
			</div>
			
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Title</label>
				<c:set var="userId" value="<%=notice.getId()%>" />
				<c:if test="${sessionId==userId}">
					<div class="col-sm-5">
						<input name="subject" class="form-control"	value=" <%=notice.getSubject()%>" >
					</div>
				</c:if>
				<c:if test="${sessionId!=userId}">
					<div class="col-sm-5">
						<input name="subject" class="form-control"	value=" <%=notice.getSubject()%>" readonly>
					</div>
				</c:if>
				
			</div>
			
			<br>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Cotent</label>
				<c:set var="userId" value="<%=notice.getId()%>" />
				<c:if test="${sessionId==userId}">
					<div class="col-sm-8" style="word-break: break-all;">
						<textarea name="content" class="form-control" cols="50" rows="8"> <%=notice.getContent()%></textarea>
					</div>
				</c:if>
				<c:set var="userId" value="<%=notice.getId()%>" />
				<c:if test="${sessionId!=userId}">
					<div class="col-sm-8" style="word-break: break-all;">
						<textarea name="content" class="form-control" cols="50" rows="8" readonly> <%=notice.getContent()%></textarea>
					</div>
				</c:if>
			</div>
			
			<br>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10" align="right">
					<c:set var="userId" value="<%=notice.getId()%>" />
					<c:if test="${sessionId==userId}">
						<a	href="#" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete</a> 
						<!-- Modal -->
						<div class="modal fade" id="deleteModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="deleteModalLabel" aria-hidden="true">
							<div class="modal-dialog" align="center">
								<div class="modal-content">
									<div class="modal-header">
										<div class="modal-title" id="deleteModalLabel">Delete Board</div>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Are you sure you want to delete this post?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
										<button type="button" onclick="location.href='./BoardDeleteAction.doBo?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>'" class="btn btn-danger">Yes</button>
									</div>
								</div>
							</div>
						</div>
						
						<input type="button" class="btn btn-outline-primary btn-sm" value="Modify" data-bs-toggle="modal" data-bs-target="#modifyModal">
						<!-- Modal -->
						<div class="modal fade" id="modifyModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="modifyModalLabel" aria-hidden="true">
							<div class="modal-dialog" align="center">
								<div class="modal-content">
									<div class="modal-header">
										<div class="modal-title" id="modifyModalLabel">Modify Board</div>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Do you want to modify the post?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
										<button type="submit" class="btn btn-success">Yes</button>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<a href="./BoardListAction.doBo?pageNum=<%=nowpage%>" class="btn btn-outline-dark btn-sm">List</a>
				</div>
			</div>
			
			<br>
			
		</form>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>


