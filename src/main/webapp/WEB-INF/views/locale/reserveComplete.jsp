<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${pageTitle}</title>

  <!-- static/css 기준 -->
  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/locale/list.css'/>" />
</head>

<body>
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
      <a href="<c:url value='/board/main'/>">게시판</a>
    </nav>

    <div class="auth">
      <a class="pill" href="<c:url value='/mypage'/>">my page</a>
      <a class="pill" href="<c:url value='/member/logout'/>">logout</a>
    </div>
  </div>
</header>

<main class="main">
  <div class="container">
    <h2 style="margin-bottom:16px;">예약 완료</h2>

    <!-- reservation이 없으면 잘못된 접근 -->
    <c:if test="${empty reservation}">
      <script>
        alert("예약 정보가 없습니다. 목록으로 이동합니다.");
        location.href = "<c:url value='/locale/list'/>";
      </script>
    </c:if>

    <div class="reservation-complete">
      <p>예약이 정상적으로 완료되었습니다!</p>

      <div class="reservation-info">
        <p><strong>장소:</strong>
          <span><c:out value="${reservation.place.placeName}" /></span>
        </p>

        <p><strong>주소:</strong>
          <span><c:out value="${reservation.place.placeAddress}" /></span>
        </p>

        <p><strong>전화:</strong>
          <span><c:out value="${reservation.place.placePhone}" /></span>
        </p>

        <p><strong>예약자:</strong>
          <span><c:out value="${empty member.name ? member.memberId : member.name}" /></span>
        </p>

        <p><strong>밴드명:</strong>
          <span><c:out value="${reservation.bandName}" /></span>
        </p>

        <p><strong>인원:</strong>
          <span><c:out value="${reservation.bandCount}" />명</span>
        </p>

        <p><strong>날짜/시간:</strong>
          <span>
            <c:out value="${reservation.reservationDate}" />
            <c:out value=" ${reservation.startTime}" />
          </span>
        </p>

        <p><strong>전화번호:</strong>
          <span><c:out value="${reservation.phone}" /></span>
        </p>

        <p><strong>이메일:</strong>
          <span><c:out value="${reservation.email}" /></span>
        </p>
      </div>

      <div class="actions" style="margin-top:24px;">
        <button class="region-btn" type="button"
                onclick="location.href='<c:url value='/'/>'">
          홈으로 돌아가기
        </button>

        <button class="region-btn" type="button"
                onclick="location.href='<c:url value='/mypage?tab=place'/>'">
          내 예약 확인
        </button>

        <button class="region-btn" type="button"
                onclick="location.href='<c:url value='/locale/list'/>'">
          다른 장소 예약하기
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
