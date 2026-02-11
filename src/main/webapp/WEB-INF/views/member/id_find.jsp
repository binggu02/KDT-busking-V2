<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>ID 찾기</title>

  <!-- (선택) 공통 css -->
  <link rel="stylesheet" href="../common.css" />
  <link rel="stylesheet" href="../main.css" />

  <style>
    body.find-page {
      margin: 0;
      min-height: 100vh;
      font-family: "맑은 고딕", sans-serif;
      overflow: hidden;
    }

    /* 배경 */
    .bg {
      position: fixed;
      inset: 0;
      background: url("/images/busking.png") center / cover no-repeat;
      z-index: 0;
    }
    .bg::after {
      content: "";
      position: absolute;
      inset: 0;
      background: rgba(0,0,0,0.45);
    }

    /* 중앙 카드 */
    .wrap {
      position: relative;
      z-index: 1;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 18px 16px;
    }

    .card {
      width: 460px;
      max-width: 92vw;
      background: rgba(255,255,255,0.92);
      border-radius: 16px;
      padding: 24px 28px 22px;
      box-shadow: 0 20px 60px rgba(0,0,0,0.35);
    }

    .title {
      margin: 0 0 16px;
      font-size: 18px;
      font-weight: 800;
      color: #222;
      text-align: center;
    }

    .label {
      display: block;
      font-size: 12px;
      color: #333;
      margin: 12px 0 6px;
    }

    .input {
      width: 100%;
      height: 40px;
      border: 1px solid #d6d6d6;
      border-radius: 8px;
      padding: 0 12px;
      outline: none;
      background: #fff;
      font-size: 14px;
    }
    .input:focus { border-color: #888; }

    .btn {
      width: 100%;
      height: 42px;
      margin-top: 16px;
      border: none;
      border-radius: 8px;
      background: #222;
      color: #fff;
      cursor: pointer;
      font-weight: 700;
    }
    .btn:hover { background: #111; }

    /* 상단 팝업(결과) */
    .modal {
      position: fixed;
      top: 18px;
      left: 50%;
      transform: translateX(-50%);
      z-index: 5;
      width: 520px;
      max-width: 92vw;
      background: rgba(255,255,255,0.96);
      border-radius: 10px;
      box-shadow: 0 18px 50px rgba(0,0,0,0.35);
      padding: 18px 18px 14px;
      display: none; /* 기본 숨김 */
    }

    .modal.show { display: block; }

    .modal-top {
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
      gap: 12px;
    }

    .modal-x {
      border: none;
      background: transparent;
      font-size: 18px;
      cursor: pointer;
      line-height: 1;
      color: #222;
    }

    .modal-body {
      margin-top: 4px;
      display: flex;
      flex-direction: column;
      gap: 8px;
    }

    .id-line {
      font-size: 16px;
      font-weight: 800;
      color: #111;
    }

    .modal-actions {
      margin-top: 10px;
      display: flex;
      justify-content: flex-end;
    }

    .mini-btn {
      padding: 6px 12px;
      border: 1px solid #999;
      border-radius: 6px;
      background: #f2f2f2;
      cursor: pointer;
      font-size: 12px;
    }
    .mini-btn:hover { background: #e9e9e9; }
    /* 하단 링크 줄 전체 */
.login-links{
  margin-top: 14px;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 6px;            /* 글자 사이 간격 */
  font-size: 12px;
  color: #666;
}

/* Id(클릭 링크) */
.login-links .find-link{
  color: #666;
  text-decoration: none;
  font-weight: 700;
  letter-spacing: 0.2px;
}
.login-links .find-link:hover{
  text-decoration: underline;
}

/* '찾기' 텍스트(그냥 텍스트면) */
.login-links .find-text{
  color: #666;
  font-weight: 500;
}

/* 구분선 */
.login-links .divider{
  width: 1px;
  height: 10px;
  background: #cfcfcf;
  display: inline-block;
  margin: 0 10px;      /* 구분선 좌우 여백 */
}

/* 로그인 링크 */
.login-links a{
  color: #666;
  text-decoration: none;
}
.login-links a:hover{
  text-decoration: underline;
}


    /* common.css 헤더 뜨면 숨김(필요 시) */
    header.header { display: none !important; }
  </style>
</head>

<body class="find-page">
  <div class="bg"></div>

  <!-- 상단 결과 팝업 -->
  <div class="modal" id="resultModal" aria-hidden="true">
    <div class="modal-top">
      <div class="modal-body">
        <!-- ✅ 아이디만 표시 -->
        <div class="id-line" id="idResult">ID : </div>
      </div>

      <button class="modal-x" type="button" aria-label="닫기" onclick="closeModal()">×</button>
    </div>

    <div class="modal-actions">
      <!-- 로그인 페이지로 이동 (member 폴더 기준) -->
      <button class="mini-btn" type="button" onclick="location.href='/member/login'">login</button>
    </div>
  </div>

  <!-- 중앙 카드 -->
  <div class="wrap">
     <div class="brand">
    <a href="/" aria-label="메인페이지로 이동">
      <img src="/images/buskinglogo.png" alt="BUSKING RESERVATION" />
    </a>
  </div>
    <div class="card">
      <h2 class="title">ID 찾기</h2>

      <form id="findForm">
        <label class="label" for="name">이름</label>
        <input class="input" id="name" name="name" type="text" placeholder="이름을 입력하세요" required />

        <label class="label" for="phone">전화번호</label>
        <input class="input" id="phone" name="phone" type="tel" placeholder="010-1234-5678" required />

        <label class="label" for="email">e-mail</label>
        <input class="input" id="email" name="email" type="email" placeholder="example@email.com" required />

        <button class="btn" type="submit">ID 찾기</button>

          <div class="login-links">
             <a class="find-link" href="/member/find-pw">PW</a>
               <span class="find-text">찾기</span>
               <span class="divider"></span>
               <a href="/member/login">로그인</a>
          </div>
      </form>
    </div>
  </div>

  <script>
    const form = document.getElementById("findForm");
    const modal = document.getElementById("resultModal");
    const idResult = document.getElementById("idResult");

    // 예시: 입력값 기반으로 "아이디"를 만들어 보여주는 데모 로직
    // (실제 서비스에서는 서버에서 조회한 아이디를 받아와서 표시)
    function makeDemoId(name, phone, email) {
      // 이메일 앞부분 + 전화번호 끝 4자리 조합 (예: honggildong_5678)
      const emailPrefix = (email.split("@")[0] || "user").replace(/[^a-zA-Z0-9_]/g, "");
      const last4 = phone.replace(/[^0-9]/g, "").slice(-4) || "0000";
      const safePrefix = emailPrefix.length ? emailPrefix : (name || "user");
      return `${safePrefix}_${last4}`;
    }

    form.addEventListener("submit", (e) => {
      e.preventDefault();

      const name = document.getElementById("name").value.trim();
      const phone = document.getElementById("phone").value.trim();
      const email = document.getElementById("email").value.trim();

      if (!name || !phone || !email) return;

      const foundId = makeDemoId(name, phone, email);

      // ✅ 상단 팝업에 아이디만 표시
      idResult.textContent = `ID : ${foundId}`;

      modal.classList.add("show");
      modal.setAttribute("aria-hidden", "false");
    });

    function closeModal() {
      modal.classList.remove("show");
      modal.setAttribute("aria-hidden", "true");
    }
  </script>
</body>
</html>

