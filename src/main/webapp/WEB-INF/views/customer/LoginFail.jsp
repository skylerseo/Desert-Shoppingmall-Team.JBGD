<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>

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
	#loginFailTitleDiv{
		width: 500px;
		margin: auto;
	}
	#loginFailTitleP{
		font-size: 60px;
/* 		font-family: 'Do Hyeon', sans-serif; */
		font-family: 'Black Han Sans', sans-serif;
		color: #FF4C93;
		text-align: center;
		margin-top: 20px;
		margin-bottom: 0px;
		display: inline-block;
	}
	#loginFailContentDiv{
		width: 850px;
		height: 140px;
		font-size: 18px;
		text-align: center;
		margin-top: 70px;
	}
	
	#loginFailBtnDiv{
		width: 850px;
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
		-webkit-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		-moz-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		-ms-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		-o-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
	}
	.btn:focus{
		outline: 0;
	}
	#goToLoginBtn{
		background: linear-gradient(330deg, #4CFFFF 0%, #FF4C93 100%);
	}
	#goToCtmAddBtn{
		background-color: #979797;
		
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
	
	function pageMoveCustomerAddFnc() {
		location.href = './customerAdd.do';
	}

</script>

</head>

<body>
<jsp:include page="/WEB-INF/views/common/CommonHeader.jsp"/>
<div id="wholeDiv">
	<div id="loginFailTitleDiv">
		<p id="loginFailTitleP">로그인 실패</p>
	</div>
	
	<div id="loginFailContentDiv">
			등록되지 않은 회원입니다.<br>
			아이디 또는 비밀번호를 확인해주세요.
	</div>
	
	<div id="loginFailBtnDiv">
		<div>
			<span>
				<input type="button" value="뒤로가기" class="btn" 
					id="goToLoginBtn" onclick="pageMoveLoginFnc();">
			</span>
		</div>
		<div>
			<span>
				<input type="button" value="회원가입" class="btn" 
					id="goToCtmAddBtn" onclick="pageMoveCustomerAddFnc();">
			</span>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>

</body>

</html>