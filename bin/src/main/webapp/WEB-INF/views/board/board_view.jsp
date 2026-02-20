<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>게시글 상세</title>

  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css" />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css" />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css" />
</head>

<body>
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

<main class="main">
  <div class="container board-wrap">

    <div class="board-box board-view-box">

      <!-- 제목 -->
      <div class="board-view-header">
        <h1 class="board-view-title">
          ${board.title}
        </h1>

        <div class="board-view-info">
          <span>작성자 <b>user${board.userId}</b></span>
          <span>
            <c:out value="${board.createWriterAt}" />
          </span>
        </div>
      </div>

      <!-- 내용 -->
      <div class="board-view-content">
        ${board.content}
      </div>

      <!-- 버튼 -->
      <div class="board-view-actions">
        <button class="action-btn btn-list"
          onclick="location.href='<%=request.getContextPath()%>/board/main?typeId=${board.boardTypeId}'">
          목록
        </button>

        <button class="action-btn btn-edit"
          onclick="location.href='<%=request.getContextPath()%>/board/update?id=${board.boardId}'">
          수정
        </button>

        <form action="<%=request.getContextPath()%>/board/delete" method="post" style="display:inline;">
          <input type="hidden" name="id" value="${board.boardId}" />
          <button type="submit" class="action-btn btn-delete"
            onclick="return confirm('게시글을 삭제하시겠습니까?');">
            삭제
          </button>
        </form>
      </div>

    </div>
  </div>
</main>

<footer class="footer">
  <div class="container">
    <p>© Busking Reservation</p>
  </div>
</footer>

</body>
</html>
