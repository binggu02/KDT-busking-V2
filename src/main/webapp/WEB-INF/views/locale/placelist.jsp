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

        <!-- ✅ thumbnail 사용 -->
        <img
          src="${pageContext.request.contextPath}${place.thumbnail}"
          alt="${place.placeName}"
        />

        <!-- ✅ 필드명 정확히 -->
        <h3>${place.placeName}</h3>
        <p>${place.placeAddress}</p>
        <p>${place.placePhone}</p>

        <!-- 예약 버튼 -->
        <a
          href="${pageContext.request.contextPath}/locale/reserve?placeId=${place.id}"
          class="btn-reserve"
        >
          예약하기
        </a>

      </div>
    </c:forEach>
  </div>
</main>

</body>
</html>
