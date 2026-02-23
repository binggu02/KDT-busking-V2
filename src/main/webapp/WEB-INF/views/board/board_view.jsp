<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>게시글 상세</title>

  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css" />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css" />
</head>

<body>

<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
<main class="board-page">
  <div class="board-view-wrap">

    <div class="board-view-box">

      <!-- 제목 -->
      <h1 class="board-view-title">
        ${board.title}
      </h1>

      <!-- 작성자 / 날짜 -->
      <div class="board-view-meta">
        작성자 user${board.userId} |
        <c:out value="${board.createWriterAt}" />
      </div>

      <!-- 내용 -->
      <div class="board-view-content">
        ${board.content}
      </div>

      <!-- 버튼 영역 -->
      <div class="board-view-actions">

        <button class="btn-outline"
          onclick="location.href='<%=request.getContextPath()%>/board/main?typeId=${board.boardTypeId}'">
          목록
        </button>

        <button class="btn-outline"
          onclick="location.href='<%=request.getContextPath()%>/board/update?id=${board.boardId}'">
          수정
        </button>

        <form action="<%=request.getContextPath()%>/board/delete" method="post">
          <input type="hidden" name="id" value="${board.boardId}" />
          <button type="submit" class="btn-outline"
            onclick="return confirm('게시글을 삭제하시겠습니까?');">
            삭제
          </button>
        </form>

      </div>

    </div>
  </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
