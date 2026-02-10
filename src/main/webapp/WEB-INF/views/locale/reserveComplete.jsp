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
  <link rel="stylesheet" href="<c:url value='/css/locale/list.css'/>" />
</head>

<body>
<header class="header">
  <div class="container header-inner">
    <a class="logo" href="<c:url value='/'/>">
      <img src="<c:url value='/images/buskinglogo.png'/>" alt="BUSKING"/>
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
    <h2>예약 완료</h2>

    <div class="reservation-complete">
      <p>예약이 정상적으로 완료되었습니다!</p>

      <div class="reservation-info">
        <p><strong>장소:</strong> ${reservation.place.placeName}</p>
        <p><strong>주소:</strong> ${reservation.place.placeAddress}</p>
        <p><strong>전화:</strong> ${reservation.place.placePhone}</p>
        <p><strong>예약자:</strong> ${userName}</p>
        <p><strong>밴드명:</strong> ${reservation.bandName}</p>
        <p><strong>인원:</strong> ${reservation.bandCount}</p>
        <p><strong>날짜/시간:</strong> ${reservation.reservationDate} ${reservation.startTime}</p>
        <p><strong>전화번호:</strong> ${reservation.phone}</p>
        <p><strong>이메일:</strong> ${reservation.email}</p>
      </div>

      <div class="actions">
        <a href="<c:url value='/'/>" class="region-btn">홈으로 돌아가기</a>
      </div>
    </div>
  </div>
</main>

</body>
</html>
