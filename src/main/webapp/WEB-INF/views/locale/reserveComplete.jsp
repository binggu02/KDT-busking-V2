<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>예약 완료</title>

  <!-- ✅ static/css 기준 -->
  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/locale/list.css'/>" />
</head>

<body>
  <!-- ✅ 헤더 (기존 틀 유지) -->
  <header class="header"
          style="background-image: url('<c:url value='/images/busking.png'/>');">
    <div class="container header-inner">
      <a class="logo" href="<c:url value='/'/>">
        <img src="<c:url value='/images/buskinglogo.png'/>"
             alt="BUSKING RESERVATION" class="logo-icon" />
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

  <!-- ✅ 본문: 예약 완료 정보 -->
  <main class="main">
    <div class="container">
      <h2 style="margin-bottom:16px;">예약 완료</h2>

      <div class="reservation-complete">
        <p>예약이 정상적으로 완료되었습니다!</p>

        <div class="reservation-info">
          <p><strong>장소:</strong> <span id="placeName">-</span></p>
          <p><strong>주소:</strong> <span id="placeAddr">-</span></p>
          <p><strong>전화:</strong> <span id="placePhone">-</span></p>
          <p><strong>예약자:</strong> <span id="userName">-</span></p>
          <p><strong>밴드명:</strong> <span id="bandName">-</span></p>
          <p><strong>인원:</strong> <span id="bandCount">-</span></p>
          <p><strong>날짜/시간:</strong> <span id="datetime">-</span></p>
          <p><strong>전화번호:</strong> <span id="phone">-</span></p>
          <p><strong>이메일:</strong> <span id="email">-</span></p>
        </div>

        <div class="actions" style="margin-top:24px;">
          <button id="goHome" class="region-btn">홈으로 돌아가기</button>
        </div>
      </div>
    </div>
  </main>

  <footer class="footer">
    <div class="container">
      <p>© Busking Reservation</p>
    </div>
  </footer>

  <script>
    // ✅ sessionStorage에서 예약 정보 가져오기
    const reservationRaw = sessionStorage.getItem('localReservationInfo');

    if (!reservationRaw) {
      alert('예약 정보가 없습니다. 홈으로 이동합니다.');
      location.href = "<c:url value='/'/>";
    } else {
      const info = JSON.parse(reservationRaw);

      document.getElementById('placeName').textContent = info.place.name || '-';
      document.getElementById('placeAddr').textContent = info.place.address || '-';
      document.getElementById('placePhone').textContent = info.place.phone || '-';
      document.getElementById('userName').textContent = info.user.name || '-';
      document.getElementById('bandName').textContent = info.band.name || '-';
      document.getElementById('bandCount').textContent = info.band.count || '-';
      document.getElementById('datetime').textContent = `${info.datetime.date || '-'} ${info.datetime.time || '-'}`;
      document.getElementById('phone').textContent = info.phone || '-';
      document.getElementById('email').textContent = info.email || '-';

      // 예약 완료 후 sessionStorage 정리
      sessionStorage.removeItem('selectedPlace');
      sessionStorage.removeItem('localReservationInfo');
    }

    document.getElementById('goHome').addEventListener('click', () => {
      location.href = "<c:url value='/'/>";
    });
  </script>
</body>
</html>
