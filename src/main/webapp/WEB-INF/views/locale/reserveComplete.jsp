<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${pageTitle}</title>

  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
  
  <link rel="stylesheet" href="<c:url value='/css/locale/reserveComplete.css'/>" />
</head>

<body>
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

<main class="main complete-main">
  <div class="container">

    <div class="complete-wrap">
      <div class="complete-box">

        <!-- 체크 아이콘 -->
		<div class="check-icon">
		  <svg width="42" height="42" fill="none" stroke="currentColor" stroke-width="3">
		    <circle cx="21" cy="21" r="19"></circle>
		    <path d="M12 22l6 6 12-14"></path>
		  </svg>
		</div>

        <div class="complete-title">
          예약이 정상적으로 완료되었습니다!
        </div>

        <!-- 가운데 카드 -->
        <div class="mini-card">
          <div class="mini-thumb"
               style="background:url('${pageContext.request.contextPath}/images/place/${reservation.place.thumbnail}') center/cover no-repeat;">
          </div>

          <div class="mini-body">
            <div class="mini-gear">
              ${reservation.place.placeName}
            </div>

            <dl class="mini-info">
              <div class="mini-row">
                <dt>주소</dt>
                <dd>${reservation.place.placeAddress}</dd>
              </div>
              <div class="mini-row">
                <dt>전화</dt>
                <dd>${reservation.place.placePhone}</dd>
              </div>
              <div class="mini-row">
                <dt>예약자</dt>
                <dd>${userName}</dd>
              </div>
              <div class="mini-row">
                <dt>밴드명</dt>
                <dd>${reservation.bandName}</dd>
              </div>
              <div class="mini-row">
                <dt>인원</dt>
                <dd>${reservation.bandCount}명</dd>
              </div>
              <div class="mini-row">
                <dt>날짜</dt>
                <dd>${reservation.reservationDate}</dd>
              </div>
              <div class="mini-row">
                <dt>시간</dt>
                <dd>${reservation.startTime}</dd>
              </div>
            </dl>
          </div>
        </div>

        <!-- 버튼 -->
        <div class="complete-actions">
          <a href="<c:url value='/locale/list'/>" class="btn-line">
            다른 장소 보기
          </a>
          <a href="<c:url value='/'/>" class="btn-dark">
            홈으로 이동
          </a>
        </div>

      </div>
    </div>

  </div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
