<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>정보 수정</title>

  <!-- ✅ 정적자원은 절대경로 + c:url -->
  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/mypage/myPage.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/mypage/update.css'/>" />
</head>

<body>

<!-- ✅ 상단 헤더 (컨트롤러 경로로 이동) -->
<header class="header" style="background-image:url('<c:url value="/images/busking.png"/>');">
  <div class="container header-inner">

    <a class="logo" href="<c:url value='/'/>">
      <img src="<c:url value='/images/buskinglogo.png'/>" alt="BUSKING RESERVATION" class="logo-icon" />
    </a>

    <nav class="nav">
      <a href="<c:url value='/gear/list'/>">장비 예약</a>
      <a href="<c:url value='/locale/list'/>">지역별 장소 예약</a>
      <a href="<c:url value='/board/list'/>">게시판</a>
    </nav>

    <div class="auth">
      <a class="pill" href="<c:url value='/mypage'/>">my page</a>
      <a class="pill" href="<c:url value='/member/logout'/>">logout</a>
    </div>

  </div>
</header>

<main class="main">
  <div class="container">

    <div class="login-wrapper">

      <!-- ✅ 프로필 상단 -->
      <div class="profile-top">
        <div class="avatar" aria-label="프로필 이미지"></div>

        <div class="profile-meta">
          <div class="nickname-row">
            <!-- ✅ 컨트롤러에서 model.addAttribute("member", loginMember) -->
            <h2 class="nickname-title">
              <c:out value="${member.nickname}" default="닉네임"/>
            </h2>
            <span class="badge">일반 회원</span>
          </div>
        </div>
      </div>

      <form>
        <!-- 닉네임 -->
        <div class="field">
          <label for="nickname">닉네임</label>
          <input type="text" id="nickname" name="nickname"
                 value="<c:out value='${member.nickname}'/>" readonly>
        </div>

        <!-- 연락처 -->
        <div class="field">
          <label for="phone">연락처</label>
          <div class="input-lock">
            <input type="text" id="phone" name="phone"
                   value="<c:out value='${member.phone}'/>" readonly>
          </div>
        </div>

        <!-- 이메일 -->
        <div class="field full">
          <label for="useremail">이메일</label>
          <input type="email" id="useremail" name="useremail"
                 value="<c:out value='${member.email}'/>" readonly>
        </div>

        <!-- ✅ 비밀번호 표시용 -->
        <div class="section-title">비밀번호로 변경</div>

        <div class="field">
          <label for="pw1"></label>

          <div class="input-lock input-toggle">
            <!-- ✅ 실제 비밀번호는 출력하면 안됨 -->
            <input type="password" id="pw1" name="pw1" value="********" readonly>
            <button type="button" class="toggle-btn" aria-label="비밀번호 보기" data-target="#pw1">보기</button>
          </div>
        </div>

        <!-- ✅ 버튼 (컨트롤러 경로로 이동) -->
        <div class="btn-col">
          <button class="joinok-btn" type="button" onclick="location.href='<c:url value="/mypage"/>'">
            확인
          </button>
          <button class="joinok-btn" type="button" onclick="location.href='<c:url value="/mypage/update"/>'">
            정보 변경
          </button>
        </div>

        <a class="back-link" href="<c:url value='/mypage/withdraw'/>">회원 탈퇴 &gt;</a>
      </form>
    </div>

  </div>
</main>

<footer class="footer">
  <div class="container">
    <p>© Busking Reservation</p>
  </div>
</footer>

<script>
  document.querySelectorAll(".toggle-btn").forEach((btn) => {
    btn.addEventListener("click", () => {
      const input = document.querySelector(btn.dataset.target);
      if (!input) return;

      const isHidden = input.type === "password";
      input.type = isHidden ? "text" : "password";

      btn.textContent = isHidden ? "숨김" : "보기";
      btn.setAttribute("aria-label", isHidden ? "비밀번호 숨기기" : "비밀번호 보기");
    });
  });
</script>

</body>
</html>
