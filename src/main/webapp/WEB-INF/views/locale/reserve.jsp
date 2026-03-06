<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${pageTitle}</title>

  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/locale/reserve.css'/>" />
</head>

<body>
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>


<section class="page-banner">
  <div class="container">
    <div class="page-banner-inner">
      <div class="page-text">
        <h1 class="page-title">장소 예약</h1>
        <div class="breadcrumb">
          <a href="/">홈</a>
          <span class="divider">›</span>
          <a href="/locale/list">지역 리스트</a>
          <span class="divider">›</span>
          <span class="current">장소 선택</span>
        </div>
      </div>
    </div>
  </div>
</section>

<main class="main">
  <div class="container">

    <section class="reserve-layout">

      <!-- 선택 장소 -->
      <aside class="place-side">
        <div class="place-info">
          <div class="place-img-wrap">
            <img src="<c:url value='/images/place/${place.thumbnail}' />"
                 alt="${place.placeName}"
                 class="place-img">
          </div>

          <div class="place-name">${place.placeName}</div>
          <div class="place-addr">${place.placeAddress}</div>
          <div class="place-phone">${place.placePhone}</div>
        </div>
      </aside>

      <!-- 입력 폼 -->
      <section class="form-box">
        <form action="<c:url value='/locale/reserve'/>" method="post">
          <input type="hidden" name="placeId" value="${place.id}" />

          <div class="form-left">
            <div class="line">
              <label class="label">예약자 명 : ${userName}</label>
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

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<!-- 예약 시 예외 메시지 alert -->
<c:if test="${not empty error}">
  <script>
    alert("${error}");
  </script>
</c:if>

</body>
</html>