<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>게시판</title>

  <link rel="stylesheet" href="../css/common.css" />

  <link rel="stylesheet" href="../css/board.css" />
</head>

<body>
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

<main class="main">
  <div class="container board-wrap">

    <!-- 검색바 -->
    <div class="board-search">
      <input type="text" placeholder="검색어 입력" />
      <button type="button">🔍</button>
    </div>

    <!-- 탭 -->
    <section class="board-tabs">
      <button class="tab ${typeId == 1 ? 'active' : ''}" type="button" data-tab="free">자유게시판</button>
      <button class="tab ${typeId == 2 ? 'active' : ''}" type="button" data-tab="qna">Q&A</button>
    </section>

    <!-- 패널 -->
    <section class="tab-panels">

      <!-- 자유게시판 -->
      <div class="tab-panel ${typeId == 1 ? 'show' : ''}" data-panel="free">
        <div class="board-box">
          <c:forEach var="b" items="${list}">
            <c:if test="${b.boardTypeId == 1}">
              <div class="board-row">
                <div class="board-left">
                  <span class="doc-icon">📄</span>
                  <div class="board-text">
                    <a href="${pageContext.request.contextPath}/board/view?id=${b.boardId}">
                      ${b.title}
                    </a>
                    <p class="board-sub">
                      ${b.content}
                    </p>
                  </div>
                </div>
                <div class="board-right">
                  <div class="writer">user${b.userId}</div>
                  <div class="date">
                    <c:out value="${b.createWriterAt}" />
                  </div>
                </div>
              </div>
            </c:if>
          </c:forEach>
        </div>
      </div>

      <!-- Q&A -->
      <div class="tab-panel ${typeId == 2 ? 'show' : ''}" data-panel="qna">
        <div class="board-box">
          <c:forEach var="b" items="${list}">
            <c:if test="${b.boardTypeId == 2}">
              <div class="board-row">
                <div class="board-left">
                  <span class="doc-icon">📄</span>
                  <div class="board-text">
                    <a href="${pageContext.request.contextPath}/board/view?id=${b.boardId}">
                      ${b.title}
                    </a>
                    <p class="board-sub">
                      ${b.content}
                    </p>
                  </div>
                </div>
                <div class="board-right">
                  <div class="writer">user${b.userId}</div>
                  <div class="date">
                    <c:out value="${b.createWriterAt}" />
                  </div>
                </div>
              </div>
            </c:if>
          </c:forEach>
        </div>
      </div>

    </section>

  </div>
</main>

<!-- 글쓰기 -->
<button class="btn-create floating"
  onclick="location.href='${pageContext.request.contextPath}/board/create'">
  <span class="icon">✍️</span>
  <span class="text">글쓰기</span>
</button>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
const tabs = document.querySelectorAll(".tab");
const panels = document.querySelectorAll(".tab-panel");

tabs.forEach(btn => {
  btn.addEventListener("click", () => {
    const target = btn.dataset.tab;

    if(target === "free") {
      location.href = "?typeId=1";
    } else {
      location.href = "?typeId=2";
    }
  });
});
</script>

</body>
</html>
