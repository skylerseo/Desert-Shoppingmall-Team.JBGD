<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정 성공</title>
<script type="text/javascript" 
	src="/jbgd/resources/js/jquery-3.4.1.min.js"></script>
	
<script type="text/javascript" 
	src="${pageContext.request.contextPath}/resources/js/common_member.js"></script>
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
		width: 850px;
		margin: auto;
		text-align: center;
		font-family: 'Noto Sans KR', sans-serif;
		color: #525252;
		
		border-radius: 10px; 
		box-sizing: border-box; 
		background-color: #FAFAFA;
		padding-bottom: 50px;
		padding-top: 0px;
		
		-webkit-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-moz-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-ms-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-o-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
	}
	#titleDiv{
		width: 600px;
		margin: auto;
	}
	#titleP{
		font-size: 60px;
/* 		font-family: 'Do Hyeon', sans-serif; */
		font-family: 'Black Han Sans', sans-serif;
		color: #FF4C93;
		text-align: center;
		margin-top: 20px;
		margin-bottom: 0px;
		display: inline-block;
	}
	#sentenceDiv{
		width: 850px;
		height: 140px;
		font-size: 18px;
		text-align: center;
		margin-top: 70px;
	}
	#goToLoginBtnDiv{
		width: 850px;
	}
	#goToLoginBtn{
		width: 300px;
		height: 40px;
		padding: 5px 5px; 
		margin: 10px 10px;
		border: none; 
		border-radius: 50px; 
		cursor: pointer; 
		font-size: 16px;
		
		background: linear-gradient(330deg, #4CFFFF 0%, #FF4C93 100%);
		color: white; 
		font-weight: bold;
		
		-webkit-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		-moz-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		-ms-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		-o-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
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
function pageMoveLoginFnc() {
	location.href = './login.do';
}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/CommonHeader.jsp"/>
	<div id="wholeDiv">
		<div id="titleDiv">
			<p id="titleP">비밀번호 수정 성공!</p>
		</div>
		
		<div id="sentenceDiv">
			성공적으로 수정되었습니다.
		</div>
		
		<div id="goToLoginBtnDiv">
			<input type="button" onclick="pageMoveLoginFnc();" 
				id="goToLoginBtn" value="로그인하러 가기">
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
</body>
</html>