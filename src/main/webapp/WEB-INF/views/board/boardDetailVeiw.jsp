<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 게시판 내용 dragon</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style type="text/css">
/* 	노토산스 웹폰트 */
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100&display=swap');

body{
		background:  #f3f2f2;
	}

#whole {
	margin: auto;
	margin-top: 30px;
	width: 1080px;
	height: 1%;
	overflow: hidden;
	font-family: 'Noto Sans KR', sans-serif;
}


#boardImg {
 	width: 480px; 
  	height: 360px; 
	border-collapse: collapse;
	border: 1px solid black;
	text-align: center;
	margin-top: 10px;
	margin-bottom: 30px;

}

#customerIdDiv {
	width: 1080px;
	height: 30px;
	margin-bottom: 10px;
	border-bottom: 1px solid black;
	
}

#createDate {
	float: right;
	margin-bottom: 50px;
}



#contentDiv {

	margin-bottom: 30px;
}

#contentText {
	width: 1080px;

	border: 0px;
	resize: none;
}

#updateBtnDiv {
	width: 1080px;
	float: right;
}

#goList {
	float: right;
	margin-top: 100px;
}

#comment {
	background-color: #8c8c8c;
	width: 1080px;
	height: 280px;
	margin-top: 80px;
}

#commentSize {
	margin-left: 10px;
}

#writeRpl {
	width: 950px;
	height: 50px;
	margin-bottom: 0px;
	resize: none;
}

#sizeOfComment {
	margin-right: 0px;
}

#idSizeInComment {
	margin-left: 20px;
	margin-right: 10px;
}

#replyContent {
	width: 844px;
	height: 80px;
	resize: none;
	border: 0px;
}

.replyDiv {
	border: 0px;
	width: 200px;
 	margin-right: 20px; 
	text-overflow: auto;
}

#commentContainer {
	margin: auto;
	width: 1080px;
	height: 1%;
}

.comentCustomerIdDiv{
	width: 1080px;
	
}

#updateDiv {
	float: right;
}

.replyCreDate {
	width: 500px;
	text-align: left;

}

#box {
	border: none;
	width: 581px;
	box-sizing: border-box;
	margin-right: 100px;
}
#createdateDiv{
	float: right;
}
#replyContentText{
	width: 955px; 
	text-overflow: auto;
 	height: 60px;
	border: 0px;

}
#replyContentTextArea{
	width: 955px; 
	text-overflow: auto;
 	height: 60px;
	resize: none; 
	border: 0px;
}
#addBtn{
	height: 56px;
}

.updateForm {
	height: 800px;
}



.btn {
	width: 100px;
	height: 40px;
	background-color: #FF1555;
	color: white;
	padding: 5px 5px;
	margin-left: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px;
	float: right;
}

.updateBtn {
 	width: 50px;
	float: right;
	margin-left: 10px;
	border-radius: 5px;
	background-color: #DC7EFF;
	border: none;
	color: white;
	padding: 5px;
}

