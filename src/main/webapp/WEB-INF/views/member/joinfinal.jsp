<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>가입 완료</title>
    
  <!-- 공통 css -->
  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
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
      background: url("<c:url value='/images/busking.png'/>") center / cover no-repeat;
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
	<div class="login-bg">
	
		<div class="login-wrap">
		    <div class="login-brand">
		      <a href="<c:url value='/'/>" aria-label="메인페이지로 이동">
		        <img src="<c:url value='/buskinglogo.png'/>" alt="BUSKING RESERVATION" />
		      </a>
		    </div>
		    
		    <div class="login-card">
			<h1>가입이 완료되었습니다</h1>
		    <p>
		        이제 버스킹 예약 서비스를 자유롭게 이용하실 수 있습니다.
		    </p>
		
		    <div class="btn-group">
		        <a href="/member/login" class="login">로그인</a>
		        <a href="/" class="home">메인으로</a>
		    </div>
		
		</div>
		</div>
		
		
	
	</div>
<!-- --------------------------------- -->
<!-- <div class="card">
    <h1>가입이 완료되었습니다</h1>
    <p>
        이제 버스킹 예약 서비스를 자유롭게 이용하실 수 있습니다.
    </p>

    <div class="btn-group">
        <a href="/member/login" class="login">로그인</a>
        <a href="/" class="home">메인으로</a>
    </div>
</div>
 -->

<!-- --------------------------------- -->


</body>
</html>
