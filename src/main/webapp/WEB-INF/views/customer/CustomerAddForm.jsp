<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">
/* 	노토산스 웹폰트 */
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100&display=swap');
	
	body, html{
		background-color: #f3f2f2;
		height: 100%; 
		margin: 0px;
	}
	#wholeDiv{
		text-align: center;
		font-family: 'Noto Sans KR', sans-serif;
		color: white;
	}
	#wholeCustomerAddFormDiv{
		width: 800px;
/* 		height: 500px; */
 		display: inline-block;
		border-radius: 10px;  
 		box-sizing: border-box;  
 		background-color: #FAFAFA; 
 		padding-bottom: 50px; 
 		padding-top: 0px; 
 		margin-top: 20px;
 		
 		background-image: url("/jbgd/resources/img/macaron02.jpg");
 		background-repeat: no-repeat;
 		background-position : center;
 		background-size: cover;
	}
	#customerAddTitleTextDiv{
		background-image: linear-gradient(to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
 		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	#customerAddTitle{
		font-size: 50px;
		color: white;
		padding-bottom: 10px;
		padding-top: 30px;
	}
	#addFormDiv{
		width: 800px;
		height: 1%; 
		overflow: hidden;
		margin-top: 20px;
		font-size: 18px;
 		text-align: center;
	}
	.labelSpanDiv{
		width: 560px;
		height: 1%; 
		overflow: hidden;
		font-size: 16px;
 		text-align: right;
	}
	.addInfoLabel{
		width: 200px;
		margin-right: 25px;
		color: white;
	}
	.addInfoSpan{
		margin-left: 0px;
		margin-right: 0px;
		text-align: center;
	}
	#addBtnDiv{
		width: 800px;
		margin-left: 0px;
		margin-right: 0px;
		text-align: center;
	}
	#idLabelSpanDiv{
		width: 665px;
	}
 	#overlapBtnDiv{
  		display: inline-block;
 	} 
	#overlapBtn{
		width: 100px;
		height: 40px;
		color: white; 
		border: none; 
		border-radius: 50px; 
		cursor: pointer; 
		font-size: 15px;
		
		background-color: rgba(0,0,0,0.5);
/* 		background: linear-gradient(330deg, #FFF681 0%, #88FFFD 100%); */
/* 		color: #FF4C93;  */
		font-weight: bold;
	}
	input[type=text], [type=email], input[type=password], select { 
		width: 300px;
		height: 40px;
		padding: 5px 5px; 
		margin: 10px 10px; 
		display: inline-block;
		border-radius: 50px; 
		box-sizing: border-box; 
		
		padding-left: 20px;
		border-style: none;
 		background-color: white;
	}
	input:focus, #overlapBtn:focus, .btn:focus{
		outline: 0;
	}
	#samePwd, #idOverlapCheckFin{
		font-size: 14px;
	}
	.btn{
		width: 300px;
		height: 40px;
		padding: 5px 5px; 
		margin: 10px 10px;
		border: none; 
		border-radius: 50px; 
		cursor: pointer; 
		font-size: 16px;
		color: white;
		font-weight: bold;
	}
	#addBtn{
		background-color: rgba(0,0,0,0.5);
	}
	#cancelBtn{
		background-color: rgba(0,0,0,0.3);
	}
	#footerDiv{
 		position:fixed;
    	bottom: 0px;
    	width: 100%;
    	margin: auto;
 	}
