<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>

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
		color: #525252;
	}
	#wholeAdminMainDiv{
		width: 1080px;
 		display: inline-block;
		border-radius: 10px;  
 		box-sizing: border-box;  
 		background-color: #FAFAFA; 
 		padding-bottom: 50px; 
 		padding-top: 0px; 
 		
 		background-image: url("/jbgd/resources/img/macaron04.jpg");
 		background-repeat: no-repeat;
 		background-position : center;
 		background-size: cover;
	}
	#adminMainTitleDiv{
		background-image: linear-gradient(to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
 		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
/* 		margin-bottom: 28px; */
	}
	#adminMainTitleText{
		font-size: 50px;
 		padding-top: 20px;
		color: white;
		padding-bottom: 20px;
	}
	
	#wholeAdmin{
		margin: 0px;
		width: 1080px;
		text-align: center;
		font-size: 18px;
	}
	.itemSaleBoardAdmin{
		width: 280px;
		display: inline-block;
		font-size: 18px;
		background-color: rgba(0,0,0,0.3);
		margin: 20px;
 		padding-bottom: 30px;
		
		border-radius: 10px; 
		box-sizing: border-box; 
	}

	.aTagBigDiv{
		background-color: rgba(0,0,0,0.5);
		padding-top: 10px;
		padding-bottom: 10px;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	.aTagBig{
		font-size: 38px;
		text-decoration: none;
		color: white;
	}
	.aTagSmallDiv{
		padding: 15px;
		padding-top: 20px;
	}
	.aTagSmall{
		text-decoration: none;
		color: white;
		font-size: 24px;
	}
	#footerDiv{
 		position:fixed;
    	bottom: 0px;
    	width: 100%;
    	margin: auto;
 	}
</style>



</head>
<body onload="InitializeQuickMenu();">
<jsp:include page="/WEB-INF/views/common/AdminHeader.jsp"/>
<%-- <jsp:include page="/WEB-INF/views/common/AdminHeaderMenu.jsp"/> --%>
	<div id="wholeDiv">
	
		<div id="wholeAdminMainDiv">
		
			<div id="adminMainTitleDiv">
				<div id="adminMainTitleText">관리자 메인</div>
			</div>
			
	<!-- 		인덱스 부분에 각각 알맞는 경로 넣기  -->
	
			<div id="wholeAdmin">
				<div class="itemSaleBoardAdmin" id="itemAdminDiv">
					<div class="aTagBigDiv">
						<a class="aTagBig" href="<%=request.getContextPath()%>/itemListAdmin.do">
							상품 관리
						</a>
					</div>
					<div class="aTagSmallDiv">
						<a class="aTagSmall" href="<%=request.getContextPath()%>/itemAdd.do">
							상품 등록
						</a>
					</div>
					<div class="aTagSmallDiv">
						<a class="aTagSmall" href="<%=request.getContextPath()%>/itemListAdmin.do">
							상품 리스트
						</a>
					</div>
					<div class="aTagSmallDiv">
						<a class="aTagSmall" href="<%=request.getContextPath()%>/itemStatistics.do">
							상품 통계
						</a>
					</div>
				</div>
				
				<div class="itemSaleBoardAdmin">
					<div class="aTagBigDiv">
						<a class="aTagBig" href="<%=request.getContextPath()%>/saleList.do">
							주문 관리
						</a>
					</div>
					<div class="aTagSmallDiv">
						<a class="aTagSmall" href="<%=request.getContextPath()%>/saleList.do">
							주문 리스트
						</a>
					</div>
					<div class="aTagSmallDiv">
						<a class="aTagSmall">
							&nbsp;
						</a>
					</div>
					<div class="aTagSmallDiv">
						<a class="aTagSmall">
							&nbsp;
						</a>
					</div>
				</div>
			
				<div class="itemSaleBoardAdmin" id="boardAdminDiv">
					<div class="aTagBigDiv">
						<a class="aTagBig" href="<%=request.getContextPath()%>/board.do">
							게시판 관리
						</a>
					</div>
					<div class="aTagSmallDiv">
						<a class="aTagSmall" href="<%=request.getContextPath()%>//boardAdd.do">
							게시글 등록
						</a>
					</div>
					<div class="aTagSmallDiv">
						<a class="aTagSmall" href="<%=request.getContextPath()%>/board.do">
							게시글 리스트
						</a>
					</div>
					<div class="aTagSmallDiv">
						<a class="aTagSmall">
							&nbsp;
						</a>
					</div>
				</div>
				
	
			</div>
			
			
<%-- 			<jsp:include page="/WEB-INF/views/common/QuickMenu.jsp"/> --%>
			
			
		</div>	

	</div> <!-- 	wholeDiv 끝 -->
	
<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
</body>
</html>