<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
		<style>
			table,th,td{
			border: 1px solid black;
			padding: 10px;
			border-collapse: collapse;
			margin: 5px;
			text-align: center;
			}
		
			th{
			border-bottom: 1px solid 5px;
			}
		</style>
		<script src = "https://code.jquery.com/jquery-3.5.1.min.js"></script>
	</head>
	<body>
		<button onclick="location.href='typelist?type=0'">자유게시판</button>
		<button onclick="location.href='typelist?type=1'">고객센터</button>
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>	
			</thead>
			<tbody>
				<c:forEach items="${list}" var="bbs">
					<tr>
					<td>${bbs.board_idx}</td>
					<td>
						<a href="detail?idx=${bbs.board_idx}&type=${type}&pri=${bbs.private_bbs}">${bbs.subject}</a>
					</td>
					<td>${bbs.id}</td>
					<td>${bbs.reg_date}</td>
					<td>${bbs.bHit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button onclick="location.href='writeForm?type=${type}'">글쓰기</button>
		</body>
	<script>
	
		var msg = "${msg}";
		if(msg !=""){
			alert(msg);
		}
		
	</script>
	</html>