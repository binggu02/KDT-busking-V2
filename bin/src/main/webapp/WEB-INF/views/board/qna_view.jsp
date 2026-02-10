<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>Q&A 상세</title>

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Pretendard, Arial, sans-serif;
    }

    body {
      background: #f5f5f5;
      color: #222;
    }

    a { text-decoration: none; color: inherit; }

    /* HEADER */
    .header { background: #111; color: white; }
    .header-inner {
      max-width: 1200px;
      margin: 0 auto;
      height: 70px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    .logo img { height: 40px; }
    .nav a { margin: 0 15px; font-size: 14px; }
    .auth .pill {
      border: 1px solid white;
      padding: 6px 14px;
      border-radius: 20px;
      font-size: 13px;
      margin-left: 10px;
    }

    /* MAIN */
    .main { padding: 40px 0; }
    .container {
      max-width: 900px;
      margin: 0 auto;
      background: white;
      padding: 40px;
      border-radius: 10px;
    }

    .post-header {
      border-bottom: 2px solid #ddd;
      padding-bottom: 20px;
      margin-bottom: 30px;
    }
    .post-title {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 10px;
    }
    .post-info {
      font-size: 14px;
      color: #777;
      display: flex;
      gap: 20px;
    }

    .post-content {
      font-size: 16px;
      line-height: 1.7;
      margin-bottom: 40px;
      white-space: pre-line;
    }

    .answer-box {
      background: #fafafa;
      border-left: 4px solid #ff7875;
      padding: 20px;
      margin-bottom: 40px;
    }
    .answer-box h3 {
      font-size: 18px;
      margin-bottom: 10px;
      color: #ff7875;
    }

    /* BUTTON */
    .btn-area {
      display: flex;
      justify-content: flex-end;
      gap: 10px;
    }

    .btn-list,
    .btn-delete {
      border: none;
      padding: 8px 20px;
      border-radius: 6px;
      font-size: 14px;
      cursor: pointer;
      color: white;
    }

    .btn-list { background: #999; }
    .btn-delete { background: #ff4d4f; }

    /* FOOTER */
    .footer {
      margin-top: 50px;
      text-align: center;
      font-size: 13px;
      color: #888;
    }
  </style>
</head>

<body>

	<header class="header">
	   <div class="container header-inner">
	     <a class="logo" href="../home.jsp">
	       <img src="images/buskinglogo.png" alt="BUSKING RESERVATION" class="logo-icon" />
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

    <!-- 질문 -->
    <section class="post-header">
      <div class="post-title">장비 대여는 어떻게 하나요?</div>
      <div class="post-info">
        <span>작성자: dlwldnjs</span>
        <span>작성일: 2026-01-15</span>
      </div>
    </section>

    <section class="post-content">
장비 대여 절차가 궁금합니다.
신청 방법과 주의사항을 알려주세요.
    </section>

    <!-- 답변 -->
    <section class="answer-box">
      <h3>관리자 답변</h3>
      <p>
        마이페이지 → 장비 예약 메뉴에서
        원하는 장비를 선택 후 예약하시면 됩니다.
      </p>
    </section>

    <!-- 버튼 -->
    <div class="btn-area">
      <button class="btn-list" onclick="location.href='./main.jsp'">
        목록
      </button>
      <button class="btn-delete" onclick="deleteQna()">
        삭제
      </button>
    </div>

  </div>
</main>

<footer class="footer">
  <p>© Busking Reservation</p>
</footer>

<script>
  function deleteQna() {
    if (confirm("해당 Q&A를 삭제하시겠습니까?")) {
      alert("삭제되었습니다.");
      location.href = "./main.jsp"; // Q&A 목록으로 이동
    }
  }
</script>

</body>
</html>
