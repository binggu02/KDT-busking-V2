<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${pageTitle}</title>

  <!-- ✅ static/css 기준 -->
  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/main.css'/>" />

  <!-- ✅ 너 폴더구조: static/css/local/locallist.css -->
  <link rel="stylesheet" href="<c:url value='/css/locale/list.css'/>" />
</head>

<body>
  <!-- ✅ 헤더 (배너 확정 적용) -->
  <header class="header"
          style="background-image: url('<c:url value='/images/busking.png'/>');">
    <div class="container header-inner">
      <a class="logo" href="<c:url value='/'/>">
        <img src="<c:url value='/images/buskinglogo.png'/>"
             alt="BUSKING RESERVATION" class="logo-icon" />
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

  <!-- ✅ 본문 -->
  <main class="main">
    <div class="container">

      <!-- ✅ placelist.jsp 스타일 맞춤: 제목 한 줄 -->
      <h2 style="margin: 0 0 16px;">지역 선택</h2>

      <section class="region-grid" aria-label="지역 선택">

        <a class="region-btn" href="<c:url value='/locale/seoul'/>">
          <span class="pin" aria-hidden="true">
            <svg viewBox="0 0 24 24" width="22" height="22">
              <path d="M12 21s7-4.6 7-11a7 7 0 1 0-14 0c0 6.4 7 11 7 11z" fill="none" stroke="currentColor" stroke-width="2"/>
              <circle cx="12" cy="10" r="2.5" fill="none" stroke="currentColor" stroke-width="2"/>
            </svg>
          </span>
          <span class="txt">서울 광역시</span>
        </a>

        <a class="region-btn" href="<c:url value='/locale/incheon'/>">
          <span class="pin" aria-hidden="true">
            <svg viewBox="0 0 24 24" width="22" height="22">
              <path d="M12 21s7-4.6 7-11a7 7 0 1 0-14 0c0 6.4 7 11 7 11z" fill="none" stroke="currentColor" stroke-width="2"/>
              <circle cx="12" cy="10" r="2.5" fill="none" stroke="currentColor" stroke-width="2"/>
            </svg>
          </span>
          <span class="txt">인천 광역시</span>
        </a>

        <a class="region-btn" href="<c:url value='/locale/busan'/>">
          <span class="pin" aria-hidden="true">
            <svg viewBox="0 0 24 24" width="22" height="22">
              <path d="M12 21s7-4.6 7-11a7 7 0 1 0-14 0c0 6.4 7 11 7 11z" fill="none" stroke="currentColor" stroke-width="2"/>
              <circle cx="12" cy="10" r="2.5" fill="none" stroke="currentColor" stroke-width="2"/>
            </svg>
          </span>
          <span class="txt">부산 광역시</span>
        </a>

        <a class="region-btn" href="<c:url value='/locale/daegu'/>">
          <span class="pin" aria-hidden="true">
            <svg viewBox="0 0 24 24" width="22" height="22">
              <path d="M12 21s7-4.6 7-11a7 7 0 1 0-14 0c0 6.4 7 11 7 11z" fill="none" stroke="currentColor" stroke-width="2"/>
              <circle cx="12" cy="10" r="2.5" fill="none" stroke="currentColor" stroke-width="2"/>
            </svg>
          </span>
          <span class="txt">대구 광역시</span>
        </a>

        <a class="region-btn" href="<c:url value='/locale/gwangju'/>">
          <span class="pin" aria-hidden="true">
            <svg viewBox="0 0 24 24" width="22" height="22">
              <path d="M12 21s7-4.6 7-11a7 7 0 1 0-14 0c0 6.4 7 11 7 11z" fill="none" stroke="currentColor" stroke-width="2"/>
              <circle cx="12" cy="10" r="2.5" fill="none" stroke="currentColor" stroke-width="2"/>
            </svg>
          </span>
          <span class="txt">광주 광역시</span>
        </a>

        <a class="region-btn" href="<c:url value='/locale/ulsan'/>">
          <span class="pin" aria-hidden="true">
            <svg viewBox="0 0 24 24" width="22" height="22">
              <path d="M12 21s7-4.6 7-11a7 7 0 1 0-14 0c0 6.4 7 11 7 11z" fill="none" stroke="currentColor" stroke-width="2"/>
              <circle cx="12" cy="10" r="2.5" fill="none" stroke="currentColor" stroke-width="2"/>
            </svg>
          </span>
          <span class="txt">울산 광역시</span>
        </a>

        <a class="region-btn" href="<c:url value='/locale/daejeon'/>">
          <span class="pin" aria-hidden="true">
            <svg viewBox="0 0 24 24" width="22" height="22">
              <path d="M12 21s7-4.6 7-11a7 7 0 1 0-14 0c0 6.4 7 11 7 11z" fill="none" stroke="currentColor" stroke-width="2"/>
              <circle cx="12" cy="10" r="2.5" fill="none" stroke="currentColor" stroke-width="2"/>
            </svg>
          </span>
          <span class="txt">대전 광역시</span>
        </a>

      </section>
    </div>
  </main>

  <footer class="footer">
    <div class="container">
      <p>© Busking Reservation</p>
    </div>
  </footer>
</body>