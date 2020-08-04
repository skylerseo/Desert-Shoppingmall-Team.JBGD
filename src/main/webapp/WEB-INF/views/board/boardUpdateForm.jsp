<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

<style type="text/css">

/* 	노토산스 웹폰트 */
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100&display=swap');

body{
   background-color: #f3f2f2;
      height: 100%; 
      margin: 0px;
}

#whole{
	  width: 1080px;
      margin: auto;
      text-align: center;
      font-family: 'Noto Sans KR', sans-serif;
      color: #525252;
      
      border-radius: 10px; 
      box-sizing: border-box; 
      background-color: #FAFAFA;
      padding-bottom: 50px;
      padding-top: 0px;
      
      -webkit-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
      -moz-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
      -ms-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
      -o-box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
      box-shadow: 0 10px 20px rgba(103, 62, 122, 0.1), 0 6px 6px rgba(103, 62, 122, 0.1);
}


#title{
	width: 70px;
	height: 30px;
}

#titleTable{
	width:	1080px;
	vertical-align: top;
}

#subject{
	width: 780px;
	height: 30px;
 	margin-left: 30px;
 	margin-bottom: 5px; 

}

#updateContent{
	width: 844px;
	height: 400px;
	margin-bottom: 10px;
	margin-top: 30px;
	resize: none;
}
#select_img img{
	margin: 20px;
	width: 100px;
}
#imageText{
	margin-bottom: 10px;
}
#upateImg{
	width: 846px;
	text-align: left;
	margin: auto;
}

.boardUpdate{
 	text-align: center; 
	margin-bottom: 5px;
}

.bnt{
	  width: 100px;
      height: 40px;
      background-color: #FF1555; 
      color: white; 
      padding: 5px 5px; 
      margin: 10px 10px; 
      cursor: pointer; 
      font-size: 14px;
      float: right;
      border: none;
      border-radius: 5px; 
}
 .imgBnt{ 
 	 width: 100px; 
      height: 30px; 
      background-color: #FF1555;  
      color: white;  
      padding: 5px 5px;  
      margin: 10px 10px;  
      cursor: pointer;  
      font-size: 14px;
      border: none; 
     border-radius: 5px;  
	
 } 
.one{
	width: 1080px;
}


</style>
<script type="text/javascript">

function pageMoveListFnc(curPage, boardNo) {
	location.href = './boardDetail.do?curPage=' + curPage + '&boardNo=' + boardNo;
	
}
function boardUpdateFnc() {
	if($('#subject').val() + $('#updateContent').val() == ""){
		alert("수정 할 제목, 내용이 없습니다  \n제목과 내용을 채워주세요");
		$('#subject').focus();
		return;		
	}
	if($('#subject').val() == ""){
		alert("수정 할 제목이 없습니다 \n제목을 채워주세요");
		$('#subject').focus();
		return;
	}
	if($('#updateContent').val() == ""){
		alert("수정 할 내용이 없습니다 \n내용을 채워주세요");
		$('#updateContent').focus();
		return;
	}
	
	var boardUpdateForm = document.getElementById('boardUpdateForm');
	boardUpdateForm.submit();
	
	
}

