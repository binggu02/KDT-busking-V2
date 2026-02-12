<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>게시글 작성</title>
  <!-- 공통 CSS -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css" />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css" />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css" />
  <body>

	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

  <!-- 본문 -->
  <main class="main">
    <div class="container board-wrap">
      <h2 class="board-title">게시글 작성</h2>

	  <div class="board-create-box">
	    <h2 class="board-title">게시글 작성</h2>

	    <form action="<%= request.getContextPath() %>/board/write" method="post" class="board-form">

	      <!-- 게시판 종류 -->
	      <div class="form-group">
	        <label>게시판</label>
	        <select name="category" required>
	          <option value="FREE">자유게시판</option>
	          <option value="QNA">Q&A</option>
	        </select>
	      </div>

	      <!-- 제목 -->
	      <div class="form-group">
	        <label>제목</label>
	        <input type="text" name="title" placeholder="제목을 입력하세요" required />
	      </div>

	      <!-- 내용 -->
	      <div class="form-group">
	        <label>내용</label>
	        <textarea name="content" rows="10" placeholder="내용을 입력하세요" required></textarea>
	      </div>

	      <!-- 버튼 -->
	      <div class="form-buttons">
	        <button type="submit" class="btn-primary">작성 완료</button>
	        <a href="<%= request.getContextPath() %>/board/main" class="btn-secondary">취소</a>
	      </div>

	    </form>
	  </div>

      </form>
    </div>
  </main>

  <footer class="footer">
    <div class="container">
      <p>© Busking Reservation</p>
    </div>
  </footer>
</body>
</html>
