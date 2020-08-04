<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>


<style type="text/css">
/* 	노토산스 웹폰트 */
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100&display=swap');

	body, html{
/* 		background: linear-gradient(330deg, #D1FFF6 0%, #FFB6D2 100%); */
		background-color: #f3f2f2;
		height: 100%; 
		margin: 0px;
	}
	
	#wholeDiv{
		text-align: center;
		font-family: 'Noto Sans KR', sans-serif;
		color: white;
	}
	#wholeIdFindFormDiv{
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
	
	#customerIdFindTitleTextDiv{
		background-image: linear-gradient(to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
 		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	#customerIdFindTitle{
		font-size: 50px;
		color: white;
		padding-bottom: 10px;
		padding-top: 30px;
	}
	.labelSpanDiv{
		width: 560px;
		height: 1%; 
		overflow: hidden;
		font-size: 16px;
 		text-align: right;
	}
	.labelDiv{
		width: 200px;
		margin-right: 25px;
		color: white;
	}
	.spanDiv{
		margin-left: 0px;
		margin-right: 0px;
		text-align: center;
	}
	#idFindFormDiv{
		width: 800px;
		height: 1%; 
		overflow: hidden;
		margin-top: 20px;
		font-size: 18px;
 		text-align: center;
	}
	input[type=text], select { 
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
	#idFindBtn{
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

// 뒤로가기(로그인 페이지로 이동하기)
function pageMoveLoginFnc() {
	location.href = './login.do';
}

//공백 입력 방지
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

//글자수 제한 alert (글자수 제한 fnc마다 반복해서 쓰임)
function maxByteMsgFnc(maxByte){
	var maxByteNum = Math.floor(maxByte/3);
	var alertText = "한글 " + maxByteNum + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.";
    alert(alertText);
}

//이름 글자수 제한
function nameMaxByteFnc(obj) {
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
            returnByte += 2; //한글2Byte
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
            returnByte += 2; //한글2Byte
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

//이메일 양식 유효성 검사
// function validateEmailFnc(obj) {
	
// 	var ctmEmail = document.getElementById("customerEmail").value;

// 	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

// 			if(exptext.test(ctmEmail)==false){

// 		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

// 		alert("이메일 형식이 올바르지 않습니다. 예) email@jbgd.com");

// 		obj.focus(obj);

// 		return;
// 	}
// }

//입력폼 유효성 검사
function idFindValidationFnc() {
	var submitObj = document.getElementById("idFindForm");
	
	if ($("#customerName").val() == "") {
		alert("이름을 입력해주세요");
		return;
	}else if ($("#customerEmail").val() == "") {
		alert("이메일을 입력해주세요");
		return;
	}else {
		submitObj.submit();
	}
}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/CommonHeader.jsp"/>
<div id="wholeDiv">
	<div id="wholeIdFindFormDiv">
		
		<div id="customerIdFindTitleTextDiv">
			<div id="customerIdFindTitle">
				아이디 찾기
			</div>
		</div>

		<div id="idFindFormDiv">
			<form id="idFindForm" action="./idFindResult.do" method='get'>
			
				<div class="labelSpanDiv">
					<label class="labelDiv">
						이름
					</label>
					<span class="spanDiv">
						<input type="text" name='customerName' 
							placeholder="이름을 입력해주세요" id="customerName"
							onkeyup="nameMaxByteFnc(this); preventSpaceFnc(this);" 
							onchange="preventSpaceFnc(this);">
					</span>
				</div>
				<div class="labelSpanDiv">
					<label class="labelDiv">
						이메일
					</label>
					<span class="spanDiv">
						<input type="text" name='customerEmail' 
							placeholder="이메일을 입력해주세요" id="customerEmail"
							onkeyup="emailMaxByteFnc(this); preventSpaceFnc(this);" 
							onchange="preventSpaceFnc(this);">
					</span>
				</div>
			
				<div>
					<span>
						<input type="button" value='아이디 찾기' id="idFindBtn" 
							class="btn" onclick="idFindValidationFnc();">
					</span>
				</div>
				<div>
					<span>
						<input type='button' value='뒤로가기' id="cancelBtn" 
							class="btn" onclick="pageMoveLoginFnc();">
					</span>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
</body>
</html>