<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>게시글 상세</title>

  <!-- 공통 CSS -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css" />
   <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css" />
   <link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css" />
   
   <body>

<!-- ✅ 공통 헤더 -->
<header class="header">
	  <div class="container header-inner">
		<a class="logo" href="<%= request.getContextPath() %>/">
			<img src="<%= request.getContextPath() %>/images/buskinglogo.png"
			     alt="BUSKING RESERVATION"
			     class="logo-icon" />

		</a>


	<nav class="nav">
		  <a href="<%= request.getContextPath() %>/gear/list">장비 예약</a>
		  <a href="<%= request.getContextPath() %>/locale/list">지역별 장소 예약</a>
		  <a href="<%= request.getContextPath() %>/board/main">게시판</a>
		</nav>

		<div class="auth">
		  <a class="pill" href="<%= request.getContextPath() %>/mypage/main">my page</a>
		  <a class="pill" href="<%= request.getContextPath() %>/member/logout">logout</a>
		</div>
		
</header>

<!-- ✅ 본문 -->
<main class="main">
  <div class="container board-wrap">

    <!-- 게시글 박스 -->
    <div class="board-box board-view-box">

      <!-- 제목 / 정보 -->
      <div class="board-view-header">
        <h1 class="board-view-title">
          Sure. Here is a Typescript code block...
        </h1>

        <div class="board-view-info">
          <span>작성자 <b>dlwldnjs</b></span>
          <span>2026-01-15</span>
        </div>
      </div>

      <!-- 내용 -->
      <div class="board-view-content">
안녕하세요.

버스킹 플랫폼을 이용해주셔서 감사합니다.
본 게시글은 게시글 상세 화면 예시입니다.

감사합니다.
      </div>

      <!-- 버튼 -->
	  <div class="board-view-actions">
	    <button class="action-btn btn-list" onclick="location.href='<%=request.getContextPath()%>/board/main'">
	      목록
	    </button>
	    <button class="action-btn btn-edit" onclick="location.href='<%=request.getContextPath()%>/board/update'">
	      수정
	    </button>
	    <button class="action-btn btn-delete" onclick="deletePost()">
	      삭제
	    </button>
	  </div>
    </div>
  </div>
</main>

<footer class="footer">
  <div class="container">
    <p>© Busking Reservation</p>
  </div>
</footer>

<script>
function deletePost() {
  if (confirm("게시글을 삭제하시겠습니까?")) {
    alert("삭제되었습니다.");
    location.href = "<%= request.getContextPath() %>/board/main";
  }
}
</script>


</body>
</html>
