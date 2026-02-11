<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>Q&A 상세</title>
</head>

<!-- 공통 CSS -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css" />
<body>

	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
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
		<button class="action-btn btn-list" onclick="location.href='<%=request.getContextPath()%>/board/main'">
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
