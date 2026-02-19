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

      <!-- 인기 장소 -->
      <section class="section">
        <div class="section-head">
          <h2>인기 장소</h2>
          <a class="more" href="<c:url value='/locale/list'/>">더보기</a>
        </div>

        <div class="grid grid-3">
          <article class="card place-card">
            <div class="thumb">
              <img src="<c:url value='/images/Hongdae.png'/>" alt="홍대 걷고싶은거리">
            </div>
            <div class="card-body">
              <h3>홍대 걷고싶은거리</h3>
              <p>서울 마포구</p>
            </div>
          </article>

          <article class="card place-card">
            <div class="thumb">
              <img src="<c:url value='/images/Han River.png'/>" alt="한강 반포공원">
            </div>
            <div class="card-body">
              <h3>한강 반포공원</h3>
              <p>서울 서초구</p>
            </div>
          </article>

          <article class="card place-card">
            <div class="thumb">
              <img src="<c:url value='/images/Gwanganri.png'/>" alt="광안리 해변">
            </div>
            <div class="card-body">
              <h3>광안리 해변</h3>
              <p>부산 수영구</p>
            </div>
          </article>
        </div>
      </section>

      <!-- 게시판 인기글 -->
      <section class="section">
        <div class="section-head">
          <h2>게시판 인기글</h2>
          <a class="more" href="<c:url value='/board/main'/>">더보기</a> <!-- ← 수정됨 -->
        </div>

        <ul class="list">
          <li class="list-item">
            <a href="#">[공지] 2월 대관 신청 오픈 안내</a>
            <span class="meta">2026-01-27</span>
          </li>
          <li class="list-item">
            <a href="#">홍대 버스킹 스피커 추천 / 세팅 팁</a>
            <span class="meta">2026-01-26</span>
          </li>
          <li class="list-item">
            <a href="#">야외 공연 시 전원(배터리) 구성 어떻게 해요?</a>
            <span class="meta">2026-01-25</span>
          </li>
          <li class="list-item">
            <a href="#">[후기] 반포에서 버스킹했는데 반응 미쳤다…</a>
            <span class="meta">2026-01-24</span>
          </li>
          <li class="list-item">
            <a href="#">처음 버스킹하는데 곡 구성 조언 부탁드립니다!</a>
            <span class="meta">2026-01-23</span>
          </li>
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
