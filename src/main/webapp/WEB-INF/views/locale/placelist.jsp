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
  <link rel="stylesheet" href="<c:url value='/css/locale/placelist.css'/>" />
</head>

<body>
<header class="header"
        style="background-image: url('<c:url value='/images/busking.png'/>');">
  <div class="container header-inner">
    <a class="logo" href="<c:url value='/'/>">
      <img src="<c:url value='/images/buskinglogo.png'/>" alt="BUSKING RESERVATION" class="logo-icon" />
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

    <h2 style="margin: 0 0 16px;">${regionName} 장소 목록</h2>

    <section class="place-grid">
      <c:forEach var="p" items="${places}">
        <article class="place-card"
          data-name="${p.name}"
          data-address="${p.address}"
          data-phone="${p.phone}"
          data-img="<c:url value='${p.img}'/>">

          <button class="thumb" type="button"
            style="background-image:url('<c:url value='${p.img}'/>')"
            aria-label="${p.name} 지도 보기"></button>

          <div class="card-body">
            <div class="card-title">${p.name}</div>
            <button class="reserve-btn" type="button">예약하기</button>
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

<!-- ✅ 맵 모달 -->
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

  document.querySelectorAll(".place-card .reserve-btn").forEach(btn => {
    btn.addEventListener("click", (e) => {
      e.preventDefault();
      e.stopPropagation();

      const card = btn.closest(".place-card");
      const selectedPlace = {
        name: card.dataset.name,
        address: card.dataset.address,
        phone: card.dataset.phone,
        img: card.dataset.img
      };

      sessionStorage.setItem("selectedPlace", JSON.stringify(selectedPlace));
      location.href = "<c:url value='/locale/reserve'/>";
    });
  });

  modal.addEventListener("click", (e) => {
    if (e.target.dataset.close === "1") closeMap();
  });

  window.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && modal.classList.contains("show")) closeMap();
  });
</script>
</body>
</html>

