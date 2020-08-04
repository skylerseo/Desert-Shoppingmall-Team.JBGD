<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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

#titleH3{
	width: 70px;
	height: 30px;
}
#titleInput{
	width: 780px;
	height: 30px;
 	margin-left: 30px;
 	margin-bottom: 5px; 
}
#newContent{
	width: 841px;
	height: 400px;
	margin-bottom: 10px;
	margin-top: 30px;
	resize: none;
}


#boardAddForm{
	margin: auto;
}

#table{
	width: 855px;
}

#titleTable{
	width: 850px;
	height: 50px;
}
#addImg{
	width: 846px;
	text-align: left;
	margin: auto;
}
#preImgView{
	width: 850px;
	
}
#imageText{
	margin-bottom: 10px;
}

.boardAdd{
	text-align: center;
}
.btn{
  	  width: 100px;
      height: 40px;
      background-color: #FF1555; 
      color: white; 
      padding: 5px 5px; 
      margin: 10px 10px; 
      border: none; 
      border-radius: 5px; 
      cursor: pointer; 
      font-size: 14px;
      float: right;
   }

.one{
	margin-bottom: 30px;
}
.select_img{
	width: 350px;
	margin:  10px;
}
span {
	width: 850px;
	font-weight: bolder;
	margin-bottom: 10px;
	text-align: left;
	
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">


function pageMoveListFnc(curPage) {
	location.href = './board.do';
	
}

function addBtnFnc() {
	
	var titleStr = document.getElementById('titleInput');
	var contentStr = document.getElementById('newContent');
	var blank_pattern = /^\s+|\s+$/g;
	
	if(titleStr.value + contentStr.value == ""){
		alert("제목, 내용이 없습니다  \n제목과 내용을 채워주세요");
		titleStr.focus();
		return;		
	}
	
	
	if(titleStr.value == ""){
		alert("제목이 비었습니다")
		titleStr.focus();
		return;
	}
	if( titleStr.value.replace( blank_pattern, '' ) == "" ){
	    alert(' 공백만 입력되었습니다 ');
	    titleStr.focus();
	    return;
	}

	if(contentStr.value == ""){
		alert("내용이 비었습니다")
		contentStr.focus();
		return;
	}
	
	var boardAddForm = document.getElementById('boardAddForm');
	boardAddForm.submit();
	
	

	
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
// function preventSpaceFnc(obj) { 
//     var str_space = /\s/;  // 공백
    
    
//     if(str_space.exec(obj.value)) { //공백 체크
//         alert("이 항목에는 공백을 입력하실 수 없습니다.");
//         obj.focus();
//         obj.value = obj.value.replace(/(^\s*)|(\s*$)/gi, ""); // 공백제거
//         return false;
//     }
    
//     function spaceDeleteFnc() {
//     	var titleStr = $('#titleInput').val();
//     	console.log(titleStr);
//     	console.log(titleStr.trim());
		
// 	}



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
		<div class="table">
			<h1 class="boardAdd">게시글 등록하기</h1>
		</div>
		<form id="boardAddForm" action='./boardAddCtr.do' method="post" onsubmit="return false" enctype="multipart/form-data">					
		<div>		
			<div>								
				<span id="titleH3">제목</span>			
				<span><input id="titleInput" placeholder="제목을 입력해주세요" type="text" name="boardTitle" maxlength="35"></span>											
			</div>
		
			<div class="table">
				<textarea id="newContent" placeholder="내용을 입력해주세요" name="boardContent" onkeyup="boardMaxByteFnc(this);"></textarea>		
			</div>	
			<div id="addImg">
				<div id="imageText">
					<span>이미지</span>
				</div>
					<div >
						<input type="file" id="boardOriginalImg" name="file"/>
						<div class="select_img"><img src=""/></div>
						<div id="preImgView">
							<script>
								$("#boardOriginalImg").change(function() {
									if(this.files && this.files[0])  {
										var reader = new FileReader;
										reader.onload = function (data) {
											$(".select_img img").attr("src", data.target.result).width(100);								
										}
										reader.readAsDataURL(this.files[0]);
									}
									
								});				
							</script>
						</div>		
					</div>
				</div>
				<hr class="one" width="1080px;">

				<div class="table">
					<input class="btn" type="button" value="취소" onclick="pageMoveListFnc();">				
					<input class="btn" type="button" value="등록" onclick="addBtnFnc();">
					
					<input type="hidden" name="curPage" value="${curPage}">
					<input type="hidden" name="customerNo" value="${customer.customerNo}">
			
				</div>
				
			</div>				
			</form>
			<c:if test="${customer.customerNo==1}">
				<jsp:include page="/WEB-INF/views/common/QuickMenu.jsp"/>
			</c:if>
		</div>
		
			<jsp:include page="/WEB-INF/views/common/Footer.jsp"></jsp:include>
		
	
</body>
</html>