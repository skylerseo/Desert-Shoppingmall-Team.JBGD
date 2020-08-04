<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOP</title>

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
		border-radius: 10px; 
		box-sizing: border-box; 
		background-color: #FAFAFA;
		padding: 5px 0px 5px 0px;
				
		-webkit-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-moz-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-ms-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-o-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
	}
	#loginTitleDiv{
		width: 1080px;
		margin: auto;
		text-align: center;
	}
	#loginTitleP{
		font-size: 60px;
/* 		color: white; */
		color: #FF4C93;
		text-align: center;
		margin-top: 10px;
		margin-bottom: 0px;
		display: inline-block;
	}
	#orderByListDiv{
		margin-top: 10px;
		margin-left: 40px;
	}
	
	#itemListDIv{
		width: 1000px;
		height: 510px;
		margin: auto;
	}
	.itemDiv{
		margin: 5px;
		width: 240px;
		height: 240px;
		float: left;
		border-radius: 10px; 
		box-sizing: border-box; 
		
		-webkit-box-shadow: 0 3px 5px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-moz-box-shadow: 0 3px 5px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-ms-box-shadow: 0 3px 5px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-o-box-shadow: 0 3px 5px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		box-shadow: 0 3px 5px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
	}
	.itemDiv:hover{
		cursor: pointer;
	}
	.itemImg, .itemImgDiv{
		width: 240px;
		height: 180px;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		box-sizing: border-box; 
	}
	.itemName{
		display: inline-block;
		width: 230px;
		text-align: left;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
		padding-left: 10px;
		margin-top: 5px;
	}
	.itemState{
		display: inline-block;
		width: 70px;
		height: 24px;
		text-align: left;
		float: left;
	}
	.itemPrice{
		display: inline-block;
		width: 150px;
		text-align: right;
		padding-right: 20px;
	}
	#footerDiv{
 		position: fixed;
    	bottom: 0px;
    	width: 100%;
    	margin: auto;
 	}
