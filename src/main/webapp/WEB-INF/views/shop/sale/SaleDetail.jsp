<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 상세정보</title>

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
	#saleDetailTitleDiv{
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
/* 		text-shadow: 0px 0px 1px #FF0074; */
		text-shadow: 1px 1px 1px #FB84D7;
	}
	#saleDetailTitleP{
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
	#moveRebuyDiv{
		margin: auto;
		width: 850px;
	}
	table, th, td{
		border-bottom: 1px solid #FFB6D2;
		border-collapse: collapse;
	}
	th{
		text-align: center;
		height: 40px;
		color: #FF4C93;
	}
	td{
		padding-left: 10px;
		padding-right: 10px;
		height: 30px;
	}
	
	#saleItemListDiv{
		width: 850px;
		height: 1%; 
		overflow: hidden;
	}
	#saleItemListTable{width: 850px;}
	#saleItemListTable{width: 850px;}
	#tableSaleListNo{width: 80px;}
	#tableSaleListName{	}
	#tableSaleListOption{width: 100px;}
	#tableSaleListVolume{width: 80px;}
	#tableSaleListPrice{width: 100px;}

	.tableSaleNo{text-align: center; color: #FF4C93;}
	.tableSaleName{text-align: left;}
	.tableSaleOption{text-align: center;}
	.tableSaleVolume{text-align: center;}
	.tableSalePrice{text-align: right;}
	.tableSaleName a{
		text-decoration: none;
		color: #525252;
	}
	.tableSaleName a:hover{
		text-decoration: underline;
	}
	#totalPriceDiv{
		width: 850px;
		text-align: right;
		margin-bottom: 30px;
	}
	#totalPriceDiv span{
		display: inline-block;
		text-align: right;
	}
	#totalPriceSpan{
		font-size: 30px;
		color: #FF4C93;
	}
	#saleInfoDiv{
		width: 850px;
	}
	#saleInfoTable{
		width: 850px;
	}
	#saleInfoColumn {width: 130px;}
	#saleInfocontent {}
	.saleInfo {text-align: center; color: #FF4C93;}

	.btn{
		width: 130px;
		height: 40px;
		padding: 5px 5px; 
/* 		margin: 10px 10px; */
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
	#refundBtnDiv, #refundBtnAdminDiv, #rebuyBtnDiv{
		float: right;
		margin-left: 10px;
	}
	#backBtn{
		background-color: #FFB6D2;
		color: white;
	}
	#refundBtn, #rebuyBtn, .refundBtnAdmin{
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
	function setItemTableList() {
		itemTableListNoFnc();
		itemTableListPriceFnc();
		setNameFnc();
	}
	function itemTableListNoFnc(){
		var tableItemNo = document.getElementsByClassName('tableSaleNo');
		
		for (var i = 0; i < tableItemNo.length; i++) {
			tableItemNo[i].innerHTML = i + 1;
		}
	}
	
	function itemTableListPriceFnc() {
		var tableSaleVolume = document.getElementsByClassName('tableSaleVolume');
		var tableSalePrice = document.getElementsByClassName('tableSalePrice');
		
		for (var i = 0; i < tableSalePrice.length; i++) {
			tableSalePrice[i].innerHTML = tableSaleVolume[i].childNodes[0].nodeValue * tableSalePrice[i].childNodes[0].nodeValue + "원";
		}
	}
	function setNameFnc() {
		var itemNo = document.getElementsByClassName('itemNo');
		var itemOptionNo = document.getElementsByClassName('itemOptionNo');
		var saleItemVolume = document.getElementsByClassName('saleItemVolume');
		
		for (var i = 0; i < itemNo.length; i++) {
			itemNo[i].setAttribute('name', 'basketList['+ i +'].itemNo');
			itemOptionNo[i].setAttribute('name', 'basketList['+ i +'].itemOptionNo');
			saleItemVolume[i].setAttribute('name', 'basketList['+ i +'].basketItemVolume');
		}
	}
	function rebuyBtnFnc() {
		var moveRebuy = document.getElementById('moveRebuy');
		moveRebuy.action = './basketInsertCtr.do';
		moveRebuy.submit();
	}
	function refundFnc() {
		
		var refundBtnDiv = document.getElementById('refundBtnDiv');
		var saleState = document.getElementById('saleState');
		var refundBtn = document.getElementById('refundBtn');
		
		if (saleState.value == '결제완료') {
			saleState.value = 'application';
			refundBtn.setAttribute('value', '환불 신청');
		}else if (saleState.value == '환불대기') {
			refundBtn.setAttribute('value', '환불 취소');
			saleState.value = 'cancle';
		}
	}
	function refundBtnFnc() {
		var moveRebuy = document.getElementById('moveRebuy');
		
		moveRebuy.action = './refundCtr.do';
		moveRebuy.submit();
	}
	function refundAdminBtnFnc(str) {
		var moveRebuy = document.getElementById('moveRebuy');
		
		var saleState = document.getElementById('saleState');
		saleState.value = str;
		
		moveRebuy.action = './refundCtr.do';
		moveRebuy.submit();
	}
	function backBtnFnc() {
		var moveRebuy = document.getElementById('moveRebuy');
		moveRebuy.action = './refundCtr.do';
		moveRebuy.submit();
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

		<div id="saleDetailTitleDiv">
			<p id="ldquoLeft">&ldquo;</p>
			<p id="saleDetailTitleP">구매 상세정보</p>
			<p id="rdquoRight">&rdquo;</p>
		</div>
		<div id="moveRebuyDiv">
			<form id="moveRebuy" action="" method="post">
				<div id="saleItemListDiv">
					<div>
						<table id="saleItemListTable">
							<tr>
								<th id="tableSaleListNo">번호</th>
								<th id="tableSaleListName">상품명</th>
								<th id="tableSaleListVolume">수량</th>
								<th id="tableSaleListPrice">가격</th>
							</tr>
							<c:forEach var="saleItemDto" items="${saleItemList}">
								<tr>
									<td class="tableSaleNo">
									</td>
									<td class="tableSaleName">
										<a href="./itemView.do?itemNo=${saleItemDto.itemNo}">
										${saleItemDto.itemName}(옵션 : ${saleItemDto.itemOptionName})
										</a>
										<input type="hidden" class="itemNo" value="${saleItemDto.itemNo}">
										<input type="hidden" class="itemOptionNo" value="${saleItemDto.itemOptionNo}">
									</td>
									<td class="tableSaleVolume">
										${saleItemDto.saleItemVolume}
										<input type="hidden" class="saleItemVolume" value="${saleItemDto.saleItemVolume}">
									</td>
									<td class="tableSalePrice">
										${saleItemDto.itemPrice}
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div id="totalPriceDiv">
						<span><strong>합계 금액&nbsp;&nbsp;</strong></span>
						<span id="totalPriceSpan"><fmt:formatNumber value="${saleDto.salePrice}" pattern="#,###" />원</span>
<!-- 						<span>원</span> -->
					</div>
				</div>	
				
				<div id="saleInfoDiv">
					<table id="saleInfoTable">
						<tr>
							<th id="saleInfoColumn">속성</th>
							<th id="saleInfocontent">내용</th>
						</tr>
						<tr>
							<td class="saleInfo">주문번호</td>
							<td>
								${saleDto.saleNo}
								<input type="hidden" name="saleNo" value="${saleDto.saleNo}">
							</td>
						</tr>
						<c:if test="${customer.customerNo == 1}">
							<tr>
								<td class="saleInfo">회원이름</td>
								<td>${customerDto.customerName}</td>
							</tr>
						</c:if>
						<tr>
							<td class="saleInfo">주문날짜</td>
							<td><fmt:formatDate value="${saleDto.saleDate}"	pattern="yyyy-MM-dd hh:mm:ss"/></td>
						</tr>
						<tr>
							<td class="saleInfo">수취인명</td>
							<td>${saleDto.saleName}</td>
						</tr>
						<tr>
							<td class="saleInfo">주소</td>
							<td>${saleDto.saleAddr}</td>
						</tr>
						<tr>
							<td class="saleInfo">전화번호</td>
							<td>${saleDto.salePhone}</td>
						</tr>
						<tr>
							<td class="saleInfo">요청사항</td>
							<td>${saleDto.saleComment}</td>
						</tr>
						<tr>
							<td class="saleInfo">결제상태</td>
							<td>
								${saleDto.saleState}
								<input type="hidden" id="saleState" name="saleState" value="${saleDto.saleState}">
								<input type="hidden" id="salePrice" name="salePrice" value="${saleDto.salePrice}">
							</td>
						</tr>
					</table>
				</div>
				<input type="hidden" name="curPage" value="${curPage}">
				
				<c:if test="${customer.customerNo != 1}">
					<c:if test="${saleDto.saleState != '환불완료'}">
						<div id="refundBtnDiv">
							<span>
								<input type="button" id="refundBtn" onclick="refundBtnFnc();" class="btn">
							</span>
						</div>
					</c:if>
					<div id="rebuyBtnDiv">
						<span>
							<input type="button" id="rebuyBtn" onclick="rebuyBtnFnc();" value="상품 재구매"  class="btn">
						</span>
					</div>
					<script type="text/javascript">refundFnc();</script>
				</c:if>
				
				<c:if test="${customer.customerNo == 1 && saleDto.saleState == '환불대기'}">
					<div id="refundBtnAdminDiv">
						<span>
							<input type="button" class="refundBtnAdmin btn" onclick="refundAdminBtnFnc('confirm');" value="환불 승인">
						</span>
						<span>
							<input type="button" class="refundBtnAdmin btn" onclick="refundAdminBtnFnc('rejection');" value="환불 거절">
						</span>
					</div>
				</c:if>
				<div id="backBtnDiv">
					<input type="button" id="backBtn" onclick="backBtnFnc();" value="돌아가기"  class="btn">
					<input type="hidden" id="curPage" value="${curPage}">
					<input type="hidden" id="keyword" value="${keyword}">
				</div>
			</form>
		</div>
		<c:if test="${customer.customerNo==1}">
			<jsp:include page="/WEB-INF/views/common/QuickMenu.jsp"/>
		</c:if>
	</div>
	<script type="text/javascript">setItemTableList();</script>
	<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>

</body>
</html>
