<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 	노토산스 웹폰트 */
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100&display=swap');
	
	#wholeDiv{
		margin: auto;
		width: 850px;
		height: 1%; 
		overflow: hidden;
		font-family: 'Noto Sans KR', sans-serif;
	}
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	th{
		text-align: center;
	}
	td{
		padding-left: 10px;
		padding-right: 10px;
	}
	#pageTitleDiv, #customerInfoTitleDiv{
		width: 850px;
		text-align: center;
	}
	
	#buyItemListDiv{
		text-align: right;
		border-bottom: 1px solid #ccc;
	}
	#buyItemListDiv{width: 850px;}
	#buyItemListTable{width: 850px;}
	#tableItemListNo{width: 50px;}
	#tableItemListName{	}
	#tableItemListOption{width: 100px;}
	#tableItemListVolume{width: 100px;}
	#tableItemListPrice{width: 150px;}

	.tableItemNo{text-align: center;}
	.tableItemName{text-align: left;}
	.tableItemOptionName{text-align: center;}
	.tableItemVolume{text-align: right;}
	.tableItemPrice{text-align: right;}

	#buyItemListDiv span{
		display: inline-block;
		margin-top: 30px;
		margin-bottom: 50px;
		text-align: right;
		}
	#buyItemTotalPrice{
		font-size: 200%;
		padding: 0px 10px 0px 10px;
		border: none;
		text-align: right;
	}
	#customerInfoDivId{
		width: 850px;
		padding-bottom: 50px;
		border-bottom: 1px solid #ccc;
	}
	.customerInfoDivCl{
		width: 850px;
		height: 40px;
	}
	.customerInfo{
		display: inline-block;
		width: 200px;
		height: 29px;
		float: left;
		margin: 5px 0px 5px 0px;
	}
	.customerInput{
		height: 25px;
		float: right;
		border-radius: 5px;
		border: 1px solid #ccc;
		width: 630px;
		margin: 5px 0px 5px 0px;
		padding-left: 10px;
	}
	.phoneInput{
		height: 25px;
		width: 50px;
		float: left;
		margin: 5px 8px 5px 8px;
		text-align: center;
		border-radius: 5px;
		border: 1px solid #ccc;
	}
	.hyphen{
		display: inline-block;
		float: left;
		margin: 5px 0px 0px 0px;
		font-weight: bold;
	}
	#costomerMoneyDivId{
		width: 810px;
		padding: 30px 20px 30px 20px;
		text-align: center;
		background-color: #ccc;
	}
	.costomerMoneyDivCl{
		height: 35px;
		margin: 5px 10px 50x 10px;
	}
	.costomerMoneyDivCl span{
		display: inline-block;
		width: 150px;
		font-size: 20px;
	}
	.moneyDivline{
		height: 1px;
		margin-top: 11px;
		margin-bottom: 5px;
		border-top: 1px solid black;
	}
	#moneyAddBtnDiv, #buyBtnDiv{
		margin: 10px 0px 10px 10px;
	}
	#moneyAddBtnDiv, #buyBtnDiv{
		float: right;
	}
	#cashAddBtn, #buyBtn, #listBtn, #basketBtn{
		width: 100px;
		height: 30px;
		color: white; 
		border: none; 
		border-radius: 5px; 
		cursor: pointer; 
		font-size: 14px;
		text-decoration: none;
		text-align: center;
	}
	#listBtn, #basketBtn{
		background-color: #FF1555; 
		margin: 10px 10px 10px 0px;
		float: left;
	}
	#cashAddBtn, #buyBtn{
		background-color: #155FFF; 
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	function setItemTableList() {
		itemTableListNoFnc();
		var totalPrice = itemTableListPriceFnc();
		moneyCalculation(totalPrice);
		setName();
		
	}
	
	function setName() {
		var itemNo = document.getElementsByClassName('itemNo');
		var itemName = document.getElementsByClassName('itemName');
		var itemOptionNo = document.getElementsByClassName('itemOptionNo');
		var itemOptionName = document.getElementsByClassName('itemOptionName');
		var saleItemVolume = document.getElementsByClassName('saleItemVolume');
		
		for (var i = 0; i < itemNo.length; i++) {
			itemNo[i].setAttribute('name', 'saleItemList['+ i +'].itemNo');
			itemName[i].setAttribute('name', 'saleItemList['+ i +'].itemName');
			itemOptionNo[i].setAttribute('name', 'saleItemList['+ i +'].itemOptionNo');
			itemOptionName[i].setAttribute('name', 'saleItemList['+ i +'].itemOptionName');
			saleItemVolume[i].setAttribute('name', 'saleItemList['+ i +'].saleItemVolume');
		}
	}

	function itemTableListNoFnc(){
		var tableItemNo = document.getElementsByClassName('tableItemNo');
		
		for (var i = 0; i < tableItemNo.length; i++) {
			tableItemNo[i].innerHTML = i + 1;
		}
	}

	function itemTableListPriceFnc() {
		var tableItemVolume = document.getElementsByClassName('tableItemVolume');
		var itemPrice = document.getElementsByClassName('itemPrice');
		var totalPrice = 0;
		var salePrice = document.getElementById('salePrice');
		var buyItemTotalPrice = document.getElementById('buyItemTotalPrice');
		
		for (var i = 0; i < itemPrice.length; i++) {
			totalPrice += itemPrice[i].value * 1;
			itemPrice[i].innerHTML = itemPrice[i].value + "원";
		}
		$('#buyItemTotalPrice').text(addComma(totalPrice))
		salePrice.value = totalPrice;
		return totalPrice;
	}
	function moneyCalculation(totalPrice) {
		var customerMoney = document.getElementById('customerMoney').value;
		var beforMoney = document.getElementById('beforMoney');
		var afterMoney = document.getElementById('afterMoney');
		var money = 0;
		
		
		beforMoney.innerHTML = addComma(customerMoney) + '원';
		money = customerMoney - totalPrice;
		afterMoney.innerHTML = addComma(money) + '원';
		
	}
	
	function buyBtnFnc() {
		var moveItemBuy = document.getElementById('moveItemBuy');
		var customerInput = document.getElementsByClassName('customerInput');
		
		for (var i = 0; i < customerInput.length; i++) {
			if (customerInput[i].value == "") {
				alert('배송정보를 모두 입력해주십시오');
				return;
			}
		}
		
		var phoneInput = document.getElementsByClassName('phoneInput');
		
		for (var i = 0; i < phoneInput.length; i++) {
			if (phoneInput[i].value == "") {
				alert('배송정보를 모두 입력해주십시오');
				return;
			}
		}
		
		
		
		var salePhone = phoneInput[0].value + "-" + phoneInput[1].value + "-" + phoneInput[2].value;
		document.getElementById('salePhone').value = salePhone;
		
		var salePrice = document.getElementById('salePrice').value;
		var customerMoney = document.getElementById('customerMoney').value;
		var result = customerMoney - salePrice;
		
		if (result < 0) {
			alert('소지금이 부족합니다');
			return;
		}
		
		moveItemBuy.action = './saleCtr.do';
		moveItemBuy.submit();
	}
	
	function listBtnFnc() {
		location.href = './itemListCtm.do';
	}
	
	function basketBtnFnc() {
		location.href = './basketList.do';
	}
	
	function cashAddBtnFnc() {
		var moveItemBuy = document.getElementById('moveItemBuy');
		moveItemBuy.action = './moneyUpdate.do';
		moveItemBuy.submit();
	}
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	$(document).ready(function() {
		$(".phoneInput").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		})
	})
