<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${pageTitle}</title>

  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/locale/placelist.css'/>" />
</head>

<body>
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

  <main class="main">
    <div class="container">
      <h2 style="margin: 0 0 16px;">${pageTitle}</h2>

      <!-- FE 카드 UI + BE 필드(place.*) 매핑 -->
      <section class="place-grid">
        <c:forEach var="place" items="${places}">
          <article class="place-card"
                   data-name="${place.placeName}"
                   data-address="${place.placeAddress}"
                   data-phone="${place.placePhone}">

            <button class="thumb" type="button"
                    style="background-image:url('${pageContext.request.contextPath}${place.thumbnail}')"
                    aria-label="${place.placeName} 지도 보기"></button>

            <div class="card-body">
              <div class="card-title">${place.placeName}</div>
              <!-- 로직(파라미터 placeId) 유지 -->
              <a class="reserve-btn" href="<c:url value='/locale/reserve?placeId=${place.id}'/>">예약하기</a>
            </div>
          </article>
        </c:forEach>
      </section>
    </div>
  </main>

  <footer class="footer">
    <div class="container">
      <p>© Busking Reservation</p>
    </div>
  </footer>

  <!-- 지도 모달 (UI 보강용: 로직과 무관) -->
  <div class="map-modal" id="mapModal" aria-hidden="true">
    <div class="map-dim" data-close="1"></div>
    <div class="map-box" role="dialog" aria-modal="true" aria-labelledby="mapTitle">
      <div class="map-head">
        <div class="map-title" id="mapTitle">지도</div>
        <button class="map-close" type="button" data-close="1">✕</button>
      </div>
      <div class="map-sub" id="mapAddr">-</div>
      <iframe id="mapFrame" class="map-frame" loading="lazy"
              referrerpolicy="no-referrer-when-downgrade" src=""></iframe>
    </div>
  </div>

  <script>
    const modal = document.getElementById("mapModal");
    const mapFrame = document.getElementById("mapFrame");
    const mapAddr = document.getElementById("mapAddr");
    const mapTitle = document.getElementById("mapTitle");

    function openMap(placeName, address){
      mapTitle.textContent = placeName;
      mapAddr.textContent = address;
      const q = encodeURIComponent(address);
      mapFrame.src = `https://www.google.com/maps?q=${q}&output=embed`;
      modal.classList.add("show");
      modal.setAttribute("aria-hidden", "false");
      document.body.style.overflow = "hidden";
    }

    function closeMap(){
      modal.classList.remove("show");
      modal.setAttribute("aria-hidden", "true");
      mapFrame.src = "";
      document.body.style.overflow = "";
    }

    document.querySelectorAll(".place-card .thumb").forEach(btn => {
      btn.addEventListener("click", () => {
        const card = btn.closest(".place-card");
        openMap(card.dataset.name, card.dataset.address);
      });
    });

    modal.addEventListener("click", (e) => {
      if (e.target.dataset.close === "1") closeMap();
    });
  </script>
</body>
</html>
