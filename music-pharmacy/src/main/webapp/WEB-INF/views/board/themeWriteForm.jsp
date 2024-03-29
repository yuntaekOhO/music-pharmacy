<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동의보감 글쓰기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style3.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/themeboard.js"></script>
</head>
<body>
<div>
	<jsp:include page="/WEB-INF/views/common/header2.jsp"/>
</div>

<div class="page">
	<a href="${pageContext.request.contextPath}/board/themeBoard.do">동의보감</a>
 	<p>음악추천게시판</p>
 		<div class="content-main">
		<h4>글쓰기</h4>
		<form id="write_form" action="themeWrite.do" 
		   method="post" enctype="multipart/form-data">
			<ul>
				<li>
					<label for="the_code"></label>
					<select name="the_code" id="the_code">
					      <option value="1">희喜</option>
					      <option value="2">노怒</option>
					      <option value="3">애哀</option>
					      <option value="4">락樂</option>
					</select>
					<label for="the_title"></label>
					<input type="text" name="the_title" 
					      id="the_title" maxlength="100" placeholder="제목을 입력하세요.">
				</li>
				<br>
				<li>
					<label for="mus_img">앨범 이미지</label>
					<input type="file" name="mus_img" id="mus_img" accept="image/gif,image/png,image/jpeg,image/jpg">
				</li>
				<li>
					<label for="mus_title">곡 제목</label>
					<input type="mus_title" name="mus_title" id="mus_title">
				</li>
				<li>
					<label for="mus_singer">가수</label>
					<input type="mus_singer" name="mus_singer" id="mus_singer">
				</li>
				<li>
					<label for="mus_album">앨범명</label>
					<input type="mus_album" name="mus_album" id="mus_album">
				</li>
				<li>
					<label for="mus_genre">장르</label>
					<select name="mus_genre" id="mus_genre">
					
						<option value="발라드">발라드</option>
						<option value="pop">pop</option>
						<option value="댄스">댄스</option>
						<option value="힙합">힙합</option>
						<option value="인디">인디</option>
						<option value="etc">etc</option>
					</select>
				</li> 
				<li>
					<label for="mus_date">발매일</label>
					<input type="date" name="mus_date" id="mus_date">
				</li>
				<li>
					<label for="mus_composer">작곡가</label>
					<input type="mus_composer" name="mus_composer" id="mus_composer">
				</li>
				<li>
					<label for="mus_songwiter">작사가</label>
					<input type="mus_songwiter" name="mus_songwiter" id="mus_songwiter">
				</li>
				<li>
					<label for="the_url">영상 링크</label>
					<input type="url" name="the_url" id="the_url">
				</li>
				<br>
				<li>
					<label for="the_content"></label>
					<textarea rows="30" cols="185" name="the_content"
					     id="the_content" placeholder="내용을 입력하세요."></textarea>
				</li>
				<li>
					<label for="the_img"></label>
					<input type="file" name="the_img" 
					 id="the_img" 
					 accept="image/gif,image/png,image/jpeg">
				</li>
				<!-- <li>
					<label for="the_video">관련 영상</label>
					<input type="file" name="the_video" 
					 id="the_video" 
					 accept="video/mp4,video/avi,video/wmv">
				</li> -->
				
				
			</ul>
			<div class="align-right">
				<input type="submit" class="correction_btn" value="등록">
				<input type="button" class="correction_btn" value="목록" 
				             onclick="location.href='themeBoard.do'">
			</div>
		</form>
	</div>
</div>
<div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</div>
</body>
</html>





