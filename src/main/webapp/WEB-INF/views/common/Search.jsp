<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

<style type="text/css">
	#wholeSearchDiv{
		 display: table;
		 width: 400px;
		 margin: auto;
		 margin-bottom: 10px;
		 overflow: hidden;
	}
	#wholeSearchDiv .searchDiv{
		display: table-cell;
	}
	#wholeSearchDiv .searchDiv:last-child {
		width: 1px;
	}
	input[type=search], #searchBtn{
		width: 100%;
  		height: 40px;
  		
  		border-style: none;
  		
  		-moz-box-sizing: border-box;
  		box-sizing: border-box;
  
/*   		font-family: inherit; */
/*   		font-size: inherit; */
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

<script type="text/javascript">
//공백 입력 방지
function preventSpaceFnc(obj) { 
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        alert("이 항목에는 공백을 입력하실 수 없습니다.");
        obj.focus();
        obj.value = obj.value.replace(/\s/gi, ""); // 공백제거
        return false;
    }
	// onkeyup="preventSpaceFnc(this);" onchange="preventSpaceFnc(this);"
}

//검색어 글자수 제한
function searchMaxByteFnc(obj) {
    var maxByte = 40; //최대 입력 바이트 수
    var str = obj.value;
    var strLength = str.length;
 
    var returnByte = 0;
    var returnLength = 0;
    var oneChar = "";
    var str2 = "";
 
    for (var i = 0; i < strLength; i++) {
        oneChar = str.charAt(i);
 
        if (escape(oneChar).length > 4) {
            returnByte += 2; //한글2Byte
        } else {
            returnByte++; //영문 등 나머지 1Byte
        }
 
        if (returnByte <= maxByte) {
            returnLength = i + 1; //return할 문자열 갯수
        }
    }
 
    if (returnByte > maxByte) {
        alert("한글 " + (maxByte / 2) + "자/영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
        str2 = str.substr(0, returnLength); //문자열 자르기
        obj.value = str2;
        fnChkByte(obj, maxByte);
    } else {
        document.getElementById('byteInfo').innerText = returnByte;
    }
}
</script>


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
			<input type="submit" id="searchBtn" value="검색">
		</span>
	</div>
</div>


	
<%-- <jsp:include page="/WEB-INF/views/common/Search.jsp"> --%>
	