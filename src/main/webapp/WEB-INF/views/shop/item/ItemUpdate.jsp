<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정하기</title>

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
		padding-bottom: 50px;
		padding-top: 5px;
		
		-webkit-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-moz-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-ms-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		-o-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
		box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
	}
	#wholeDiv span{
		display: inline-block;
	}
	#itemUpdateTitleDiv{
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
	#itemUpdateTitleP{
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
	#secondDiv{
		width: 850px;
		margin: auto;
	}
	.itemDiv, .itemImgDiv{
		width: 850px;
		margin: 20px 0px 20px 0px;
		height: 1%; 
		overflow: hidden;
	}
	.addBtnDiv{
		width: 850px;
		margin: 20px 0px 20px 0px;
		height: 30px;
	}
	.itemDiv input{
		width: 690px;
		height: 25px;
		float: right;
		border-radius: 5px;
		border: 1px solid #ccc;
		padding-left: 10px;
	}
	.itemImg{
		width: 300px;
		height: 25px;
		float: right;
		margin-right: 400px;
	}
	.newItemImg{
		width: 300px;
		height: 25px;
		float: right;
		margin-right: 353px;
	}
	.itemOptionDiv{
		width: 702px;
		float: right;
		padding-left: 8px;
		border-bottom: 1px solid #ccc;
		margin-bottom: 10px;
	}
	.itemOptionDiv span{
		margin-right: 20px;
		margin-bottom: 10px;
		float: left;
	}
	.itemOptionDiv input{
		height: 25px;
		border-radius: 5px;
		border: 1px solid #ccc;
		padding-left: 10px;
	}
	.itemOptionPrice{
		width: 100px;
		float: left;
	}
	.itemOptionStock{
		width: 100px;
		float: left;
	}
	.itemOptionName{
		width: 690px;
	}
	#fileContent, #optionContent{
		width: 850px;
		height: 1%; 
		overflow: hidden;
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
	.addBtnDiv input, #addBtn, #backBtn, #itemAbleBtn{
  		width: 130px;
/*  		height: 30px; */
 		color: white;
 		padding: 0px 20px 0px 20px;
 		border: none;
