<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <c:forEach var="city" items="${cities}">
      <div class="place-card">

        

        <!-- ✅ 필드명 정확히 -->
        <a href="/locale/${city.cityCode}"><h3>${city.cityName}</h3></a>
        

        

      </div>
    </c:forEach>
  </div>
</main>

</body>
</html>

