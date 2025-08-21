<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>영화 리뷰 목록</title>
</head>
<body>
  <h2>영화 리뷰 목록</h2>
  <p><a href="index.jsp">리뷰 등록하기</a></p>

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
</body>
</html>
