<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>QnA 답변 작성</title>

<link rel="stylesheet" href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" href="<c:url value='/css/admin.css'/>">
</head>

<body>

    <!-- 기존 사용자 헤더 그대로 사용 -->
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <!-- 🔥 admin 전용 영역 시작 -->
    <div class="admin-page">

        <div class="admin-container">

            <!-- 사이드 메뉴 -->
            <aside class="admin-aside">
                <ul>
                    <li><a href="<c:url value='/admin/board/list'/>">게시판 관리</a></li>
                    <li><a href="<c:url value='/admin/board/qna_list'/>">Q&A 관리</a></li>
                    <li><a href="<c:url value='/admin/gear/list'/>">장비 예약 관리</a></li>
                    <li><a href="<c:url value='/admin/locale/list'/>">장소 예약 관리</a></li>
					<li><a href="<c:url value='/admin/gear/update_list'/>">장비 관리</a></li>
					<li><a href="<c:url value='/admin/locale/update_list'/>">장소 관리</a></li>
					<li><a href="<c:url value='/admin/member/list'/>">회원 관리</a></li>
                </ul>
            </aside>   
  <h1>QnA 답변 작성</h1>

  <!-- 질문 내용 -->
  <div class="card">
    <div class="label">제목</div>
    <div class="value">${qna.title}</div>

    <div class="label">작성자</div>
    <div class="value">${qna.writer}</div>

    <div class="label">질문 내용</div>
    <div class="value">${qna.content}</div>
  </div>

  <!-- 답변 작성 -->
  <form>
    <div class="card">
      <div class="label">답변 내용</div>
      <textarea name="answer" placeholder="답변을 입력하세요">${qna.answer}</textarea>

      <div class="btn-group">
        <a class="btn btn-cancel" href="qna_list.jsp">목록으로</a>
        <button type="button" class="btn btn-submit" onclick="submitAnswer()">답변 등록</button>
      </div>
    </div>
  </form>

</div>

<script>
function submitAnswer() {
  alert("답변이 등록되었습니다.");
  location.href = "qna_list.jsp";
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
