<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

<style type="text/css">
	nav > ul{
		background-color: #EBEBEB;
		list-style-type: none;
		padding: 0px;
		display: table;
		overflow: hidden;
		margin-left: auto;
		margin-right: auto;
		margin-top: 0px;
		
		border-radius: 50px;
		box-sizing: border-box; 
		padding-left: 20px;
		padding-right: 20px;
	}
	
	nav > ul > li{
		float: left;
	}
	
	nav > ul > li > a{
		text-align: center;
		color: gray;
		display: block;
		padding: 12px;
		text-decoration: none;
	}
	
	nav > ul > li > a:hover {
		color: white;
		background-color: #DCA0FF;
		font-weight: bold;
	}
	
	.active{
		color: white;
		background-color: #83EDE2;
		font-weight: bold;
	}
</style>


<script type="text/javascript">

	function goPage(pageNumber) {
		var curPageObj = $('#tempCurPage');
		
		curPageObj.val(pageNumber);
		
		var formObj = document.getElementById('pagingForm');
		
		var htmlStr = '';
		htmlStr += '<input type="hidden" name="curPage"';
		htmlStr += 'value="' + curPageObj.val()+ '">';
		
		$("#pagingForm").html($("#pagingForm").html()+ htmlStr);
		
		$("#pagingForm").submit();
		
	} //goPage 끝
	
	
	$(document).ready(function() {
		var curPageDoc = $('#tempCurPage');
		
		var index = curPageDoc.val();
		index = ((index-1)%10)+1;
		
		$('#pageNation').find('li').eq(index).addClass('active');
	});
	
</script>




	<nav id='pageNation'>
		<ul>
			<li>
				<a href="#" onclick="goPage(${pagingMap.customerPaging.prevPage});"><span>&laquo</span></a>
			</li>
			
			<c:forEach var="num" begin="${pagingMap.customerPaging.blockBegin}" 
				end="${pagingMap.customerPaging.blockEnd}">
				
			<li id="pageButton${num}">
				<a href="#" onclick="goPage(${num});">
					<c:out value="${num}"/>
				</a>
			</li>
			
			
			</c:forEach>
			
			<li>
				<a href="#" onclick="goPage(${pagingMap.customerPaging.nextPage});"><span>&raquo</span></a>
			</li>
		</ul>
	</nav>