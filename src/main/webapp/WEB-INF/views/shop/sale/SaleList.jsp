<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매확인</title>

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
		margin: auto;
		width: 1080px;
		font-family: 'Noto Sans KR', sans-serif;
		color: #525252;
		
		border-radius: 10px; 
		box-sizing: border-box; 
		background-color: #FAFAFA;
		padding-bottom: 100px;
		padding-top: 5px;
		
		-webkit-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-moz-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-ms-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-o-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
	}
	#saleListTitleDiv{
		width: 850px;
		margin: auto;
		text-align: center;
	}
	#ldquoLeft{
		color: #FFF681;
		font-size: 60px;
		margin-top: 10px;
		margin-bottom: 0px;
		display: inline-block;
		font-family: 'Black Han Sans', sans-serif;
		text-shadow: 1px 1px 1px #FB84D7;
	}
	#saleListTitleP{
		font-size: 60px;
		font-family: 'Black Han Sans', sans-serif;
		color: #FF4C93;
		text-align: center;
		margin-top: 10px;
		margin-bottom: 0px;
		display: inline-block;
	}
	#rdquoRight{
		color: #88FFFD;
		font-size: 60px;
		margin-top: 10px;
		margin-bottom: 0px;
		display: inline-block;
		font-family: 'Black Han Sans', sans-serif;
		text-shadow: 1px 1px 1px #FB84D7;
	}
	table, th, td{
		border-bottom: 1px solid #FFB6D2;
		border-collapse: collapse;
	}
	th{
		text-align: center;
		height: 40px;
	}
	td{
		padding-left: 10px;
		padding-right: 10px;
		height: 30px;
	}
	
	#saleItemListDiv{
		width: 850px;
		height: 300px;
		margin: auto;
	}
	#saleItemListTable{width: 850px;}
	#tableSaleListNo{width: 80px;}
	#tableSaleListName{	}
	#tableSaleListPrice{width: 100px;}
	#tableSaleListState{width: 80px;}
	#tableSaleListDate{width: 170px;}

	.tableSaleNo{text-align: center;}
	.tableSaleName{text-align: left;}
	.tableSalePrice{text-align: right;}
	.tableSaleState{text-align: center;}
	.tableSaleDate{text-align: right;}
	
	.tableSaleName:hover{
		text-decoration: underline;
		cursor: pointer;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function saleDetailFnc(saleNo, curPage) {
		location.href= './saleDetail.do?saleNo=' + saleNo + '&curPage=' + curPage;
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

		<div id="saleListTitleDiv">
			<p id="ldquoLeft">&ldquo;</p>
			<p id="saleListTitleP">구매확인</p>
			<p id="rdquoRight">&rdquo;</p>
		</div>
		<div id="saleItemListDiv">
			<table id="saleItemListTable">
				<tr>
					<th id="tableSaleListNo">주문번호</th>
					<th id="tableSaleListName">상품명</th>
					<th id="tableSaleListPrice">가격</th>
					<th id="tableSaleListDate">주문날짜</th>
					<th id="tableSaleListState">구매상태</th>
				</tr>
				<c:forEach var="saleDto" items="${saleList}">
					<tr>
						<td class="tableSaleNo">
							${saleDto.saleNo}
						</td>
						<td class="tableSaleName" onclick="saleDetailFnc(${saleDto.saleNo}, ${curPage});">
							${saleDto.itemName}<c:if test="${saleDto.count != 1}">외 ${saleDto.count - 1}개</c:if>
						</td>
						<td class="tableSalePrice">
							${saleDto.salePrice}원
						</td>
						<td class="tableSaleDate">
							<fmt:formatDate value="${saleDto.saleDate}"	pattern="yyyy-MM-dd hh:mm:ss"/>
						</td>
						<td class="tableSaleState">
							${saleDto.saleState}
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>	
		
		<div id="pageSearchDiv">
			<form id="pagingForm" action="./saleList.do?" method="POST">
				<div id="pageDiv">
					<jsp:include page="/WEB-INF/views/common/Paging.jsp">
						<jsp:param value="${pagingMap}" name="pagingMap"/>
					</jsp:include>
					<input type="hidden" id='tempCurPage' name='tempCurPage' value="${curPage}">
				</div>
				<jsp:include page="/WEB-INF/views/common/Search.jsp"/>
			</form>
		</div>

		<c:if test="${customer.customerNo==1}">
			<jsp:include page="/WEB-INF/views/common/QuickMenu.jsp"/>
		</c:if>
	</div>

	<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>

</body>
</html>