</script>
</head>
<body onload="InitializeQuickMenu();">

	<jsp:include page="/WEB-INF/views/common/CustomerHeader.jsp"/>
	
	<div id="wholeDiv">
	
		<div id="pageTitleDiv">
			<h1>구매/결제</h1>
		</div>
		<form id="moveItemBuy" action="" method="post">

			<div id="buyItemListDiv">
				<table id="buyItemListTable">
					<tr>
						<th id="tableItemListNo">번호</th>
						<th id="tableItemListName">상품명</th>
						<th id="tableItemListVolume">수량</th>
						<th id="tableItemListPrice">가격</th>
					</tr>
					<c:forEach var="saleItemListDto" items="${saleItemList}">
						<tr>
							<td class="tableItemNo">
							</td>
							<td class="tableItemName">
								${saleItemListDto.itemName}(옵션 : ${saleItemListDto.itemOptionName})
								<input type="hidden" class="itemNo" value="${saleItemListDto.itemNo}">
								<input type="hidden" class="itemName" value="${saleItemListDto.itemName}">
								<input type="hidden" class="itemOptionNo" value="${saleItemListDto.itemOptionNo}">
								<input type="hidden" class="itemOptionName" value="${saleItemListDto.itemOptionName}">
							</td>
							<td class="tableItemVolume">
								${saleItemListDto.basketItemVolume}
							<input type="hidden" class="saleItemVolume" value="${saleItemListDto.basketItemVolume}">
							</td>
							<td class="tableItemPrice">
								<fmt:formatNumber value="${saleItemListDto.itemPrice}" currencyCode="KRW"/>원
								<input type="hidden" class="itemPrice" value="${saleItemListDto.itemPrice}">
							</td>
						</tr>
					</c:forEach>
				</table>
				<span>합계 금액 : </span>
				<span id="buyItemTotalPrice"></span>
				<input type="hidden" id="salePrice" name="salePrice" value="">
				<span>원</span>
			</div>	
		
			<div id="customerInfoTitleDiv">
				<h2>배송정보입력</h2>
			</div>
			
			<div id="customerInfoDivId">
			
				<div class="customerInfoDivCl">
					<span class="customerInfo">이름</span>
					<span>
						<input type="text" class="customerInput" name="saleName" value="${saleDto.saleName}" maxlength="10" placeholder="받으시는분 성함을 입력하세요">
					</span>
				</div>
				
				<div class="customerInfoDivCl">
					<span class="customerInfo">주소</span>
					<span>
						<input type="text" class="customerInput" name="saleAddr" value="${saleDto.saleAddr}" maxlength="50" placeholder="받으시는분 주소를 입력하세요">
					</span>
				</div>
				
				<div class="customerInfoDivCl">
					<span class="customerInfo">전화번호</span>
					<span class="customerPhone">
						<input type="text" class="phoneInput" maxlength="3">
					</span>
					<span class="hyphen">―</span>
					<span class="customerPhone">
						<input type="text" class="phoneInput" maxlength="4">
					</span>
					<span class="hyphen">―</span>
					<span class="customerPhone">
						<input type="text" class="phoneInput" maxlength="4">
					</span>
						<input type="hidden" id="salePhone" name="salePhone" value="">
				</div>
				
				<div class="customerInfoDivCl">
					<span class="customerInfo">요청사항</span>
					<span>
						<input type="text" class="customerInput" name="saleComment" value="${saleDto.saleComment}" maxlength="50" placeholder="하고싶으신 말을 입력하세요">
					</span>
				</div>
			
				<input type="hidden" id="customerMoney" value="${customer.customerMoney}">
			</div>
			
			<div id="costomerMoneyTitleDiv">
				<h2>결제</h2>
			</div>
			
			<div id="costomerMoneyDivId">
				<div class="costomerMoneyDivCl">
					<span>현재 캐쉬 잔액</span>
					<span class="moneyDivline"></span>
					<span id="beforMoney"></span>
				</div>
				
				<div class="costomerMoneyDivCl">
					<span>결제 후 캐쉬 잔액</span>
					<span class="moneyDivline"></span>
					<span id="afterMoney"></span>
				</div>
			</div>
		
			<div id="buyBtnDiv">
				<input type="button" id="buyBtn" onclick="buyBtnFnc();" value="결제">
				<input type="hidden" name="saleOption" value="${saleOption}">
			</div>
			
			<div id="moneyAddBtnDiv">
				<input type="button" id="cashAddBtn" onclick="cashAddBtnFnc();" value="캐쉬 충전">
			</div>
			
			<div id="listBtnDiv">
				<input type="button" id="listBtn" onclick="listBtnFnc();" value="상품리스트">
			</div>
			
			<div id="basketBtnDiv">
				<input type="button" id="basketBtn" onclick="basketBtnFnc();" value="장바구니">
			</div>
		</form>
		<c:if test="${customer.customerNo==1}">
			<jsp:include page="/WEB-INF/views/common/QuickMenu.jsp"/>
		</c:if>
	</div>
	
	<script type="text/javascript">setItemTableList();</script>
	
	<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
	
</body>
</html>