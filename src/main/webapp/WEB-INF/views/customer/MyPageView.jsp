<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

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
	#wholeMyPageDiv{
		width: 1080px;
/* 		height: 500px; */
 		display: inline-block;
		border-radius: 10px;  
 		box-sizing: border-box;  
 		background-color: #FAFAFA; 
 		padding-bottom: 50px; 
 		padding-top: 0px; 
 		
 		background-image: url("/jbgd/resources/img/macaron03.jpg");
 		background-repeat: no-repeat;
 		background-position : center;
 		background-size: cover;
	}
	#myPageTitleDiv{
		background-image: linear-gradient(to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
 		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		margin-bottom: 28px;
	}
	#myPageTitleP{
		font-size: 50px;
 		padding-top: 20px;
		color: white;
		padding-bottom: 20px;
	}
	#wholeCustomerInfoDiv{
		width: 539px;
		height: 407px;
		float: left;
		border-right: solid white 1px;
	}
	#customerInfoDiv{
 		width: 500px;
		height: 275px;
 		display: inline-block;
		font-size: 16px;
		margin-left: 30px;
	}
 	.customerInfoLabel{
 		width: 80px;
		display: inline-block; 
		box-sizing: border-box; 
		text-align: center;
		margin-right: 24px;
		color: white;
/* 		font-weight: bold; */
		background-color: rgba(0,0,0,0.4);
		padding: 5px;
 	}
 	.customerInfoSpan{
 		width: 352px;
 		margin-right: 32px;
		display: inline-block; 
		box-sizing: border-box; 
		text-align: left;
		font-size: 14px;
		color: white;
		background-color: rgba(0,0,0,0.3);
		padding-left: 10px;
		padding-top: 5px;
		padding-bottom: 5px;
 	}
 	.customerInfoLabelSpanDiv{
 		margin-bottom: 25px;
 	}

	#moneyCheckContent{
		width: 538px;
		height: 220px;
		font-size: 18px;
		color: white;
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
		
		background-color: rgba(0,0,0,0.5);
		color: white; 
		font-weight: bold;
	}
	.btn:focus{
		outline: 0;
	}
	#customerInfoBtnForm{
		width: 539px;
		text-align: center;
	}
	#moneyCheck{
		text-align: center;
		width: 538px;
		height: 410px;
		float: right;
	}
	#customerMoneySpanDiv{
		margin-top: 20px;
		margin-bottom: 20px;
		font-size: 26px;
	}
	#customerMoneySpan{
		background-color: rgba(0,0,0,0.3);
		color: white;
		font-weight: bold;
		padding-left: 10px;
		padding-top: 5px;
		padding-bottom: 5px;
	}
	#customerMoneySpanWon{
		background-color: rgba(0,0,0,0.3);
		padding-top: 5px;
		padding-bottom: 5px;
		padding-right: 10px;
	}
	#wholeCustomerInfoP{
		margin-bottom: 30px;
		text-align: center;
		font-size: 32px;
		height: 50px;
		margin-top: 0px;
		color: white;
	}
	#moneyCheckTitleP{
		margin-bottom: 85px;
		font-size: 32px;
		margin-top: 0px;
		height: 50px;
		color: white;
	}
	#footerDiv{
 		position: fixed;
    	bottom: 0px;
    	width: 100%;
    	margin: auto;
 	}
</style>

<script type="text/javascript">
	window.onload = function() {
		var customerInfoBtn = document.getElementById('customerInfoBtn');
		var moneyCheckBtn = document.getElementById('moneyChkBtn');
		
		customerInfoBtn.addEventListener('click', function() {
			var formObj = document.getElementById('customerInfoBtnForm');
			
			formObj.submit();
		})
		
		moneyCheckBtn.addEventListener('click', function() {
			var formObj = document.getElementById('moneyChkBtnForm');
			
			formObj.submit();
		})
	}
</script>

</head>
<body onload="InitializeQuickMenu();">

	<c:choose>
		<c:when test="${customer.customerNo == 1}">
			<jsp:include page="/WEB-INF/views/common/AdminHeader.jsp"/>
			<jsp:include page="/WEB-INF/views/common/AdminHeaderMenu.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="/WEB-INF/views/common/CustomerHeader.jsp"/>
		</c:otherwise>
	</c:choose>
	
	<div id="wholeDiv">
	
		<div id="wholeMyPageDiv">
	
			<div id="myPageTitleDiv">
				<div id="myPageTitleP">마이페이지</div>
			</div>
			
			<div id="wholeCustomerInfoDiv">
				<p id="wholeCustomerInfoP">회원정보</p>
				<div id="customerInfoDiv">
					<div class="customerInfoLabelSpanDiv">
						<label class="customerInfoLabel">
							아이디
						</label>
						<span class="customerInfoSpan">
							${customerDto.customerId}
						</span>
					</div>
					<div class="customerInfoLabelSpanDiv">
						<label class="customerInfoLabel">
							이름
						</label>
						<span class="customerInfoSpan">
							${customerDto.customerName}
						</span>
					</div>
					<div class="customerInfoLabelSpanDiv">
						<label class="customerInfoLabel">
							이메일
						</label>
						<span class="customerInfoSpan">
							${customerDto.customerEmail}
						</span>
					</div>
					<div class="customerInfoLabelSpanDiv">
						<label class="customerInfoLabel">
							주소
						</label>
						<span class="customerInfoSpan" id="addrSpan">
							${customerDto.customerAddr}
						</span>
					</div>
					<div class="customerInfoLabelSpanDiv">
						<label class="customerInfoLabel">
							전화번호
						</label>
						<span class="customerInfoSpan">
							${customerDto.customerPhone}
						</span>
					</div>
				</div>
				
				<div id="customerInfoBtnFormDiv">
					<form action="./customerUpdate.do" id="customerInfoBtnForm" method="get">
						<input type="button" class="btn" 
							id="customerInfoBtn" value="회원정보 수정">
					</form>
				</div>
			</div>
			
			<div id="moneyCheck">
				<p id="moneyCheckTitleP">캐쉬 내역</p>
				<div id="moneyCheckContent">
					회원님의 잔액은
					<div id="customerMoneySpanDiv">
						<span id="customerMoneySpan">
	 						<fmt:formatNumber value="${customerDto.customerMoney}" pattern="#,###" />
						</span>
						<span id="customerMoneySpanWon">원</span>
					</div>
					입니다.
				</div>
				
				<div id="moneyCheckBtn">
					<form action="./moneyUpdate.do" id="moneyChkBtnForm" method="post">
						<input type="button" class="btn" 
							id="moneyChkBtn" value="캐쉬 충전하기">
					</form>
				</div>
				
			</div>
		
		</div>
		<c:if test="${customer.customerNo==1}">
			<jsp:include page="/WEB-INF/views/common/QuickMenu.jsp"/>
		</c:if>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
</body>
</html>