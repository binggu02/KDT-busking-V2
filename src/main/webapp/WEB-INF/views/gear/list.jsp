<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>장비 목록</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/gear/gear.css" />
</head>
<body>

<header class="header">
  <div class="container header-inner">
    <a class="logo" href="${pageContext.request.contextPath}/">
      <img src="${pageContext.request.contextPath}/buskinglogo.png"
           alt="BUSKING RESERVATION"
           class="logo-icon" />
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

    <c:if test="${not empty msg}">
      <div class="alert success">${msg}</div>
    </c:if>

    <section class="gear-grid">

      <c:forEach var="gear" items="${gearList}">
        <div class="gear-card">

          <div class="thumb"
               style="background-image:url('${empty gear.gearThumbnail
                 ? pageContext.request.contextPath.concat("/default.jpg")
                 : gear.gearThumbnail}')">
          </div>

          <div class="card-body">
            <div class="card-title">${gear.gearName}</div>
            <div class="card-price">${gear.gearPrice}원</div>
            <div class="card-desc">${gear.gearDescription}</div>
            <div class="card-desc">남은 수량: ${gear.gearQuantity}</div>

            <c:choose>
              <c:when test="${gear.gearQuantity < 1}">
                <div class="badge soldout">장비 수량이 부족합니다.</div>
              </c:when>
              <c:otherwise>
                <!-- ✅ 컨트롤러와 파라미터 이름 100% 일치 -->
                <a class="btn"
                   href="${pageContext.request.contextPath}/gear/reserve?gearId=${gear.id}">
                  예약하기
                </a>
              </c:otherwise>
            </c:choose>
          </div>

        </div>
      </c:forEach>

    </section>
  </div>
</main>

</body>
</html>
