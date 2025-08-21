<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>영화 리뷰 등록</title></head>
<body>
    <h2>영화 리뷰 등록</h2>
    <form action="review" method="post">
        영화 제목: <input type="text" name="movieTitle" required><br><br>
        리뷰 내용: <textarea name="reviewText" rows="5" cols="50" required></textarea><br><br>
        <button type="submit">등록</button>
    </form>
    <p><a href="review">리뷰 목록 보기</a></p>
</body>
</html>
