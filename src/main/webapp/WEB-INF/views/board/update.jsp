<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>게시물 수정</title>
  <link rel="stylesheet" href="../css/common.css" />
  <link rel="stylesheet" href="../css/main.css" />
  <link rel="stylesheet" href="../css/board.css" />
</head>
<body>

<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

<main class="main">
  <div class="container board-wrap">

    <h2 class="board-title">게시글 수정</h2>
	
    <div class="board-box board-edit-box">
      <form action="<%= request.getContextPath() %>/board/update" method="post" class="board-form">

        <input type="hidden" name="boardId" value="${board.boardId}" />

        <div class="form-group">
          <label>게시판</label>
          <select name="boardTypeId" required>
            <option value="1" <c:if test="${board.boardTypeId == 1}">selected</c:if>>자유게시판</option>
            <option value="2" <c:if test="${board.boardTypeId == 2}">selected</c:if>>Q&A</option>
          </select>
        </div>

        <div class="form-group">
          <label>제목</label>
          <input type="text" name="title" class="form-input" value="${board.title}" placeholder="제목을 입력하세요" required />
        </div>

        <div class="form-group">
          <label>내용</label>
          <textarea name="content" class="form-textarea" rows="12" placeholder="내용을 입력하세요" required>${board.content}</textarea>
        </div>

        <div class="form-group">
          <label>썸네일 URL</label>
          <input type="text" name="thumbnailWriter" class="form-input" value="${board.thumbnailWriter}" placeholder="썸네일 URL 입력 (선택)" />
        </div>

        <div class="form-buttons">
          <button type="submit" class="btn btn-primary">수정 완료</button>
          <a href="<%= request.getContextPath() %>/board/view?id=${board.boardId}" class="btn btn-secondary">취소</a>
        </div>

      </form>
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
