<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
<link rel="stylesheet" href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" href="<c:url value='/css/admin.css'/>">


    <title>게시글 상세보기</title>

<style>
main {
	flex: 1;
	background: #fff;
	padding: 40px;
}

h2 {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-top: 20px;
	font-weight: bold;
	margin-bottom: 6px;
}

input[type=text], textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
}

textarea {
	height: 150px;
	resize: none;
}

.btn-group {
	margin-top: 20px;
	display: flex;
	gap: 10px;
}

.btn {
	padding: 8px 18px;
	border: none;
	border-radius: 6px;
	font-size: 14px;
	cursor: pointer;
	color: white;
}

.submit {
	background-color: #52c41a;
}

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


	<!-- 기존 사용자 헤더 그대로 사용 -->
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<!-- 🔥 admin 전용 영역 시작 -->
	<div class="admin-page">

		<div class="admin-container">

			<!-- 사이드 메뉴 -->
			<aside class="admin-aside">
				<ul>
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



<div class="container">
    <h2>게시글 상세보기</h2>
	
	<div class="field">
		<label>번호</label>
	   	<input type="text" name="boardId" value="${board.boardId}" disabled>
	</div>
	
    <div class="field">
		<label>제목</label>
	   	<input type="text" name="title" value="${board.title}" disabled>
	</div>
	
	<div class="field">
		<label>내용</label>
	   	<textarea name="content" disabled>${board.content}</textarea>
	</div>

    
    <div class="field">
        <label>작성일</label>
        <input type="text" name="createWriterAt" value="${board.createWriterAt}" disabled>
    </div>
    <br>
    
    <div class="btn-area">
       <a href="<c:url value='/admin/board/list'/>" class="btn cancel">목록</a>
   </div>

</div>
</main>
</div>
</div>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>


관리자 게시판 페이지 확인용 (자유게시판, Q&A) 