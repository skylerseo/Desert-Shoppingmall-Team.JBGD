<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호</title>
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
	#wholePwdResetDiv{
		width: 800px;
 		display: inline-block;
		border-radius: 10px;  
 		box-sizing: border-box;  
 		background-color: #FAFAFA; 
 		padding-bottom: 50px; 
 		padding-top: 0px; 
 		margin-top: 20px;
 		
 		background-image: url("/jbgd/resources/img/macaron05.jpg");
 		background-repeat: no-repeat;
 		background-position : center;
 		background-size: cover;
	}
	#pwdResetTitleDiv{
		background-image: linear-gradient(to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
 		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	#pwdResetTitleP{
		font-size: 50px;
		padding-bottom: 10px;
		padding-top: 30px;
		margin-top: 0px;
	}
	#pwdResetDiv{
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
	.labelClass{
		width: 200px;
		margin-right: 25px;
	}
	.spanClass{
		margin-left: 0px;
		margin-right: 0px;
		text-align: center;
	}
	#pwdResetBtnDiv{
		width: 800px;
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
	#pwdResetBtn{
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

//비밀번호 재설정 버튼 유효성 검사
function pwdResetValidationFnc() {
	
	var submitObj = document.getElementById("pwdResetForm");
	
	var samePwdObj = document.getElementById("samePwd");
	
	if ($("#pwd").val() == "") {
		alert("비밀번호를 입력해주세요");
		pwd.focus();
		return;
	}else if ($("#pwdCheck").val() == "") {
		alert("비밀번호를 다시 한 번 입력해주세요");
		return;
	}else if (samePwdObj.innerHTML == "비밀번호가 일치하지 않습니다."){
		alert("비밀번호가 일치하지 않으면 변경하실 수 없습니다");
		return;
	}else {
		submitObj.submit();
	}
}

// 로그인 화면으로 이동
function pageMoveLoginFnc() {
	location.href = './login.do';
}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/CommonHeader.jsp"/>
<div id="wholeDiv">

	<div id="wholePwdResetDiv">
	
		<div id="pwdResetTitleDiv">
			<div id="pwdResetTitleP">비밀번호 재설정</div>
		</div>
		
		
		<div id="pwdResetDiv">
			<form id="pwdResetForm" action='./pwdResetCtr.do' method='post'>
			
			<div class="labelSpanDiv">
				<label class="labelClass">
					새로운 비밀번호
				</label>
				<span class="spanClass">
					<input type="password" id="pwd" placeholder="비밀번호를 입력해주세요" 
						name="customerPwd" onchange="pwdCheckFnc();"
						onkeyup="pwdAndNameMaxByteFnc(this);">
				</span>
			</div>
			<div class="labelSpanDiv">
				<label class="labelClass">
					비밀번호 확인
				</label>
				<span class="spanClass">
					<input type="password" id="pwdCheck" 
						placeholder="비밀번호를 다시 입력해주세요"
						onchange="pwdCheckFnc();"
						onkeyup="pwdAndNameMaxByteFnc(this);">
				</span>
			</div>
			<span id="samePwd"></span>
			
			<div id="pwdResetBtnDiv">
				<div>
					<span>
						<input type="hidden" name="customerNo" value="${customerDto.customerNo}">
						<input type='button' id="pwdResetBtn" class="btn" 
							value='변경하기' onclick="pwdResetValidationFnc();">
					</span>
				</div>
				<div>
					<span>
						<input type='button' id="cancelBtn" class="btn" 
							value='취소하기' onclick="pageMoveLoginFnc();">
					</span>
				</div>
			</div>
			
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
</body>
</html>