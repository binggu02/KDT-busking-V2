<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>게시물 수정</title>

  <link rel="stylesheet" href="css/common.css" />
  <link rel="stylesheet" href="css/main.css" />
  <link rel="stylesheet" href="./board.css" />
</head>

<body>
  <!-- 헤더 -->
  <header class="header">
      <div class="container header-inner">
        <a class="logo" href="../home.jsp">
          <img src="../buskinglogo.png" alt="BUSKING RESERVATION" class="logo-icon" />
        </a>

  	  <nav class="nav">
  	      <a href="../gear/list.jsp">장비 예약</a>
  	      <a href="../locale/list.jsp">지역별 장소 예약</a>
  	      <a href="../board/main.jsp">게시판</a>
  	    </nav>

  	    <div class="auth">
  	      <a class="pill" href="../mypage/main.jsp">my page</a>
  	      <a class="pill" href="../member/login.jsp">logout</a>
  	    </div>
  	  </div>
  </header>

  <!-- 본문 -->
  <main class="main">
    <div class="container board-wrap">
      <h2 class="board-title">게시물 수정</h2>

      <form action="/board/update" method="post" class="board-form">
        <!-- 게시물 번호 (hidden) -->
        <input type="hidden" name="boardId" value="${board.id}" />

        <!-- 제목 -->
        <div class="form-group">
          <label>제목</label>
          <input
            type="text"
            name="title"
            value="${board.title}"
            required
          />
        </div>

        <!-- 내용 -->
        <div class="form-group">
          <label>내용</label>
          <textarea
            name="content"
            rows="10"
            required
          >${board.content}</textarea>
        </div>

        <!-- 버튼 -->
        <div class="form-buttons">
          <button type="submit" class="btn primary">수정 완료</button>
          <a href="/board/detail?id=${board.id}" class="btn">취소</a>
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
