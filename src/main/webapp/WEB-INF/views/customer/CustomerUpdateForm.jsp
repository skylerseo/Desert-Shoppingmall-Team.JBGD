<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정하기</title>

<script type="text/javascript" 
	src="/jbgd/resources/js/jquery-3.4.1.min.js"></script>
	
<script type="text/javascript" 
	src="${pageContext.request.contextPath}/resources/js/common_member.js"></script>
	
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
	#wholeCustomerUpdateDiv{
		width: 1080px;
 		display: inline-block;
		border-radius: 10px;  
 		box-sizing: border-box;  
 		background-color: #FAFAFA; 
 		padding-bottom: 50px; 
 		padding-top: 0px; 
 		margin-top: 20px;
 		
 		background-image: url("/jbgd/resources/img/macaron03.jpg");
 		background-repeat: no-repeat;
 		background-position : center;
 		background-size: cover;
	}
	#updateTitleDiv{
		background-image: linear-gradient(to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
 		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	#updateTitleText{
		font-size: 50px;
		color: white;
		padding-bottom: 10px;
		padding-top: 30px;
	}
	#customerUpdateDiv{
		width: 1080px;
		height: 1%; 
		overflow: hidden;
		margin-top: 20px;
		font-size: 18px;
 		text-align: center;
	}
	.labelSpanDiv{
		width: 700px;
		height: 1%; 
		overflow: hidden;
		font-size: 16px;
 		text-align: right;
	}
	.customerUpdateLabel{
		width: 200px;
		margin-right: 25px;
		color: white;
	}
	.customerUpdateSpan{
		margin-left: 0px;
		margin-right: 0px;
		text-align: center;
	}
	input[type=text], input[type=password], select { 
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
	input:focus, .btn:focus{
		outline: 0;
	}
	#idSpan{
		width: 300px;
		height: 40px;
		margin: 10px 10px; 
		display: inline-block; 
		box-sizing: border-box; 
		text-align: left;
		background-color: rgba(0,0,0,0.1);
		padding: 5px;
		padding-left: 20px;
		border-radius: 50px; 
	}
	#samePwd{
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
	#updateBtn{
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

