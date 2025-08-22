<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 목록</title>
<style>
* {
	margin: 0;
	padding: 0;
}

section {
	width: 100%;
	height: calc(100vh - 160px);
	background-color: lightgray;
}

section h2 {
	text-align: center;
	padding: 10px;
}

section div {
	padding: 10px;
}

section p {
	padding-bottom: 10px;
}

section b {
	display: block;
	padding-bottom: 10px;
}

td {
	text-align: center;
	padding: 10px;
}

</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>영화 리뷰 목록</h2>
		<p>
			<a href="index.jsp">리뷰 등록하기</a>
		</p>
		<c:choose>
			<c:when test="${empty reviews}">
				<p>등록된 리뷰가 없습니다.</p>
			</c:when>
			<c:otherwise>
				<table border="1" cellpadding="8">
					<tr>
						<th>ID</th>
						<th>영화 제목</th>
						<th>리뷰 내용</th>
						<th>작성일</th>
					</tr>
					<c:forEach var="r" items="${reviews}">
						<tr>
							<td>${r.id}</td>
							<td>${r.movieTitle}</td>
							<td>${r.reviewText}</td>
							<td>${r.createdAt}</td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