/*  		border-radius: 50px; */
/*  		cursor: pointer; */
/*  		font-size: 14px; */
 		text-decoration: none;
	}
	.addBtnDiv input, #backBtn, #itemAbleBtn{
		background-color: #FFB6D2;
		color: white;
	}
	#addBtn{
		background: linear-gradient(330deg, #4CFFFF 0%, #FF4C93 100%);
		color: white; 
	}
	.addBtnDiv input{
		float: right;
	}
	.deleteBtn{
		width: 26px;
		height: 25px;
		background-color: #FFB6D2; 
		color: white; 
		border: none; 
		border-radius: 50px; 
		cursor: pointer; 
		font-size: 14px;
		text-decoration: none;
		float: right;
		text-align: center;
		padding: 3px 0px 0px 1px;
		margin-left: 10px;
		margin-bottom: 5px;
	}
	.oldItemImgDiv{
		text-align: right;
		width: 700px;
		float: right;
	}
	#itemContentDiv{
		text-align: center;
	}
	#itemContentDiv textarea{
		margin-top: 20px;
	}
	#itemContent{
		resize: none;
	}
	#itemContentSpan{
		width: 850px;
		margin-bottom: 30px;
		text-align: center;
		font-size: 48px;
		height: 50px;
		margin-top: 0px;
		font-family: 'Black Han Sans', sans-serif;
		color: #FF8FBF;
	}
	#underBtnDiv{
		width: 850px;
		margin: auto;
	}
	#addBtn, #itemAbleBtn{
		margin-left: 10px;
		margin-top: 20px;
		float: right;
	}
	#backBtnDiv{
		margin-top: 20px;
		float: left
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	var fileIndex = 1;
	var optionIndex = 1;
	
	$(document).ready(function() {
		$(".inputNum").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		})
		$(".itemOptionPrice").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		})
		$(".itemOptionStock").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		})
		
		var itemOptionNum = document.getElementsByClassName('itemOptionNum');
		var str = '';
		if (document.getElementById('itemImgThumbnailState') == null) {
			str += '<span>섬네일</span>'; 
			str += '<input type="file" class="itemImg" name="itemImgThumbnail">'; 
			str += '<input type="hidden" name="itemImgState" value="new">'; 

			document.getElementsByClassName('itemImgDiv')[0].innerHTML = str;
		}
		
		for (var i = 0; i < itemOptionNum.length; i++) {
			itemOptionNum[i].innerHTML = '옵션 ' + (i+1);
		}
		optionIndex = itemOptionNum.length + 1;
	})
	
	function addFnc(locStr){
		
		var obj = $(locStr);
		
		var htmlStr = "";
		
		if (locStr == fileContent) {
			htmlStr += '<div class="itemImgDiv">';
			htmlStr += '<div>';
			htmlStr += '<a href="#this" class="deleteBtn">Χ</a>';
			htmlStr += '<input type="file" class="newItemImg" name="newFile_' + fileIndex + '">';
			htmlStr += '<input type="hidden" name="itemImgState" value="new">';
			htmlStr += '</div>';
			fileIndex++;
		}else if (locStr == optionContent) {
			htmlStr += '<div class="itemOptionDiv">';
			htmlStr += '<span><label class="itemOptionNum">옵션 ' + optionIndex + '</label></span>';
			htmlStr += '<span><label>-</label></span>';
			htmlStr += '<span><label>추가 가격</label></span>';
			htmlStr += '<span><input type="text" class="itemOptionPrice" maxlength="6" placeholder="0"></span>';
			htmlStr += '<span><label>재고</label></span>';
			htmlStr += '<span><input type="text" class="itemOptionStock" maxlength="6" placeholder="0"></span>';
			htmlStr += '<span><a href="#this" class="deleteBtn">Χ</a></span>';
			htmlStr += '<span><input type="text" class="itemOptionName" maxlength="50" placeholder="옵션 이름을 입력하세요"></span>';
			htmlStr += '<input type="hidden" class="itemOptionState" name="itemOptionState" value="new">';
			optionIndex++;
		}
		
		htmlStr += '</div>';
	
		obj.append(htmlStr);
		$("a[class^='deleteBtn']").on("click", function(e){
			e.preventDefault();
			deleteFileFnc($(this));
		});
		$(".itemOptionPrice").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		})
		$(".itemOptionStock").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		})
	}
	function deleteFileFnc(obj){
		obj.parent().parent().remove();
		
		var itemOptionNum = document.getElementsByClassName('itemOptionNum');
			
		for (var i = 0; i < itemOptionNum.length; i++) {
			itemOptionNum[i].innerHTML = '옵션 ' + (i+1);
		}
		
		optionIndex = itemOptionNum.length + 1;
	}
	function deleteOptionFnc(itemOptionNo){
		
		var str = '#itemOptionDiv_' + itemOptionNo;
		
		$(str).remove();
		
		document.getElementById('itemOptionState_' + itemOptionNo).value = 'delete';
		var itemOptionNum = document.getElementsByClassName('itemOptionNum');
			
		for (var i = 0; i < itemOptionNum.length; i++) {
			itemOptionNum[i].innerHTML = '옵션 ' + (i+1);
		}
		
		optionIndex = itemOptionNum.length + 1;
	}
	function deleteThumbnailFnc(itemImgNo){
		
		var str = '#itemImgDiv_' + itemImgNo;
		
		$(str).remove();

		document.getElementById('itemImgThumbnailState').value = 'delete';
		
	}
	
	function deleteImgFnc(itemImgNo){
		
		var str = '#itemImgDiv_' + itemImgNo;
		
		$(str).remove();

		document.getElementById('itemImgState_' + itemImgNo).value = 'delete';
		
	}
	
	function pageBackFnc(itemNo) {
		var curPage = document.getElementById('curPage').value;
		var keyword = document.getElementById('keyword').value;
		
		location.href = './itemView.do?itemNo=' + itemNo
						+'&curPage=' + curPage
						+'&keyword=' + keyword;
	}
	
	function itemAbleBtnFnc() {
		var formObj = document.getElementById('itemAddForm');
		
		formObj.action = './itemAbleCtr.do';
		formObj.submit();	
	}
	
	function newOptionCheckFnc(itemOptionNo) {
		
		<c:forEach var="itemOptionDto" items="${itemOptionList}">
			if ("${itemOptionDto.itemOptionNo}" - itemOptionNo == 0) {
				if (document.getElementById('itemOptionPrice_' + itemOptionNo).value - "${itemOptionDto.itemOptionPrice}" != 0) {
					document.getElementById('itemOptionState_' + itemOptionNo).value = 'update';
				}else if (document.getElementById('itemOptionStock_' + itemOptionNo).value - "${itemOptionDto.itemOptionStock}" != 0) {
					document.getElementById('itemOptionState_' + itemOptionNo).value = 'update';
				}else if (document.getElementById('itemOptionName_' + itemOptionNo).value != "${itemOptionDto.itemOptionName}") {
					document.getElementById('itemOptionState_' + itemOptionNo).value = 'update';
				}else{
					document.getElementById('itemOptionState_' + itemOptionNo).value = 'old';
				}
			}
		</c:forEach>
		
	}
	
	function newImgCheckFnc(itemImgNo) {
		
		if (document.getElementById('itemImg_' + itemImgNo).value != "") {
			document.getElementById('itemImgState_' + itemImgNo).value = 'update';
		}
	}
	
	function newThumbnailCheckFnc() {
		
		if (document.getElementById('itemImgThumbnail').value != "") {
			document.getElementById('itemImgThumbnailState').value = 'update';
		}
		
	}
	
	function itemAddBtnFnc() {
		var formObj = document.getElementById('itemAddForm');
		
		var str = document.getElementById('itemName').value;
		
		if (str == "") {
			alert("상품명을 입력하세요")
			return;
		}
		
		var itemOptionPrice = document.getElementsByClassName('itemOptionPrice');
		var itemOptionStock = document.getElementsByClassName('itemOptionStock');
		var itemOptionName = document.getElementsByClassName('itemOptionName');
		var itemOptionNo = document.getElementsByClassName('itemOptionNo');
		var itemOptionState = document.getElementsByClassName('itemOptionState');
		var count = 0;
		
		for (var i = 0; i < itemOptionPrice.length; i++) {
			if (itemOptionPrice[i].value == '') {
				alert("옵션 가격을 입력하세요")
				return;
			}else if(itemOptionStock[i].value == ''){
				alert("옵션 재고를 입력하세요")
				return;
			}else if(itemOptionName[i].value == ''){
				alert("옵션명을 입력하세요")
				return;
			}
		}
		
		for (var i = 0; i < itemOptionState.length; i++) {
			if (itemOptionState[i].value != 'new') {
				itemOptionNo[i].setAttribute('name', 'itemOptionList['+i+'].itemOptionNo');
			}
			if (itemOptionState[i].value != 'delete') {
				itemOptionPrice[count].setAttribute('name', 'itemOptionList['+i+'].itemOptionPrice');
				itemOptionStock[count].setAttribute('name', 'itemOptionList['+i+'].itemOptionStock');
				itemOptionName[count].setAttribute('name', 'itemOptionList['+i+'].itemOptionName');
				count++;
			}
		}
		
		formObj.action = './itemUpdateCtr.do';
		formObj.submit();
	}
	
	function getByteB(str) {

		var strByte = 0;

		for (var i=0; i<str.length; ++i) {
			(str.charCodeAt(i) > 127) ? strByte += 3 : strByte++ ;
		}
		return strByte;
	}

	function setItemAbleBtnFnc(state){
		var itemAbleBtn = document.getElementById('itemAbleBtn');
		
		if (state == '활성화') {
			itemAbleBtn.value = '판매 중단';
		}else if (state == '비활성화') {
			itemAbleBtn.value = '판매 개시';
		}
		
	}
	

