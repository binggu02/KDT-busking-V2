<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>회원가입 완료</title>

  <!-- (선택) 공통 css 쓰면 유지 -->
  <link rel="stylesheet" href="../common.css" />
  <link rel="stylesheet" href="../main.css" />

  <style>
    /* ====== 회원가입 완료 페이지(단일 HTML) ====== */
    body.joinok-page {
      margin: 0;
      min-height: 100vh;
      font-family: "맑은 고딕", sans-serif;
      overflow: hidden;
    }

    /* 배경 + 오버레이 */
    .joinok-bg {
      position: fixed;
      inset: 0;
      background: url("../buskinglogin.png") center / cover no-repeat;
      z-index: 0;
    }
    .joinok-bg::after {
      content: "";
      position: absolute;
      inset: 0;
      background: rgba(0, 0, 0, 0.45);
    }

    /* 가운데 정렬 */
    .joinok-wrap {
      position: relative;
      z-index: 1;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 18px 16px;
      gap: 14px;
      transform: translateY(-10px);
    }

    /* 상단 로고 */
    .joinok-brand img {
      width: clamp(220px, 28vw, 320px);
      height: auto;
      display: block;
      filter: drop-shadow(0 10px 18px rgba(0,0,0,0.35));
    }

    /* 카드 */
    .joinok-card {
      width: 420px;
      max-width: 92vw;
      background: rgba(255, 255, 255, 0.92);
      border-radius: 18px;
      padding: 26px 28px 22px;
      box-shadow: 0 20px 60px rgba(0,0,0,0.35);
      text-align: center;
    }

    .joinok-title {
      margin: 0;
      font-size: 18px;
      font-weight: 800;
      color: #222;
      letter-spacing: -0.3px;
    }

    .joinok-desc {
      margin: 10px 0 18px;
      font-size: 12px;
      color: #444;
    }

    /* 체크 아이콘(원형) */
    .check-wrap {
      display: flex;
      justify-content: center;
      margin: 8px 0 18px;
    }

    .check-circle {
      width: 66px;
      height: 66px;
      border-radius: 50%;
      border: 2px solid #222;
      display: grid;
      place-items: center;
    }

    .check-circle svg {
      width: 34px;
      height: 34px;
      display: block;
    }

    /* 버튼 */
    .btn-col {
      display: flex;
      flex-direction: column;
      gap: 12px;
      margin-top: 6px;
    }

    .joinok-btn {
      height: 42px;
      border-radius: 999px;
      border: 1px solid #222;
      background: transparent;
      color: #222;
      font-size: 12px;
      font-weight: 700;
      cursor: pointer;
    }

    .joinok-btn:hover {
      background: rgba(0,0,0,0.06);
    }

    /* common.css 헤더가 뜨면 숨김 */
    header.header {
      display: none !important;
    }
  </style>
</head>

<body class="joinok-page">
  <div class="joinok-bg"></div>

  <div class="joinok-wrap">
    <!-- 로고 -->
    <div class="joinok-brand">
      <a href="../home.jsp" aria-label="메인페이지로 이동">
    <img src="../buskinglogo.png" alt="BUSKING RESERVATION" />
  </a>
    </div>

    <!-- 카드 -->
    <div class="joinok-card">
      <h2 class="joinok-title">회원가입</h2>
      <p class="joinok-desc">OO님 회원가입을 축하드립니다!</p>

      <div class="check-wrap">
        <div class="check-circle" aria-hidden="true">
          <!-- 체크 SVG -->
          <svg viewBox="0 0 24 24" fill="none">
            <path d="M20 6L9 17l-5-5" stroke="#222" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </div>
      </div>

      <div class="btn-col">
        <!-- ✅ 경로는 너 파일 구조에 맞게 수정 가능 -->
        <button class="joinok-btn" type="button" onclick="location.href='../home.jsp'">
          메인페이지로 이동
        </button>
        <button class="joinok-btn" type="button" onclick="location.href='../mypage/main.jsp'">
          마이페이지로 이동
        </button>
      </div>
    </div>
  </div>
</body>
</html>
