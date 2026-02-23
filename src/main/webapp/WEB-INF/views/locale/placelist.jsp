<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${pageTitle}</title>

  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
 
  <link rel="stylesheet" href="<c:url value='/css/locale/placelist.css'/>" />
</head>

<body>
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

  <main class="main">
    <div class="container">
      <h2 style="margin: 0 0 16px;">${pageTitle}</h2>

      <section class="place-grid">
        <c:forEach var="place" items="${places}">
          <article class="place-card"
                   data-name="${place.placeName}"
                   data-address="${place.placeAddress}"
                   data-phone="${place.placePhone}">

            <!-- 썸네일 클릭하면 지도 토글 -->
			
			<button class="thumb"
			        type="button"
			        aria-label="지도보기"
			        style="background-image: url('<c:url value="/images/place/${place.thumbnail}"/>');">
			</button>



            <div class="card-body">
              <div class="card-title">${place.placeName}</div>

              <div class="card-actions">
                <button class="map-btn" type="button">지도보기</button>
                <a class="reserve-btn" href="<c:url value='/locale/reserve?placeId=${place.id}'/>">예약하기</a>
              </div>
            </div>

            <!-- ✅ 카드 내부 지도 -->
            <div class="card-map" aria-hidden="true">
              <iframe class="card-map-frame"
                      loading="lazy"
                      referrerpolicy="no-referrer-when-downgrade"
                      src=""></iframe>
            </div>

          </article>
        </c:forEach>
      </section>
    </div>
  </main>

  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  <script>
    function setMapIframe(iframe, address){
      const q = encodeURIComponent(address);
      iframe.src = `https://www.google.com/maps?q=${q}&output=embed`;
    }
	// 썸네일 배경 세팅
	document.querySelectorAll(".thumb").forEach(btn=>{
	  const img = btn.dataset.thumb;
	  if(img){
	    btn.style.backgroundImage = `url('${img}')`;
	  }
	});

    document.querySelectorAll(".place-card").forEach(card => {
      const btn = card.querySelector(".map-btn");
      const thumb = card.querySelector(".thumb");
      const iframe = card.querySelector(".card-map-frame");

      function toggleMap(){
        const isOpen = card.classList.contains("open");

        // 닫기
        if (isOpen) {
          card.classList.remove("open");
          iframe.src = "";
          card.querySelector(".card-map")?.setAttribute("aria-hidden", "true");
          return;
        }

        // 다른 카드 열려있으면 닫기(원하면 삭제 가능)
        document.querySelectorAll(".place-card.open").forEach(c => {
          c.classList.remove("open");
          const fr = c.querySelector(".card-map-frame");
          if (fr) fr.src = "";
          c.querySelector(".card-map")?.setAttribute("aria-hidden", "true");
        });

        // 열기
        setMapIframe(iframe, card.dataset.address);
        card.classList.add("open");
        card.querySelector(".card-map")?.setAttribute("aria-hidden", "false");
      }

      btn.addEventListener("click", toggleMap);
      thumb.addEventListener("click", toggleMap);
    });
  </script>
</body>
</html>
