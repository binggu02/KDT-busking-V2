<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>게시물 수정</title>
    <!-- 공통 CSS -->
    <link rel="stylesheet" href="../css/common.css" />
    <link rel="stylesheet" href="../css/main.css" />

    <!-- board 전용 CSS -->
    <link rel="stylesheet" href="../css/board.css" />
  </head>

  <body>

  <!-- ✅ 공통 헤더 -->
  <header class="header">
    <divs="container header-inner">
  	<a class="logo" href="<%= request.getContextPath() %>/">
  	  <img src="../images/buskinglogo.png"
  	       alt="BUSKING RESERVATION"
  	       class="logo-icon" />
  	</a>
	<nav class="nav">
	  <a href="<%= request.getContextPath() %>/gear/list">장비 예약</a>
	  <a href="<%= request.getContextPath() %>/locale/list">지역별 장소 예약</a>
	  <a href="<%= request.getContextPath() %>/board/main">게시판</a>
	</nav>

	<div class="auth">
	  <a class="pill" href="<%= request.getContextPath() %>/mypage/main">my page</a>
	  <a class="pill" href="<%= request.getContextPath() %>/member/logout">logout</a>
	</div>
	</div>
	
  </header>
  <!-- 본문 -->
  <main class="main">
    <div class="container board-wrap">

      <!-- 제목 -->
      <h2 class="board-title">게시글 수정</h2>

      <!-- 수정 카드 -->
      <div class="board-box board-edit-box">
        <form action="<%= request.getContextPath() %>/board/update"
              method="post"
              class="board-form">

          <!-- 게시물 번호 -->
          <input type="hidden" name="boardId" value="${board.id}" />

          <!-- 제목 -->
          <div class="form-group">
            <label class="form-label">제목</label>
            <input
              type="text"
              name="title"
              class="form-input"
              value="${board.title}"
              placeholder="제목을 입력하세요"
              required
            />
          </div>

          <!-- 내용 -->
          <div class="form-group">
            <label class="form-label">내용</label>
            <textarea
              name="content"
              class="form-textarea"
              rows="12"
              placeholder="내용을 입력하세요"
              required
            >${board.content}</textarea>
          </div>

          <!-- 버튼 영역 -->
          <div class="form-buttons">
            <button type="submit" class="btn btn-primary">
              수정 완료
            </button>
            <a
              href="<%= request.getContextPath() %>/board/detail?id=${board.id}"
              class="btn btn-secondary"
            >
              취소
            </a>
          </div>

        </form>
      </div>

    </div>
  </main>

  <footer class="footer">
    <div class="container">
      <p>© Busking Reservation</p>
    </div>
  </footer>
</body>
</html>
