<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>게시판</title>

  <!-- ✅ 루트에 있는 공통 CSS -->
  <link rel="stylesheet" href="../css/common.css" />
  <link rel="stylesheet" href="../css/main.css" />

  <!-- ✅ board 전용 CSS (반드시 마지막) -->
  <link rel="stylesheet" href="../css/board.css" />
</head>

<body>
  <!-- ✅ 상단 헤더 -->
  <header class="header">
    <div class="container header-inner">
		<a class="logo" href="<%= request.getContextPath() %>/">
		  <img src="../images/buskinglogo.png"
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
			
    </div>
  </header>

  <main class="main">
    <div class="container board-wrap">

      <!-- ✅ 검색바 -->
      <div class="board-search">
        <input type="text" placeholder="Value" />
        <button type="button" aria-label="검색">🔍</button>
      </div>

      <!-- ✅ 탭 -->
      <section class="board-tabs">
        <button class="tab active" type="button" data-tab="free">자유게시판</button>
        <button class="tab" type="button" data-tab="qna">Q&A</button>
      </section>

      <!-- ✅ 패널 -->
      <section class="tab-panels">
        <!-- 자유게시판 -->
        <div class="tab-panel show" data-panel="free">
          <div class="board-box">

            <div class="board-row">
              <div class="board-left">
                <span class="doc-icon">📄</span>
                <div class="board-text">
					<a href="<%= request.getContextPath() %>/board/view">Sure. Here is a Typescript code block...</a>
                  <p class="board-sub">Let me know if you would like to make any refinements to the code.</p>
                </div>
              </div>
              <div class="board-right">
                <div class="writer">dlwldnjs</div>
                <div class="date">2026-01-15</div>
              </div>
            </div>

            <div class="board-row">
              <div class="board-left">
                <span class="doc-icon">📄</span>
                <div class="board-text">
                  <a class="board-link" href="#">Sure. Here is a Typescript code block...</a>
                  <p class="board-sub">Let me know if you would like to make any refinements to the code.</p>
                </div>
              </div>
              <div class="board-right">
                <div class="writer">dlwldnjs</div>
                <div class="date">2026-01-15</div>
              </div>
            </div>

            <div class="board-row">
              <div class="board-left">
                <span class="doc-icon">📄</span>
                <div class="board-text">
                  <a class="board-link" href="#">Sure. Here is a Typescript code block...</a>
                  <p class="board-sub">Let me know if you would like to make any refinements to the code.</p>
                </div>
              </div>
              <div class="board-right">
                <div class="writer">dlwldnjs</div>
                <div class="date">2026-01-15</div>
              </div>
            </div>

            <div class="board-row">
              <div class="board-left">
                <span class="doc-icon">📄</span>
                <div class="board-text">
                  <a class="board-link" href="#">Sure. Here is a Typescript code block...</a>
                  <p class="board-sub">Let me know if you would like to make any refinements to the code.</p>
                </div>
              </div>
              <div class="board-right">
                <div class="writer">dlwldnjs</div>
                <div class="date">2026-01-15</div>
              </div>
            </div>

          </div>
        </div>

        <!-- Q&A -->
		<div class="tab-panel" data-panel="qna">
		  <div class="board-box">
		    <div class="board-row">
		      <div class="board-left">
		        <span class="doc-icon">📄</span>
		        <div class="board-text">
					<a href="<%= request.getContextPath() %>/board/qna/view">
					  장비 대여는 어떻게 해야 합니까?
					</a>
		          <p class="board-sub">절차가 궁금합니다.</p>
		        </div>
		      </div>
		      <div class="board-right">
		        <div class="writer">dlwldnjs</div>
		        <div class="date">2026-01-15</div>
		      </div>
		    </div>
		  </div>
		</div>
      </section>

    </div>
  </main>

  <!-- 플로팅 글쓰기 버튼 -->
  <button class="btn-create floating" onclick="location.href='<%= request.getContextPath() %>/board/create'">
    <span class="icon">✍️</span>
    <span class="text">글쓰기</span>
  </button>

  <footer class="footer">
    <div class="container">
      <p>© Busking Reservation</p>
    </div>
  </footer>

  <script>
    const tabs = document.querySelectorAll(".tab");
    const panels = document.querySelectorAll(".tab-panel");

    tabs.forEach((btn) => {
      btn.addEventListener("click", () => {
        const target = btn.dataset.tab;

        tabs.forEach(t => t.classList.remove("active"));
        btn.classList.add("active");

        panels.forEach(p => {
          p.classList.toggle("show", p.dataset.panel === target);
        });
      });
    });
  </script>
</body>
</html>
