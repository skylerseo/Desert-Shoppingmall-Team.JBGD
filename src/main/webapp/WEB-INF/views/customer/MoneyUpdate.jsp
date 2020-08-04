<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐쉬 충전하기</title>

<script type="text/javascript" 
	src="/jbgd/resources/js/jquery-3.4.1.min.js"></script>

<style type="text/css">
/* 	노토산스 웹폰트 */
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100&display=swap');

	body, html{
		background-color: #f3f2f2;
		height: 100%; 
		margin: 0px;
	}
	#wholeDiv{
		text-align: center;
		font-family: 'Noto Sans KR', sans-serif;
		color: white;
	}
	#wholeMoneyUpdateDiv{
		width: 1080px;
 		display: inline-block;
		border-radius: 10px;  
 		box-sizing: border-box;  
 		background-color: #FAFAFA; 
 		padding-bottom: 50px; 
 		padding-top: 0px; 
 		margin-top: 20px;
 		
 		background-image: url("/jbgd/resources/img/macaron03.jpg");
 		background-repeat: no-repeat;
 		background-position : center;
 		background-size: cover;
	}
	#moneyUpdateTitleDiv{
		background-image: linear-gradient(to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
 		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	#moneyUpdateTitleText{
		font-size: 50px;
		padding-bottom: 10px;
		padding-top: 30px;
	}
	#moneyUpdateFormDiv{
		width: 1080px;
/* 		height: 1%;  */
/* 		overflow: hidden; */
		margin-top: 20px;
		font-size: 18px;
 		text-align: center;
	}
	.labelSpanDiv{
		width: 700px;
		
 		text-align: right;
	}
	.moneyUpdateLabel{
		width: 200px;
		margin-right: 25px;
		font-size: 16px;
/* 		font-weight: bold; */
	}
	.moneyUpdateSpan{
		margin-left: 0px;
		margin-right: 0px;
		font-size: 18px;
		text-align: center;
	}
	input[type=text], input[type=password], select { 
		width: 300px;
		height: 40px;
		padding: 5px 5px; 
		margin: 10px 10px; 
		display: inline-block;
		border-radius: 50px; 
		box-sizing: border-box; 
		
		padding-left: 20px;
		border-style: none;
		background-color: white;
	}
	input:focus, .btn:focus{
		outline: 0;
	}
	#idMoney, #idAfterMoney{
		width: 300px;
		height: 40px;
		padding: 5px 5px; 
		margin: 10px 10px; 
		display: inline-block; 
		box-sizing: border-box; 
		text-align: right;
		color: white;
/* 		font-weight: bold; */
		padding-right: 20px;
		background-color: rgba(0,0,0,0.1);
/* 		padding: 5px; */
		border-radius: 50px; 
	}
	#customerMoney, #customerPwd{
		text-align: right;
		padding-right: 20px;
	}
	.btn{
		width: 300px;
		height: 40px;
		padding: 5px 5px; 
		margin: 10px 10px;
		border: none; 
		border-radius: 50px; 
		cursor: pointer; 
		font-size: 16px;
		color: white;
		font-weight: bold;
	}
	#updateBtn{
		background-color: rgba(0,0,0,0.5);
	}
	#cancelBtn{
		background-color: rgba(0,0,0,0.3);
	}
	#footerDiv{
 		position:fixed;
    	bottom: 0px;
    	width: 100%;
    	margin: auto;
 	}
</style>

