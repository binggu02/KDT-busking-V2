<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>${pageTitle}</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/locale/locale.css">
</head>
<body>

<header>
  <a href="${pageContext.request.contextPath}/">홈</a>
</header>

<main class="main">
  <h1>${pageTitle}</h1>

  <div class="region-list">
    <c:choose>
      <c:when test="${empty cities}">
        <div class="region-card">등록된 지역이 없습니다.</div>
      </c:when>
      <c:otherwise>
        <c:forEach var="city" items="${cities}">
          <a class="region-card"
             href="${pageContext.request.contextPath}/locale/${city.cityCode}">
            ${city.cityName}
          </a>
        </c:forEach>
      </c:otherwise>
    </c:choose>
  </div>

</main>
</body>
</html>
