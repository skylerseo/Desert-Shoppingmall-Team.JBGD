<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>

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
		color: #525252;
	}
	#wholeIdFindResultDiv{
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
	#idFindResultTitleDiv{
		background-image: linear-gradient(to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
 		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	#idFindResultP{
		font-size: 50px;
		color: white;
		padding-bottom: 10px;
		padding-top: 30px;
		margin-top: 0px;
	}
	#idFindResultContent{
		width: 800px;
		height: 200px;
		font-size: 18px;
		text-align: center;
		margin-top: 70px;
		color: white; 
	}
	#idFindResultSpanDiv{
		margin-top: 20px;
		margin-bottom: 20px;
	}
	#idFindResultSpan{
		font-size: 26px;
		font-weight: bold;
		background-color: rgba(0,0,0,0.3);
		padding-left: 20px;
		padding-right: 20px;
		padding-top: 5px;
		padding-bottom: 5px;
	}
	#idFindResultBtnDiv{
		width: 800px;
		margin-left: 0px;
		margin-right: 0px;
		text-align: center;
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
	.btn:focus{
		outline: 0;
	}
	#goToLoginBtn{
		background-color: rgba(0,0,0,0.5);
	}
	#goToPwdFindBtn{
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

function loginPageMoveFnc() {
	location.href = './login.do';
}

function pwdFindPageMoveFnc() {
	location.href = './pwdFind.do';
}

</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/CommonHeader.jsp"/>
<div id="wholeDiv">

	<div id="wholeIdFindResultDiv">

		<div id="idFindResultTitleDiv">
			<p id="idFindResultP">아이디 찾기 결과</p>
		</div>

		<div id="idFindResultContent">
			귀하의 아이디는
			<div id="idFindResultSpanDiv">
				<span id="idFindResultSpan">
					${customerDto.customerId}
				</span>
			</div>
			입니다.
		</div>
		
		<div id="idFindResultBtnDiv">
			<div>
				<input type="button" value="로그인하러 가기" id="goToLoginBtn"
					class="btn" onclick="loginPageMoveFnc();">
			</div>
			<div>
				<input type="button" value="비밀번호 찾기" id="goToPwdFindBtn"
					class="btn" onclick="pwdFindPageMoveFnc();">
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
</body>
</html>