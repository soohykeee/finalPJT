function CheckAddProduct() {
	
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var description = document.getElementById("description");
	var brand = document.getElementById("brand");
	var unitsInStock = document.getElementById("unitsInStock");
	
	var category = document.getElementsByName("category");
	var size = document.getElementById("size");
	
	
	function check(regExp, e, msg){
		
		if (regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return ;
	}
	
	//상품 아이디 체크
	if (!check(/^P[0-9]{1,9}$/, productId, "[상품코드]\nP와 숫자를 조합하여 2~10자까지 입력하세요\n첫 글자는 반드시 P로 시작하세요.")){
		return;
	}
	//상품명 체크
	if (name.value.length < 4 || name.value.length > 20) {
		alert("[상품명]\n최소 4자에서 최대 20자까지 입력하세요.");
		name.select();
		name.foucs();
		return ;
	}
	
	//상품 가격 체크
	if (isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요.");
		unitPrice.select();
		unitPrice.focus();
		return ;
	}
	if (unitPrice.value.length == 0) {
		alert("[가격]\n가격을 입력하세요.");
		unitPrice.select();
		unitPrice.focus();
		return ;
	}
	if (unitPrice.value < 0) {
		alert("[가격]\n음수는 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return ;
	} 

	//상세설명 체크
	if (description.value.length == 0){
		alert("[상세설명]\n상세설명을 입력해주세요.");
		description.select();
		description.focus();
		return;
	}
	
	//브랜드 체크
	if (brand.value.length == 0){
		alert("[브랜드]\n브랜드명을 입력해주세요.");
		brand.select();
		brand.focus();
		return;
	}

	

	//재고 수 체크
	if (unitsInStock.value.length == 0){
		alert("[재고 수]\n재고수를 입력해주세요.");
		unitsInStock.select();
		unitsInStock.focus();
		return;
	}
	if (isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요.");
		unitsInStock.select();
		unitsInStock.focus();
		return ;
	}
	if (unitsInStock.value < 0) {
		alert("[재고 수]\n음수는 입력할 수 없습니다.");
		unitsInStock.select();
		unitsInStock.focus();
		return ;
	}
	
	document.newProduct.submit();
	
}