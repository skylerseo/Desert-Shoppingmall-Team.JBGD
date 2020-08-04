<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>

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
	#wholeCustomerAddSuccessDiv{
		width: 800px;
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
	#customerAddSuccesstitleDiv{
		background-image: linear-gradient(to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
 		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	#customerAddSuccessP{
		font-size: 50px;
		color: white;
		padding-bottom: 10px;
		padding-top: 30px;
		margin-top: 0px;
	}
	#sentenceDiv{
		width: 800px;
		height: 150px;
		font-size: 18px;
		text-align: center;
		margin-top: 70px;
		color: white;
	}
	#sentenceClass{
		padding: 10px;
	}
	#goToLoginBtnDiv{
		text-align: center;
	}
	#goToLoginBtn{
		width: 300px;
		height: 40px;
		color: white; 
		padding: 5px 5px; 
		margin: 10px 10px;
		border: none; 
		border-radius: 50px; 
		cursor: pointer; 
		font-size: 16px;
		background-color: rgba(0,0,0,0.5);
		color: white; 
		font-weight: bold;
	}
	#goToLoginBtn:focus{
		outline: 0;
	}
	#footerDiv{
 		position:fixed;
    	bottom: 0px;
    	width: 100%;
    	margin: auto;
 	}
</style>	
<script type="text/javascript">
	function loginPageMoveFnc() {
		location.href = "./login.do";
	}
</script>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/CommonHeader.jsp"/>
	<div id="wholeDiv">

		<div id="wholeCustomerAddSuccessDiv">

			<div id="customerAddSuccesstitleDiv">
				<p id="customerAddSuccessP">회원가입 성공!</p>
			</div>

			<div id="sentenceDiv">
				<div id="sentenceClass">정상적으로 가입되셨습니다.</div>
				<div id="sentenceClass">로그인 페이지에서 로그인해주세요!</div>
			</div>

			<div id="goToLoginBtnDiv">
				<input type="button" onclick="loginPageMoveFnc();" id="goToLoginBtn"
					value="로그인하러 가기">
			</div>

		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
</body>

</html>