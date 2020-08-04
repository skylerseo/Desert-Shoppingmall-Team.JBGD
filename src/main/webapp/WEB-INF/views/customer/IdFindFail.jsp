<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 실패</title>
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
	#wholeIdFindFailDiv{
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
	#idFindFailTitleDiv{
		background-image: linear-gradient(to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
 		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	#idFindFailP{
		font-size: 50px;
		padding-bottom: 10px;
		padding-top: 30px;
		margin-top: 0px;
	}
	#idFindFailContentDiv{
		width: 800px;
		height: 120px;
		font-size: 18px;
		text-align: center;
		margin-top: 70px;
	}
	#idFindFailBtnDiv{
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
		font-weight: bold;
		color: white;
	}
	.btn:focus{
		outline: 0;
	}
	#goToIdFindBtn{
		background-color: rgba(0,0,0,0.5);
	}
	#goToCtmAddBtn{
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

	// 회원가입 페이지로 이동
	function pageMoveCustomerAddFnc() {
		location.href = './customerAdd.do';
	}
	
	// 뒤로가기 (비밀번호 찾기 페이지로 이동)
	function pageMoveIdFindFnc() {
		location.href = './idFind.do';
	}
	
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/CommonHeader.jsp"/>
<div id="wholeDiv">

	<div id="wholeIdFindFailDiv">

		<div id="idFindFailTitleDiv">
			<p id="idFindFailP">아이디 찾기 실패</p>
		</div>
	
		<div id="idFindFailContentDiv">
			회원정보가 존재하지 않습니다.
		</div>
		
		<div id="idFindFailBtnDiv">
			<div>
				<span>
					<input type="button" value="뒤로가기" class="btn"
						id="goToIdFindBtn" onclick="pageMoveIdFindFnc();">
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
</div>
<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
</body>
</html>