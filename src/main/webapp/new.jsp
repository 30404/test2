<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 리뷰 확인</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: Arial, sans-serif; background-color: #f0f0f0; }

section {
    width: 100%;
    min-height: calc(100vh - 160px);
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 30px 0;
    background-color: lightgray;
}

section h2 { margin-bottom: 20px; font-size: 28px; color: #333; }

.review-box {
    width: 500px;
    background-color: #fff;
    padding: 15px;
    margin-bottom: 15px;
    border-radius: 10px;
    box-shadow: 0 0 5px rgba(0,0,0,0.1);
}

.review-box p { margin-bottom: 10px; font-size: 16px; }

section a {
    display: inline-block;
    margin-top: 20px;
    padding: 8px 16px;
    background-color: #ff69b4;
    color: white;
    border-radius: 5px;
    text-decoration: none;
}

section a:hover { background-color: #ff85c1; }
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section>
    <h2>등록된 리뷰 확인</h2>

<%
    request.setCharacterEncoding("UTF-8");

    // 세션에서 기존 리뷰 리스트 가져오기
    List<Map<String,String>> reviews = (List<Map<String,String>>) session.getAttribute("reviews");
    if (reviews == null) {
        reviews = new ArrayList<>();
    }

    // POST로 입력된 값 받기
    String movieTitle = request.getParameter("movieTitle");
    String reviewText = request.getParameter("reviewText");

    if (movieTitle != null && reviewText != null) {
        Map<String, String> review = new HashMap<>();
        review.put("title", movieTitle);
        review.put("text", reviewText);
        reviews.add(review);

        // 세션에 저장
        session.setAttribute("reviews", reviews);
    }

    if (reviews.isEmpty()) {
%>
        <p>아직 작성된 리뷰가 없습니다.</p>
<%
    } else {
        for (Map<String, String> r : reviews) {
%>
        <div class="review-box">
            <p><b>영화 제목:</b> <%= r.get("title") %></p>
            <p><b>리뷰 내용:</b> <%= r.get("text") %></p>
        </div>
<%
        }
    }
%>
    <a href="index.jsp">리뷰 등록하러 가기</a>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
