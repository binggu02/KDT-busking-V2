<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>장비 예약</title>

  <!-- 공통 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/gear/gear.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/gear/gearreserve.css" />
</head>
<body>
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

<main class="main">
  <div class="container">

    <form method="post"
          action="${pageContext.request.contextPath}/gear/reserve"
          id="reserveForm">

      <!-- 🔥 gearId는 컨트롤러에서 내려줌 -->
      <input type="hidden" name="gearId" value="${gearId}" />

      <div class="row">
        <label>대여 시작</label>
        <input type="datetime-local" name="startDT" required />
      </div>

      <div class="row">
        <label>대여 종료</label>
        <input type="datetime-local" name="endDT" required />
      </div>

      <button type="submit" class="reserve-btn">예약하기</button>
    </form>

    <!-- 🔴 에러 메시지 -->
    <c:if test="${not empty sessionScope.errorMessage}">
      <p style="color:red; margin-top:15px;">
        ${sessionScope.errorMessage}
      </p>
      <c:remove var="errorMessage" scope="session"/>
    </c:if>

  </div>
</main>

<script>
  document.getElementById("reserveForm").addEventListener("submit", (e) => {
    const start = document.querySelector("[name=startDT]").value;
    const end   = document.querySelector("[name=endDT]").value;

    if (new Date(start) >= new Date(end)) {
      alert("종료 시간이 시작 시간보다 이후여야 합니다.");
      e.preventDefault();
    }
  });
</script>

<footer class="footer">
  <div class="container">
    <p>© Busking Reservation</p>
  </div>
</footer>

</body>
</html>
