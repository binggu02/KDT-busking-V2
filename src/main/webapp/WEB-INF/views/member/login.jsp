<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>로그인</title>

  <!-- 공통 css -->
  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/login.css'/>" />

  <style>
    /* ====== 로그인 페이지 단일 파일 CSS ====== */

    /* 페이지 기본 */
    body.login-page {
      margin: 0;
      min-height: 100vh;
      font-family: "맑은 고딕", sans-serif;
    }

    /* 배경 (buskinglogin.png) + 어두운 오버레이 */
    .login-bg {
      position: fixed;
      inset: 0;
      /* ✅ 이미지 폴더가 /images 라고 했으니 여기로 맞춤 */
      background: url("<c:url value='/images/buskinglogin.png'/>") center / cover no-repeat;
      z-index: 0;
    }
    .login-bg::after {
      content: "";
      position: absolute;
      inset: 0;
      background: rgba(0, 0, 0, 0.45);
    }

    /* 가운데 정렬 */
    .login-wrap {
      position: relative;
      z-index: 1;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 40px 16px;
      gap: 8px;
    }

    /* 상단 로고 */
    .login-brand img {
      width: 400px;
      height: auto;
      display: block;
      filter: drop-shadow(0 10px 18px rgba(0,0,0,0.35));
    }

    /* 카드 */
    .login-card {
      width: 420px;
      max-width: 92vw;
      background: rgba(255, 255, 255, 0.92);
      border-radius: 16px;
      padding: 26px 28px 22px;
      box-shadow: 0 20px 60px rgba(0,0,0,0.35);
    }

    /* 라벨/입력 */
    .login-label {
      display: block;
      font-size: 12px;
      color: #333;
      margin: 12px 0 6px;
    }

    .login-input {
      width: 100%;
      height: 38px;
      border: 1px solid #d6d6d6;
      border-radius: 8px;
      padding: 0 12px;
      outline: none;
      background: #fff;
    }
    .login-input:focus { border-color: #888; }

    /* 버튼 */
    .login-btn {
      width: 100%;
      height: 40px;
      margin-top: 14px;
      border: none;
      border-radius: 8px;
      background: #222;
      color: #fff;
      cursor: pointer;
      font-weight: 600;
    }
    .login-btn:hover { background: #111; }

    /* 링크 */
    .login-links {
      margin-top: 14px;
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 6px;
      font-size: 12px;
      color: #666;
    }

    .find-link {
      color: #666;
      text-decoration: none;
      font-weight: 600;
    }
    .find-link:hover { text-decoration: underline; }

    .slash { color: #999; margin: 0 2px; }
    .find-text { color: #666; margin-left: 2px; }

    .divider {
      width: 1px;
      height: 10px;
      background: #cfcfcf;
      display: inline-block;
      margin: 0 10px;
    }

    .login-links a {
      color: #666;
      text-decoration: none;
    }
    .login-links a:hover { text-decoration: underline; }

    /* ✅ 상단 표지(토스트) */
    .toast{
      position: fixed;
      top: 16px;
      left: 50%;
      transform: translateX(-50%);
      z-index: 9999;

      min-width: 280px;
      max-width: 92vw;
      padding: 12px 16px;
      border-radius: 10px;

      background: rgba(255, 70, 70, 0.95);
      color: #fff;
      font-size: 13px;
      font-weight: 700;
      text-align: center;

      box-shadow: 0 12px 30px rgba(0,0,0,0.35);
      display: none;
    }
    .toast.show{ display:block; }
  </style>
</head>

<body class="login-page">
  <div class="login-bg"></div>

  <!-- ✅ 실패 토스트: "loginError" 값이 있을 때만 표시 -->
  <div id="toast" class="toast" role="alert" aria-live="assertive">
    <c:out value="${loginError}" />
  </div>

  <div class="login-wrap">
    <div class="login-brand">
      <a href="<c:url value='/'/>" aria-label="메인페이지로 이동">
        <img src="<c:url value='/images/buskinglogo.png'/>" alt="BUSKING RESERVATION" />
      </a>
    </div>

    <div class="login-card">
      <!-- ✅ 컨트롤러에 맞게: POST /member/login, name=memberId, pw -->
      <form id="loginForm" method="post" action="<c:url value='/member/login'/>">
        <label class="login-label" for="memberId">ID</label>
        <input
          id="memberId"
          class="login-input"
          type="text"
          name="memberId"
          placeholder="아이디를 입력하세요"
          required
        />

        <label class="login-label" for="pw">Password</label>
        <input
          id="pw"
          class="login-input"
          type="password"
          name="pw"
          placeholder="비밀번호를 입력하세요"
          required
        />

        <button class="login-btn" type="submit">Sign In</button>

        <div class="login-links">
          <!-- ⚠️ 현재 컨트롤러는 find-id / find-pw가 POST만 있음
               링크 클릭으로 이동하려면 GET 폼 페이지 매핑이 필요할 수 있음 -->
          <a class="find-link" href="<c:url value='/member/findId'/>">ID</a>
          <span class="slash">/</span>
          <a class="find-link" href="<c:url value='/member/findPw'/>">PW</a>
          <span class="find-text">찾기</span>

          <span class="divider"></span>
          <a href="<c:url value='/member/register'/>">회원가입</a>
        </div>
      </form>
    </div>
  </div>

  <script>
    // ✅ 서버에서 loginError가 내려오면 토스트 자동 표시
    (function () {
      const toast = document.getElementById("toast");
      const msg = (toast && toast.textContent) ? toast.textContent.trim() : "";

      if (!msg) return;

      toast.classList.add("show");
      setTimeout(() => toast.classList.remove("show"), 2000);
    })();
  </script>
</body>
</html>
