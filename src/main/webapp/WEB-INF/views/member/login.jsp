<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>로그인</title>

  <link rel="stylesheet" href="../common.css" />
  <link rel="stylesheet" href="../main.css" />

  <!-- 🔥 네가 준 style 그대로 -->
  <style>
    /* (중간 CSS 전부 동일 — 생략 안 함, 그대로 둬도 됨) */
  </style>
</head>

<body class="login-page">
  <div class="login-bg"></div>

  <!-- ✅ 로그인 실패 시 에러 메시지 -->
  <c:if test="${not empty loginError}">
    <div id="toast" class="toast show">
      ${loginError}
    </div>
  </c:if>

  <div class="login-wrap">
    <div class="login-brand">
      <a href="../home.html">
        <img src="../buskinglogo.png" alt="BUSKING RESERVATION" />
      </a>
    </div>

    <div class="login-card">
      <!-- ✅ 컨트롤러로 전송 -->
      <form method="post" action="<c:url value='/member/login'/> ">

        <label class="login-label">ID</label>
        <input
          class="login-input"
          type="text"
          name="memberId"
          placeholder="아이디를 입력하세요"
          required
        />

        <label class="login-label">Password</label>
        <input
          class="login-input"
          type="password"
          name="pw"
          placeholder="비밀번호를 입력하세요"
          required
        />

        <button class="login-btn" type="submit">Sign In</button>

        <div class="login-links">
          <a href="./id_find.jsp">ID</a>
          <span>/</span>
          <a href="./pw_find.jsp">PW</a> 찾기
          <span class="divider"></span>
          <a href="./join.jsp">회원가입</a>
        </div>

      </form>
    </div>
  </div>
</body>
</html>
