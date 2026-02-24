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


<section class="page-banner">
  <div class="container">
    <div class="page-banner-inner">
      <div class="page-text">
        <h1 class="page-title">게시판</h1>
        <div class="breadcrumb">
          <a href="/">홈</a>
          <span class="divider">›</span>
          <span class="current">게시판</span>
        </div>
      </div>
    </div>
  </div>
</section>

<main class="main board-page">

  <div class="board-container">

    <!-- 상단 헤더 -->
    <div class="board-header">
      <h2></h2>

      <button class="btn-write"
        onclick="location.href='${pageContext.request.contextPath}/board/create'">
        글쓰기
      </button>
    </div>

    <!-- 탭 -->
	<section class="board-tabs">
	  <a href="?typeId=1"
	     class="tab ${typeId == 1 ? 'active' : ''}">
	     자유게시판
	  </a>

	  <a href="?typeId=2"
	     class="tab ${typeId == 2 ? 'active' : ''}">
	     Q&A
	  </a>
	</section>

    <!-- 테이블 -->
    <table class="board-table">
      <thead>
        <tr>
          <th>제목</th>
          <th style="width:160px;">작성자</th>
          <th style="width:220px;">작성일</th>
        </tr>
      </thead>

      <tbody>
        <c:forEach var="b" items="${list}">
          <c:if test="${b.boardTypeId == typeId}">
            <tr>
              <td class="title-cell">
                <a href="${pageContext.request.contextPath}/board/view?id=${b.boardId}">
                  ${b.title}
                </a>
              </td>
              <td>user${b.userId}</td>
              <td><c:out value="${b.createWriterAt}" /></td>
            </tr>
          </c:if>
        </c:forEach>
      </tbody>
    </table>

  </div>
</main>

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
