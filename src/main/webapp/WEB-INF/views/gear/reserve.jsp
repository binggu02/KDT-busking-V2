<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>장비 예약</title>

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

    <a href="${pageContext.request.contextPath}/gear/list" class="btn">← 목록으로</a>

    <div class="gear-detail">

      <div class="thumb large"
           style="background-image:url('${empty gear.gearThumbnail
             ? pageContext.request.contextPath.concat("/default.jpg")
             : gear.gearThumbnail}')">
      </div>

      <div class="detail-body">
        <h2>${gear.gearName}</h2>
        <p>${gear.gearDescription}</p>
        <p><b>가격:</b> ${gear.gearPrice}원</p>
        <p><b>남은 수량:</b> ${gear.gearQuantity}</p>

        <c:if test="${not empty error}">
          <div class="alert error">${error}</div>
        </c:if>

        <c:choose>
          <c:when test="${gear.gearQuantity < 1}">
            <div class="badge soldout">장비 수량이 부족합니다.</div>
          </c:when>

          <c:otherwise>
            <form action="${pageContext.request.contextPath}/gear/reserve/confirm" method="post" class="form">
              <input type="hidden" name="gearId" value="${gear.id}" />

              <label>시작 시간</label>
              <!-- ✅ 컨트롤러와 name 맞춤 -->
              <input type="datetime-local" name="startDT" required />

              <label>종료 시간</label>
              <!-- ✅ 컨트롤러와 name 맞춤 -->
              <input type="datetime-local" name="endDT" required />

              <button type="submit" class="btn primary">예약확정</button>
            </form>
          </c:otherwise>
        </c:choose>

      </div>
    </div>

  </div>
</main>

</body>
</html>
