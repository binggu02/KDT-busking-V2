<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>Q&A 상세</title>

  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css" />

  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css" />
</head>

<body>

<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
<main class="main">
  <div class="board-view-wrap">
    <div class="board-view-box">

      <!-- 제목 -->
      <div class="board-view-title">
        ${board.title}
      </div>

      <!-- 작성자 / 날짜 -->
      <div class="board-view-meta">
        <span>작성자: user${board.userId}</span>
        <span> | </span>
        <span>작성일: <c:out value="${board.createWriterAt}" /></span>
      </div>

      <!-- 질문 내용 -->
      <div class="board-view-content">
        ${board.content}
      </div>

      <!-- 답변 -->
      <div class="answer-box">
        <h3>관리자 답변</h3>
        <c:choose>
          <c:when test="${not empty board.answer}">
            <p>${board.answer}</p>
          </c:when>
          <c:otherwise>
            <p>아직 답변이 등록되지 않았습니다.</p>
          </c:otherwise>
        </c:choose>
      </div>

      <!-- 버튼 영역 -->
      <div class="board-view-actions">

        <button class="btn-outline"
          onclick="location.href='<%=request.getContextPath()%>/board/main?typeId=${board.boardTypeId}'">
          목록
        </button>

        <form action="<%=request.getContextPath()%>/board/delete"
              method="post"
              style="display:inline;">
          <input type="hidden" name="id" value="${board.boardId}" />
          <button type="submit"
                  class="btn-outline btn-delete"
                  onclick="return confirm('해당 Q&A를 삭제하시겠습니까?');">
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