function imgDeleteFnc(obj) {
	$(obj).parent().remove();
	$("#select_img").children(0).attr("src", "");
	
	document.getElementById("boardOriginalImg").value = 'delete';
	
	
}
function boardMaxByteFnc(obj) {
    var maxByte = 4000; //최대 입력 바이트 수
    var str = obj.value;
    var strLength = str.length;
 
    var returnByte = 0;
    var returnLength = 0;
    var oneChar = "";
    var str2 = "";
    var koreanByte = maxByte/2;
 
    for (var i = 0; i < strLength; i++) {
        oneChar = str.charAt(i);
 
        if (escape(oneChar).length > 4) {
            returnByte += 3; //한글2Byte
        } else {
            returnByte++; //영문 등 나머지 1Byte
        }
 
        if (returnByte <= maxByte) {
            returnLength = i + 1; //return할 문자열 갯수
        }
    }
 
    if (returnByte > maxByte) {
    	
        alert("한글 " + koreanByte + "자/영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
        str2 = str.substr(0, returnLength); //문자열 자르기
        obj.value = str2;
        fnChkByte(obj, maxByte);
    } 
}
// function changeImgFnc(imageChangeinput) {
// 	var changeImgObj = $(imageChangeinput);
// 	htmlStr = "";
	
// 	htmlStr += '<input type="file" id="boardOriginalImg" name="file"/>';
// 	htmlStr += '<div id="select_img"><img style="width: 300px;" src="<c:url value="/img/${boardCtmDto.boardStoredImg}"/>"/></div>';
// 	htmlStr += '<input type="hidden" id="boardOriginalImg" value="${boardCtmDto.boardOriginalImg}" >';
// 	htmlStr += '<input class="bnt" type="button" value="삭제" onclick="imgDeleteFnc(this);">';
	
// 	changeImgObj.parent().html(htmlStr);
// }

</script>
</head>

<body onload="InitializeQuickMenu();">
	<c:choose>
		<c:when test="${sessionScope.customer.customerNo eq '1'}">
			<jsp:include page="/WEB-INF/views/common/AdminHeader.jsp"></jsp:include>
			<jsp:include page="/WEB-INF/views/common/AdminHeaderMenu.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="/WEB-INF/views/common/CustomerHeader.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>

	<div id="whole">
		<div>
			<h1 class="boardUpdate">게시글 수정하기</h1>
		</div>
		<form id="boardUpdateForm" action="./boardUpdateCtr.do" method="post"  enctype="multipart/form-data">		
			<div id="titleTable">
				<span id="title">제목</span>
				<span><input id="subject" type="text" name="boardTitle" maxlength="35" value="${boardCtmDto.boardTitle}"></span>
			</div>
			<div>
				<textarea  id="updateContent"  name="boardContent" onkeyup="boardMaxByteFnc(this);">${boardCtmDto.boardContent}</textarea>
			</div>
			<div id="upateImg">
				<div id="imageText">
					<span>이미지</span>
				</div>
				<div>
					<c:choose>
						<c:when test="${boardCtmDto.boardStoredImg eq null}">
							<input type="file" id="boardOriginalImg" name="file" value="${boardCtmDto.boardOriginalImg}" >				
							<div id="select_img"><img src="<c:url value='/img/${boardCtmDto.boardStoredImg}'/>"/></div>
							<input type="hidden" name="boardOriginalImg" value="${boardCtmDto.boardOriginalImg}" >
						</c:when>
						<c:otherwise>
							<span><input type="file" id="boardOriginalImg" name="file" value="${boardCtmDto.boardStoredImg}"/></span>
							<span><input class="imgBnt" type="button" value="이미지삭제" onclick="imgDeleteFnc(this);"></span>
							<span><input type="hidden" name="boardOriginalImg" value="${boardCtmDto.boardOriginalImg}" ></span>				
							<div id="select_img"><img  src="<c:url value='/img/${boardCtmDto.boardStoredImg}'/>"/></div>						
						</c:otherwise>	
					</c:choose>
				</div>
				<div>
					<script>
						$("#boardOriginalImg").change(function() {
							if(this.files && this.files[0])  {
								var reader = new FileReader;
								reader.onload = function (data) {
									$("#select_img img").attr("src", data.target.result).width(100);								
								}
								reader.readAsDataURL(this.files[0]);
							}else{
								$("#select_img img").attr("src", "");
								
							}
							
						});				
					</script>
				</div>
			</div>	
			<div>
				<hr class="one">
			</div>
			<div>
				<input class="bnt" type="button" value="취소" onclick="pageMoveListFnc(${curPage},${boardCtmDto.boardNo});">
			</div>
			<div>
				<input id="boardUpdateBtn" class="bnt" type="button" value="수정" onclick="boardUpdateFnc();">
				<input type="hidden" name="boardNo" value='${boardCtmDto.boardNo}'>
				<input type="hidden" name="curPage" value="${curPage}">							
			</div>
		</form>		
		<c:if test="${customer.customerNo==1}">
			<jsp:include page="/WEB-INF/views/common/QuickMenu.jsp"/>
		</c:if>
	</div>
	
			<jsp:include page="/WEB-INF/views/common/Footer.jsp"></jsp:include>
	
	
	
</body>
</html>