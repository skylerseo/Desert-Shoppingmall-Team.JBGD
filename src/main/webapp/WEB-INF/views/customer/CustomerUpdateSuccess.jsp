<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 성공</title>

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
	#wholeCustomerAddSuccessDiv{
		width: 1080px;
/* 		height: 500px; */
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
	#titleDiv{
		background-image: linear-gradient(to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
 		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	#titleP{
		font-size: 50px;
		color: white;
		padding-bottom: 10px;
		padding-top: 30px;
		margin-top: 0px;
	}
	#sentenceDiv{
		font-size: 18px;
		height: 120px;
		text-align: center;
		margin-top: 50px;
	}
	#goToMyPageBtnDiv{
		text-align: center;
	}
	#goToMyPageBtn{
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
		background-color: rgba(0,0,0,0.5);
	}
	#goToMyPageBtn:focus{
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
	function MyPageMoveFnc(customerNo) {
		location.href = "./myPage.do";
	}
</script>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/CustomerHeader.jsp"/>
	<div id="wholeDiv">
	
		<div id="wholeCustomerAddSuccessDiv">
			<div id="titleDiv">
				<p id="titleP">회원정보 수정 성공!</p>
			</div>
			
			<div id="sentenceDiv">
				성공적으로 수정되었습니다.
				
			</div>
			
			<div id="goToMyPageBtnDiv">
				<input type="button" onclick="MyPageMoveFnc(${customerNo});" id="goToMyPageBtn" value="마이페이지로 돌아가기">
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
</body>

</html>