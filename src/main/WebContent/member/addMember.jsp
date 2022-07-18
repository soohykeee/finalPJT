<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">
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
		
		if (!document.newMember.name.value) {
			alert("이름을 입력하세요.");
			return false;
		}
		
		if (!document.newMember.phone.value) {
			alert("전화번호를 입력하세요.");
			return false;
		}
		
		if (!document.newMember.address.value) {
			alert("주소를 입력하세요.");
			return false;
		}
	}
</script>
<title>회원 가입</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	

	<div class="container" align="center" style="width:700px;">
		<br><br>
		<div class="col">
			<br><h3>Join</h3><br>
			<hr>
			<form name="newMember"  action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
				<div class="form-group  row mx-auto">
					<label class="col-sm-4 ">ID</label>
					<div class="col">
						<input name="id" type="text" class="form-control">
					</div>
				</div>
				
				<br>
				<div class="form-group  row mx-auto">
					<label class="col-sm-4">PW</label>
					<div class="col">
						<input name="password" type="text" class="form-control">
					</div>
				</div>
				<br>
				<div class="form-group  row mx-auto">
					<label class="col-sm-4">PW confirm</label>
					<div class="col">
						<input name="password_confirm" type="text" class="form-control" >
					</div>
				</div>
				<br>
				<div class="form-group  row mx-auto">
					<label class="col-sm-4">Name</label>
					<div class="col">
						<input name="name" type="text" class="form-control">
					</div>
				</div>
				<br>
				<div class="form-group  row mx-auto">
					<label class="col-sm-4">Sex</label>
					<div class="col" align="left">
						<input name="gender" type="radio" value="남" /> 남 
						<input name="gender" type="radio" value="여" /> 여
					</div>
				</div>
				<br>
				<div class="form-group row mx-auto">
					<label class="col-sm-4">Birth</label>
					<div class="col" align="left">
						<!-- <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6"> -->
						<select name="birthyy">
							<option value="">년</option>
							<option value="1970">1970</option>
							<option value="1971">1971</option>
							<option value="1972">1972</option>
							<option value="1973">1973</option>
							<option value="1974">1974</option>
							<option value="1975">1975</option>
							<option value="1976">1976</option>
							<option value="1977">1977</option>
							<option value="1978">1978</option>
							<option value="1979">1979</option>
							
							<option value="1980">1980</option>
							<option value="1981">1981</option>
							<option value="1982">1982</option>
							<option value="1983">1983</option>
							<option value="1984">1984</option>
							<option value="1985">1985</option>
							<option value="1986">1986</option>
							<option value="1987">1987</option>
							<option value="1988">1988</option>
							<option value="1989">1989</option>
							
							<option value="1990">1990</option>
							<option value="1991">1991</option>
							<option value="1992">1992</option>
							<option value="1993">1993</option>
							<option value="1994">1994</option>
							<option value="1995">1995</option>
							<option value="1996">1996</option>
							<option value="1997">1997</option>
							<option value="1998">1998</option>
							<option value="1999">1999</option>
							
							<option value="2000">2000</option>
							<option value="2001">2001</option>
							<option value="2002">2002</option>
							<option value="2003">2003</option>
							<option value="2004">2004</option>
							<option value="2005">2005</option>
							<option value="2006">2006</option>
							<option value="2007">2007</option>
							<option value="2008">2008</option>
							<option value="2009">2009</option>
							
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
						</select> 
						<select name="birthmm">
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
						</select> 
						<select name="birthdd">
							<option value="">일</option>
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
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
						<!-- <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4"> -->
					</div>
				</div>
				<br>
				<div class="form-group  row mx-auto">
					<label class="col-sm-4">Email</label>
					<div class="col" align="left">
						<input type="text" name="mail1" maxlength="30" width="10">@ 
						<select name="mail2">
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
						<input name="phone" type="text" class="form-control" placeholder="010XXXXXXXX" >
	
					</div>
				</div>
				<br>
				<div class="form-group  row mx-auto">
					<label class="col-sm-4">Address</label>
					<div class="col">
						<input name="address" type="text" class="form-control">
	
					</div>
				</div>
				<hr>
				<div class="form-group  row justify-content-end">
					<div class="col" align="right">
						<input type="reset" class="btn btn-danger btn-sm " value="reset" onclick="reset()" >

						<input type="button" class="btn btn-primary btn-sm " value="submit" data-bs-toggle="modal" data-bs-target="#addModal" > 
						<!-- Modal -->
						<div class="modal fade" id="addModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="addModalLabel" aria-hidden="true">
							<div class="modal-dialog" align="center">
								<div class="modal-content">
									<div class="modal-header">
										<div class="modal-title" id="addModalLabel">Register Membership</div>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Would you like to register the membership?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
										<button type="submit" class="btn btn-primary">Yes</button>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>