</style>
<script type="text/javascript">
	function itemListOrderByFnc() {
		var itemOrderSelect = document.getElementById('itemOrderSelect').value;
		var orderBy = '';
		var orderOption = '';
		
		if (itemOrderSelect == 'dateAsc') {
			orderBy = 'ITEM_CRE_DATE';
			orderOption = 'ASC';
		}else if (itemOrderSelect == 'dateDesc') {
			orderBy = 'ITEM_CRE_DATE';
			orderOption = 'DESC';
		}else if (itemOrderSelect == 'nameAsc') {
			orderBy = 'ITEM_NAME';
			orderOption = 'ASC';
		}else if (itemOrderSelect == 'nameDesc') {
			orderBy = 'ITEM_NAME';
			orderOption = 'DESC';
		}else if (itemOrderSelect == 'priceAsc') {
			orderBy = 'ITEM_PRICE';
			orderOption = 'ASC';
		}else if (itemOrderSelect == 'priceDesc') {
			orderBy = 'ITEM_PRICE';
			orderOption = 'DESC';
		}else if (itemOrderSelect == 'saleAsc') {
			orderBy = 'ITEM_SOLD_COUNT';
			orderOption = 'ASC';
		}else if (itemOrderSelect == 'saleDesc') {
			orderBy = 'ITEM_SOLD_COUNT';
			orderOption = 'DESC';
		}else if (itemOrderSelect == 'viewAsc') {
			orderBy = 'ITEM_VIEW_COUNT';
			orderOption = 'ASC';
		}else if (itemOrderSelect == 'viewDesc') {
			orderBy = 'ITEM_VIEW_COUNT';
			orderOption = 'DESC';
		}
		
		var formObj = document.getElementById('pagingForm');
		
		var htmlStr = '';
		htmlStr += '<input type="hidden" name="orderBy" value="'+ orderBy +'">';
		htmlStr += '<input type="hidden" name="orderOption" value="'+ orderOption +'">';

		formObj.innerHTML = formObj.innerHTML + htmlStr;
		formObj.action = './itemListCtm.do';
		formObj.submit();
		
	}
	function optionSeletedFnc() {
		
		var orderBy = document.getElementById('orderBy').value;
		var orderOption = document.getElementById('orderOption').value;
		var str = '';
		
		if (orderBy == 'ITEM_CRE_DATE') {
			if (orderOption == 'ASC') {
				str = 'dateAsc';
			}else{
				str = 'dateDesc';
			}
		}else if (orderBy == 'ITEM_NAME') {
			if (orderOption == 'ASC') {
				str = 'nameAsc';
			}else{
				str = 'nameDesc';
			}
		}else if (orderBy == 'ITEM_PRICE') {
			if (orderOption == 'ASC') {
				str = 'priceAsc';
			}else{
				str = 'priceDesc';
			}
		}else if (orderBy == 'ITEM_SOLD_COUNT') {
			if (orderOption == 'ASC') {
				str = 'saleAsc';
			}else{
				str = 'saleDesc';
			}
		}else if (orderBy == 'ITEM_VIEW_COUNT') {
			if (orderOption == 'ASC') {
				str = 'viewAsc';
			}else{
				str = 'viewDesc';
			}
		}
		
		optionObj = document.getElementById(str);
		optionObj.setAttribute('selected', 'selected');
	}
	
	function itemViewFnc(itemNo) {
		var orderBy = document.getElementById('orderBy').value;
		var orderOption = document.getElementById('orderOption').value;
		
		var formObj = document.getElementById('pagingForm');
		
		var htmlStr = '';
		htmlStr += '<input type="hidden" name="itemNo" value="'+ itemNo +'">';
		htmlStr += '<input type="hidden" name="orderBy" value="'+ orderBy +'">';
		htmlStr += '<input type="hidden" name="orderOption" value="'+ orderOption +'">';

		formObj.innerHTML = formObj.innerHTML + htmlStr;
		formObj.action = './itemViewCtr.do';
		formObj.submit();

	}
	
	function setItemStateFnc() {
		var itemState = document.getElementsByClassName('itemState');
		var itemStock = document.getElementsByClassName('itemStock');
		
		for (var i = 0; i < itemState.length; i++) {
			if (itemStock[i].value == 0) {
				itemState[i].innerHTML = '♥품절♥';
			}else {
				itemState[i].innerHTML = ' ';
			}
		}
	}
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/CustomerHeader.jsp"/>
	<div id="wholeDiv">
		<div id="loginTitleDiv">
			<p id="loginTitleP">SHOP</p>
		</div>
		<div id="orderByListDiv">
			정렬 : 
			<select id="itemOrderSelect" onchange="itemListOrderByFnc();">
				<option id="dateDesc" value="dateDesc">최근 등록순</option>
				<option id="dateAsc" value="dateAsc">최초 등록순</option>
				<option id="nameAsc" value="nameAsc">빠른 이름순</option>
				<option id="nameDesc" value="nameDesc">느린 이름순</option>
				<option id="priceAsc" value="priceAsc">낮은 가격순</option>
				<option id="priceDesc" value="priceDesc">높은 가격순</option>
				<option id="saleDesc" value="saleDesc">많은 판매순</option>
				<option id="saleAsc" value="saleAsc">적은 판매순</option>
				<option id="viewDesc" value="viewDesc">많은 조회순</option>
				<option id="viewAsc" value="viewAsc">적은 조회순</option>
			</select>
			<input type="hidden" id="orderBy" value="${orderBy}">
			<input type="hidden" id="orderOption" value="${orderOption}">
			<script type="text/javascript">optionSeletedFnc();</script>
		</div>
		
		<div id="itemListDIv">
			<c:forEach var="itemListDto" items="${itemList}">
				<div class="itemDiv" onclick="itemViewFnc(${itemListDto.itemNo});">
					<div class="itemImgDiv">
							<c:choose>
								<c:when test="${itemListDto.itemStoredImgName != ''}">
									<img alt="image not found" class="itemImg" src="<c:url value='/img/${itemListDto.itemStoredImgName}'/>"/>
								</c:when>
								<c:otherwise>
									<img alt="image not found" class="itemImg" src="/jbgd/resources/img/noImage.jpg"/>
								</c:otherwise>
							</c:choose>
					</div>
					<span class="itemName">${itemListDto.itemName}</span>
					<span class="itemState">
					</span>
					<span class="itemPrice">
						<fmt:formatNumber value="${itemListDto.itemPrice}" currencyCode="KRW"/>원
					</span>
					<input type="hidden" class="itemStock" value="${itemListDto.itemStock}">
				</div>
			</c:forEach>
			<script type="text/javascript">setItemStateFnc()</script>
		</div>
				
		<div id="pageSearchDiv">
			<form id="pagingForm" action="./itemListCtm.do" method="post">
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
	</div>
	
	<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>

</body>
</html>