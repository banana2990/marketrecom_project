<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<td>환영합니다. <spring:eval expression="@config['manager.id']" /> 님
</td>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCA Service</title>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
/* font-family: 'Do Hyeon', sans-serif; 쓸 때 이것만 넣어주세요 제목 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
/* font-family: 'Noto Sans KR', sans-serif;  쓸 때 이것만 넣어주세요 이건 글 폰트*/


table {
	position: relative;
	top: 120px;
	left: 300px;
	height: 300px;
	width: 1000px;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	border-collapse: collapsed;
	padding: 5px;
}

.page-link {
	position: relative;
	right: 5px;
	top: 120px;
}

.nav{

}
</style>

<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>

	<a href="admin_member"><div>회원관리</div></a>
	<a href="admin_faqboard"><div>문의글관리</div></a>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${adminlist}" var="market_board">
			<tr>
				<td>${market_board.board_idx}</td>
				<td><a
					href="detail?idx=${market_board.board_idx}&type=${type}&pri=${market_board.private_bbs}&adminpage=${currPage}">${market_board.subject} [${market_board.com_total}]</a>
				</td>				
				<td>${market_board.id}</td>
				<td>${market_board.reg_date}</td>
				<td>${market_board.bHit}</td>
				<td><input type="button"
					onclick="ajaxCall(${market_board.board_idx})" value="삭제" id="Del" />
				</td>
			</tr>
		</c:forEach>
		<tr>
		</tr>
	</table>
	
	<div class="text-center">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="./admin?page=i"><span>처음</span></a>
				<a id="prevPage" class="page-link" href="./admin?page=${currPage-1}"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
					class="sr-only">Previous</span>
			</a>
			<li class="page-link">
			<c:forEach var="i" begin="${1}" end="${endPage}">		 	
				<a href="./admin?page=${i}">${i}</a>
			</c:forEach>
			</li>
			<li class="page-item"><a id="nextPage" class="page-link"
				href="./admin?page=${currPage+1}" aria-label="Next"> <span
					aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
			</a> <a class="page-link" href="./admin?page=${endPage}"><span>끝</span></a>
			</li>
			
		</ul>
	</div>
	</div>
	</div>
	
<script>

//삭제 버튼
	function ajaxCall(board_idx){
		
		if(confirm('삭제하시겠습니까?')){
			$.ajax({
				url:"admindel",
				type:'GET',
				data:{'board_idx':board_idx},
				dataType:'JSON',
				success:function(d){	
					//디비랑 페이지가 삭제되지만 페이지 새로고침이 안된다.
					console.log("성공했니?");
					location.reload();//페이지 새로고침	
				},
				error:function(e){
					console.log(e);
				}
			});
		}else{
			("취소")
		}
	}
	
	
	var endPage = ${endPage};
	var end = ${end}; //오른쪽
	var start =${start}; //왼쪽
	var currPage = ${currPage}; //현재 페이지
	var listCount = ${listCount};

	
</script>


</html>