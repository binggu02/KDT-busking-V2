<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>Busking Reservation - Main</title>

<!-- CSS -->
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
</head>

<body class="main-page">

<div class="page">

	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

	<section class="hero">
	  <div class="container hero-inner">
	    <h1>당신의 순간을, 무대로.</h1>
	    <p class="hero-sub">Busking Platform</p>
	  </div>
	</section>

	<!-- ================= BRAND INTRO ================= -->
	<section class="brand-intro">
	  <div class="container">
	    <p class="intro-label">OUR PHILOSOPHY</p>
	    <h2 class="intro-title">
	      거리의 무대를<br>
	      가장 가치 있는 순간으로
	    </h2>
	    <p class="intro-desc">
	      우리는 공간과 아티스트를 연결하여<br>
	      누구나 자신만의 무대를 경험할 수 있도록 돕습니다.
	    </p>
	  </div>
	</section>

  <!-- ================= MAIN ================= -->
  <main class="main">
    <div class="container">

      <!-- 최신 장소 -->
      <section class="section">
        <div class="section-head">
          <h2>최근 등록된 장소</h2>
          <a class="more" href="<c:url value='/locale/list'/>">더보기</a>
        </div>

        <div class="grid grid-3">
          <c:forEach var="place" items="${latestLocales}">
            <a href="<c:url value='/locale/reserve?placeId=${place.id}'/>">
              <article class="card place-card">
                <div class="thumb">
                  <img src="<c:url value='/images/place/${place.thumbnail}'/>" alt="${place.placeName}">
                </div>
                <div class="card-body">
                  <h3>${place.placeName}</h3>
                  <p>${place.placeAddress}</p>
                </div>
              </article>
            </a>
          </c:forEach>
        </div>
      </section>

      <!-- 최신 게시글 -->
      <section class="section">
        <div class="section-head">
          <h2>게시판 최신글</h2>
          <a class="more" href="<c:url value='/board/main'/>">더보기</a>
        </div>

        <ul class="list">
          <c:forEach var="board" items="${latestBoards}">
            <li class="list-item">
              <a href="<c:url value='/board/view?id=${board.boardId}'/>">
                ${board.title}
              </a>
              <span class="meta">${board.formattedCreateWriterAt}</span>
            </li>
          </c:forEach>
        </ul>
      </section>

    </div>
  </main>

  <!-- ================= FOOTER ================= -->
  <footer class="footer">
    <p>© Busking Reservation</p>
  </footer>

</div>

</body>
</html>