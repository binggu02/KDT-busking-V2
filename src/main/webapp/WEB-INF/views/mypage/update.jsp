<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>정보 수정</title>
  
  <!-- CSS 경로: info.jsp 기준으로 한 단계 위로 -->
  <link rel="stylesheet" href="/css/common.css">
  <link rel="stylesheet" href="/css/myPage.css">
</head>

<!-- body에 클래스 추가 -->
<body class="mypage-page update-page">
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

  <main class="main">
    <div class="container">

      <div class="login-wrapper">

        <!-- 프로필 상단 -->
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

          <!-- 연락처 (읽기 전용) -->
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

          <!-- 비밀번호 변경 -->
          <div class="section-title">비밀번호로 변경</div>

          <div class="field">
            <label for="pw1"></label>
            <div class="input-toggle">
              <input type="password" id="pw1" name="pw1" placeholder="새 비밀번호">
              <button type="button" class="toggle-btn" aria-label="비밀번호 보기" data-target="#pw1">
                보기
              </button>
            </div>
          </div>

          <div class="field">
            <label for="pw2"></label>
            <div class="input-toggle">
              <input type="password" id="pw2" name="pw2" placeholder="새 비밀번호 확인">
              <button type="button" class="toggle-btn" aria-label="비밀번호 보기" data-target="#pw2">
                보기
              </button>
            </div>
          </div>

		  <div class="btn-col">
		    <button type="button" class="joinok-btn"
		            onclick="location.href='${pageContext.request.contextPath}/update'">
		      저장하기
		    </button>

			<button type="button" class="joinok-btn"
			        onclick="location.href='/mypage'">취소
			</button>
		  </div>

		  <button type="button" class="withdraw-btn"
		          onclick="location.href='${pageContext.request.contextPath}/mypage/withdraw'">
		    회원 탈퇴
		  </button>

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
    // 비밀번호 보기/숨기기 토글
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

</body>
</html>
