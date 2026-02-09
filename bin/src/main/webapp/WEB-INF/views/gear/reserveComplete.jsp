<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>장비 예약 완료</title>

  <!-- 공통 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/gear/gear.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/gear/gearreserve.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/gear/gearreserveComplete.css" />
</head>
<body>

<!-- 헤더 -->
<header class="header">
  <div class="container header-inner">
    <a class="logo" href="${pageContext.request.contextPath}/">
      <img src="${pageContext.request.contextPath}/buskinglogo.png" alt="BUSKING RESERVATION" class="logo-icon"/>
    </a>

    <nav class="nav">
      <a href="${pageContext.request.contextPath}/gear/list">장비 예약</a>
      <a href="${pageContext.request.contextPath}/locale/list">지역별 장소 예약</a>
      <a href="${pageContext.request.contextPath}/board">게시판</a>
    </nav>

    <div class="auth">
      <a class="pill" href="${pageContext.request.contextPath}/mypage">my page</a>
      <a class="pill" href="${pageContext.request.contextPath}/member/logout">logout</a>
    </div>
  </div>
</header>

<main class="main complete-main">
  <div class="container">
    <div class="complete-box">
      <h2>🎉 예약이 완료되었습니다!</h2>

      <div class="complete-actions">
        <button onclick="location.href='${pageContext.request.contextPath}/gear/list'">
          장비 더 보기
        </button>

        <button onclick="location.href='${pageContext.request.contextPath}/mypage'">
          마이페이지
        </button>
      </div>
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
