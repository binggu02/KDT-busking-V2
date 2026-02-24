<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 수정</title>


<link rel="stylesheet" href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" href="<c:url value='/css/admin.css'/>">


<style>
h2 {
	margin-bottom: 20px;
}

.grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 14px;
}

.field {
	display: flex;
	flex-direction: column;
	gap: 6px;
}

label {
	font-size: 13px;
	color: #333;
}

input, select {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 14px;
}

.full {
	grid-column: 1/-1;
}

.hint {
	font-size: 12px;
	color: #777;
}

.btns {
	margin-top: 20px;
	display: flex;
	gap: 10px;
	justify-content: flex-end;
}

button, .btns a {
	padding: 10px 14px;
	border-radius: 8px;
	border: none;
	cursor: pointer;
	font-size: 14px;
	text-decoration: none;
	display: inline-block;
	text-align: center;
}

.save {
	background: #4caf50;
	color: #fff;
}

.back {
	background: #607d8b;
	color: #fff;
}

main {
	flex: 1;
	background-color: #fff;
	padding: 40px;
}

h2 {
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

thead {
	background-color: #f3f3f3;
}

th, td {
	padding: 14px;
	border-bottom: 1px solid #ddd;
	text-align: center;
	font-size: 14px;
}

.manage-btns {
	display: flex;
	justify-content: center;
	gap: 8px;
}

.manage-btns a, .manage-btns button {
	border: none;
	padding: 6px 14px;
	border-radius: 6px;
	font-size: 13px;
	cursor: pointer;
	color: white;
	text-decoration: none;
	display: inline-block;
}

.edit-btn {
	background-color: #607d8b;
}

.delete-btn {
	background-color: #f44336;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />



	<!-- 🔥 admin 전용 영역 시작 -->
	<div class="admin-page">

		<div class="admin-container">

			<!-- 사이드 메뉴 -->
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



					<h2>회원 수정</h2>

					<form method="post"
						action="<c:url value='/admin/member/${member.id}/edit'/>">

						<div class="grid">
							<div class="field">
								<label>회원번호(ID)</label> <input type="text" value="${member.id}"
									readonly>
							</div>

							<div class="field">
								<label>로그인 ID (수정불가)</label> <input type="text"
									value="${member.memberId}" readonly>
							</div>

							<div class="field full">
								<label>비밀번호</label> <input type="password" name="pw"
									placeholder="변경할 때만 입력 (비우면 기존 유지)">
								<div class="hint">비밀번호를 비워두면 기존 비밀번호를 유지합니다.</div>
							</div>

							<div class="field">
								<label>이름</label> <input type="text" name="name"
									value="${member.name}" required>
							</div>

							<div class="field">
								<label>닉네임</label> <input type="text" name="nickname"
									value="${member.nickname}" required>
							</div>

							<div class="field">
								<label>이메일</label> <input type="email" name="email"
									value="${member.email}">
							</div>

							<div class="field">
								<label>전화번호</label> <input type="text" name="phone"
									value="${member.phone}" placeholder="01012345678" required>
							</div>

							<div class="field">
								<label>생년월일</label> <input type="date" name="birthDate"
									value="${member.birthDate}" required>
							</div>

							<div class="field">
								<label>성별</label> <select name="gender" required="required">
									<option value=""
										<c:if test="${empty member.gender}">selected</c:if>>선택안함</option>
									<option value="M"
										<c:if test="${member.gender == 'M'}">selected</c:if>>M</option>
									<option value="F"
										<c:if test="${member.gender == 'F'}">selected</c:if>>F</option>
								</select>
							</div>
						</div>

						<div class="btns">
							<a class="back" href="<c:url value='/admin/member/list'/>">목록</a>
							<button class="save" type="submit">저장</button>
						</div>
					</form>

			</main>
		</div>
	</div>

</body>
</html>