</script>
</head>
<body onload="InitializeQuickMenu();">

	<jsp:include page="/WEB-INF/views/common/AdminHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/common/AdminHeaderMenu.jsp"/>
	
	<div id="wholeDiv">
		<div id="itemUpdateTitleDiv">
			<p id="ldquoLeft">&ldquo;</p>
			<p id="itemUpdateTitleP">상품 수정하기</p>
			<p id="rdquoRight">&rdquo;</p>
		</div>
		
		
		<form action="" id="itemAddForm" method="post" enctype="multipart/form-data">
			<div id="secondDiv">
				<div class="itemDiv" id="itemNameDiv">
					<span>상품명</span>
					<input type="text" id="itemName" name="itemName" value="${itemDto.itemName}" placeholder="상품명을 입력하세요">
					<input type="hidden" name="itemNo" value="${itemDto.itemNo}">
					
				</div>
				
				<div class="itemDiv" id="itemPriceDiv">
					<span>판매가</span>
					<input type="text" class="inputNum" name="itemPrice" maxlength="7" value="${itemDto.itemPrice}" placeholder="0">
				</div>
				
				<div class="itemImgDiv">
					<c:forEach var="itemImgDto" items="${itemImgList}">
						<c:if test="${itemImgDto.itemImgThumbnail == 'true'}">
							<span>섬네일</span>
							<input type="file" id="itemImgThumbnail" class="itemImg" name="itemImgThumbnail">
							<div id="itemImgDiv_${itemImgDto.itemImgNo}" class="oldItemImgDiv">
								<span>${itemImgDto.itemOriginalImgName}</span>
								<a onclick="deleteThumbnailFnc(${itemImgDto.itemImgNo});" class="deleteBtn">Χ</a>
							</div>
							<input type="hidden" id="itemImgThumbnailState" class="itemImgState" name="itemImgState" value="old">
							<input type="hidden" name="itemImgNo" id="oldItemImgThumbnail" value="${itemImgDto.itemImgNo}">
						</c:if>
					</c:forEach>
				</div>
				
				<div id="fileContent">
					<span>사진 등록</span>
					<c:if test="${empty itemImgList}">
						<input type="file" id="itemImg_${itemImgDto.itemImgNo}" class="itemImg" name="imgFile_${itemImgDto.itemImgNo}"
							onchange="newImgCheckFnc(${itemImgDto.itemImgNo});">
						<input type="hidden" id="itemImgState_${itemImgDto.itemImgNo}" class="itemImgState" name="itemImgState" value="new">
	
					</c:if>
							<c:forEach var="itemImgDto" items="${itemImgList}">
								<c:if test="${itemImgDto.itemImgThumbnail == 'false'}">
									<div id="itemImgDiv_${itemImgDto.itemImgNo}" class="oldItemImgDiv">
										<input type="file" id="itemImg_${itemImgDto.itemImgNo}" class="itemImg" name="imgFile_${itemImgDto.itemImgNo}"
											onchange="newImgCheckFnc(${itemImgDto.itemImgNo});">
										<span>${itemImgDto.itemOriginalImgName}</span>
										<a onclick="deleteImgFnc(${itemImgDto.itemImgNo});" class="deleteBtn">Χ</a>
									</div>
										<input type="hidden" name="itemImgNo" value="${itemImgDto.itemImgNo}">
										<input type="hidden" id="itemImgState_${itemImgDto.itemImgNo}" class="itemImgState" name="itemImgState" value="old">
								</c:if>
							</c:forEach>
				</div>
				
				<div class="addBtnDiv">
					<input type="button" onclick="addFnc(fileContent);" 
						value="추가" class="btn">
				</div>
			
			
				<div id="optionContent">
					<span>옵션 등록</span>
					<c:forEach var="itemOptionDto" items="${itemOptionList}">
						<div id="itemOptionDiv_${itemOptionDto.itemOptionNo}" class="itemOptionDiv">
							<span>
								<label class="itemOptionNum"></label>
							</span>
							<span>
								<label>-</label>
							</span>
							<span>
								<label>추가 가격</label>
							</span>
							<span>
								<input type="text" id="itemOptionPrice_${itemOptionDto.itemOptionNo}" class="itemOptionPrice" 
										onchange="newOptionCheckFnc(${itemOptionDto.itemOptionNo});" maxlength="6" 
										value="${itemOptionDto.itemOptionPrice}" placeholder="0">
							</span>
							<span>
								<label>재고</label>
							</span>
							<span>
								<input type="text" id="itemOptionStock_${itemOptionDto.itemOptionNo}" class="itemOptionStock" 
										onchange="newOptionCheckFnc(${itemOptionDto.itemOptionNo});" maxlength="6" 
										value="${itemOptionDto.itemOptionStock}" placeholder="0">
							</span>
							<span>
								<a onclick="deleteOptionFnc(${itemOptionDto.itemOptionNo});" class="deleteBtn">Χ</a>
							</span>
							<span>
								<input type="text" id="itemOptionName_${itemOptionDto.itemOptionNo}" class="itemOptionName" 
										onchange="newOptionCheckFnc(${itemOptionDto.itemOptionNo});" maxlength="50" 
										value="${itemOptionDto.itemOptionName}" placeholder="옵션 이름을 입력하세요">
							</span>
						</div>
						<input type="hidden" class="itemOptionNo" value="${itemOptionDto.itemOptionNo}">
						<input type="hidden" id="itemOptionState_${itemOptionDto.itemOptionNo}" class="itemOptionState" name="itemOptionState" value="old">
					</c:forEach>
				</div>
				
				<div class="addBtnDiv">
					<input type="button" onclick="addFnc(optionContent);" 
						value="추가" class="btn">
				</div>
			</div>
			
			<div id="itemContentDiv">
				<span id="itemContentSpan">▼&nbsp;&nbsp;&nbsp;상세 내용&nbsp;&nbsp;&nbsp;▼</span>
				<textarea rows="20" cols="117" id="itemContent" name="itemContent" placeholder="상품 설명을 입력하세요">${itemDto.itemContent}</textarea>
			</div>
			
			<div id="underBtnDiv">
				<div id="itemAddBtnDiv">
					<input type="button" id="addBtn" onclick="itemAddBtnFnc();" 
						value="수정" class="btn">
				</div>
				
				<div id="itemAbleBtnDiv">
					<input type="button" id="itemAbleBtn" onclick="itemAbleBtnFnc();" 
						value="" class="btn">
					<input type="hidden" name="itemState"value="${itemDto.itemState}">
					<script type="text/javascript"> setItemAbleBtnFnc("${itemDto.itemState}") </script>
				</div>
				
				<div id="backBtnDiv">
					<input type="button" id="backBtn" onclick="pageBackFnc(${itemDto.itemNo});" 
						value="취소" class="btn">
					<input type="hidden" id="curPage" name="curPage" value="${searchMap.curPage}">
					<input type="hidden" id="keyword" name="keyword" value="${searchMap.keyword}">
				</div>
			</div>
		</form>
		
		<c:if test="${customer.customerNo==1}">
			<jsp:include page="/WEB-INF/views/common/QuickMenu.jsp"/>
		</c:if>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
</body>
</html>