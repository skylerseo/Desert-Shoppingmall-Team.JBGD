<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 통계</title>
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
/* 		height: 1%;  */
		overflow: hidden;
		font-family: 'Noto Sans KR', sans-serif;
		color: #525252;
		
		border-radius: 10px; 
		box-sizing: border-box; 
		background-color: #FAFAFA;
		padding-bottom: 50px;
		padding-top: 5px;
		
		-webkit-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-moz-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-ms-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-o-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
	}

	#pageTitleDiv{
		width: 1080px;
		margin: auto;
		text-align: center;
	}
	#ldquoLeft{
		color: #FFF681;
		font-size: 60px;
		margin-top: 15px;
		margin-bottom: 0px;
		display: inline-block;
		font-family: 'Black Han Sans', sans-serif;
/* 		text-shadow: 0px 0px 1px #FF0074; */
		text-shadow: 1px 1px 1px #FB84D7;
	}
	#pageTitleP{
		font-size: 60px;
		font-family: 'Black Han Sans', sans-serif;
		color: #FF4C93;
		text-align: center;
		margin-top: 15px;
		margin-bottom: 30px;
		display: inline-block;
	}
	#rdquoRight{
		color: #88FFFD;
		font-size: 60px;
		margin-top: 15px;
		margin-bottom: 0px;
		display: inline-block;
		font-family: 'Black Han Sans', sans-serif;
/* 		text-shadow: 0px 0px 1px #FF0074; */
		text-shadow: 1px 1px 1px #FB84D7;
	}
	table, th, td{
		border-bottom: 1px solid #FFB6D2;
		border-collapse: collapse;
	}
	th{
		text-align: center;
		height: 30px;
		cursor: pointer;
	}
	th:hover{
		text-decoration: underline;
	}
	td{
		padding-left: 10px;
		padding-right: 10px;
	}
	#pageTitleDiv{
		width: 850px;
		text-align: center;
	}
	#itemListDiv{
		width: 850px;
		height: 1%; 
		overflow: hidden;
		margin: auto;
		margin-bottom: 24px;
	}
	#itemListTable{width: 850px;}
	#tableItemListNo{width: 90px;}
	#tableItemListName{	}
	#tableItemListPrice{width: 100px;}
	#tableItemListSoldCount{width: 100px;}
	#tableItemListViewCount{width: 80px;}
	#tableItemListDate{width: 110px;}
	#tableItemListState{width: 80px;}

	.tableItemNo{text-align: center;}
	.tableItemName{text-align: left;}
	.tableItemPrice{text-align: right;}
	.tableItemSoldCount{text-align: right;}
	.tableItemViewCount{text-align: right;}
	.tableItemDate{text-align: center;}
	.tableItemState{text-align: center;}
	
	.itemOption{text-align: center;}
	.itemOptionName{text-align: left;}
	.itemOptionPrice{text-align: right;}
	.itemOptionStock{text-align: right;}
	.itemOptionSoldCount{text-align: right;}
	.itemOptionCreDate{text-align: center;}
	.tableLine:hover {
		cursor: pointer;	
	}
	.tableItemName:hover{
		text-decoration: underline;
		cursor: pointer;
	}
	.itemOptionDetail, .itemOption{
		background-color: #e6e6e6;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	function moveItemViewFnc(itemNo) {
		location.href = './itemView.do?itemNo=' + itemNo;
	}
	function itemHideFnc(itemNo, itemName) {
		var str = '.itemOptionDetail_' + itemNo;
		
		$(str).hide();
		
		var itemName = document.getElementById('itemName_' + itemNo);
		itemName.setAttribute('onclick', 'itemViewFnc(' + itemNo + ');');
	}
	function itemViewFnc(itemNo, itemName) {
		var str = '.itemOptionDetail_' + itemNo;
		
		$(str).show();
		
		var itemName = document.getElementById('itemName_' + itemNo);
		itemName.setAttribute('onclick', 'itemHideFnc(' + itemNo + ');');
		
	}
	function itemListOrderByFnc(str) {
		if (str == 1) {	str = 'ITEM_NO'; }
		else if (str == 2) { str = 'ITEM_NAME'; }
		else if (str == 3) { str = 'ITEM_PRICE'; }
		else if (str == 4) { str = 'ITEM_SOLD_COUNT'; }
		else if (str == 5) { str = 'ITEM_VIEW_COUNT'; }
		else if (str == 6) { str = 'ITEM_CRE_DATE'; }
		else if (str == 7) { str = 'ITEM_STATE'; }
		
		var orderBy = document.getElementById('orderBy').value;
		var orderOption = document.getElementById('orderOption').value;
		
		if (orderBy == str && orderOption == 'ASC') {
			location.href= './itemStatistics.do?orderBy=' + str + '&orderOption=' + orderOption;
		}else{
			location.href= './itemStatistics.do?orderBy=' + str;
		}
	}
	$(document).ready(function() {
		var itemOptionDetail;
		var thumbNail;
		<c:forEach var="itemDto" items="${itemList}">
			itemOptionDetail = document.getElementsByClassName('itemOptionDetail_'+${itemDto.itemNo});
			itemOptionEmpty = document.getElementById('itemOptionEmpty_'+${itemDto.itemNo});
			itemOptionEmpty.setAttribute('rowspan', itemOptionDetail.length);
		</c:forEach>
	})
