<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 등록</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* 전체 섹션 */
section {
    width: 100%;
    height: calc(100vh - 160px);
    background-color: lightgray;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* 제목 */
section h2 {
    text-align: center;
    padding: 10px;
}

/* form 박스 */
section div {
    padding: 20px;
    background-color: #f0f0f0;
    border-radius: 10px;
    text-align: center;
    width: 500px;
}

/* input, textarea 스타일 */
section div input[type="text"],
section div textarea {
    width: 90%;
    padding: 10px;
    font-size: 16px;
    margin-bottom: 15px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

/* 버튼 스타일 */
section div button {
    width: 50%;
    padding: 10px;
    font-size: 18px;
    border-radius: 5px;
    border: none;
    background-color: #ff69b4;
    color: white;
    cursor: pointer;
}

section div button:hover {
    background-color: #ff85c1;
}

/* 링크 스타일 */
section div p {
    padding-top: 10px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section>
    <div>
        <h2>영화 리뷰 등록</h2>
        <form action="new.jsp" method="post">
            영화 제목:<br>
            <input type="text" name="movieTitle" required><br><br>
            
            리뷰 내용:<br>
            <textarea name="reviewText" rows="5" cols="50" required></textarea><br><br>
            
            <button type="submit">등록</button>
        </form>
        <p>
            <a href="new.jsp">등록한 리뷰 확인하기</a>
        </p>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