table, tr, td, th {
	border-collapse: collapse;
	border: 1px solid black;
	text-align: center;
}
</style>
<script type="text/javascript">
	function pageMoveListFnc(curPage) {
		location.href = './board.do?curPage=' + curPage;

	}
	function pageMoveDetailFnc(boardNo, curPage) {
		location.href = './boardDetail.do?boardNo=' + boardNo + '&curPage=' + curPage;
		
	}
	
	function boardDeleteFnc(boardNo) {
		if(confirm("글을 정말로 삭제하겠습니까?")){
		var url = "./boardDeleteCtr.do";
		var boardFormObj = document.getElementById('updateForm');
		
		boardFormObj.action = url;
		boardFormObj.submit();
		}
		
	}

	function replyDeleteFnc(replyNo) {
		if(confirm("뎃글을 정말로 삭제하겠습니까?")){
		var url = "./replyDeleteCtr.do?replyNo=" + replyNo;
		var replyFormObj = document.getElementById('deleteForm');

		replyFormObj.action = url;
		replyFormObj.submit();
		}	

	}
	function replySaveFnc() {
		if($('#replyContentText').val() == ""){
			alert("댓글 내용이 비었습니다");
			$('#replyContentText').focus();
			return;
			
		}
		var boardSaveForm = document.getElementById('deleteForm');
		boardSaveForm.submit();
	}
	
	function replyUpdateFnc(replyUpdateInputTag) {
		var replyInputUpdateObj = $(replyUpdateInputTag);
		var replyContentObj = $('#replyContentText').text();
		
				
		var htmlStr = "";
		htmlStr += '<input class="updateBtn" type="button" value="취소" onclick="pageMoveDetailFnc(${boardCtmDto.boardNo},${curPage});">';
		htmlStr += '<input class="updateBtn" type="submit" value="저장">';
		
		var spanStr ="";
		spanStr += '<textarea id="replyContentTextArea" name="replyContent">'+replyContentObj+'</textarea>';
		
	
		var replyContDivObj = replyInputUpdateObj.parent(); 
		
		replyContDivObj.html(htmlStr);
		
		var replyAllContDivObj = replyContDivObj.parent();
		
		var replyContentSpanObj = replyAllContDivObj.children("div").eq(2);
		
		var replyContentAreaObj = replyContentSpanObj.children("span").eq(0);
				
		replyContentAreaObj.html(spanStr);
		
		$('#replyContentTextArea').focus();


	}
	
	function relpyContentFnc(curPage) {
		
		var url = "./replyAddCtr.do";
		var replyFormObj = document.getElementById('addForm');
		
		if($("#writeRpl").val() == ""){
			alert("댓글이 비었습니다")
			$("#writeRpl").focus();
			return;
		}
		$('#addBtn').submit();
		
		replyFormObj.action = url;
		replyFormObj.submit();
		}
	
	function replyMaxByteFnc(obj) {
	    var maxByte = 1000; //최대 입력 바이트 수
	    var str = obj.value;
	    var strLength = str.length;
	 
	    var returnByte = 0;
	    var returnLength = 0;
	    var oneChar = "";
	    var str2 = "";
	 
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
	    	var koreanByte = maxByte/2;
	    	
	    	alert("한글 " + koreanByte + "자/영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
	        str2 = str.substr(0, returnLength); //문자열 자르기
	        obj.value = str2;
	        fnChkByte(obj, maxByte);
	    }

	}
		
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
			<h1>${boardCtmDto.boardTitle}</h1>
		</div>
		<form id="updateForm" action="./boardUpdate.do" method="get">
			<div id="customerIdDiv">
				작성자 :<span id="box" >${boardCtmDto.customerId}</span>  
				<div id="createdateDiv">
					<fmt:formatDate value='${boardCtmDto.boardCreDate}' pattern='yyyy-MM-dd hh:mm:ss' />
				</div>
			</div>
			<div>
			<c:if test="${boardCtmDto.boardStoredImg != ''}">
				<div><img id="boardImg" alt="no Image" src="<c:url value='/img/${boardCtmDto.boardStoredImg}'/>"></div>
			</c:if>	
				<div id="contentDiv">
					<span id="contentText">${boardCtmDto.boardContent}</span>
				</div>
			</div>
			<div id="updateBtnDiv">
				<c:if test="${sessionScope.customer.customerId eq 'admin' || sessionScope.customer.customerId eq boardCtmDto.customerId}">
					<input class="btn" type="button"  value="삭제" onclick="boardDeleteFnc(${boardCtmDto.boardNo});">
				</c:if>
				<c:if test="${sessionScope.customer.customerId eq boardCtmDto.customerId}">
					 <input class="btn" type="submit" value="수정">
				</c:if>
	
			</div>
			<input type="hidden" name="boardNo" value='${boardCtmDto.boardNo}'>
			<input type="hidden" name="curPage" value="${curPage}">
		</form>

		<div id='commentContainer'>
			<form id="addForm" action="./replyAddCtr.do" method="post" onsubmit="return false">
				<div>
					<div id="reply">
						<h3 id="replySize">Comment</h3>
						<div>
							<textarea id="writeRpl" name="replyContent" onkeyup="replyMaxByteFnc(this);"></textarea>
							<input id="addBtn" class="btn" type="button" value="등록" onclick="relpyContentFnc(${curPage});">
						</div>
						<hr class="one" width="1080px;">
					</div>
						<input type="hidden" name="boardNo" value="${boardCtmDto.boardNo}">
						<input type="hidden" name="curPage" value="${curPage}"> 
						<input type="hidden" name="customerNo" value="${sessionScope.customer.customerNo}"> 
						<input type="hidden" name="customerId" value="${sessionScope.customer.customerId}">
				</div>		
			</form>



		<div id='replyList'>
			<c:forEach var="boardRplDto" items="${boradRplList}">
				<form id="deleteForm" action="./replyUpdateCtr.do" method="post" onsubmit="false">
						<div><!-- 두번째변화를 주기를 위한 태그위치  다리역 --> 
						
							<div class="comentCustomerIdDiv">
								<span class="replyDiv">${boardRplDto.customerId}</span>
								<span class="replyCreDate">
								등록일 : <fmt:formatDate value='${boardRplDto.replyCreDate}' pattern='yyyy-MM-dd hh:mm:ss' /></span>
							</div>
							
						<!-- 첫번째변화를 주기를 위한 태그위치 -->
							<div>
								<c:if test="${sessionScope.customer.customerId eq 'admin' || sessionScope.customer.customerId eq boardRplDto.customerId}">
										<input class="updateBtn" type="button" value="삭제" onclick="replyDeleteFnc(${boardRplDto.replyNo});"> 

								</c:if>
								<c:if test="${sessionScope.customer.customerId eq boardRplDto.customerId}">									  

										<input class="updateBtn" type="button" value="수정" onclick="replyUpdateFnc(this);">								
								</c:if>
							</div>
									<input type="hidden" name="customerId" value="${sessionScope.customer.customerId}"> 
									<input type="hidden" name="customerNo" value="${sessionScope.customer.customerNo}"> 
									<input type="hidden" name="replyNo" value="${boardRplDto.replyNo}">
									<input type="hidden" name="boardNo" value="${boardRplDto.boardNo}">  
									<input type="hidden" name="curPage" value="${curPage}">													
							<div><!-- 목표 변화를 주기를 위한 테그위치  --> 
								<span id="replyContentText">${boardRplDto.replyContent}</span>
							</div>											
						</div>					

					</form>										
				</c:forEach>
			</div>
			<div id="goList">
				<input class="btn" type="button" value="목록" onclick="pageMoveListFnc(${curPage});">
			</div>
		</div>
		<c:if test="${customer.customerNo==1}">
			<jsp:include page="/WEB-INF/views/common/QuickMenu.jsp"/>
		</c:if>
	</div>



	<jsp:include page="/WEB-INF/views/common/Footer.jsp"></jsp:include>


</body>
</html>