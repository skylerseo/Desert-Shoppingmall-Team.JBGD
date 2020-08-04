<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>

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
		overflow: hidden;
		font-family: 'Noto Sans KR', sans-serif;
		color: #525252;
		
		border-radius: 10px; 
		box-sizing: border-box; 
		background-color: #FAFAFA;
		padding-bottom: 20px;
		padding-top: 5px;
		
		-webkit-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-moz-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-ms-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-o-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
	}
	#secondDiv{
		width: 850px;
		margin: auto;
		margin-bottom: 20px;
	}
	table{
		border-bottom: 1px solid #FFB6D2;
		border-collapse: collapse;
	}   
	table, td{
		border-top: 1px solid #bfbfbf;
        font-family: 'Noto Sans KR', sans-serif;
	}
	th, td{
		text-align: center;
	}
	th{
		cursor: pointer; 
	}
	th:hover{
		text-decoration: underline;
	}
	th:focus{
		outline: none;
	}
	.tableLine td, #tableHeadLine{
		border-top: 1px solid #FFB6D2;
		cursor: pointer;
		height: 40px;
	}
	.detail{
        background-color: #e6e6e6;
	}
	.tableLine td{
	}
	.tableLine:hover{
	}
/* 	.addBtnDiv{ */
/* 		text-align: right; */
/* 		margin-top: 10px; */
/* 		margin-bottom: 10px; */
/* 	} */
	#listDiv{
		width: 850px;
       	height: 1%; 
		overflow: hidden;
	}
	#listTable{width: 850px}
	#tableNo{width: 74px;}
	#tableName{}
	#tablePrice{width: 150px;}
	#tableStock{width: 90px;}
	#tableDate{width: 100px;}
	#tableState{width: 74px;}
	.itemStock{
		width: 60px;
		text-align: right;
	}
	.price{
		text-align: right;
	}
	.thumbNail{
		width: 380px;
		border: 1px 1px 0px 1px solid #FFB6D2;
	}
	.thumbNail img{
		width: 100px;
		height: 100px;
	}
	.itemOptionName{
		text-align: left;
		padding-left: 10px;
	}
	#pageSearchDiv{
		text-align: center;
		margin-bottom: 20px;
		width: 850px;
		margin: auto;
	}
	.itemNameTd {
		text-align: left;
	}
	
	.addBtnDiv{
 		width: 850px;
		height: 40px;
		margin: 0px;
	}
 	.addBtnDiv a{ 
 		display: inline-block;
 		padding: 5px 5px;
 		float: right;
 		margin-top: 10px;
 		margin-bottom: 10px;
 	}
 	.btn{
		width: 130px;
		border: none; 
		border-radius: 50px; 
		cursor: pointer; 
		font-size: 16px;
		font-weight: bold;
		
		text-decoration: none;
		text-align: center;
		
		background: linear-gradient(330deg, #4CFFFF 0%, #FF4C93 100%);
		color: white; 
		
		-webkit-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		-moz-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		-ms-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		-o-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
	}
	a {cursor: pointer;}
	td a:hover{text-decoration: underline;}
	.moveDetailBtn, .moveUpdateBtn{
		color: #155FFF; 
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	function itemEzUpdateFnc(itemOptionNo, itemNo) {
		var formObj = document.getElementById('pagingForm');
		var itemStock = document.getElementById('itemOptionStock_' + itemOptionNo);
		var oldItemStock = document.getElementById('oldItemOptionStock_' + itemOptionNo);

		if (itemStock.value == '') {
			alert('수량을 입력해 주세요');
			itemStock.value = oldItemStock.value;
			return;
		}else if (confirm("수량을 수정하시겠습니까?") == false) {
			itemStock.value = oldItemStock.value;
			return;
		}
		
		var htmlStr = '';
		htmlStr += '<input type="hidden" name="itemNo" value="'+ itemNo +'">';
		htmlStr += '<input type="hidden" name="itemOptionNo" value="'+ itemOptionNo +'">';
		htmlStr += '<input type="hidden" name="itemOptionStock" value="'+ itemStock.value +'">';

		formObj.innerHTML = formObj.innerHTML + htmlStr;
		formObj.action = './itemEzUpdateCtr.do';
		formObj.submit();
	}
	
	function itemAddFnc() {
		location.href= './itemAdd.do?curPage=' + $('#tempCurPage').val() + '&keyword=' + $('#keyword').val();
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
		
		var itemOptionDetail = document.getElementsByClassName('itemOptionDetail');
		if (itemOptionDetail.length > 3) {
			for (var i = 3; i < itemOptionDetail.length; i++) {
				itemOptionDetail.childNodes[0].setAttribute('colspan', '5');
			}
		}
	}
	
	function deleteOptionFnc(itemOptionNo, itemNo) {
		var formObj = document.getElementById('pagingForm');
		
		var oldItemStock = document.getElementById('oldItemOptionStock_' + itemOptionNo).value;
		var htmlStr = '';
		htmlStr += '<input type="hidden" name="itemOptionNo" value="'+ itemOptionNo +'">';
		htmlStr += '<input type="hidden" name="itemOptionStock" value="'+ oldItemStock +'">';
		htmlStr += '<input type="hidden" name="itemNo" value="'+ itemNo +'">';

		formObj.innerHTML = formObj.innerHTML + htmlStr;
		formObj.action = './itemEzDeleteCtr.do';
		formObj.submit();
	}
	function moveItemViewFnc(itemNo) {
		location.href = './itemView.do?itemNo=' + itemNo;
	}
	function moveItemUpdateFnc(itemNo) {
		location.href = './itemUpdate.do?itemNo=' + itemNo;
	}
	
	function itemListOrderByFnc(str) {
		if (str == 1) {	str = 'ITEM_NO'; }
		else if (str == 2) { str = 'ITEM_NAME'; }
		else if (str == 3) { str = 'ITEM_PRICE'; }
		else if (str == 4) { str = 'ITEM_STOCK'; }
		else if (str == 5) { str = 'ITEM_CRE_DATE'; }
		
		var orderBy = document.getElementById('orderBy').value;
		var orderOption = document.getElementById('orderOption').value;
		
		if (orderBy == str && orderOption == 'ASC') {
			location.href= './itemListAdmin.do?orderBy=' + str + '&orderOption=' + orderOption;
		}else{
			location.href= './itemListAdmin.do?orderBy=' + str;
		}
	}
	
	$(document).ready(function() {
		$(".itemStock").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		})
		
		var itemOptionDetail;
		var thumbNail;
		<c:forEach var="itemDto" items="${itemList}">
			itemOptionDetail = document.getElementsByClassName('itemOptionDetail_'+${itemDto.itemNo});
			thumbNail = document.getElementById('thumbNail_'+${itemDto.itemNo});
			thumbNail.setAttribute('rowspan', itemOptionDetail.length);
		</c:forEach>
	})