</style>
<script type="text/javascript" 
	src="/jbgd/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	window.onload = function() {
		var stateInputObj = document.getElementById("stateInput");
		
		var idOverlapCheckFinObj = document.getElementById("idOverlapCheckFin");
		
		var idAvailableText = "사용 가능한 아이디입니다.";
		var idUnableText = "이미 존재하는 아이디입니다.";
		
		
		if (stateInputObj.value === 'pass') {
			idOverlapCheckFinObj.innerHTML = idAvailableText;
			idOverlapCheckFinObj.style.color = 'blue';
		}
		if (stateInputObj.value === 'fail') {
			idOverlapCheckFinObj.innerHTML = idUnableText;
			idOverlapCheckFinObj.style.color = 'red';
		}
		
	}

	// 아이디 중복체크
	function idOverlapCheckFnc() {
		
		var addFormTag = document.getElementById("addForm");
		
		addFormTag.action = 'customerIdOverlapCheckCtr.do';
		addFormTag.submit();
		
	}

	
	// 공백 입력 방지
	function preventSpaceFnc(obj) { 
	    var str_space = /\s/;  // 공백체크
	    if(str_space.exec(obj.value)) { //공백 체크
	        alert("이 항목에는 공백을 입력하실 수 없습니다.");
	        obj.focus();
	        obj.value = obj.value.replace(/\s/gi, ""); // 공백제거
	        return false;
	    }
 	// onkeyup="preventSpaceFnc(this);" onchange="preventSpaceFnc(this);"
	}
	
	// 글자수 제한 alert (글자수 제한 fnc마다 반복해서 쓰임)
	function maxByteMsgFnc(maxByte){
		var alertText = "한글 " + Math.floor(maxByte/3) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.";
        alert(alertText);
	}
	
	//아이디 글자수 제한
	function idMaxByteFnc(obj) {
	    var maxByte = 30; //최대 입력 바이트 수
	    var minByte = 4; //최소 입력 바이트 수
	    var str = obj.value;
	    var strLength = str.length;
	 
	    var returnByte = 0;
	    var returnLength = 0;
	    var oneChar = "";
	    var str2 = "";
	 
	    for (var i = 0; i < strLength; i++) {
	        oneChar = str.charAt(i);
	 
	        if (escape(oneChar).length > 4) {
	            returnByte += 3; //한글3Byte
	        } else {
	            returnByte++; //영문 등 나머지 1Byte
	        }
	 
	        if (returnByte <= maxByte) {
	            returnLength = i + 1; //return할 문자열 갯수
	        }
	    }
	 
	    if (returnByte > maxByte) {
	    	maxByteMsgFnc(maxByte);
// 	    	var alertText = "한글 " + Math.floor(maxByte/3) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.";
// 	        alert(alertText);
	        str2 = str.substr(0, returnLength); //문자열 자르기
	        obj.value = str2;
	        fnChkByte(obj, maxByte);
	    } else {
	        document.getElementById('customerId').innerText = returnByte;
	    }
	    
	}
	
	//비밀번호와 이름 글자수 제한
	function pwdAndNameMaxByteFnc(obj) {
	    var maxByte = 40; //최대 입력 바이트 수
	    var str = obj.value;
	    var strLength = str.length;
	 
	    var returnByte = 0;
	    var returnLength = 0;
	    var oneChar = "";
	    var str2 = "";
	 
	    for (var i = 0; i < strLength; i++) {
	        oneChar = str.charAt(i);
	 
	        if (escape(oneChar).length > 4) {
	            returnByte += 3; //한글3Byte
	        } else {
	            returnByte++; //영문 등 나머지 1Byte
	        }
	 
	        if (returnByte <= maxByte) {
	            returnLength = i + 1; //return할 문자열 갯수
	        }
	    }
	 
	    if (returnByte > maxByte) {
	    	maxByteMsgFnc(maxByte);
	        str2 = str.substr(0, returnLength); //문자열 자르기
	        obj.value = str2;
	        fnChkByte(obj, maxByte);
	    } else {
	        document.getElementById('byteInfo').innerText = returnByte;
	    }
	}
	
	//이메일 글자수 제한
	function emailMaxByteFnc(obj) {
	    var maxByte = 50; //최대 입력 바이트 수
	    var str = obj.value;
	    var strLength = str.length;
	 
	    var returnByte = 0;
	    var returnLength = 0;
	    var oneChar = "";
	    var str2 = "";
	 
	    for (var i = 0; i < strLength; i++) {
	        oneChar = str.charAt(i);
	 
	        if (escape(oneChar).length > 4) {
	            returnByte += 3; //한글3Byte
	        } else {
	            returnByte++; //영문 등 나머지 1Byte
	        }
	 
	        if (returnByte <= maxByte) {
	            returnLength = i + 1; //return할 문자열 갯수
	        }
	    }
	 
	    if (returnByte > maxByte) {
	    	maxByteMsgFnc(maxByte);
	        str2 = str.substr(0, returnLength); //문자열 자르기
	        obj.value = str2;
	        fnChkByte(obj, maxByte);
	    } else {
	        document.getElementById('byteInfo').innerText = returnByte;
	    }
	}
	
	// 이메일 양식 유효성 검사
	function validateEmailFnc(obj) {
		
		var ctmEmail = document.getElementById("customerEmail").value;

		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

				if(exptext.test(ctmEmail)==false){

			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

			alert("이메일 형식이 올바르지 않습니다. 예) email@jbgd.com");

			obj.focus(obj);

			return;
		}
	}
	
	//주소 글자수 제한
	function addrMaxByteFnc(obj) {
	    var maxByte = 200; //최대 입력 바이트 수
	    var str = obj.value;
	    var strLength = str.length;
	 
	    var returnByte = 0;
	    var returnLength = 0;
	    var oneChar = "";
	    var str2 = "";
	 
	    for (var i = 0; i < strLength; i++) {
	        oneChar = str.charAt(i);
	 
	        if (escape(oneChar).length > 4) {
	            returnByte += 3; //한글3Byte
	        } else {
	            returnByte++; //영문 등 나머지 1Byte
	        }
	 
	        if (returnByte <= maxByte) {
	            returnLength = i + 1; //return할 문자열 갯수
	        }
	    }
	 
	    if (returnByte > maxByte) {
	    	maxByteMsgFnc(maxByte);
	        str2 = str.substr(0, returnLength); //문자열 자르기
	        obj.value = str2;
	        fnChkByte(obj, maxByte);
	    } else {
	        document.getElementById('byteInfo').innerText = returnByte;
	    }
	}
	
	// 뒤로가기 버튼(로그인 화면으로 이동)
	function pageMoveLoginFnc() {
		location.href = './login.do';
	}
	
	// 비밀번호 재확인 검사
	function pwdCheckFnc() {
		var pw = document.getElementById("pwd").value;
		var pwChk = document.getElementById("pwdCheck").value;
		var samePwdObj = document.getElementById("samePwd");
		
		if (pw != '' && pwChk != '') {
			if (pw == pwChk) {
				samePwdObj.innerHTML = '비밀번호가 일치합니다.';
				samePwdObj.style.color = 'blue';
			}
			else{
				samePwdObj.innerHTML = '비밀번호가 일치하지 않습니다.';
				samePwdObj.style.color = 'red';
			}
		}
	}
	
	// 회원가입 입력폼 유효성 검사
	function addValidationFnc() {
		var submitObj = document.getElementById("addForm");
		
		var idOverlapCheckFinObj = document.getElementById("idOverlapCheckFin");
		var samePwdObj = document.getElementById("samePwd");
		
		if ($("#customerId").val() == "") {
			alert("아이디를 입력해주세요");
			return;
		}else if (idOverlapCheckFinObj.innerHTML == ""){
			alert("아이디 중복검사 버튼을 눌러주세요");
			return;
		}else if (idOverlapCheckFinObj.innerHTML == "이미 존재하는 아이디입니다."){
			alert("다른 아이디를 사용해주세요");
			return;
		}else if ($("#pwd").val() == "") {
			alert("비밀번호를 입력해주세요");
			return;
		}else if ($("#pwdCheck").val() == "") {
			alert("비밀번호를 다시 한 번 입력해주세요");
			return;
		}else if (samePwdObj.innerHTML == "비밀번호가 일치하지 않습니다."){
			alert("비밀번호가 일치하지 않으면 가입하실 수 없습니다");
			return;
		}else if ($("#customerName").val() == "") {
			alert("이름을 입력해주세요");
			return;
		}else if ($("#customerEmail").val() == "") {
			alert("이메일을 입력해주세요");
			return;
		}else if ($("#customerAddr").val() == "") {
			alert("주소를 입력해주세요");
			return;
		}else if ($("#customerPhone").val() == "") {
			alert("전화번호를 입력해주세요");
			return;
		}else {
			submitObj.submit();
		}
	}
	
	// 숫자만 입력 가능
	function onlyNumberFnc(){
		if(event.keyCode<48 || event.keyCode>57){
			event.returnValue=false;
		}
	}
	
	// 전화번호 하이픈 자동 삽입하기
	function inputTelNumber(obj) {

	    var number = obj.value.replace(/[^0-9]/g, "");
	    var tel = "";
	
	    // 서울 지역번호(02)가 들어오는 경우
	    if(number.substring(0, 2).indexOf('02') == 0) {
	        if(number.length < 3) {
	            return number;
	        } else if(number.length < 6) {
	            tel += number.substr(0, 2);
	            tel += "-";
	            tel += number.substr(2);
	        } else if(number.length < 10) {
	            tel += number.substr(0, 2);
	            tel += "-";
	            tel += number.substr(2, 3);
	            tel += "-";
	            tel += number.substr(5);
	        } else {
	            tel += number.substr(0, 2);
	            tel += "-";
	            tel += number.substr(2, 4);
	            tel += "-";
	            tel += number.substr(6);
	        }
	    
	    // 서울 지역번호(02)가 아닌경우
	    } else {
	        if(number.length < 4) {
	            return number;
	        } else if(number.length < 7) {
	            tel += number.substr(0, 3);
	            tel += "-";
	            tel += number.substr(3);
	        } else if(number.length < 11) {
	            tel += number.substr(0, 3);
	            tel += "-";
	            tel += number.substr(3, 3);
	            tel += "-";
	            tel += number.substr(6);
	        } else {
	            tel += number.substr(0, 3);
	            tel += "-";
	            tel += number.substr(3, 4);
	            tel += "-";
	            tel += number.substr(7);
	        }
	    }
	
	    obj.value = tel;
	}
	

