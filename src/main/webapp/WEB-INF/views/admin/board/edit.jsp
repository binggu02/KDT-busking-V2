<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Q&A 답변 등록</title>

<link rel="stylesheet" href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" href="<c:url value='/css/admin.css'/>">

<style>
main { flex: 1; background: #fff; padding: 40px; }
h2 { margin-bottom: 20px; }
label { display: block; margin-top: 20px; font-weight: bold; margin-bottom: 6px; }
input[type=text], textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
}
textarea { height: 150px; resize: none; }
.btn-group { margin-top: 20px; display: flex; gap: 10px; }
.btn {
	padding: 8px 18px;
	border: none;
	border-radius: 6px;
	font-size: 14px;
	cursor: pointer;
	color: white;
}
.submit { background-color: #52c41a; }
.cancel {
	background-color: #ff4d4f;
	text-decoration: none;
	text-align: center;
	display: inline-block;
	line-height: 28px;
}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/nav.jsp" />

<div class="admin-page">
	<div class="admin-container">

		<aside class="admin-aside">
				<ul>
					<li><a href="<c:url value='/admin/main'/>">대시보드</a></li>
					<li><a href="<c:url value='/admin/board/list'/>">게시판 관리</a></li>
					<li><a href="<c:url value='/admin/board/qna_list'/>">Q&A
							관리</a></li>
					<li><a href="<c:url value='/admin/gear/list'/>">장비 예약 관리</a></li>
					<li><a href="<c:url value='/admin/locale/list'/>">장소 예약 관리</a></li>
					<li><a href="<c:url value='/admin/gear/update_list'/>">장비
							관리</a></li>
					<li><a href="<c:url value='/admin/locale/update_list'/>">장소
							관리</a></li>
					<li><a href="<c:url value='/admin/member/list'/>">회원 관리</a></li>
				</ul>
			</aside>

		<main>
			<h2>답변 등록</h2>

			<form action="<c:url value='/admin/board/edit'/>" method="post">
				<label>게시글 번호</label>
				<input type="text" name="boardId" value="${board.boardId}" readonly="readonly">

				<label>게시글 제목</label>
				<input type="text" value="${board.title}" readonly>

				<label>질문 내용</label>
				<textarea readonly>${board.content}</textarea>

				<label>답변 작성</label>
				<textarea name="answer" placeholder="답변을 작성하세요..." required>${board.answer}</textarea>

				<div class="btn-group">
					<button type="submit" class="btn submit">답변 등록</button>
					<a href="<c:url value='/admin/board/qna_list'/>"
						class="btn cancel">취소</a>
				</div>
			</form>
		</main>

	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>