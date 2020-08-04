<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
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
	#basketListTitleDiv{
		width: 850px;
		margin: auto;
		text-align: center;
		margin-bottom: 20px;
	}
	#ldquoLeft{
		color: #FFF681;
		font-size: 60px;
		margin-top: 10px;
		margin-bottom: 0px;
		display: inline-block;
		font-family: 'Black Han Sans', sans-serif;
/* 		text-shadow: 0px 0px 1px #FF0074; */
		text-shadow: 1px 1px 1px #FB84D7;
	}
	#basketListTitleP{
		font-size: 60px;
/* 		font-family: 'Do Hyeon', sans-serif; */
		font-family: 'Black Han Sans', sans-serif;
/* 		color: white; */
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
/* 		text-shadow: 0px 0px 1px #FF0074; */
		text-shadow: 1px 1px 1px #FB84D7;
	}
	#pageTitleDiv{
		width: 850px;
		text-align: center;
	}
	table, th, td{
		border-bottom : 1px solid #FFB6D2;
		border-collapse: collapse;
	}
	th{
		text-align: center;
	}
	td{
		padding-left: 10px;
		padding-right: 10px;
	}
	#buyItemListDiv{
		text-align: right;
		min-height: 450px;
		height: 1%; 
 		overflow: hidden;
		border-bottom: 1px solid #ccc;
		margin-bottom: 30px;
		margin: auto;
	}
	#buyItemListDiv{width: 850px;}
	#buyItemListTable{width: 850px;}
	#tableItemListNo{width: 50px;}
	#tableItemListName{}
	#tableItemListVolume{width: 50px;}
	#tableItemListPrice{width: 120px;}
	#tableItemListDelete{width: 70px;}

	.tableItemNo{text-align: center;}
	.tableItemName{
		text-align: left;
		cursor: pointer;
		}
	.tableItemVolume{text-align: center;}
	.tableItemPrice{text-align: right;}

	.tableItemName:hover{	
		text-decoration: underline;
	}
	
	.tableItemVolume input{
		width: 50px;
		text-align: right;
	}
	#buyItemListDiv span{
		display: inline-block;
		margin-top: 30px;
		margin-bottom: 50px;
		text-align: right;
		}
	#buyItemTotalPrice{
		font-size: 200%;
		padding: 0px 10px 0px 10px;
	}
	#wholeBtnDiv{
		width: 850px;
		margin: auto;
	}
	.btn{
		width: 130px;
		height: 40px;
		padding: 5px 5px;
		margin-top: 20px;
		border: none; 
		border-radius: 50px; 
		cursor: pointer; 
		font-size: 16px;
		font-weight: bold;
		
		text-decoration: none;
		text-align: center;
		
		-webkit-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		-moz-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		-ms-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		-o-box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
		box-shadow: 0 5px 10px rgba(103, 62, 122, 0.1), 0 3px 3px rgba(103, 62, 122, 0.1);
	}
	#backBtnDiv{
		float: left;
	}
	#buyBtnDiv{
		float: right;
	}
	.EzUpdateBtn:focus, .deleteBtn:focus{
		outline: none;
	}
	.EzUpdateBtn:hover, .deleteBtn:hover{
		text-decoration: underline;
	}
	.deleteBtn{
		width: 80px;
		height: 24px;
		border: none; 
		border-radius: 50px; 
		cursor: pointer; 
		font-size: 12px;
		font-weight: bold;
		
		text-decoration: none;
		text-align: center;
		background-color: #FFB6D2;
		color: white;
	}
	#backBtn{
		background-color: #FFB6D2;
		color: white;
	}
	#cashAddBtn, #buyBtn{
		background: linear-gradient(330deg, #4CFFFF 0%, #FF4C93 100%);
		color: white; 
	}
	#footerDiv{
 		position: fixed;
    	bottom: 0px;
    	width: 100%;
    	margin: auto;
 	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function updateBtnFnc(basketNo) {
		var formObj = document.getElementById('itemListForm');
		var itemVolume = document.getElementById('itemVolume_' + basketNo);
		var basketItemVolume = document.getElementById('basketItemVolume_' + basketNo);
		var itemStock = document.getElementById('itemStock_' + basketNo).value;
		
		if (itemVolume.value == "") {
			alert('수량을 입력해 주세요');
			itemVolume.value = basketItemVolume.value;
			return;
		}else if (itemStock - itemVolume.value < 0) {
			alert('구매 가능 수량보다 많이 구매할 수 없습니다\n구매 가능 수량: ' + itemStock);
			itemVolume.value = basketItemVolume.value;
			return;
		}else if (confirm("수량을 수정하시겠습니까?") == false) {
			itemVolume.value = basketItemVolume.value;
			return;
		}
		
		var htmlStr = '';
		htmlStr += '<input type="hidden" name="basketNo" value="'+ basketNo +'">';
		htmlStr += '<input type="hidden" name="basketItemVolume" value="'+ itemVolume.value +'">';

		formObj.innerHTML = formObj.innerHTML + htmlStr;
		formObj.action = './basketEzUpdateCtr.do';
		formObj.submit();
	}
	function deleteBtnFnc(basketNo) {
		var formObj = document.getElementById('itemListForm');
		
		var htmlStr = '<input type="hidden" name="basketNo" value="'+ basketNo +'">';

		formObj.innerHTML = formObj.innerHTML + htmlStr;
		formObj.action = './basketEzDeleteCtr.do';
		formObj.submit();
	}
	
	function itemBuyFnc() {
		
		var itemState = document.getElementsByClassName('itemState');
		var itemOptionState = document.getElementsByClassName('itemOptionState');

		if (itemState.length == 0) {
			alert('장바구니가 비어있습니다');
			return;
		}
		
		for (var i = 0; i < itemState.length; i++) {
			if (itemState[i].value == '비활성화' || itemOptionState[i].value == '비활성화') {
				alert('구매 할 수 없는 상품이 포함되어 있습니다');
				return;
			}
		}
		
		
		
		location.href= './basketBuy.do';
	}
	function moveViewFnc(itemNo) {
		location.href= './itemView.do?itemNo=' + itemNo;
	}
	function backFnc() {
		location.href= './itemListCtm.do';
	}
	
	function setItemTableList() {
		itemTableListNoFnc();
		itemTableListPriceFnc();
	}
	
	function itemTableListNoFnc(){
		var tableItemNo = document.getElementsByClassName('tableItemNo');
		
		for (var i = 0; i < tableItemNo.length; i++) {
			tableItemNo[i].innerHTML = i + 1;
		}
	}
	function itemTableListPriceFnc() {
		var itemVolume = document.getElementsByClassName('itemVolume');
		var tableItemPrice = document.getElementsByClassName('tableItemPrice');
		var totalPrice = 0;
		var buyItemTotalPrice = document.getElementById('buyItemTotalPrice');
		
		for (var i = 0; i < tableItemPrice.length; i++) {
			totalPrice += tableItemPrice[i].childNodes[0].nodeValue * 1;
			tableItemPrice[i].innerHTML = addComma(tableItemPrice[i].childNodes[0].nodeValue) + "원";
		}
		
		buyItemTotalPrice.innerHTML = addComma(totalPrice);
	}
	
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	
	$(document).ready(function() {
		$(".itemVolume").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		})
	})
	
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
		<div id="basketListTitleDiv">
			<p id="ldquoLeft">&ldquo;</p>
			<p id="basketListTitleP">장바구니</p>
			<p id="rdquoRight">&rdquo;</p>
		</div>
		<div id="buyItemListDiv">
			<form id="itemListForm" action="">
				<table id="buyItemListTable">
					<tr>
						<th id="tableItemListNo">번호</th>
						<th id="tableItemListName">상품명</th>
						<th id="tableItemListVolume">수량</th>
						<th id="tableItemListPrice">가격</th>
						<th id="tableItemListDelete">상품 제거</th>
					</tr>
					<c:forEach var="basketListDto" items="${basketList}">
						<tr>
							<td class="tableItemNo"></td>
							<td class="tableItemName" onclick="moveViewFnc(${basketListDto.itemNo});">
								${basketListDto.itemName}
								<c:choose>
									<c:when test="${basketListDto.itemState == '비활성화' || basketListDto.itemOptionState == '비활성화'}">
										(구매 불가)
									</c:when>
									<c:otherwise>
										(옵션 : ${basketListDto.itemOptionName})
									</c:otherwise>
								</c:choose>
								<input type="hidden" class="itemState" value="${basketListDto.itemState}">
								<input type="hidden" class="itemOptionState" value="${basketListDto.itemOptionState}">
							</td>
							<td class="tableItemVolume">
								<input type="text" class="itemVolume" id="itemVolume_${basketListDto.basketNo}" 
									value="${basketListDto.basketItemVolume}" onchange="updateBtnFnc(${basketListDto.basketNo});">
								<input type="hidden" id="itemStock_${basketListDto.basketNo}" value="${basketListDto.itemOptionStock}">
							</td>
							<td class="tableItemPrice">${basketListDto.itemPrice}</td>
							<td class="tableItemDelete">
								<input type="hidden" id="basketItemVolume_${basketListDto.basketNo}" value="${basketListDto.basketItemVolume}">
								<input type="button" class="deleteBtn" onclick="deleteBtnFnc(${basketListDto.basketNo});" value="제거하기">
							</td>
						</tr>
					</c:forEach>
				</table>
			</form>
			<span>합계 금액 : </span><span id="buyItemTotalPrice"></span><span>원</span>
		</div>	
		<script type="text/javascript">setItemTableList();</script>
		<div id="wholeBtnDiv">
			<div id="buyBtnDiv">
				<span>
					<input type="button" id="buyBtn" onclick="itemBuyFnc();" value="구매" class="btn">
				</span>
			</div>
			
			<div id="backBtnDiv">
				<span>
					<input type="button" id="backBtn" onclick="backFnc();" value="상품으로" class="btn">
				</span>
			</div>
		</div>
		<c:if test="${customer.customerNo==1}">
			<jsp:include page="/WEB-INF/views/common/QuickMenu.jsp"/>
		</c:if>
	</div>

	<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
	
</body>
</html>