</script>
</head>
<body onload="InitializeQuickMenu();">

	<jsp:include page="/WEB-INF/views/common/AdminHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/common/AdminHeaderMenu.jsp"/>
	
	<div id="wholeDiv">

		<div id="pageTitleDiv">
			<p id="ldquoLeft">&ldquo;</p>
			<p id="pageTitleP">상품 통계</p>
			<p id="rdquoRight">&rdquo;</p>
		</div>
		<input type="hidden" id="orderOption" value="${pagingMap.orderOption}">
		<input type="hidden" id="orderBy" value="${pagingMap.orderBy}">
		<div id="itemListDiv">
			<div>
				<table id="itemListTable">
					<tr>
						<th id="tableItemListNo" onclick="itemListOrderByFnc(1);">
							<c:if test="${pagingMap.orderBy == 'ITEM_NO' && pagingMap.orderOption == 'DESC'}">상품번호▼</c:if>
							<c:if test="${pagingMap.orderBy == 'ITEM_NO' && pagingMap.orderOption == 'ASC'}">상품번호▲</c:if>
							<c:if test="${pagingMap.orderBy != 'ITEM_NO'}">상품번호</c:if>
						</th>
						<th id="tableItemListName" onclick="itemListOrderByFnc(2);">
							<c:if test="${pagingMap.orderBy == 'ITEM_NAME' && pagingMap.orderOption == 'DESC'}">상품명▼</c:if>
							<c:if test="${pagingMap.orderBy == 'ITEM_NAME' && pagingMap.orderOption == 'ASC'}">상품명▲</c:if>
							<c:if test="${pagingMap.orderBy != 'ITEM_NAME'}">상품명</c:if>
						</th>
						<th id="tableItemListPrice" onclick="itemListOrderByFnc(3);">
							<c:if test="${pagingMap.orderBy == 'ITEM_PRICE' && pagingMap.orderOption == 'DESC'}">가격▼</c:if>
							<c:if test="${pagingMap.orderBy == 'ITEM_PRICE' && pagingMap.orderOption == 'ASC'}">가격▲</c:if>
							<c:if test="${pagingMap.orderBy != 'ITEM_PRICE'}">가격</c:if>
						</th>
						<th id="tableItemListSoldCount" onclick="itemListOrderByFnc(4);">
							<c:if test="${pagingMap.orderBy == 'ITEM_SOLD_COUNT' && pagingMap.orderOption == 'DESC'}">누적 판매량▼</c:if>
							<c:if test="${pagingMap.orderBy == 'ITEM_SOLD_COUNT' && pagingMap.orderOption == 'ASC'}">누적 판매량▲</c:if>
							<c:if test="${pagingMap.orderBy != 'ITEM_SOLD_COUNT'}">누적 판매량</c:if>
						</th>
						<th id="tableItemListViewCount" onclick="itemListOrderByFnc(5);">
							<c:if test="${pagingMap.orderBy == 'ITEM_VIEW_COUNT' && pagingMap.orderOption == 'DESC'}">조회수▼</c:if>
							<c:if test="${pagingMap.orderBy == 'ITEM_VIEW_COUNT' && pagingMap.orderOption == 'ASC'}">조회수▲</c:if>
							<c:if test="${pagingMap.orderBy != 'ITEM_VIEW_COUNT'}">조회수</c:if>
						</th>
						<th id="tableItemListDate" onclick="itemListOrderByFnc(6);">
							<c:if test="${pagingMap.orderBy == 'ITEM_CRE_DATE' && pagingMap.orderOption == 'DESC'}">등록날짜▼</c:if>
							<c:if test="${pagingMap.orderBy == 'ITEM_CRE_DATE' && pagingMap.orderOption == 'ASC'}">등록날짜▲</c:if>
							<c:if test="${pagingMap.orderBy != 'ITEM_CRE_DATE'}">등록날짜</c:if>
						</th>
						<th id="tableItemListState" onclick="itemListOrderByFnc(7);">
							<c:if test="${pagingMap.orderBy == 'ITEM_STATE' && pagingMap.orderOption == 'DESC'}">판매상태▼</c:if>
							<c:if test="${pagingMap.orderBy == 'ITEM_STATE' && pagingMap.orderOption == 'ASC'}">판매상태▲</c:if>
							<c:if test="${pagingMap.orderBy != 'ITEM_STATE'}">판매상태</c:if>
						</th>
					</tr>
					<c:forEach var="itemDto" items="${itemList}">
						<tr onclick="itemViewFnc(${itemDto.itemNo});" class="tableLine" id="itemName_${itemDto.itemNo}"
						onmouseover="this.style.background='#ffe6eb';" onmouseout="this.style.background='#ffffff';">
							<td class="tableItemNo">
								${itemDto.itemNo}
							</td>
							<td class="tableItemName">
								${itemDto.itemName}
							</td>
							<td class="tableItemPrice">
								<fmt:formatNumber value="${itemDto.itemPrice}" currencyCode="KRW"/>원
							</td>
							<td class="tableItemSoldCount">
								${itemDto.itemSoldCount}개
							</td>
							<td class="tableItemViewCount">
								${itemDto.itemViewCount}회
							</td>
							<td class="tableItemDate">
								<fmt:formatDate value="${itemDto.itemCreDate}"	pattern="yyyy-MM-dd hh:mm:ss"/>
							</td>
							<td class="tableItemState">
								${itemDto.itemState}
							</td>
						</tr>
						<tr class="itemOptionDetail_${itemDto.itemNo} itemOption" style="display: none;">
							<td id="itemOptionEmpty_${itemDto.itemNo}"></td>
							<td>옵션명</td>
							<td class="price">추가 가격</td>
							<td>재고</td>
							<td>판매량</td>
							<td colspan="2">등록 날짜</td>
						</tr>
						<c:forEach var="itemOptionList" items="${itemOptionTotalList}">
							<c:forEach var="itemOptionDto" items="${itemOptionList}">
								<c:if test="${itemOptionDto.itemNo == itemDto.itemNo}">
									<tr class="itemOptionDetail_${itemDto.itemNo} itemOptionDetail" style="display: none;">
										<td class="itemOptionName">${itemOptionDto.itemOptionName}</td>
										<td class="itemOptionPrice">
											<fmt:formatNumber value="${itemOptionDto.itemOptionPrice}" currencyCode="KRW"/>원
										</td>
										<td class="itemOptionStock">
											<fmt:formatNumber value="${itemOptionDto.itemOptionStock}" currencyCode="KRW"/>개
										</td>
										<td class="itemOptionSoldCount">
											<fmt:formatNumber value="${itemOptionDto.itemOptionSoldCount}" currencyCode="KRW"/>개
										</td>
										<td colspan="2"  class="itemOptionCreDate">
											<fmt:formatDate value="${itemOptionDto.itemOptionCreDate}"	pattern="yyyy-MM-dd hh:mm:ss"/>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:forEach>
				</table>
			</div>
		</div>	
		<div id="pageSearchDiv">
			<form id="pagingForm" action="./itemStatistics.do" method="post">
				<div id="pageDiv">
					<jsp:include page="/WEB-INF/views/common/Paging.jsp">
						<jsp:param value="${pagingMap}" name="pagingMap"/>
					</jsp:include>
					<input type="hidden" id='tempCurPage' name='tempCurPage' 
						value="${pagingMap.curPage}">
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

	