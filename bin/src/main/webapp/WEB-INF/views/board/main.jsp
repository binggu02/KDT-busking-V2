<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>게시판</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/board/board.css" />
</head>

<body>
<header class="header">
  <div class="container header-inner">
    <a class="logo" href="${pageContext.request.contextPath}/">
      <img src="<c:url value='/images/buskinglogo.png'/>" class="logo-icon" alt="BUSKING RESERVATION"/>
    </a>

    <nav class="nav">
      <a href="${pageContext.request.contextPath}/gear/list">장비 예약</a>
      <a href="${pageContext.request.contextPath}/locale/list">지역별 장소 예약</a>
      <a href="${pageContext.request.contextPath}/board/main">게시판</a>
    </nav>

    <div class="auth">
      <a class="pill" href="${pageContext.request.contextPath}/mypage">my page</a>
      <a class="pill" href="${pageContext.request.contextPath}/member/logout">logout</a>
    </div>
  </div>
</header>

<main class="main">
  <div class="container board-wrap">

    <!-- 검색 -->
    <div class="board-search">
      <input type="text" placeholder="검색어를 입력하세요" />
      <button type="button">검색</button>
    </div>

    <!-- 탭 (URL 기반) -->
	<section class="board-tabs">
	  <a class="tab-btn ${type eq 'free' ? 'active' : ''}"
	     href="${pageContext.request.contextPath}/board/main?type=free">
	    <button type="button">자유게시판</button>
	  </a>

	  <a class="tab-btn ${type eq 'qna' ? 'active' : ''}"
	     href="${pageContext.request.contextPath}/board/main?type=qna">
	    <button type="button">Q&amp;A</button>
	  </a>
    </section>

    <!-- 자유게시판 -->
    <c:if test="${type eq 'free'}">
      <div class="board-box">
        <div class="board-row">
          <div class="board-left">
            <span class="doc-icon">📄</span>
            <div class="board-text">
              <a class="board-link"
                 href="${pageContext.request.contextPath}/board/view">
                게시글 제목 예시
              </a>
              <p class="board-sub">게시글 미리보기 내용</p>
            </div>
          </div>
          <div class="board-right">
            <div class="writer">dlwldnjs</div>
            <div class="date">2026-01-15</div>
          </div>
        </div>
      </div>
    </c:if>

    <!-- Q&A -->
    <c:if test="${type eq 'qna'}">
      <div class="board-box">
        <div class="board-row">
          <div class="board-left">
            <span class="doc-icon">❓</span>
            <div class="board-text">
              <a class="board-link"
                 href="${pageContext.request.contextPath}/board/qna/view">
                장비 대여는 어떻게 하나요?
              </a>
              <p class="board-sub">절차가 궁금합니다.</p>
            </div>
          </div>
          <div class="board-right">
            <div class="writer">dlwldnjs</div>
            <div class="date">2026-01-15</div>
          </div>
        </div>
      </div>
    </c:if>

  </div>
</main>

<footer class="footer">
  <div class="container">
    <p>© Busking Reservation</p>
  </div>
</footer>
</body>
</html>
