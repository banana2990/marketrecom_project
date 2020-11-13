<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCA Service</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
/* font-family: 'Do Hyeon', sans-serif; 쓸 때 이것만 넣어주세요 제목 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
/* font-family: 'Noto Sans KR', sans-serif;  쓸 때 이것만 넣어주세요 이건 글 폰트*/
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<c:import url="../navi.jsp"></c:import>
		<div>
			<c:if test="${param.age_10 ne null}">${param.age_10}대</c:if>
			<c:if test="${param.age_20 ne null}">${param.age_20}대</c:if>
			<c:if test="${param.age_30 ne null}">${param.age_30}대</c:if>
			<c:if test="${param.age_40 ne null}">${param.age_40}대</c:if>
			<c:if test="${param.age_50 ne null}">${param.age_50}대</c:if>
			<c:if test="${param.age_60 ne null}">${param.age_60}대 이상</c:if>
			<c:if test="${param.age_total ne null}">${param.age_total} 연령</c:if>
			
			<c:if test="${param.day_1 ne null}">${param.day_1}</c:if>
			<c:if test="${param.day_2 ne null}">${param.day_2}</c:if>
			<c:if test="${param.day_total ne null}">${param.day_total}</c:if>
			
			<c:if test="${param.time_1 ne null}">${param.time_1}</c:if>
			<c:if test="${param.time_2 ne null}">${param.time_2}</c:if>
			<c:if test="${param.time_3 ne null}">${param.time_3}</c:if>
			<c:if test="${param.time_4 ne null}">${param.time_4}</c:if>
			<c:if test="${param.time_5 ne null}">${param.time_5}</c:if>
			<c:if test="${param.time_6 ne null}">${param.time_6}</c:if>
			<c:if test="${param.time_total ne null}">${param.time_total} 시간</c:if>
			적합한 곳은 ${msg} 입니다.
			여기에는 ${Sectors} 집이 많이 있습니다.
			<br/>
			<button onclick=save()>스크랩하기</button>
			<div>
				스크랩 제목<br/>
				<input type="text" value="" id="sub">
			</div>
		</div>
		<c:if test="${fileName ne null and fileName ne ''}">
		<iframe src="/photo/${fileName}" width="70%" height="500px" style="border:none"></iframe>
	</c:if>
</body>
<script>
function save(){
	var loginId = "${sessionScope.loginid }";
	var subject = $("#sub").val();
	var url = null;
	var param = "${param}";
	$.ajax({
		url : "scriptsave",
		type : 'get',
		data : {
		"subject" : subject,
		"param":param,
		"loginId":loginId,
		},
		dataType : 'json',
		success : function(data) {
		console.log(data);
				alert(data.msg);
				location.reload();
		},
		error : function(e) {
			console.log(e);
		}

	});
}

</script>
</html>