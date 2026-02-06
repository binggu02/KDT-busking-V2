<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>${pageTitle}</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/locale/locale.css">
</head>
<body>
<header>
  <a href="${pageContext.request.contextPath}/">홈</a>
</header>

<main class="main">
  <h1>${pageTitle}</h1>
  
  <div class="place-list">
    <c:forEach var="place" items="${places}">
      <div class="place-card">
        <img src="${pageContext.request.contextPath}${place.img}" alt="${place.name}">
        <h3>${place.name}</h3>
        <p>${place.address}</p>
        <p>${place.phone}</p>
        <!-- 버튼 클릭 시 JS로 sessionStorage에 저장 -->
        <button class="btn-reserve"
                data-name="${place.name}"
                data-address="${place.address}"
                data-phone="${place.phone}"
                data-img="${place.img}">
          예약하기
        </button>
      </div>
    </c:forEach>
  </div>
</main>

<script>
  const CTX = "${pageContext.request.contextPath}";

  // 예약 버튼 클릭 시 sessionStorage에 선택한 장소 저장 후 reserve 페이지로 이동
  document.querySelectorAll('.btn-reserve').forEach(btn => {
    btn.addEventListener('click', () => {
      const place = {
        name: btn.dataset.name,
        address: btn.dataset.address,
        phone: btn.dataset.phone,
        img: btn.dataset.img
      };
      // sessionStorage에 저장
      sessionStorage.setItem('selectedPlace', JSON.stringify(place));
      // 예약 페이지로 이동
      location.href = CTX + '/locale/reserve';
    });
  });
</script>
</body>
</html>
