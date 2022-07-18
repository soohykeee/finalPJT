<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) request.getAttribute("name");
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Board</title>
</head>
<script type="text/javascript">
	function checkForm() {
		if (!document.newWrite.name.value) {
			alert("성명을 입력하세요.");
			return false;
		}
		if (!document.newWrite.subject.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}
	}
</script>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="container">
		<br><br><strong>Write</strong><hr><br>
	</div>

	<div class="container" align="center">
		<form name="newWrite" action="./BoardWriteAction.doBo" class="form-horizontal" method="post" onsubmit="return checkForm()">
			<input name="id" type="hidden" class="form-control" value="${sessionId}" readonly>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Name</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="<%=name %>" placeholder="name" readonly>
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Title</label>
				<div class="col-sm-5">
					<input name="subject" type="text" class="form-control" placeholder="subject">
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >Content</label>
				<div class="col-sm-8">
					<textarea name="content" cols="50" rows="8" class="form-control" placeholder="content"></textarea>
				</div>
			</div>
			<br>
			<div class="form-group row" align="right">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="reset" class="btn btn-outline-danger btn-sm" value="Reset">
					<input type="button" class="btn btn-outline-primary btn-sm" value="Submit" data-bs-toggle="modal" data-bs-target="#submitModal">	
					<!-- Modal -->
					<div class="modal fade" id="submitModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="submitModalLabel" aria-hidden="true">
						<div class="modal-dialog" align="center">
							<div class="modal-content">
								<div class="modal-header">
									<div class="modal-title" id="submitModalLabel">Add Board</div>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">Are you sure you want to register your post?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
									<button type="submit" class="btn btn-primary">Yes</button>
								</div>
							</div>
						</div>
					</div>
						
					<a href="./BoardListAction.doBo?pageNum=1" class="btn btn-outline-dark btn-sm">List</a>		
				</div>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>



