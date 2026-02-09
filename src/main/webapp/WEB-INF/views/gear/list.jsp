<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${pageTitle}</title>

  <!-- ✅ 정적 경로는 var로 빼서 쓰면 컨텍스트패스에서 100% 안전 -->
  <c:url var="commonCss" value="/css/common.css" />
  <c:url var="mainCss" value="/css/main.css" />
  <c:url var="listCss" value="/css/gear/list.css" />

  <link rel="stylesheet" href="${commonCss}" />
  <link rel="stylesheet" href="${mainCss}" />
  <link rel="stylesheet" href="${listCss}" />
</head>

<body>

<c:url var="homeUrl" value="/" />
<c:url var="gearListUrl" value="/gear/list" />
<c:url var="localeListUrl" value="/locale/list" />
<c:url var="boardListUrl" value="/board/list" />
<c:url var="mypageUrl" value="/mypage/main" />
<c:url var="logoutUrl" value="/member/logout" />
<c:url var="reserveUrl" value="/gear/reserve" />

<c:url var="headerBgUrl" value="/images/busking.png" />
<c:url var="logoUrl" value="/images/buskinglogo.png" />

<header class="header" style="background-image: url('${headerBgUrl}');">
  <div class="container header-inner">
    <a class="logo" href="${homeUrl}">
      <img src="${logoUrl}" alt="BUSKING RESERVATION" class="logo-icon" />
    </a>

    <nav class="nav">
      <a href="${gearListUrl}" class="is-active">장비 예약</a>
      <a href="${localeListUrl}">지역별 장소 예약</a>
      <a href="${boardListUrl}">게시판</a>
    </nav>

    <div class="auth">
      <a class="pill" href="${mypage/main}">my page</a>
      <a class="pill" href="${logoutUrl}">logout</a>
    </div>
  </div>
</header>

<main class="main">
  <div class="container">
    <section class="gear-grid">

      <c:forEach var="g" items="${gears}">
        <!-- ✅ g.img 가 "/images/01.jpg" 형태여야 정상 -->
        <c:url var="imgUrl" value="${g.img}" />

        <a class="gear-link gear-card" href="${reserveUrl}"
           data-name="${g.name}"
           data-price="${g.price}"
           data-desc="${g.desc}"
           data-img="${imgUrl}">

          <div class="thumb"
               style="background-image:url('${imgUrl}');"
               aria-label="${g.name} 이미지"></div>

          <div class="card-body">
            <div class="card-title">${g.name}</div>
            <div class="card-price">$${g.price}</div>
            <div class="card-desc">${g.desc}</div>
          </div>
        </a>
      </c:forEach>

    </section>
  </div>
</main>

<footer class="footer">
  <div class="container">
    <p>© Busking Reservation</p>
  </div>
</footer>

<script>
  document.querySelectorAll(".gear-link").forEach((link) => {
    link.addEventListener("click", (e) => {
      e.preventDefault();

      const item = {
        name: link.dataset.name,
        price: link.dataset.price,
        desc: link.dataset.desc,
        img: link.dataset.img
      };

      sessionStorage.setItem("selectedGear", JSON.stringify(item));
      window.location.href = link.getAttribute("href");
    });
  });
</script>

</body>
</html>
