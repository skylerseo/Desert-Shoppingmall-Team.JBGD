<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">

@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100&display=swap');
 
 #headerDiv{
 	width: 1080px; 
 	margin: auto; 
 	height: 110px;
   	font-family: 'Noto Sans KR', sans-serif;
 	
 }
 #headerMenuDiv{
 	width: 1080px; 
 	height: 110px;
 }
 #customerHeaderA{
 	float: left; 
 	font-size: 70px; 
	margin: 0px 0px; 
	margin-left: 30px;
	color: #525252;
  	line-height: 110px;
/*   	margin-bottom: 10px; */
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
 }
 #smallMenuDiv{
 	width: 430px; 
 	height: 20px; 
 	float: right; 
 	margin-top: 0px; 
/*  	margin-bottom: 10px; */
 }
 .customerHeaderSpanClass{
 	width: 97px; 
 	text-align: center;
 	height: 50px;
 }
 #aShop{
 	font-size: 42px;
 	margin-right: 24px;  
	color: #fe43d8;
 }
 #aBoard{
 	font-size: 42px; 
 	margin-right: 70px;
	color: #525252;
 }
 #myPageSpan, #cartSpan, #purchaseConfirmSpan{
/*  	border-right: solid #787878 1px; */
 }
 #logoutSpan{
 	width: 98px;
 }
 #aMyPage{
 	font-size: 14px; 
	margin-left: 18px; 
	margin-right: 21px;
 	color: #525252;
 }
 #aCart{
 	font-size: 14px; 
	margin-left: 22px; 
	margin-right: 21px;
 	color: #525252;
 }
 #aPurchaseConfirm{
 	font-size: 14px; 
	margin-left: 22px; 
	margin-right: 21px;
 	color: #525252;
 }
 #aLogout{
 	font-size: 14px; 
 	margin-left: 22px;
  	color: #525252;
 }
</style>

<div id="headerDiv">

	<div id="headerMenuDiv">
		<a id="customerHeaderA" href="<%=request.getContextPath()%>/itemListCtm.do">
			디저트에 자빠지다
		</a>
		
		<div id="bigMenuDiv">
<%-- 			<c:if test="${sessionScope.customer.customerId ne null}"> --%>
		
				<span class="customerHeaderSpanClass">
					<a id="aShop" href="<%=request.getContextPath()%>/itemListCtm.do">
						Shop
					</a>
				</span>
				
				<span class="customerHeaderSpanClass">
					<a id="aBoard" href="<%=request.getContextPath()%>/board.do">
						자유게시판
					</a>
				</span>
				
<%-- 			</c:if> --%>
		</div>
		
		<div id="smallMenuDiv">
<%-- 			<c:if test="${sessionScope.customer.customerId ne null}"> --%>
		
				<span class="customerHeaderSpanClass" id="myPageSpan">
					<a id="aMyPage" href="<%=request.getContextPath()%>/myPage.do">
								마이페이지
					</a>
				</span>
				
				<span class="customerHeaderSpanClass" id="cartSpan">
					<a id="aCart" href="<%=request.getContextPath()%>/basketList.do">
								장바구니
					</a>
				</span>
				
				<span class="customerHeaderSpanClass" id="purchaseConfirmSpan">
					<a id="aPurchaseConfirm" href="<%=request.getContextPath()%>/saleList.do">
								구매확인
					</a>
				</span>
				
				<c:choose>
					<c:when test="${customer.customerNo >= 0}">
						<span class="customerHeaderSpanClass" id="logoutSpan">
							<a id="aLogout" href="<%=request.getContextPath()%>/logout.do">
										로그아웃
							</a>
							<input type="hidden" value="${customer.customerNo}">
							</span>
					</c:when>
					<c:otherwise>
						<span class="customerHeaderSpanClass" id="logoutSpan">
							<a id="aLogout" href="<%=request.getContextPath()%>/login.do">
										로 그 인
							</a>
							<input type="hidden" value="${customer.customerNo}">
						</span>
					</c:otherwise>
				</c:choose>
				
				
<%-- 				<c:if test="${sessionScope.customer.customerId ne null}"> --%>
<!-- 					<span class="customerHeaderSpanClass" id="logoutSpan"> -->
<%-- 						<a id="aLogout" href="<%=request.getContextPath()%>/logout.do"> --%>
<!-- 									로그아웃 -->
<!-- 						</a> -->
<!-- 					</span> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${sessionScope.customer.customerId eq null}"> --%>
<!-- 					<span class="customerHeaderSpanClass" id="logoutSpan"> -->
<%-- 						<a id="aLogout" href="<%=request.getContextPath()%>/login.do"> --%>
<!-- 									로 그 인 -->
<!-- 						</a> -->
<!-- 					</span> -->
<%-- 				</c:if> --%>
				
<%-- 			</c:if> --%>
		</div>
		
	</div>
<!-- 	<img id="headerImg" src="/jbgd/resources/img/HeaderTitleTempImg.jpg"> -->
</div>    

