
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">

/* 	노토산스 웹폰트 */
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100&display=swap');

 #wholeHeaderDiv{
 	width: 1080px; 
 	margin: auto; 
 	height: 110px;
   	font-family: 'Noto Sans KR', sans-serif;
 }

#headerDiv{
 	width: 1080px; 
 	height: 110px;
 }
 #adminHeaderA{
	float: left; 
 	font-size: 70px; 
	margin: 0px 0px; 
	margin-left: 30px;
	color: #525252;
  	line-height: 110px;
 }
 
a{
 	text-decoration: none; 
 }
 #bigMenuDiv{
 	width: 430px; 
 	margin: 0px 0px; 
 	float: right; 
 	margin-top: 10px; 
 	margin-bottom: 3px; 
 	text-align: right;
/*  	text-shadow: 0px 0px 2px #FF0074; */
 }
 #smallMenuDiv{
 	width: 430px; 
 	height: 20px; 
 	float: right; 
 	margin-top: 0px; 
/*  	margin-bottom: 10px; */
 }
 .adminHeaderSpanClass{
 	width: 97px; 
 	text-align: center;
 	height: 50px;
 }
 #aHeaderShop{
 	font-size: 42px;
 	margin-right: 24px;  
	color: #fe43d8;
 }
 #aHeaderBoard{
 	font-size: 42px; 
 	margin-right: 70px;
	color: #525252;
 }
 #myPageSpan, #cartSpan, #purchaseConfirmSpan{
/*  	border-right: solid #FFB6D2 2px; */
 }
 #logoutSpan{
 	width: 98px;
 }
 #aHeaderMyPage{
 	font-size: 14px; 
	margin-left: 18px; 
	margin-right: 21px;
 	color: #525252;
 }
 #aHeaderCart{
 	font-size: 14px; 
	margin-left: 22px; 
	margin-right: 21px;
 	color: #525252;
 }
 #aHeaderPurchaseConfirm{
 	font-size: 14px; 
	margin-left: 22px; 
	margin-right: 21px;
 	color: #525252;
 }
 #aHeaderLogout{
 	font-size: 14px; 
 	margin-left: 22px;
  	color: #525252;
 }
</style>

<div id="wholeHeaderDiv">

	<div id="headerDiv">
		<a id="adminHeaderA" href="<%=request.getContextPath()%>/adminMain.do">
			디저트에 자빠지다
		</a>
		
		<div id="bigMenuDiv">
<%-- 			<c:if test="${sessionScope.customer.customerId ne null}"> --%>
		
				<span class="adminHeaderSpanClass">
					<a id="aHeaderShop" href="<%=request.getContextPath()%>/itemListAdmin.do">
						Shop
					</a>
				</span>
				
				<span class="adminHeaderSpanClass">
					<a id="aHeaderBoard" href="<%=request.getContextPath()%>/board.do">
						자유게시판
					</a>
				</span>
				
<%-- 			</c:if> --%>
		</div>
		<div id="smallMenuDiv">
<%-- 			<c:if test="${sessionScope.customer.customerId ne null}"> --%>
		
				<span class="adminHeaderSpanClass" id="myPageSpan">
					<a id="aHeaderMyPage" href="<%=request.getContextPath()%>/myPage.do">
								마이페이지
					</a>
				</span>
				
				<span class="adminHeaderSpanClass" id="cartSpan">
					<a id="aHeaderCart" href="<%=request.getContextPath()%>/basketList.do">
								장바구니
					</a>
				</span>
				
				<span class="adminHeaderSpanClass" id="purchaseConfirmSpan">
					<a id="aHeaderPurchaseConfirm" href="<%=request.getContextPath()%>/saleList.do">
								구매확인
					</a>
				</span>
				
				<c:choose>
					<c:when test="${customer.customerNo >= 0}">
						<span class="adminHeaderSpanClass" id="logoutSpan">
							<a id="aHeaderLogout" href="<%=request.getContextPath()%>/logout.do">
										로그아웃
							</a>
							<input type="hidden" value="${customer.customerNo}">
							</span>
					</c:when>
					<c:otherwise>
						<span class="adminHeaderSpanClass" id="logoutSpan">
							<a id="aHeaderLogout" href="<%=request.getContextPath()%>/login.do">
										로 그 인
							</a>
							<input type="hidden" value="${customer.customerNo}">
						</span>
					</c:otherwise>
				</c:choose>
				
		</div>
		
		
	</div>
	
</div>    

