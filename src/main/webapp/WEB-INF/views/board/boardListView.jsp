<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
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
#tableSize{
   width: 1080px;
   
}
#img{
   margin-top: 50px;
   margin-bottom: 20px;
   
}

#board{
   width: 1080px;
     height: 500px;  
   
}

#title{
   width: 500px;   
}
#no{
   width: 50px;   
}
.customerIdTd{
   width: 70px;
   text-align: left;
   border-color: #ff69b4;

}
.createDateTd{
   width: 120px;
   border-color: #ff69b4;
   
}
#view{
   width: 30px;
}



#typing{
   width: 100px;
   height: 40px;
   font-size: 17px;
   margin-bottom: 20px;
   
}

#addtable{
   border: none;
}

#paging{
   margin-top: 100px;
}

#pagingForm{
margin-left: 250px;
}


#searchOption{
   width: 1080px;
   height: 50px;
   
   
   
}

#option{
    width: 100px;
      height: 40px;
      vertical-align: top;
      margin-left: 30px;
      float: left; 
      padding-left: 7px;
      border-top-left-radius: 50px;
     border-bottom-left-radius: 50px;
     border-bottom-right-radius: 50px;
     border-top-right-radius: 50px;
     border-style: none;
     margin-right: 10px;   

}

#searchBnt{
   vertical-align: top;
    text-decoration: none;
     display: inline-block;
     width: 70px;
      height: 34px;
      background-color: #FF1555; 
      color: white; 
      padding: 0px 0px 0px 0px;        
      border: none; 
      border-radius: 5px;
      text-align:center; 
      cursor: pointer; 
      font-size: 14px;
      vertical-align: top;
      cursor: pointer;

}
#imgDiv{
   width: 1078px;
   height: 300px;
   border-collapse: collapse;
   border: 1px solid black;
   text-align: center;
   margin-bottom: 10px;

}
#boardViewTh{
   width: 50px;
   margin: 0px;
   padding: 0px;
}

#boardTitleTh{
   width: 700px;
   margin: 0px;
   padding: 0px;
}
.listBoardNo{
   text-align: center;
   border-color: #ff69b4;
   
}
.listBoardTitle{
   text-align: left;
   cursor: pointer;
   border-color: #ff69b4;
   
}
.listBoardTitle:hover{
   background: #ff69b4;
}
.listBoardViewCount{
   text-align: center;
   width: 72px;
   border-color: #ff69b4;
}
#customerIdTh{
   width: 200px;
   margin: 0px;
   padding: 0px;
}
#boardNoTh{
   width: 100px;
   margin: 0px;
   padding: 0px;
}
#customerIdTh{
   width: 100px;
   margin: 0px;
   padding: 0px;
}
#createDateTh{
   width: 200px;
   margin: 0px;
   padding: 0px;
}


.btnAdd{
     text-decoration: none;
     display: inline-block;
     width: 100px;
      height: 40px;
      background-color: #FF1555; 
      color: white; 
      padding: 0px 0px 0px 0px;        
      margin-top: 50px;
      border: none; 
      border-radius: 5px;
      text-align:center; 
      cursor: pointer; 
      font-size: 14px;
      float: right;
}

.boardHead{
   background-color: #ff69b4;
   width: 100px;
   height: 30px;
   text-align: center;
   margin-bottom: 0px;
   border-color: #ff69b4;
   
}


.detail{
   text-decoration: none;
   
}

table{
    width: 1080px;
   border-collapse: separate;
    border-spacing: 1px; 
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin : 20px 0px;
    text-align: center;
    border-collapse: collapse;
    border-color: #ff69b4;
}
th{

    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
td{

    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
#wholeSearchDiv{
       display: table;
       width: 400px;
       margin: auto;
       overflow: hidden;
       float: left; 
   }
#wholeSearchDiv .searchDiv{
   display: table-cell;
}
#wholeSearchDiv .searchDiv:last-child {
   width: 1px;
}
#searchBtn{
     cursor: pointer; 

}
input[type=search], #searchBtn{
   width: 100%;
     height: 40px;
     border-style: none;      
     -moz-box-sizing: border-box;
     box-sizing: border-box;
      vertical-align: top; 
        
  
