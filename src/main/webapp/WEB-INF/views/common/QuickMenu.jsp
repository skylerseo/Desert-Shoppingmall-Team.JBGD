<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

<style type="text/css">
	/* 	노토산스 웹폰트 */
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100&display=swap');

	
	#quickMenu{
		margin: 0px;
		margin-top: 36px;
		padding: 0px;  
		position: absolute; 
		left: 6px; 
		top: 0px;
		font-family: 'Noto Sans KR', sans-serif;
		width: 160px;
		border-radius: 10px;  
 		box-sizing: border-box;  
		
		background-image: url("/jbgd/resources/img/macaron03.jpg");
 		background-repeat: no-repeat;
 		background-position : center;
 		background-size: cover;
	}
	.quickAdminDiv{
		text-align: center;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	.quickTitleADiv{
 		background-color: rgba(0,0,0,0.5);
 		width: 126px;
		height: 24px;
		text-align: center;
		margin: auto;
		padding: 5px 5px;
		border: none; 
 		border-radius: 50px;
		cursor: pointer;
		margin-bottom: 5px;
	}
	.quickTitleA{
		text-decoration: none;
		color: white;
		font-size: 14px;
		font-weight: bold;
	}
	.quickADiv{
		padding: 5px;
		cursor: pointer;
	}
	.quickA{
		text-decoration: none;
		color: white;
		font-size: 14px;
	}
	.quickTitleA:hover, .quickA:hover{
		text-decoration: underline;
	}
	

</style>

<script type="text/javascript">

	var stmnLEFT = 10; // 오른쪽 여백 
	var stmnGAP1 = 0; // 위쪽 여백 
	var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
	var stmnBASE = 150; // 스크롤 시작위치 
	var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
	var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
	var stmnTimer; 
	
	function RefreshQuickMenu() { 
	
		var stmnStartPoint, stmnEndPoint; 
		stmnStartPoint = parseInt(document.getElementById('quickMenu').style.top, 10); 
		stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
		if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
		if (stmnStartPoint != stmnEndPoint) { 
		stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
		document.getElementById('quickMenu').style.top = parseInt(document.getElementById('quickMenu').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
		stmnRefreshTimer = stmnScrollSpeed; 
		}
		stmnTimer = setTimeout("RefreshQuickMenu();", stmnActivateSpeed); 
	 } 
	
	 function InitializeQuickMenu() {
		 document.getElementById('quickMenu').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
		 document.getElementById('quickMenu').style.top = document.body.scrollTop + stmnBASE + 'px'; 
		 RefreshQuickMenu();
	 }
</script>


<!-- body 태그 안에 다음처럼 onload 붙여넣기 <body onload="InitializeQuickMenu();"> -->
<!-- 아래 주석처리된 것을 복사해서 wholeDiv 끝나는 곳 바로 위에 붙이기 -->
<%-- <jsp:include page="/WEB-INF/views/common/QuickMenu.jsp"/> --%>

			<div id="quickMenu">
				<div class="quickAdminDiv">
					<div class="quickTitleADiv">
						<a class="quickTitleA" href="<%=request.getContextPath()%>/itemListAdmin.do">
							상품 관리
						</a>
					</div>
					<div class="quickADiv">
						<a class="quickA" href="<%=request.getContextPath()%>/itemAdd.do">
							상품 등록
						</a>
					</div>
					<div class="quickADiv">
						<a class="quickA" href="<%=request.getContextPath()%>/itemListAdmin.do">
							상품 리스트
						</a>
					</div>
					<div class="quickADiv">
						<a class="quickA" href="<%=request.getContextPath()%>/itemStatistics.do">
							상품 통계
						</a>
					</div>
				</div>
				
				<div class="quickAdminDiv">
					<div class="quickTitleADiv">
						<a class="quickTitleA" href="<%=request.getContextPath()%>/saleList.do">
							주문 관리
						</a>
					</div>
					<div class="quickADiv">
						<a class="quickA" href="<%=request.getContextPath()%>/saleList.do">
							주문 리스트
						</a>
					</div>
				</div>
				
				<div class="quickAdminDiv">
					<div class="quickTitleADiv">
						<a class="quickTitleA" href="<%=request.getContextPath()%>/index.jsp">
							자유게시판 관리
						</a>
					</div>
					<div class="quickADiv">
						<a class="quickA" href="<%=request.getContextPath()%>/index.jsp">
							게시글 등록
						</a>
					</div>
					<div class="quickADiv">
						<a class="quickA" href="<%=request.getContextPath()%>/index.jsp">
							게시글 리스트
						</a>
					</div>
				</div>
				
			</div>
		
