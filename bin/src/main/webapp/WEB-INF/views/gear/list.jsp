<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>장비 목록</title>

  <link rel="stylesheet" href="../common.css" />
  <link rel="stylesheet" href="../main.css" />
  <link rel="stylesheet" href="./gear.css" />
</head>
<body>
  <header class="header">
    <div class="container header-inner">
      <a class="logo" href="${pageContext.request.contextPath}/">
        <img src="../buskinglogo.png" alt="BUSKING RESERVATION" class="logo-icon" />
      </a>

      <nav class="nav">
		<a href="${pageContext.request.contextPath}/gear/reserve?gearId==${gear.id}">장비 예약</a>
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
    <section class="gear-grid">

      <!-- 🔥 DB에서 불러온 장비 목록 -->
      <c:forEach var="gear" items="${gearList}">
        <a class="gear-link" href="/gear/reserve?gearId=${gear.gearId}">
          <div class="gear-card">

            <div class="thumb"
                 style="background-image:url('${empty gear.gearThumbnail ? "../default.jpg" : gear.gearThumbnail}')">
            </div>

            <div class="card-body">
              <div class="card-title">${gear.gearName}</div>
              <div class="card-price">${gear.gearPrice}원</div>
              <div class="card-desc">${gear.gearDescription}</div>
            </div>

          </div>
        </a>
      </c:forEach>

    </section>
  </div>
</main>

</body>
</html>
