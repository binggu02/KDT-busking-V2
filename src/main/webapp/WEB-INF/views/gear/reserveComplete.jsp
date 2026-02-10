<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>예약 완료</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/gear/gear.css" />
</head>
<body>

<header class="header">
  <div class="container header-inner">
    <a class="logo" href="${pageContext.request.contextPath}/">
      <img src="${pageContext.request.contextPath}/buskinglogo.png" alt="BUSKING RESERVATION" class="logo-icon" />
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
  <div class="container">
    <div class="complete-box">

      <h2>예약이 완료되었습니다 🎉</h2>

      <c:if test="${not empty msg}">
        <div class="alert success">${msg}</div>
      </c:if>

      <p>마이페이지에서 예약 내역을 확인할 수 있습니다.</p>

      <div class="actions">
        <a class="btn" href="${pageContext.request.contextPath}/gear/list">장비 목록으로</a>
        <a class="btn primary" href="${pageContext.request.contextPath}/mypage">마이페이지로</a>
      </div>

    </div>
  </div>
</main>

</body>
</html>
