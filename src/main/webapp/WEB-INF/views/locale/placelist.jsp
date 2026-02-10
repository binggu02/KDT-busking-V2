<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${pageTitle}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/locale/locale.css">
</head>
<body>

	<header>
		<a href="${pageContext.request.contextPath}/locale/list">← 지역 선택</a>
	</header>

	<main class="main">
		<h1>${pageTitle}</h1>

		<div class="place-list">
			<c:choose>
				<c:when test="${empty places}">
					<div>예약 가능한 장소가 없습니다.</div>
				</c:when>

				<c:forEach var="place" items="${places}">
					<div class="place-card">
						<img src="${pageContext.request.contextPath}${place.thumbnail}"
							alt="${place.placeName}">
						<h3>${place.placeName}</h3>
						<p>${place.placeAddress}</p>
						<p>${place.placePhone}</p>

						<a class="btn-reserve"
							href="${pageContext.request.contextPath}/locale/reserve?placeId=${place.id}">
							예약하기 </a>
					</div>
				</c:forEach>


			</c:choose>
		</div>
	</main>

</body>
</html>
