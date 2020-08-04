<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삼품 상세보기</title>
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
		padding-bottom: 100px;
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
	}
	#itemNameH1{
   		text-align: center;
   		border-top: 1px solid #FFB6D2;
   		border-bottom: 1px solid #FFB6D2;
   		margin-bottom: 10px;
   		color: #FF4C93;
	}
	#itemNameH1 h1{
		margin: 10px;
	}
	#thumbNailImgDiv{
   		float: left;
   		border: 1px solid #FFB6D2;
   		margin-top: 20px;
		width: 298px; 
		height: 298px;
	}
	#thumbNailImgDiv img{
		width: 298px; 
		height: 298px;
	}
	#itemBoxDiv{
		float: right;
		padding: 20px;
		width: 510px;
		height: 260px;
   		margin-top: 20px;
	}
	.rightSide{
	}
	.leftSide{
		float: right;
		text-align: center;
	}
	#itemPriceDiv, #itemOptionDiv, #itemCountDiv, #itemStockDiv, #itemSelectOptionDiv, #itemTotalPriceDiv{
		margin-top: 5px;
		margin-bottom: 5px;
		height: 30px;
	}
	#itemOptionDiv select{
		width: 305px;
		padding-top: 2px;
		padding-bottom: 2px;
		align: center;
	}
	#itemCountDiv{
		height: 40px;
		border-bottom: 1px solid #FFB6D2;
		margin-bottom: 15px;
	}
	#itemCountDiv input{
		width: 300px;
	}
	#itemStockDiv{
		float: left;
		width: 150px;
	}
	#itemSelectOptionDiv{
		float: right;
		width: 360px;
		text-align: right;
	}
	#itemTotalPriceDiv{
		float: left;
		width: 510px;
	}
	.btn{
		width: 130px;
		height: 40px;
		padding: 5px 5px;
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
	#moveBtnDiv{
		float: right;
		margin-top: 40px;
	}
	#moveBtnDiv input{
		background: linear-gradient(330deg, #4CFFFF 0%, #FF4C93 100%);
		color: white;
		margin-left: 10px;
	}
	#pageMoveBtnDiv input{
		background-color: #FFB6D2;
		color: white;
	}
	#itemImgDiv{
		float: left;
		width: 850px;
		margin-top: 50px;
	}
	.itemImgDivChild{
		text-align: center;
		width: 850px;
	}
	.itemImgDivChild img{
		max-width: 100%;
 		height: auto;
	}
	#itemContentDiv{
		float: left;
		width: 850px;
		margin-bottom: 50px;
	}
   
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function pageMoveFnc(str) {
		if (str == 'itemListAdmin') {
			listFnc(str);
		}else if (str == 'itemListCtm') {
			listFnc(str);
		}else if (str == 'itemUpdate') {
			updateFnc(str);
		}else if (str == 'basketInsert') {
			basketInsertFnc();
		}
	}
	function listFnc(str) {
		location.href= './' + str + '.do?curPage=' + ${searchMap.curPage}
			+ '&keyword=' + document.getElementById('keyword').value;
	}
	function updateFnc(str) {
		location.href= './' + str + '.do?curPage=' + ${searchMap.curPage}
			+ '&keyword=' + document.getElementById('keyword').value
			+ '&itemNo=' + ${itemDto.itemNo};
	}
	
	var itemOptionName = '';
	var itemOptionPrice = 0;
	var itemOptionStock = 0;
	
	function basketInsertFnc() {
		var formObj = document.getElementById('fromObj');
		var itemOptionSelect = document.getElementById('itemOptionSelect').value
		var itemStock = document.getElementById('itemStock').value
		var basketItemVolume = document.getElementById('basketItemVolume').value;
		
		if (itemOptionSelect == '') {
			alert('옵션을 선택해 주세요');
			return;
		}else if (itemStock == 0) {
			alert('해당 상품은 품절입니다');
			return;
		}else if (basketItemVolume == 0){
			alert('수량을 입력해 주세요');
			return;
		}
		
		formObj.action = './basketInsertCtr.do';
		formObj.submit();
	}
	function itemBuyFnc() {
		var itemOptionSelect = document.getElementById('itemOptionSelect').value
		var itemStock = document.getElementById('itemStock').value
		var basketItemVolume = document.getElementById('basketItemVolume').value;
		
		if (itemOptionSelect == '') {
			alert('옵션을 선택해 주세요');
			return;
		}else if (itemStock == 0) {
			alert('해당 상품은 품절입니다');
			return;
		}else if (basketItemVolume == 0){
			alert('수량을 입력해 주세요');
			return;
		}
		
		location.href= './itemDirectBuy.do?itemNo=' + ${itemDto.itemNo}
			+ '&basketItemVolume=' + basketItemVolume + '&itemOptionNo=' + itemOptionSelect;
	}
	
	function changeOptionFnc() {
		var itemOptionSelect = $('#itemOptionSelect option:checked').val()
		
		<c:forEach var="itemOptionDto" items="${itemOptionList}">
			if (itemOptionSelect == ${itemOptionDto.itemOptionNo}) {
				itemOptionName = '${itemOptionDto.itemOptionName}';
				itemOptionPrice = ${itemOptionDto.itemOptionPrice};
				itemOptionStock = ${itemOptionDto.itemOptionStock};
			}
		</c:forEach>
		
		$('#itemSelectOptionSpan').text('옵션 : ' + itemOptionName);
		var itemPrice = document.getElementById('itemPrice').value;
		itemPrice *= 1;
		var itemTotalPriceSapn = document.getElementById('itemTotalPriceSapn');
		
		var price = addComma(itemPrice + itemOptionPrice);
		itemTotalPriceSapn.innerHTML = price + '원';
		
	}
	
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	
	$(document).ready(function() {
		$("#basketItemVolume").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		})
		$('#basketItemVolume').keyup(function() {
			var basketItemVolume = $("#basketItemVolume").val();
			var itemPrice = $("#itemPrice").val();
			itemPrice *= 1;
// 			var itemStock = $("#itemStock").val();
			var itemStock = itemOptionStock;
			var itemTotalPriceSapn = $("#itemTotalPriceSapn");
			var itemSelectCountSpan = $("#itemSelectCountSpan");
			
			if (itemStock - basketItemVolume < 0) {
				alert('구매가능 수량보다 많이 구매할 수 없습니다');
				$("#basketItemVolume").val(itemStock);
				return;
			}
			
			var total = addComma(basketItemVolume * (itemPrice + itemOptionPrice));
			var str = '';

			$("#itemSelectCountSpan").html(', 수량 : ' + basketItemVolume + '개');
			$("#itemTotalPriceSapn").html(total + '원');
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
	
		<div id="secondDiv">
			<form id="fromObj" action="" onsubmit="return false;" method="post">
				<div id="itemNameH1">
					<h1>${itemDto.itemName}</h1>
					<input type="hidden" id="itemNo" name="basketList[0].itemNo" value="${itemDto.itemNo}">
				</div>
				
				<div id="thumbNailImgDiv">
					<c:forEach var="itemImgDto" items="${itemImgList}">
						<c:if test="${itemImgDto.itemImgThumbnail == 'true'}">
							<img alt="image not found" src="<c:url value='/img/${itemImgDto.itemStoredImgName}'/>"/>
						</c:if>
					</c:forEach>
				</div>
				
				<div id="itemBoxDiv">
					<div id="itemPriceDiv">
						<span class="rightSide">가격 :</span>
						<span class="leftSide">
							<fmt:formatNumber value="${itemDto.itemPrice}" currencyCode="KRW"/>원
							<input type="hidden" id="itemPrice" value="${itemDto.itemPrice}">
						</span>
					</div>
					
					<div id="itemOptionDiv">
						<span class="rightSide">옵션 :</span>
						
						<select id="itemOptionSelect" name="basketList[0].itemOptionNo" class="leftSide" onchange="changeOptionFnc();">
							<option value="">상품을 선택해 주세요</option>
							<c:forEach var="itemOptionDto" items="${itemOptionList}">
								<option value="${itemOptionDto.itemOptionNo}">${itemOptionDto.itemOptionName}
									(+<fmt:formatNumber value="${itemOptionDto.itemOptionPrice}" currencyCode="KRW"/>원)
									(재고 : ${itemOptionDto.itemOptionStock})</option>
							</c:forEach>
						</select>
					</div>
					
					<div id="itemCountDiv">
						<span class="rightSide">수량 :</span>
						<input type="text" id="basketItemVolume" class="leftSide" value="1" name="basketList[0].basketItemVolume">
					</div>
					
					<div id="itemStockDiv">
						<span>구매가능 수량 : </span>
						<span>
							<c:choose>
								<c:when test="${itemDto.itemStock == 0}">품절</c:when>
								<c:otherwise>
								<fmt:formatNumber value="${itemDto.itemStock}" currencyCode="KRW"/>개
								</c:otherwise>
							</c:choose>
							<input type="hidden" id="itemStock" value="${itemDto.itemStock}">
						</span>	  
					</div>
					
					<div id="itemSelectOptionDiv">
						<span id="itemSelectOptionSpan">옵션 : 미선택</span>
						<span id="itemSelectCountSpan">, 수량 : 1개</span>
					</div>
					
					<div id="itemTotalPriceDiv">
						<span class="rightSide">총 상품 금액</span>
						<span class="leftSide" id="itemTotalPriceSapn" >
							<fmt:formatNumber value="${itemDto.itemPrice}" currencyCode="KRW"/>원
						</span>
					</div>
					
					<div id="moveBtnDiv">
						<c:choose>
							<c:when test="${customer.customerNo==1}">
								<input type="button" onclick="pageMoveFnc('itemUpdate');" 
									value="수정하기" class="btn">
							</c:when>
							<c:otherwise>
								<input type="button" onclick="pageMoveFnc('basketInsert');" 
									value="장바구니" class="btn">
								<input type="button" onclick="itemBuyFnc();" 
									value="즉시구매" class="btn">
							</c:otherwise>
						</c:choose>
					</div>
				</div>	
				
				<div id="itemImgDiv">
					<c:forEach var="itemImgDto" items="${itemImgList}">
						<c:if test="${itemImgDto.itemImgThumbnail == 'false'}">
							<div class="itemImgDivChild">
								<img alt="image not found" src="<c:url value='/img/${itemImgDto.itemStoredImgName}'/>"/>
							</div>
						</c:if>
					</c:forEach>
				</div>
		
				<div id="itemContentDiv">
					${itemDto.itemContent}
				</div>
				
				<div id="pageMoveBtnDiv">
					<c:choose>
						<c:when test="${customer.customerNo==1}">
							<input type="button" onclick="pageMoveFnc('itemListAdmin');" 
								value="돌아가기" class="btn">
						</c:when>
						<c:otherwise>
							<input type="button" onclick="pageMoveFnc('itemListCtm');" 
								value="돌아가기" class="btn">
						</c:otherwise>
					</c:choose>
					
					<input type="hidden" id="curPage" value="${searchMap.curPage}">
					<input type="hidden" id="keyword" value="${searchMap.keyword}">
				</div>
			</form>
		</div>
		<c:if test="${customer.customerNo==1}">
			<jsp:include page="/WEB-INF/views/common/QuickMenu.jsp"/>
		</c:if>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
</body>
</html>