<script type="text/javascript">

	//캐쉬충전 유효성 검사
	function moneyUpdateValidationFnc() {
		
		var submitObj = document.getElementById("moneyUpdateForm");
		
		if ($("#customerMoney").val() == "") {
			alert("충전하실 캐쉬 금액을 입력해주세요");
			customerMoney.focus();
			return;
		}else if ($("#customerPwd").val() == "") {
			alert("비밀번호를 입력해주세요");
			customerPwd.focus();
			return;
		}else {
			submitObj.submit();
		}
	}
	
	// 뒤로가기(마이페이지)
	function pageMoveBeforeFnc(customerNo) {
		location.href = './myPage.do';
	}
	
	// 숫자만 입력 가능
	function onlyNumberFnc(){
		if(event.keyCode<48 || event.keyCode>57){
			event.returnValue=false;
		}
	}
	
	//비밀번호 글자수 제한
	function pwdMaxByteFnc(obj) {
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
	            returnByte += 3; //한글3Byte
	        } else {
	            returnByte++; //영문 등 나머지 1Byte
	        }
	 
	        if (returnByte <= maxByte) {
	            returnLength = i + 1; //return할 문자열 갯수
	        }
	    }
	 
	    if (returnByte > maxByte) {
	    	var alertText = "한글 " + Math.floor(maxByte/3) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.";
	        alert(alertText);
	        str2 = str.substr(0, returnLength); //문자열 자르기
	        obj.value = str2;
	        fnChkByte(obj, maxByte);
	    } else {
	        document.getElementById('byteInfo').innerText = returnByte;
	    }
	}
	
	// 공백 입력 방지
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
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	$(document).ready(function() {
		$("#basketItemVolume").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		})
		$('#customerMoney').keyup(function() {
			var customerMoney = $("#customerMoney").val();
			customerMoney *= 1;
			var idAfterMoney = $("#idAfterMoney");
			
			var total = addComma(customerMoney + ${customerDto.customerMoney});

			$("#idAfterMoney").html(total + '원');
		})
	})
</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/CustomerHeader.jsp"/>
<div id="wholeDiv">	

	<div id="wholeMoneyUpdateDiv">
	
		<div id="moneyUpdateTitleDiv">
			<div id="moneyUpdateTitleText">캐쉬 충전하기</div>
		</div>
	
		<div id="moneyUpdateFormDiv">
			<form id="moneyUpdateForm" action="./moneyUpdateCtr.do" method='post'>
			
				<div class="labelSpanDiv">
					<label class="moneyUpdateLabel">
						잔액
					</label>
					<span class="moneyUpdateSpan" id="idMoney">
	<%-- 					<fmt:formatNumber value="${customerDto.customerMoney}" --%>
	<%--  							type="currency" currencyCode="KRW"/> --%>
	 					<fmt:formatNumber 
	 						value="${customerDto.customerMoney}" pattern="#,###" />&nbsp;원
					</span>
				</div>
				<div class="labelSpanDiv">
					<label class="moneyUpdateLabel">
						충전할 캐쉬
					</label>
					<span class="moneyUpdateSpan">
						<input type="text" id="customerMoney" onkeypress="onlyNumberFnc();"
							name="customerMoney" placeholder="충전할 캐쉬 금액을 입력해주세요"
							maxlength="8">
					</span>
				</div>
				<div class="labelSpanDiv">
					<label class="moneyUpdateLabel">
						비밀번호
					</label>
					<span class="moneyUpdateSpan">
						<input type="password" id="customerPwd" onchange="preventSpaceFnc(this);"
							name="customerPwd" placeholder="비밀번호를 입력해주세요"
							onkeyup="pwdMaxByteFnc(this); preventSpaceFnc(this);">
					</span>
				</div>
				<div class="labelSpanDiv">
					<label class="moneyUpdateLabel">
						충전 후 잔액
					</label>
					<span class="moneyUpdateSpan" id="idAfterMoney">
	<%-- 				<fmt:formatNumber value="${  customerMoney.val() + customerDto.customerMoney  }" --%>
	<%--  							type="currency" currencyCode="KRW"/> --%>
	 				<fmt:formatNumber value="${customerDto.customerMoney}" pattern="#,###" />&nbsp;원
					</span>
				</div>
				
				<div>
					<span>
						<input type='button' class="btn" id="updateBtn" value='충전'
							onclick="moneyUpdateValidationFnc();">
					</span>
				</div>
				<div>
					<span>
						<input type='button' class="btn" id="cancelBtn" value='취소'
							onclick="pageMoveBeforeFnc(${customerDto.customerNo});">
					</span>
				</div>
				
			</form>
		</div>
	</div>	
</div>	
<jsp:include page="/WEB-INF/views/common/Footer.jsp"/>
</body>
</html>