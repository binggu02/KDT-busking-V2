<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>정보 수정</title>

  <!-- 공통 CSS (mypage 폴더라서 ../) -->
  <link rel="stylesheet" href="../common.css" />
  <link rel="stylesheet" href="../main.css" />

  <!-- 마이페이지 전용 CSS -->
  <link rel="stylesheet" href="myPage.css" />

  <!-- ✅ 업데이트 페이지 전용 CSS (반드시 마지막) -->
  <link rel="stylesheet" href="update.css" />
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

  <main class="main">
    <div class="container">

      <div class="login-wrapper">

        <!-- ✅ 프로필 상단(사진 느낌) -->
        <div class="profile-top">
          <div class="avatar" aria-label="프로필 이미지"></div>

          <div class="profile-meta">
            <div class="nickname-row">
              <h2 class="nickname-title">닉네임</h2>
              <span class="badge">일반 회원</span>
            </div>
          </div>
        </div>

        <form>

          <!-- 닉네임 -->
          <div class="field">
            <label for="nickname">닉네임</label>
            <input type="text" id="nickname" name="nickname" required placeholder="닉네임">
          </div>

          <!-- 연락처 (잠금 아이콘) -->
          <div class="field">
            <label for="phone">연락처</label>
            <div class="input-lock">
              <input type="text" id="phone" name="phone" value="010-1234-5678" readonly>
            </div>
          </div>

          <!-- 이메일 -->
          <div class="field full">
            <label for="useremail">이메일</label>
            <input type="email" id="useremail" name="useremail" placeholder="user@example.com">
          </div>

          <!-- ✅ 비밀번호로 변경 -->
          <div class="section-title">비밀번호로 변경</div>

          <div class="field">
            <label for="pw1"></label>

            <!-- ✅ 토글 래퍼(자물쇠 없음) -->
            <div class="input-toggle">
              <input type="password" id="pw1" name="pw1" placeholder="새 비밀번호">
              <button type="button" class="toggle-btn" aria-label="비밀번호 보기" data-target="#pw1">
                보기
              </button>
            </div>
          </div>

          <div class="field">
            <label for="pw2"></label>

            <!-- ✅ 토글 래퍼(자물쇠 없음) -->
            <div class="input-toggle">
              <input type="password" id="pw2" name="pw2" placeholder="새 비밀번호 확인">
              <button type="button" class="toggle-btn" aria-label="비밀번호 보기" data-target="#pw2">
                보기
              </button>
            </div>
          </div>


          <!-- ✅ 버튼 -->
          <div class="btn-col">
            <button class="joinok-btn" type="button" onclick="location.href='./info.jsp'">
              저장하기
            </button>
            <button class="joinok-btn" type="button" onclick="location.href='./main.jsp'">
              취소
            </button>
          </div>

          <a class="back-link" onclick="location.href='./withdraw.jsp'">회원 탈퇴 &gt;</a>

        </form>
      </div>

    </div>
  </main>

  <footer class="footer">
    <div class="container">
      <p>© Busking Reservation</p>
    </div>
  </footer>

</body>
<script>
  document.querySelectorAll(".toggle-btn").forEach((btn) => {
    btn.addEventListener("click", () => {
      const targetSel = btn.dataset.target;
      const input = document.querySelector(targetSel);
      if (!input) return;

      const isHidden = input.type === "password";
      input.type = isHidden ? "text" : "password";

      btn.textContent = isHidden ? "숨김" : "보기";
      btn.setAttribute("aria-label", isHidden ? "비밀번호 숨기기" : "비밀번호 보기");
    });
  });
</script>

</html>