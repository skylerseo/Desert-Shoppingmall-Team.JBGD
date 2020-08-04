
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style type="text/css">
/* 	노토산스 웹폰트 */
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100&display=swap');



 #headerMenuDiv{
  	width: 1080px;
  	height: 46px;
 	margin: auto;

  	font-family: 'Noto Sans KR', sans-serif;

  	background-color: rgba(0,0,0,0.5);
  	border-radius: 10px; 
	box-sizing: border-box; 
	margin-bottom: 10px;
	padding-bottom: 10px;
 }
 
 .aHeaderMainClass{
  	width: 360px;
  	font-size: 30px;
  	text-decoration: none;

   	color: white;
   	

 }
 #aItem{
 	border-right: solid white 1px;
 	padding-right: 110px;
  	margin-left: 126px;
 }
 #aSale{
 	border-right: solid white 1px;
 	margin-left: 110px;
  	padding-right: 110px;
 }
 #aBoard{
  	margin-left: 110px;
 }
 
</style>

<div id="headerMenuDiv">
	
<!-- 	인덱스 부분에 알맞은 경로 넣기  -->

		<span id="itemSpan">
			<a class="aHeaderMainClass" id="aItem"
				href="<%=request.getContextPath()%>/itemListAdmin.do">
					상품 관리
			</a>
		</span>
	
		<span id="saleSpan">
			<a class="aHeaderMainClass" id="aSale"
				href="<%=request.getContextPath()%>/saleList.do">
					주문 관리
			</a>
		</span>
	
		<span id="boardSpan">
			<a class="aHeaderMainClass" id="aBoard"
				href="<%=request.getContextPath()%>/board.do">
					게시판 관리
			</a>
		</span>

</div>
	