</script>


</head>

<body>


	<jsp:include page="/WEB-INF/views/common/CommonHeader.jsp"/>
	<div id="wholeDiv">

		<div id="wholeCustomerAddFormDiv">
		
			<div id="customerAddTitleTextDiv">
				<div id="customerAddTitle">
					회원가입
				</div>
			</div>
			
			
			<div id="addFormDiv">
			
				<form id="addForm" action='./customerAddCtr.do' method='post'>
					
					<div class="labelSpanDiv" id="idLabelSpanDiv">
						<label class="addInfoLabel">
							아이디
						</label>
						<input type="hidden" value="${state}" id="stateInput">
						<span class="addInfoSpan">
							<input type="text" name="customerId" id="customerId" 
								placeholder="아이디를 입력해주세요" value="${customerDto.customerId}"
								onkeyup="idMaxByteFnc(this); preventSpaceFnc(this);"
								onchange="preventSpaceFnc(this);">
						</span>
						<div id="overlapBtnDiv">
							<input type="button" value="중복검사" id="overlapBtn" 
								onclick="idOverlapCheckFnc();">
						</div>
					</div>
					<span id="idOverlapCheckFin"></span>
					<div class="labelSpanDiv">
						<label class="addInfoLabel">
							비밀번호
						</label>
						<span class="addInfoSpan">
							<input type='password' name='customerPwd' 
								placeholder="비밀번호를 입력해주세요"	id="pwd" 
								onchange="pwdCheckFnc(); preventSpaceFnc(this);" 
								onkeyup="pwdAndNameMaxByteFnc(this); preventSpaceFnc(this);">
						</span>
					</div>
					<div class="labelSpanDiv">
						<label class="addInfoLabel">
							비밀번호 재확인
						</label>
						<span class="addInfoSpan">
							<input type='password' id="pwdCheck" 
							 placeholder="비밀번호를 다시 입력해주세요"
							 onchange="pwdCheckFnc(); preventSpaceFnc(this);" 
							 onkeyup="pwdAndNameMaxByteFnc(this); preventSpaceFnc(this);">
						</span>
					</div>
					<span id="samePwd"></span>
					
					<div class="labelSpanDiv">
						<label class="addInfoLabel">
							이름
						</label>
						<span class="addInfoSpan">
							<input type='text' name='customerName' id="customerName" value="${customerDto.customerName}"
								placeholder="이름을 입력해주세요" onchange="preventSpaceFnc(this);"
								onkeyup="pwdAndNameMaxByteFnc(this); preventSpaceFnc(this);">
						</span>
					</div>
					<div class="labelSpanDiv">
						<label class="addInfoLabel">
							이메일
						</label>
						<span class="addInfoSpan">
							<input type='email' name='customerEmail' id="customerEmail" value="${customerDto.customerEmail}"
								placeholder="이메일을 입력해주세요" onchange="preventSpaceFnc(this); validateEmailFnc(this);"
								onkeyup="emailMaxByteFnc(this); preventSpaceFnc(this);">
						</span>
					</div>
					<div class="labelSpanDiv">
						<label class="addInfoLabel">
							주소
						</label>
						<span class="addInfoSpan">
							<input type="text" name="customerAddr" id="customerAddr" 
								value="${customerDto.customerAddr}"
								placeholder="주소를 입력해주세요"
								onkeyup="addrMaxByteFnc(this);">
						</span>
					</div>
					<div class="labelSpanDiv">
						<label class="addInfoLabel">
							전화번호
						</label>
						<span class="addInfoSpan">
							<input type="text" name="customerPhone" 
								class="customerPhoneInput" id="customerPhone" value="${customerDto.customerPhone}"
								placeholder="전화번호를 숫자만 입력해주세요" onkeypress="onlyNumberFnc();"
								onKeyup="inputTelNumber(this);" maxlength="13">
						</span>
					</div>
					
					<!-- 가입하기 버튼 -->
					<div>
						<span>
						 	<input type='button' value='가입' id="addBtn" class="btn" 
						 		onclick="addValidationFnc();"
						 		onkeyup="preventSpaceFnc(this);" 
						 		onchange="preventSpaceFnc(this);">
						</span>
					</div>
					
					<!-- 뒤로가기 버튼 -->
					<div>
						<span>
						 	<input type='button' value='뒤로가기' id="cancelBtn" 
						 		class="btn" onclick="pageMoveLoginFnc();">
						</span>
					</div>
					
				</form>
				
			</div> <!-- addFormDiv 끝 -->	
		</div>
	</div> <!-- wholeDiv 끝 -->
	
	
			
	<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
	
	
</body>
</html>