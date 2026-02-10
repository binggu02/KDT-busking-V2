<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>마이페이지</title>

  <!-- 공통 CSS (mypage 폴더라서 ../) -->
  <link rel="stylesheet" href="../common.css" />
  <link rel="stylesheet" href="../main.css" />

  <!-- 마이페이지 전용 CSS -->
  <link rel="stylesheet" href="myPage.css" />

  <!-- ✅ 탭 패널 show/hide용 CSS (원하면 myPage.css로 옮겨도 됨) -->
  <style>
    .tab-panel {
      display: none;
    }

    .tab-panel.show {
      display: block;
    }
  </style>
</head>

<body>

  <!-- ✅ 상단 헤더 -->
  <header class="header">
      <div class="container header-inner">
        <a class="logo" href="../home.jsp">
          <img src="../buskinglogo.png" alt="BUSKING RESERVATION" class="logo-icon" />
        </a>

  	  <nav class="nav">
  	      <a href="../gear/list.jsp">장비 예약</a>
  	      <a href="../locale/list.jsp">지역별 장소 예약</a>
  	      <a href="../board/main.jsp">게시판</a>
  	    </nav>

  	    <div class="auth">
  	      <a class="pill" href="../mypage/main.jsp">my page</a>
  	      <a class="pill" href="../member/login.jsp">logout</a>
  	    </div>
  	  </div>
  </header>

  <!-- 배너는 CSS에서 숨김 처리 중 -->
  <section class="banner">
    <div class="banner-inner">
      <h1>마이페이지</h1>
    </div>
  </section>

  <main class="main">
    <div class="container">

      <!-- 프로필 카드 -->
      <section class="profile-card">
        <div class="profile-left">
          <div class="avatar" aria-label="프로필 이미지"></div>

          <div class="profile-basic">
            <div class="nickname-row">
              <h2 class="nickname">닉네임</h2>
              <span class="badge">일반 회원</span>
            </div>
            <button type="button" class="btn whatever btn-black" onclick="location.href='./update.html'"> 프로필
              수정</button>

          </div>
        </div>

        <div class="profile-right">
          <dl class="info">
            <div class="info-row">
              <dt>ID</dt>
              <dd>example_user</dd>
            </div>
            <div class="info-row">
              <dt>전화</dt>
              <dd>010-1234-5678</dd>
            </div>
            <div class="info-row">
              <dt>이메일</dt>
              <dd>user@example.com</dd>
            </div>
            <div class="info-row">
              <dt>가입일</dt>
              <dd>2024-04-24</dd>
            </div>
          </dl>
        </div>
      </section>

      <!-- ✅ 탭 메뉴 (data-tab 추가) -->
      <section class="tabs">
        <button class="tab active" type="button" data-tab="place">장소 예약 내역</button>
        <button class="tab" type="button" data-tab="gear">장비 대여 내역</button>
        <button class="tab" type="button" data-tab="post">내 게시글</button>
      </section>

      <!-- ✅ 탭 패널들 -->
      <section class="tab-panels">

        <!-- 1) 장소 예약 내역 -->
        <div class="tab-panel show" data-panel="place">
          <!-- 지금 데이터가 장비 대여 위주라서 예시 문구만 -->
          <section class="list">
            <article class="list-item">
              <div class="item-left">
                <h3 class="item-title">장소 예약 내역이 없습니다.</h3>
                <p class="item-meta">예약 후 이곳에서 확인할 수 있어요.</p>
              </div>
              <div class="item-right">
                <button class="btn outline" type="button">장소 예약하기</button>
              </div>
            </article>
          </section>
        </div>

        <!-- 2) 장비 대여 내역 (✅ 기존 목록 3개를 여기에 넣음) -->
        <div class="tab-panel" data-panel="gear">
          <section class="list">
            <article class="list-item">
              <div class="item-left">
                <h3 class="item-title">버스킹 공연 마이크 대여 예약</h3>
                <p class="item-meta">2024-04-24 · 인사동 거리</p>
              </div>

              <div class="item-right">
                <span class="status pending">확인중</span>
                <button class="btn outline" type="button">상세보기</button>
              </div>
            </article>

            <article class="list-item">
              <div class="item-left">
                <h3 class="item-title">버스킹 공연 장비 대여 예약</h3>
                <p class="item-meta">2024-04-10 · 롯데월드타워</p>
              </div>

              <div class="item-right">
                <span class="status done">완료</span>
                <button class="btn outline" type="button">상세보기</button>
              </div>
            </article>

            <article class="list-item">
              <div class="item-left">
                <h3 class="item-title">버스킹 공연 장비 대여 예약</h3>
                <p class="item-meta">2024-04-01 · 홍대 거리</p>
              </div>

              <div class="item-right">
                <span class="status done">완료</span>
                <button class="btn outline" type="button">상세보기</button>
              </div>
            </article>
          </section>
        </div>

        <!-- 3) 내 게시글 -->
        <div class="tab-panel" data-panel="post">
          <section class="list">
            <article class="list-item">
              <div class="item-left">
                <h3 class="item-title">내 게시글이 없습니다.</h3>
                <p class="item-meta">게시글 작성 후 여기에서 확인할 수 있어요.</p>
              </div>
              <div class="item-right">
                <button class="btn outline" type="button">게시글 쓰기</button>
              </div>
            </article>
          </section>
        </div>

      </section>

    </div>
  </main>

  <footer class="footer">
    <div class="container">
      <p>© Busking Reservation</p>
    </div>
  </footer>

  <!-- ✅ 탭 클릭 시 아래 내용만 바뀌는 JS -->
  <script>
    const tabs = document.querySelectorAll(".tab");
    const panels = document.querySelectorAll(".tab-panel");

    tabs.forEach((btn) => {
      btn.addEventListener("click", () => {
        const target = btn.dataset.tab;

        // 탭 active 처리
        tabs.forEach(t => t.classList.remove("active"));
        btn.classList.add("active");

        // 패널 show/hide 처리
        panels.forEach(p => {
          p.classList.toggle("show", p.dataset.panel === target);
        });
      });
    });
  </script>

</body>

</html>