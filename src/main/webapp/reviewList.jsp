<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.ReviewDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
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

/* 제목 */
section h2 {
    margin-bottom: 20px;
    font-size: 28px;
    color: #333;
}

/* 리뷰 박스 */
.review-box {
    width: 500px;
    background-color: #f0f0f0;
    padding: 20px;
    border-radius: 10px;
    margin-bottom: 20px;
}

.review-box p {
    margin-bottom: 10px;
    font-size: 16px;
    color: #333;
}

/* 구분선 */
hr {
    border: 0;
    height: 1px;
    background-color: #ccc;
    margin: 10px 0;
}

/* 링크 버튼 */
a {
    display: inline-block;
    text-decoration: none;
    padding: 10px 20px;
    background-color: #ff69b4;
    color: white;
    border-radius: 5px;
    transition: background-color 0.3s;
    margin-top: 20px;
}

a:hover {
    background-color: #ff85c1;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section>
    <h2>리뷰 목록</h2>
    <%
        List<ReviewDTO> reviews = (List<ReviewDTO>) request.getAttribute("reviews");
        if (reviews != null && !reviews.isEmpty()) {
            for (ReviewDTO r : reviews) {
    %>
        <div class="review-box">
            <p><b>영화 제목:</b> <%= r.getMovieTitle() %></p>
            <p><b>리뷰 내용:</b> <%= r.getReviewText() %></p>
            <p><b>작성일:</b> <%= r.getCreatedAt() %></p>
        </div>
    <%
            }
        } else {
    %>
        <p>아직 작성된 리뷰가 없습니다.</p>
    <%
        }
    %>
    <a href="index.jsp">리뷰 등록하러 가기</a>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
