<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>

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
	#itemAddTitleDiv{
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
	#itemAddTitleP{
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
	.itemDiv{
		width: 850px;
 		margin: 20px 0px 20px 0px;
		height: 30px;
		margin: auto;
 		margin-bottom: 10px;
	}
	.itemImgDiv{
		width: 850px;
 		margin: 20px 0px 20px 0px;
		height: 30px;
/* 		margin-bottom: 10px; */
	}
	#secondDiv{
		width: 850px;
		margin: auto;
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
	.newItemImg{
		width: 300px;
		height: 25px;
		float: right;
		margin-right: 373px;
	}
	#fileContent, #optionContent{
		width: 850px;
		height: 1%; 
		overflow: hidden;
	}
 	.addBtnDiv input, #addBtn, #backBtn{
  		width: 100px;
/*  		height: 30px; */
 		color: white;
 		padding: 0px 20px 0px 20px;
 		border: none;
/*  		border-radius: 50px; */
/*  		cursor: pointer; */
/*  		font-size: 14px; */
 		text-decoration: none;
	}
	.addBtnDiv input, #backBtn{
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
	}

	#itemContentDiv{
		text-align: center;
	}
	#itemContent textarea{
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
	#underBtnDiv{
		width: 850px;
		margin: auto;
	}
	#itemAddBtnDiv{
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
	var optionIndex = 2;

	function addFnc(locStr){
		
		var obj = $(locStr);
		
		var htmlStr = "";
		
		if (locStr == fileContent) {
			htmlStr += '<div class="itemImgDiv">';
			htmlStr += '<div>';
			htmlStr += '<a href="#this" class="deleteBtn">Χ</a>';
			htmlStr += '<input type="file" class="newItemImg" name="newFile_' + fileIndex + '">';
			htmlStr += '</div>';
			fileIndex++;
		}else if (locStr == optionContent) {
			htmlStr += '<div class="itemOptionDiv">';
			htmlStr += '<span><label class="itemOptionNum">옵션 ' + optionIndex + '</label></span>';
			htmlStr += '<span><label>-</label></span>';
			htmlStr += '<span><label>추가 가격</label></span>';
			htmlStr += '<span><input type="text" class="itemOptionPrice" maxlength="6" placeholder="추가 가격"></span>';
			htmlStr += '<span><label>재고</label></span>';
			htmlStr += '<span><input type="text" class="itemOptionStock" maxlength="6" placeholder="재고"></span>';
			htmlStr += '<span><a href="#this" class="deleteBtn">Χ</a></span>';
			htmlStr += '<span><input type="text" class="itemOptionName" maxlength="50" placeholder="옵션 이름을 입력하세요"></span>';
		
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
	
	function pageBackFnc() {
		var formObj = document.getElementById('itemAddForm');
		
		formObj.action = './itemListAdmin.do';
		formObj.submit();	
	}
	
	function itemAddBtnFnc() {
		var formObj = document.getElementById('itemAddForm');
		
		var itemName = document.getElementById('itemName').value;
		var itemPrice = document.getElementById('itemPrice').value;
		
		if (itemName == "") {
			alert("상품명을 입력하세요")
			return;
		}else if (itemPrice == "") {
			alert("상품가격을 입력하세요")
			return;
		}
		
		var itemOptionPrice = document.getElementsByClassName('itemOptionPrice');
		var itemOptionStock = document.getElementsByClassName('itemOptionStock');
		var itemOptionName = document.getElementsByClassName('itemOptionName');

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
		
		for (var i = 0; i < itemOptionPrice.length; i++) {
			itemOptionPrice[i].setAttribute('name', 'itemOptionList['+i+'].itemOptionPrice');
			itemOptionStock[i].setAttribute('name', 'itemOptionList['+i+'].itemOptionStock');
			itemOptionName[i].setAttribute('name', 'itemOptionList['+i+'].itemOptionName');
		}
		
		formObj.action = './itemAddCtr.do';
		formObj.submit();
	}
	
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
	})
</script>
</head>
<body onload="InitializeQuickMenu();">

	<jsp:include page="/WEB-INF/views/common/AdminHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/common/AdminHeaderMenu.jsp"/>
	
	<div id="wholeDiv">
		<div id="itemAddTitleDiv">
			<p id="ldquoLeft">&ldquo;</p>
			<p id="itemAddTitleP">상품 등록하기</p>
			<p id="rdquoRight">&rdquo;</p>
		</div>
		
		<form action="" id="itemAddForm" method="post" enctype="multipart/form-data">
			<div class="itemDiv" id="itemNameDiv">
				<span>상품명</span>
				<input type="text" id="itemName" name="itemName" maxlength="20" placeholder="상품명을 입력하세요">
			</div>
			<div class="itemDiv" id="itemPriceDiv">
				<span>판매가</span>
				<input type="text" class="inputNum" id="itemPrice" name="itemPrice" maxlength="7" placeholder="0">
			</div>
			<div id="secondDiv">
				<div class="itemImgDiv" id="itemThumbnailDiv">
					<span>섬네일</span>
					<input type="file" class="itemImg" id="thumbnailFile" name="thumbnailFile">
				</div>
				<div id="fileContent">
					<span>사진 등록</span>
					<input type="file" class="itemImg" id="newFile_0" name="newFile_0">
				</div>
				<div class="addBtnDiv">
					<input type="button" onclick="addFnc(fileContent);" 
						value="추가" class="btn">
				</div>
				<div id="optionContent">
					<span>옵션 등록</span>
					<div class="itemOptionDiv">
						<span>
							<label class="itemOptionNum">옵션 1</label>
						</span>
						<span>
							<label>-</label>
						</span>
						<span>
							<label>추가 가격</label>
						</span>
						<span>
							<input type="text" class="itemOptionPrice" maxlength="6" placeholder="추가 가격">
						</span>
						<span>
							<label>재고</label>
						</span>
						<span>
							<input type="text" class="itemOptionStock" maxlength="6" placeholder="재고">
						</span>
						<span>
							<input type="text" class="itemOptionName" maxlength="50" value="기본" placeholder="옵션 이름을 입력하세요">
						</span>
					</div>
				</div>
				<div class="addBtnDiv">
					<input type="button" onclick="addFnc(optionContent);" 
						value="추가" class="btn">
				</div>
			</div>
			<div id="itemContentDiv">
				<span id="itemContentSpan">▼&nbsp;&nbsp;&nbsp;상세 내용&nbsp;&nbsp;&nbsp;▼</span>
				<textarea rows="20" cols="117" id="itemContent" name="itemContent" maxlength="1333" placeholder="상품 설명을 입력하세요"></textarea>
			</div>
			<div id="underBtnDiv">
				<div id="itemAddBtnDiv">
					<input type="button" id="addBtn" onclick="itemAddBtnFnc();" 
						value="등록" class="btn">
				</div>
				<div id="backBtnDiv">
					<input type="button" id="backBtn" onclick="pageBackFnc();" 
						value="취소" class="btn">
					<input type="hidden" name="curPage" value="${curPage}">
					<input type="hidden" name="keyword" value="${keyword}">
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