<script type="text/javascript">

	// 뒤로가기 버튼(마이페이지로 이동)
	function pageMoveBeforeFnc(customerNo) {
		location.href = './myPage.do';
	}
	
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
	
	// 숫자만 입력 가능
	function onlyNumberFnc(){
		if(event.keyCode<48 || event.keyCode>57){
			event.returnValue=false;
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
	        alert("한글 " + Math.floor(maxByte/3) + "자/영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
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
	        alert("한글 " + Math.floor(maxByte/3) + "자/영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
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
	        alert("한글 " + Math.floor(maxByte/3) + "자/영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
	        str2 = str.substr(0, returnLength); //문자열 자르기
	        obj.value = str2;
	        fnChkByte(obj, maxByte);
	    } else {
	        document.getElementById('byteInfo').innerText = returnByte;
	    }
	}
	
	// 회원수정 입력폼 유효성 검사
	function updateValidationFnc() {
		
		var submitObj = document.getElementById("customerUpdateForm");
		
		var samePwdObj = document.getElementById("samePwd");
		
		if ($("#pwd").val() == "") {
			alert("비밀번호를 입력해주세요");
			pwd.focus();
			return;
		}else if ($("#pwdCheck").val() == "") {
			alert("비밀번호를 다시 한 번 입력해주세요");
			pwdCheck.focus();
			return;
		}else if (samePwdObj.innerHTML == "비밀번호가 일치하지 않습니다."){
			alert("비밀번호가 일치하지 않으면 수정하실 수 없습니다");
			return;
		}else if ($("#customerName").val() == "") {
			alert("이름을 입력해주세요");
			customerName.focus();
			return;
		}else if ($("#customerEmail").val() == "") {
			alert("이메일을 입력해주세요");
			customerEmail.focus();
			return;
		}else if ($("#customerAddr").val() == "") {
			alert("주소를 입력해주세요");
			customerAddr.focus();
			return;
		}else if ($("#customerPhone").val() == "") {
			alert("전화번호를 입력해주세요");
			customerPhone.focus();
			return;
		}
			submitObj.submit();
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
	
</script>


</head>

<body>

<jsp:include page="/WEB-INF/views/common/CustomerHeader.jsp"/>

<div id="wholeDiv">

	<div id="wholeCustomerUpdateDiv">

		<div id="updateTitleDiv">
			<div id="updateTitleText">회원정보 수정</div>
		</div>
		
		<div id="customerUpdateDiv">
			<form id="customerUpdateForm" action='./customerUpdateCtr.do' method='post'>
			
				<div class="labelSpanDiv">
					<label class="customerUpdateLabel">
						아&nbsp;이&nbsp;디
					</label>
					<span class="customerUpdateSpan" id="idSpan">
						${customerDto.customerId}
					</span>
				</div>
				<div class="labelSpanDiv">
					<label class="customerUpdateLabel">
						비밀번호
					</label>
					<span class="customerUpdateSpan">
						<input type='password' name='customerPwd' 
							value='${customerDto.customerPwd}' autofocus="autofocus" 
							id="pwd" onkeyup="pwdAndNameMaxByteFnc(this); preventSpaceFnc(this);"
							placeholder="비밀번호를 입력해주세요"
							onchange="pwdCheckFnc(); preventSpaceFnc(this);">
					</span>
				</div>
				<div class="labelSpanDiv">
					<label class="customerUpdateLabel">
						비밀번호 재확인
					</label>
					<span class="customerUpdateSpan">
						<input type='password' id="pwdCheck" 
							onchange="pwdCheckFnc(); preventSpaceFnc(this);" 
							onkeyup="pwdAndNameMaxByteFnc(this); preventSpaceFnc(this);"
							placeholder="비밀번호를 다시 입력해주세요">
					</span>
				</div>
				<span id="samePwd"></span>
				<div class="labelSpanDiv">
					<label class="customerUpdateLabel">
						이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름
					</label>
					<span class="customerUpdateSpan">
						<input type='text' name='customerName' id="customerName"
							value='${customerDto.customerName}'
							onchange="preventSpaceFnc(this);" 
							onkeyup="pwdAndNameMaxByteFnc(this); preventSpaceFnc(this);">
					</span>
				</div>
				<div class="labelSpanDiv">
					<label class="customerUpdateLabel">
						이&nbsp;메&nbsp;일
					</label>
					<span class="customerUpdateSpan">
						<input type='text' name='customerEmail'  id="customerEmail"
							value='${customerDto.customerEmail}'
							onchange="preventSpaceFnc(this);" 
							onkeyup="emailMaxByteFnc(this); preventSpaceFnc(this);">
					</span>
				</div>
				<div class="labelSpanDiv">
					<label class="customerUpdateLabel">
						주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소
					</label>
					<span class="customerUpdateSpan">
						<input type='text' name='customerAddr'  id="customerAddr"
							value='${customerDto.customerAddr}'
							onkeyup="addrMaxByteFnc(this);">
					</span>
				</div>
				<div class="labelSpanDiv">
					<label class="customerUpdateLabel">
						전화번호
					</label>
					<span class="customerUpdateSpan">
						<input type='text' name='customerPhone'  id="customerPhone"
							value='${customerDto.customerPhone}' 
							onkeypress="onlyNumberFnc();"
							onKeyup="inputTelNumber(this);" maxlength="13">
					</span>
				</div>
			
			
				<div>
					<span>
						<input type="hidden" name="customerNo" value="${customerDto.customerNo}">
						<input type="button" class="btn" id="updateBtn" value='수정'
							onclick="updateValidationFnc();">
					</span>
				</div>
				<div>
					<span>
						<input type='button' class="btn" id="cancelBtn" value='취소'
							onclick="pageMoveBeforeFnc(${customerDto.customerNo});">
					</span>
				</div>
			</form>
		</div>
	
	</div>
	
</div>	
<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
	
</body>
</html>