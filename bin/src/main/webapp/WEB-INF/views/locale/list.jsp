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
    <a class="region-card" href="${pageContext.request.contextPath}/locale/seoul">서울</a>
    <a class="region-card" href="${pageContext.request.contextPath}/locale/incheon">인천</a>
    <a class="region-card" href="${pageContext.request.contextPath}/locale/busan">부산</a>
    <a class="region-card" href="${pageContext.request.contextPath}/locale/daegu">대구</a>
    <a class="region-card" href="${pageContext.request.contextPath}/locale/gwangju">광주</a>
    <a class="region-card" href="${pageContext.request.contextPath}/locale/ulsan">울산</a>
    <a class="region-card" href="${pageContext.request.contextPath}/locale/daejeon">대전</a>
  </div>
</main>
</body>
</html>
