<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>영화 리뷰 등록</title>
<style>
	*{
		margin : 0;
		padding : 0;
	}
	
	
	section{
		width: 100%;
		height: calc(100vh - 160px);
		background-color: lightgray;
	}
	section h2{
		text-align: center;
		padding: 10px;
	}
	section div{
		padding: 10px;
	}
	section p{
		padding-bottom: 10px;
	}
	section b{
		display: block;
		padding-bottom: 10px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2>영화 리뷰 등록</h2>
	<div>
	<form action="review" method="post">
		영화 제목: <input type="text" name="movieTitle" required><br>
		<br> 리뷰 내용:
		<textarea name="reviewText" rows="5" cols="50" required></textarea>
		<br>
		<br>
		<button type="submit">등록</button>
	</form>
	<p>
		<a href="review">리뷰 목록 보기</a>
	</p>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>