</script>
</head>
<body onload="InitializeQuickMenu();">

	<jsp:include page="/WEB-INF/views/common/AdminHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/common/AdminHeaderMenu.jsp"/>
	<div id="wholeDiv">
	
		<div id="secondDiv">
				<div class="addBtnDiv">
					<a onclick="itemAddFnc();" class="btn">등록</a>
				</div>
				<input type="hidden" id="orderOption" value="${orderOption}">
				<input type="hidden" id="orderBy" value="${orderBy}">
				<div id="listDiv">
					<table id="listTable">
						<tr id="tableHeadLine">
							<th id="tableNo" onclick="itemListOrderByFnc(1);">
								<c:if test="${orderBy == 'ITEM_NO' && orderOption == 'DESC'}">번호▼</c:if>
								<c:if test="${orderBy == 'ITEM_NO' && orderOption == 'ASC'}">번호▲</c:if>
								<c:if test="${orderBy != 'ITEM_NO'}">번호</c:if>
							</th>
							<th colspan="2" id="tableName" onclick="itemListOrderByFnc(2);">
								<c:if test="${orderBy == 'ITEM_NAME' && orderOption == 'DESC'}">상품명▼</c:if>
								<c:if test="${orderBy == 'ITEM_NAME' && orderOption == 'ASC'}">상품명▲</c:if>
								<c:if test="${orderBy != 'ITEM_NAME'}">상품명</c:if>
							</th>
							<th id="tablePrice" onclick="itemListOrderByFnc(3);">
								<c:if test="${orderBy == 'ITEM_PRICE' && orderOption == 'DESC'}">가격▼</c:if>
								<c:if test="${orderBy == 'ITEM_PRICE' && orderOption == 'ASC'}">가격▲</c:if>
								<c:if test="${orderBy != 'ITEM_PRICE'}">가격</c:if>
							</th>
							<th id="tableStock" onclick="itemListOrderByFnc(4);">
								<c:if test="${orderBy == 'ITEM_STOCK' && orderOption == 'DESC'}">재고▼</c:if>
								<c:if test="${orderBy == 'ITEM_STOCK' && orderOption == 'ASC'}">재고▲</c:if>
								<c:if test="${orderBy != 'ITEM_STOCK'}">재고</c:if>
							</th>
							<th id="tableDate" onclick="itemListOrderByFnc(5);">
								<c:if test="${orderBy == 'ITEM_CRE_DATE' && orderOption == 'DESC'}">등록날짜▼</c:if>
								<c:if test="${orderBy == 'ITEM_CRE_DATE' && orderOption == 'ASC'}">등록날짜▲</c:if>
								<c:if test="${orderBy != 'ITEM_CRE_DATE'}">등록날짜</c:if>
							</th>
							<th id="tableState">판매상태</th>
						</tr>
						<c:forEach var="itemDto" items="${itemList}">
							<tr class="tableLine" id="itemName_${itemDto.itemNo}" onclick="itemViewFnc(${itemDto.itemNo});"
								onmouseover="this.style.background='#ffe6eb';" onmouseout="this.style.background='#FAFAFA';">
								<td>${itemDto.itemNo}</td>
								<td colspan="2" class="itemNameTd">${itemDto.itemName}</td>
								<td class="price">
									<fmt:formatNumber value="${itemDto.itemPrice}" currencyCode="KRW"/>원
								</td>
								<td class="price">
									${itemDto.itemStock}
								</td>
								<td>
									<fmt:formatDate value="${itemDto.itemCreDate}"	pattern="yyyy-MM-dd"/>
								</td>
								<td>${itemDto.itemState}</td>
							</tr>
							<tr class="itemOptionDetail_${itemDto.itemNo} detail" style="display: none;">
								<td colspan="2" id="thumbNail_${itemDto.itemNo}" class="thumbNail">
									<img alt="image not found" src="<c:url value='/img/${itemDto.itemStoredImgName}'/>"/>
								</td>
								<td>옵션명</td>
								<td class="price">추가 가격</td>
								<td colspan="2">재고 수정</td>
								<td>옵션 삭제</td>
							</tr>
							<c:forEach var="itemOptionList" items="${itemOptionTotalList}">
								<c:forEach var="itemOptionDto" items="${itemOptionList}">
									<c:if test="${itemOptionDto.itemNo == itemDto.itemNo}">
										<tr class="itemOptionDetail_${itemDto.itemNo} detail" style="display: none;">
											<td class="itemOptionName">${itemOptionDto.itemOptionName}</td>
											<td class="price">
												<fmt:formatNumber value="${itemOptionDto.itemOptionPrice}" currencyCode="KRW"/>원
											</td>
											<td colspan="2">
												<input type="text" class="itemStock" id="itemOptionStock_${itemOptionDto.itemOptionNo}" 
													value="${itemOptionDto.itemOptionStock}" 
													onchange="itemEzUpdateFnc(${itemOptionDto.itemOptionNo}, ${itemDto.itemNo});">
												<input type="hidden" id="oldItemOptionStock_${itemOptionDto.itemOptionNo}" value="${itemOptionDto.itemOptionStock}">
											</td>
											<td>
												<a onclick="deleteOptionFnc(${itemOptionDto.itemOptionNo}, ${itemDto.itemNo})">삭제</a>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:forEach>
							<tr class="itemOptionDetail_${itemDto.itemNo} detail" style="display: none;">
								<td colspan="2"></td>
								<td colspan="2">
									<a class="moveDetailBtn" onclick="moveItemViewFnc(${itemDto.itemNo});">판매 페이지</a>
								</td>
								<td>
									<a class="moveUpdateBtn" onclick="moveItemUpdateFnc(${itemDto.itemNo});">상세 수정</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="addBtnDiv">
					<a onclick="itemAddFnc();" class="btn">등록</a>
				</div>
				
			</div>
			
			
			<div id="pageSearchDiv">
				<form id="pagingForm" action="./itemListAdmin.do" method="post">
					<div id="pageDiv">
						<jsp:include page="/WEB-INF/views/common/Paging.jsp">
							<jsp:param value="${pagingMap}" name="pagingMap"/>
						</jsp:include>
						<input type="hidden" id='tempCurPage' name='tempCurPage' 
							value="${pagingMap.customerPaging.curPage}">
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