/*         font-family: inherit; */
/*         font-size: inherit; */
}
input[type=search] {
   margin: 0;
   padding: 0 15px;
   
   background-color: white;
   
   border: 0;
   border-top-left-radius: 50px;
   border-bottom-left-radius: 50px;
}
input:focus{
   outline: 0;
}
#searchBtn{
   line-height: 40px;

   margin: 0;
   padding: 0 20px;
   
   color: white;
   background-color: #FF4C93;
    font-weight: bold;
   
     
   border-top-right-radius: 50px;
   border-bottom-right-radius: 50px;
   
     white-space: nowrap;
}
</style>
<meta charset="UTF-8">
<title>자유게시판</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script type="text/javascript">
	function addFnc() {
		location.href='./boardAdd.do?';
		
	}
	function goDetailFnc(boardNo, curPage) {
		location.href='./boardViewCountCtr.do?boardNo=' + boardNo + '&curPage=' + curPage;
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
		<div id="basketListTitleDiv">
			<p id="ldquoLeft">&ldquo;</p>
			<p id="basketListTitleP">자유게시판</p>
			<p id="rdquoRight">&rdquo;</p>
		</div>				
		<div id="board">
			<table>
				<tr>
					<th id="boardNoTh" class="boardHead">번호</th>
					<th id="boardTitleTh" class="boardHead">제목</th>
					<th id="customerIdTh" class="boardHead">글쓴이</th>
					<th id="createDateTh" class="boardHead">등록날짜</th>
					<th id="boardViewTh" class="boardHead">조회수</th>
				</tr>		
				<c:forEach var="boardCtmDto" items="${boardList}">
				<tr>
					<td class="listBoardNo">${boardCtmDto.boardNo}</td>
					<td class="listBoardTitle" onclick="goDetailFnc(${boardCtmDto.boardNo}, ${pagingMap.customerPaging.curPage});">
					<c:if test="${boardCtmDto.rcount eq '0'}">
						${boardCtmDto.boardTitle}
					</c:if>
					<c:if test="${boardCtmDto.rcount > '0'}">
						${boardCtmDto.boardTitle}(${boardCtmDto.rcount})					
					</c:if>
					</td>
					<td class="customerIdTd">${boardCtmDto.customerId}</td>
					<td class="createDateTd">
						<fmt:formatDate value="${boardCtmDto.boardCreDate}"
							pattern="yyyy-MM-dd"/>
					</td>
					<td class="listBoardViewCount" class="content">${boardCtmDto.boardViewCount}</td>
				</tr>
				</c:forEach>
			</table>
		</div>	
		
		<div>
			<input class="btnAdd" type="button" value="글쓰기" onclick="addFnc();" >			
		</div>						

				
		<div id="paging">
			<jsp:include page="/WEB-INF/views/common/Paging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap"/>
			</jsp:include>
		</div>
			<input type="hidden" id="tempCurPage" name="tempCurPage" value="${pagingMap.customerPaging.curPage}">			
			<div id="searchOption">		
				<form id="pagingForm" action="./board.do" method="post">
					<select id="option" name="searchOption">
						<c:choose>
							<c:when test="${searchMap.searchOption == 'all'}">
								<option value="all" selected="selected">제목+내용</option>
								<option value="board_title">제목</option>
								<option value="board_content">내용</option>
							</c:when>
							<c:when test="${searchMap.searchOption == 'board_title'}">
								<option value="all">제목+내용</option>
								<option value="board_title" selected="selected">제목</option>
								<option value="board_content">내용</option>
							</c:when>
							<c:when test="${searchMap.searchOption == 'board_content'}">
								<option value="all">제목+내용</option>
								<option value="board_title">제목</option>
								<option value="board_content" selected="selected">내용</option>
							</c:when>
						</c:choose>
					</select>
						<div id="wholeSearchDiv">
							<div class="searchDiv">
								<span>
									<input type="search" name="keyword" value="${searchMap.keyword}" 
											placeholder="여기에 검색해주세요"
											onkeyup="preventSpaceFnc(this); searchMaxByteFnc(this);"
											onchange="preventSpaceFnc(this);">
								</span>
							</div>
							<div class="searchDiv">
								<span>
									<input type="button" id="searchBtn" value="검색">
								</span>
							</div>
						</div>
				</form>
			</div>
		<c:if test="${customer.customerNo==1}">
			<jsp:include page="/WEB-INF/views/common/QuickMenu.jsp"/>
		</c:if>
		</div>
		
			<jsp:include page="/WEB-INF/views/common/Footer.jsp"></jsp:include>
	
							

</body>
</html>