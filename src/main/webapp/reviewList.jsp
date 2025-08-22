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
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
}

/* 전체 섹션 */
section {
    width: 100%;
    min-height: calc(100vh - 160px);
    display: flex;
    flex-direction: column;
    align-items: center; /* 가운데 정렬 */
    padding: 30px 0;
    background-color: lightgray;
}

section h2 {
    margin-bottom: 20px;
    font-size: 28px;
    color: #333;
}

/* 링크 스타일 */
section p a {
    display: inline-block;
    margin-bottom: 20px;
    text-decoration: none;
    padding: 8px 16px;
    background-color: #ff69b4;
    color: white;
    border-radius: 5px;
    transition: background-color 0.3s;
}

section p a:hover {
    background-color: #ff85c1;
}

/* 테이블 스타일 */
table {
    border-collapse: collapse;
    width: 80%;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

th, td {
    border: 1px solid #ccc;
    padding: 12px 15px;
    text-align: center;
}

th {
    background-color: #ff69b4;
    color: white;
    font-size: 16px;
}

td {
    font-size: 15px;
    color: #333;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #ffe4f1;
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
            <table>
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
