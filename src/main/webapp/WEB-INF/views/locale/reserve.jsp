<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${pageTitle}</title>

  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/locale/reserve.css'/>" />
</head>

<body>
<header class="header">
  <div class="container header-inner">
    <a class="logo" href="<c:url value='/'/>">
      <img src="<c:url value='/images/buskinglogo.png'/>" alt="BUSKING" />
    </a>

    <nav class="nav">
      <a href="<c:url value='/gear/list'/>">장비 예약</a>
      <a href="<c:url value='/locale/list'/>" class="is-active">지역별 장소 예약</a>
      <a href="<c:url value='/board/list'/>">게시판</a>
    </nav>

    <div class="auth">
      <a class="pill" href="<c:url value='/mypage/main'/>">my page</a>
      <a class="pill" href="<c:url value='/member/logout'/>">logout</a>
    </div>
  </div>
</header>

<main class="main">
  <div class="container">

    <section class="reserve-layout">

      <!-- 선택 장소 -->
      <aside class="place-side">
        <div class="place-info">
          <div class="place-name">${place.name}</div>
          <div class="place-addr">${place.address}</div>
          <div class="place-phone">${place.phone}</div>
        </div>
      </aside>

      <!-- 입력 폼: 서버로 POST -->
      <section class="form-box">
        <form action="<c:url value='/locale/reserve'/>" method="post">
          <input type="hidden" name="placeId" value="${place.id}" />

          <div class="form-left">
            <div class="line">
              <span class="label">예약자 명 :</span>
              <span class="value">${userName}</span>
            </div>

            <div class="line input">
              <label class="label">밴드명 :</label>
              <input name="bandName" type="text" required />
            </div>

            <div class="line input">
              <label class="label">밴드 인원 :</label>
              <input name="bandCount" type="number" min="1" required />
            </div>

            <div class="line input">
              <label class="label">전화번호 :</label>
              <input name="phone" type="text" />
            </div>

            <div class="line input">
              <label class="label">이메일 :</label>
              <input name="email" type="email" />
            </div>
          </div>

          <div class="form-right">
            <div>
              <label>날짜</label>
              <input name="reservationDate" type="date" required />
            </div>
            <div>
              <label>시간</label>
              <input name="startTime" type="time" required />
            </div>
          </div>

          <div class="actions">
            <button type="submit">예약하기</button>
          </div>
        </form>
      </section>

    </section>

  </div>
</main>

<footer class="footer">
  <div class="container">
    <p>© Busking Reservation</p>
  </div>
</footer>
</body>
</html>
