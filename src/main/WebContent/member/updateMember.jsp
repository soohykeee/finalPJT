<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/finalpjtdb" driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
	SELECT * FROM MEMBER WHERE ID=?
	<sql:param value="<%=sessionId%>" />
</sql:query>
	
<title>회원 수정</title>
</head>
<body onload="init()">
	<jsp:include page="/menu.jsp" />

	<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="email" value="${row.email}" />
	<c:set var="mail1" value="${email.split('@')[0]}" />
	<c:set var="mail2" value="${email.split('@')[1]}" />

	<c:set var="birth" value="${row.birth }" />
	<c:set var="year" value="${birth.split('/')[0]}" />
	<c:set var="month" value="${birth.split('/')[1]}" />
	<c:set var="day" value="${birth.split('/')[2]}" />
	
	<div class="container" align="center" style="width:700px;">
		<br><br>
		<div class="col">
			<br><h3>MyPage</h3><br>
			<hr>
			<form name="newMember" class="form-horizontal" action="processUpdateMember.jsp" method="post" onsubmit="return checkForm()">
				<div class="form-group  row mx-auto">
					<label class="col-sm-4 ">ID</label>
					<div class="col">
						<input name="id" type="text" class="form-control" placeholder="id" value="<c:out value='${row.id }'/>" />
					</div>
				</div>
				<br>
				<div class="form-group  row mx-auto">
					<label class="col-sm-4">PW</label>
					<div class="col">
						<input name="password" type="text" class="form-control" placeholder="password" value="<c:out value='${row.password }'/>" >
					</div>
				</div>
				<br>
				<div class="form-group  row mx-auto">
					<label class="col-sm-4">PW confirm</label>
					<div class="col">
						<input name="password_confirm" type="text" class="form-control" placeholder="password_confirm" >
					</div>
				</div>
				<br>
				<div class="form-group  row mx-auto">
					<label class="col-sm-4">Name</label>
					<div class="col">
						<input name="name" type="text" class="form-control" placeholder="name" value="<c:out value='${row.name }'/>" >
					</div>
				</div>
				<br>
				<div class="form-group  row mx-auto">
					<label class="col-sm-4">Sex</label>
					<div class="col" align="left">
						<c:set var="gender" value="${row.gender }" />
						<input name="gender" type="radio" value="남"	<c:if test="${gender.equals('남')}"> <c:out value="checked" /> </c:if> >남 
						<input name="gender" type="radio" value="여"	<c:if test="${gender.equals('여')}"> <c:out value="checked" /> </c:if> >여
					</div>
				</div>
				<br>
				<div class="form-group row mx-auto">
					<label class="col-sm-4">Birth</label>
					<div class="col" align="left">
						<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" 	size="6" value="${year}"> 
							<select name="birthmm"	id="birthmm">
							<option value="">월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" value="${day}">
					</div>
				</div>
				<br>
				<div class="form-group  row mx-auto">
					<label class="col-sm-4">Email</label>
					<div class="col" align="left">
						<input type="text" name="mail1" maxlength="50" value="${mail1}">@
						<select name="mail2" id="mail2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>
							<option>skuniv.ac.kr</option>
						</select>
					</div>
				</div>
				<br>
				<div class="form-group  row mx-auto">
					<label class="col-sm-4">Phone</label>
					<div class="col">
						<input name="phone" type="text" class="form-control" placeholder="phone" value="<c:out value='${row.phone}'/>">
	
					</div>
				</div>
				<br>
				<div class="form-group  row mx-auto">
					<label class="col-sm-4">Address</label>
					<div class="col">
						<input name="address" type="text" class="form-control" placeholder="address" value="<c:out value='${row.address}'/>">
					</div>
				</div>
				<hr>
				<div class="form-group  row justify-content-end">
					<div class="col" align="right">
						<input type="button" class="btn btn-success btn-sm" value="Modify" data-bs-toggle="modal" data-bs-target="#modifyModal"> 
						<!-- Modal -->
						<div class="modal fade" id="modifyModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="modifyModalLabel" aria-hidden="true">
							<div class="modal-dialog" align="center">
								<div class="modal-content">
									<div class="modal-header">
										<div class="modal-title" id="modifyModalLabel">Modify Membership</div>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Do you want to modify the Membership?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
										<button type="submit" class="btn btn-success">Yes</button>
									</div>
								</div>
							</div>
						</div>
						
						<a href="#" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">Withdrawal</a>
						<!-- Modal -->
						<div class="modal fade" id="deleteModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="deleteModalLabel" aria-hidden="true">
							<div class="modal-dialog" align="center">
								<div class="modal-content">
									<div class="modal-header">
										<div class="modal-title" id="deleteModalLabel">Withdrawal Membership</div>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Are you sure you want to withdrawal?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
										<button type="button" onclick="location.href='./deleteMember.jsp'" class="btn btn-danger">Yes</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>	
		</div>
	</div>
	</c:forEach>
</body>
</html>
<script type="text/javascript">
	function init() {
		setComboMailValue("${mail2}");
		setComboBirthValue("${month}");
	}

	function setComboMailValue(val) {
		var selectMail = document.getElementById('mail2');
		for (i = 0, j = selectMail.length; i < j; i++) {
			if (selectMail.options[i].value == val) {
				selectMail.options[i].selected = true; 
				break;
			}
		}
	}
	function setComboBirthValue(val) {
		var selectBirth = document.getElementById('birthmm'); 
		for (i = 0, j = selectBirth.length; i < j; i++){
			if (selectBirth.options[i].value == val){
				selectBirth.options[i].selected = true; 
				break;
			}
		}
	}
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>