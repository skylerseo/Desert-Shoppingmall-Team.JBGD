<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐쉬 충전 완료</title>

<script type="text/javascript" 
	src="/jbgd/resources/js/jquery-3.4.1.min.js"></script>

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
	#wholeMoneyUpdateFinDiv{
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
	#moneyBalanceTitleDiv{
		background-image: linear-gradient(to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
 		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	#moneyBalanceText{
		font-size: 50px;
		padding-bottom: 10px;
		padding-top: 30px;
	}
	#moneyBalanceContent{
		width: 1080px;
		height: 200px;
		font-size: 18px;
		text-align: center;
		margin-top: 70px;
	}
	#moneyBalanceSpanDiv{
		margin-top: 20px;
		margin-bottom: 20px;
	}
	#moneyBalanceSpan{
		font-size: 26px;
		font-weight: bold;
		background-color: rgba(0,0,0,0.4);
		padding: 5px;
		padding-left: 8px;
		padding-right: 8px;
	}
	#goToMyPageBtnDiv{
		text-align: center;
	}
	#goToMyPageBtn{
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

	function myPageMoveFnc(customerNo) {
	   location.href = './myPage.do';
	}

	function myPageReturnFnc(referer) {
	   location.href = referer;
	}

</script>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/CustomerHeader.jsp"/>
<div id="wholeDiv">

	<div id="wholeMoneyUpdateFinDiv">
	
		<div id="moneyBalanceTitleDiv">
			<div id="moneyBalanceText">캐쉬 충전 완료</div>
		</div>
		
		<div id="moneyBalanceContent">
			회원님의 잔액은
			<div id="moneyBalanceSpanDiv">
				<span id="moneyBalanceSpan">
	<%-- 				${customer.customerMoney} 원 --%>
	 				<fmt:formatNumber 
	 					value="${customer.customerMoney}" pattern="#,###" />원
				</span>
			</div>
			입니다.
		</div>
		
	   <c:choose>
	      <c:when test="${empty redirect}">
	         <div id="goToMyPageBtnDiv">
	            <input type="button" value="확인" id="goToMyPageBtn"
	               onclick="myPageMoveFnc(${customerDto.customerNo});">
	         </div>
	      </c:when>
	      <c:otherwise>
	         <div id="goToMyPageBtnDiv">
	            <input type="button" value="확인" id="goToMyPageBtn"
	               onclick="myPageReturnFnc('${redirect}');">
	         </div>
	      </c:otherwise>
	   </c:choose>
	</div>
</div>	
<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>

</body>
</html>