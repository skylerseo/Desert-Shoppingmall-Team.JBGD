<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script type="text/javascript" 
	src="/jbgd/resources/js/jquery-3.4.1.min.js"></script>
	
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
		color: #525252;
	}
	
	#wholeLoginDiv{
		width: 800px;
/* 		height: 500px; */
 		display: inline-block;
		border-radius: 10px;  
 		box-sizing: border-box;  
 		background-color: #FAFAFA; 
 		padding-bottom: 50px; 
 		padding-top: 0px; 
 		margin-top: 20px;
 		
 		background-image: url("/jbgd/resources/img/macaron01.jpg");
 		background-repeat: no-repeat;
 		background-position : center;
 		background-size: cover;
	}
	#titleTextDiv{
 		background-image: linear-gradient(to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
 		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
		
	#loginTitle{
 		font-size: 50px;
		color: white;
		padding-bottom: 20px;
	}
	
	#loginP{
		font-size: 16px;
 		padding-top: 58px;
 		padding-bottom: 38px;
		color: white;
	}
	
	.loginPClass{
		padding-bottom: 20px;
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
	input:focus, #loginBtn:focus{
		outline: 0;
	}
	.labelSpanDiv{
		width: 800px;
		height: 1%; 
		overflow: hidden;
		font-size: 16px;
	}
	.spanClass{
		margin-left: 0px;
		margin-right: 0px;
		text-align: center;
	}
	#loginFormDiv{
		display: inline-block;
	}
	#loginBtnDiv{
		width: 800px;
	}
	#loginBtn{
		width: 300px;
 		height: 40px;
 		color: white;
		padding: 5px 5px; 
		margin: 10px 10px; 
		border: none; 
		border-radius: 50px; 
		cursor: pointer; 
		font-size: 16px;
		
		font-weight: bold;
		background-color: rgba(0,0,0,0.5);
	}
	#underBtn{
		width: 300px;
		margin: auto;
		border-top: solid #FFB6D2 1px;
		border-top: solid white 1px;
		margin-top: 5px;
		padding-top: 4px;
	}
	.eachUnderBtn{
		width: 90px;
		font-size: 12px;
 		color: white;
		
		border: none;
		outline: none; 
		background: none;
		text-decoration: none;
		
		cursor: pointer; 
		display: inline-block;
	}
	.eachUnderBtn:hover{
		text-decoration: underline;
	}
	
	#footerDiv{
 		position:fixed;
    	bottom: 0px;
    	width: 100%;
    	margin: auto;
 	}
</style>
<script type="text/javascript">

	// 회원가입 페이지로 이동
	function joinPageMoveFnc() {
		location.href = "./customerAdd.do";
	}
	
	//아이디 찾기 페이지로 이동
	function idFindPageMoveFnc() {
		location.href = "./idFind.do";
	}
	
	// 비밀번호 찾기 페이지로 이동
	function pwdFindPageMoveFnc() {
		location.href = "./pwdFind.do";
	}
	
	// 입력폼 유효성 검사
	function loginValidationFnc() {
		
		var submitObj = document.getElementById("loginForm");
		
		if ($("#customerId").val() == "") {
			alert("아이디를 입력해주세요");
			return;
		}else if ($("#customerPwd").val() == "") {
			alert("비밀번호를 입력해주세요");
			return;
		}else {
			submitObj.submit();
		}
	}
	
	// 엔터키로 로그인하기 (입력폼 유효성 검사 포함)
	function enterKeyLoginFnc() {
		
		var keyCode = window.event.keyCode;
		
		var submitObj = document.getElementById("loginForm");
		
		if (keyCode == 13) {
			if ($("#customerId").val() == "") {
				alert("아이디를 입력해주세요");
				return;
			}else if ($("#customerPwd").val() == "") {
				alert("비밀번호를 입력해주세요");
				return;
			}else {
				submitObj.submit();
			}
		}
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
	
	
	//아이디 글자수 제한
	function idMaxByteFnc(obj) {
	    var maxByte = 30; //최대 입력 바이트 수
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
	    	var alertText = "한글 " + Math.floor(maxByte/3) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.";
	        alert(alertText);
	        str2 = str.substr(0, returnLength); //문자열 자르기
	        obj.value = str2;
	        fnChkByte(obj, maxByte);
	    } else {
	        document.getElementById('byteInfo').innerText = returnByte;
	    }
	}
	
	
	//비밀번호 글자수 제한
	function pwdMaxByteFnc(obj) {
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
	    	var alertText = "한글 " + Math.floor(maxByte/3) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.";
	        alert(alertText);
	        str2 = str.substr(0, returnLength); //문자열 자르기
	        obj.value = str2;
	        fnChkByte(obj, maxByte);
	    } else {
	        document.getElementById('byteInfo').innerText = returnByte;
	    }
	}
	

</script>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/CommonHeader.jsp"/>


<div id="wholeDiv">
			
	<div id="wholeLoginDiv">	

		<div id="titleTextDiv">
			<div id="loginP">
				<div class="loginPClass">
					각종 디저트 구매 및 소통이 가능한 공간,
				</div>
				<div class="loginPClass">
					"디저트에 자빠지다" 입니다.
				</div>
				<div class="loginPClass">
					로그인하시면 입장하실 수 있습니다.
				</div>
			</div>
			
			<div id="loginTitleDiv">
				<div id="loginTitle">로그인</div>
			</div>
		</div>
		
		
		
	<!-- 	아이디 비번 입력~로그인 버튼까지 -->
			<div id="loginFormDiv">
				<form id="loginForm" action="./loginCtr.do" method="post" onkeyup="enterKeyLoginFnc();">
					<div class="labelSpanDiv">
<!-- 						<div class="labelClass"> -->
<!-- 							<label> -->
<!-- 								아이디 -->
<!-- 							</label> -->
<!-- 						</div> -->
						<span class="spanClass">
							<input type="text" id="customerId" 
								name="customerId" placeholder="아이디를 입력해주세요"
								onkeyup="idMaxByteFnc(this); preventSpaceFnc(this);" 
								onchange="preventSpaceFnc(this);">
						</span>
					</div>
					
					<div class="labelSpanDiv">
<!-- 						<div class="labelClass"> -->
<!-- 							<label> -->
<!-- 								비밀번호 -->
<!-- 							</label> -->
<!-- 						</div> -->
						<span class="spanClass">
							<input type="password" id="customerPwd" 
								name="customerPwd" placeholder="비밀번호를 입력해주세요"
								onkeyup="pwdMaxByteFnc(this); preventSpaceFnc(this);" 
								onchange="preventSpaceFnc(this);">
						</span>
					</div>
					
					<div id="loginBtnDiv">
						<span>
							<input type="button" id="loginBtn" value="로그인" 
								onclick="loginValidationFnc();">
						</span>
					</div>
				</form>
			</div>
			
	<!-- 	아래 버튼들 -->
		<div id="underBtn">
			<span>
				<input type="button" class="eachUnderBtn" 
					onclick="joinPageMoveFnc();" value="회원가입">
			</span>
			<span>
				<input type="button" class="eachUnderBtn" 
					onclick="idFindPageMoveFnc();" value="아이디 찾기">
			</span>
			<span>
				<input type="button" class="eachUnderBtn" 
					onclick="pwdFindPageMoveFnc();" value="비밀번호 찾기">
			</span>
		</div>
	
	
	</div>	
	
</div>



<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>

</body>
</html>