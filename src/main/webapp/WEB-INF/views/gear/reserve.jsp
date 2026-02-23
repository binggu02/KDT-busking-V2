<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>장비 예약</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gear/reserve.css" />
</head>
<body>

<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

<main class="main">
  <div class="container">

    <!-- 단계 표시 -->
    <div class="step">
      <div class="step-item on">
        <div class="dot">1</div>
        예약 정보 입력
      </div>
      <div class="step-item">
        <div class="dot">2</div>
        예약 완료
      </div>
    </div>

    <!-- 전체 레이아웃 -->
    <div class="reserve-wrap">

      <!-- 왼쪽 선택 카드 -->
      <div class="selected-card">

        <div class="selected-thumb"
             style="background-image:url('/images/gear/${gear.gearThumbnail }')">
        </div>

        <div class="selected-body">
          <div class="selected-title">${gear.gearName}</div>
          <div class="selected-price">${gear.gearPrice}원</div>
          <div class="selected-desc">${gear.gearDescription}</div>
        </div>

      </div>

      <!-- 오른쪽 폼 영역 -->
      <div class="reserve-form">

        <h3 class="form-title">예약 정보 입력</h3>

        <c:if test="${not empty error}">
          <div class="alert error">${error}</div>
        </c:if>

        <c:choose>
          <c:when test="${gear.gearQuantity < 1}">
            <div class="badge soldout">장비 수량이 부족합니다.</div>
          </c:when>

          <c:otherwise>
            <form action="${pageContext.request.contextPath}/gear/reserve/confirm"
                  method="post">

              <input type="hidden" name="gearId" value="${gear.id}" />

              <div class="block">

                <div class="row">
                  <div class="label">남은 수량</div>
                  <div class="value">${gear.gearQuantity}</div>
                </div>

                <div class="row row-top">
                  <div class="label">예약 기간</div>

                  <div class="range">
                    <div class="range-item">
                      <span class="mini">시작</span>
                      <input type="datetime-local"
                             name="startDT"
                             class="input"
                             required>
                    </div>

                    <div class="range-item">
                      <span class="mini">종료</span>
                      <input type="datetime-local"
                             name="endDT"
                             class="input"
                             required>
                    </div>
                  </div>
                </div>

              </div>

              <div class="form-actions">
                <button type="submit" class="reserve-btn">
                  예약확정
                </button>
              </div>

            </form>
          </c:otherwise>
        </c:choose>

      </div>

    </div>

  </div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
