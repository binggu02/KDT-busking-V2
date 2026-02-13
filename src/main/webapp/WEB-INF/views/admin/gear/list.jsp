<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장비 예약 관리</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Pretendard", Arial, sans-serif;
}

body {
	background-color: #e5e5e5;
}

/* ===== 헤더 ===== */
.header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 80px;
	background: url("./images/busking.png") center/cover no-repeat;
	display: flex;
	align-items: center;
	justify-content: flex-end;
	padding-right: 40px;
	z-index: 1000;
}

.header::before {
	content: "";
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
	z-index: 1;
}

.logo-img {
	position: absolute;
	left: 30px;
	top: 50%;
	transform: translateY(-50%);
	height: 120px;
	z-index: 2;
}

.menu {
	display: flex;
	gap: 30px;
	z-index: 2;
}

.menu span {
	color: white;
	font-size: 14px;
	cursor: pointer;
}

.logout {
	color: white;
	border: 1px solid white;
	padding: 6px 16px;
	border-radius: 20px;
	font-size: 13px;
	cursor: pointer;
}

/* ===== 레이아웃 ===== */
.container {
	display: flex;
	margin-top: 80px;
	min-height: calc(100vh - 80px);
}

aside {
	width: 220px;
	background-color: #d9d9d9;
	padding: 30px 20px;
}

aside ul {
	list-style: none;
}

aside li {
	margin-bottom: 20px;
	font-size: 15px;
	cursor: pointer;
}

aside li:hover {
	font-weight: bold;
}

main {
	flex: 1;
	background-color: #fff;
	padding: 40px;
}

/* ===== 테이블 ===== */
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

.status {
	font-weight: bold;
}

.status.wait {
	color: #ff9800;
}

.status.approve {
	color: #2e7d32;
}

.status.reject {
	color: #c62828;
}

.manage-btns {
	display: flex;
	justify-content: center;
	gap: 8px;
}

.manage-btns button {
	border: none;
	padding: 6px 14px;
	border-radius: 6px;
	font-size: 13px;
	cursor: pointer;
	color: white;
}

.approve-btn {
	background-color: #4caf50;
}

.reject-btn {
	background-color: #f44336;
}

.view-btn {
	background-color: #607d8b;
}
</style>
</head>

<body>

	<header class="header">

		<a href="/"> <img src="./images/buskinglogo.png" class="logo-img">
		</a>

		<div class="menu">
			<span>장비 예약</span> <span>지역별 장소 예약</span> <span>게시판</span>
			<div class="logout">logout</div>
		</div>
	</header>

	<div class="container">

		<aside>
			<li><a href="<c:url value='/admin/board/list'/>">게시판 관리</a></li>
			<li><a href="<c:url value='/admin/board/qna_list'/>">Q&A 관리</a></li>
			<li><a href="<c:url value='/admin/gear/list'/>">장비 예약 관리</a></li>
			<li><a href="<c:url value='/admin/locale/list'/>">장소 예약 관리</a></li>
			<li><a href="<c:url value='/admin/member/list'/>">회원 관리</a></li>

		</aside>

		<main>
			<h2>장비 예약 관리</h2>

			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>장비명</th>
						<th>예약자</th>
						<th>예약일</th>
						<th>사용일</th>
						<th>상태</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="r" items="${reservationList}">
						<tr>
							<td>${r.id}</td>
							<td><c:choose>
									<c:when test="${not empty r.gear}">
                    ${r.gear.gearName}
                </c:when>
									<c:otherwise>(장비정보 없음)</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${not empty r.member}">
                    ${r.member.memberId}
                </c:when>
									<c:otherwise>(예약자 없음)</c:otherwise>
								</c:choose></td>
							<td>${r.createdAt}</td>
							<td>${r.startDatetime}~ ${r.endDatetime}</td>
							<td class="status wait">${r.status}</td>

							<td class="manage-btns">
								<form method="post"
									action="<c:url value='/admin/gear/${r.id}/delete'/>"
									onsubmit="return confirm('정말 삭제할까요?');">
									<button class="reject-btn" type="submit">삭제</button>
								</form>
							</td>
						</tr>
					</c:forEach>

					<c:if test="${empty reservationList}">
						<tr>
							<td colspan="7" style="padding: 30px; color: #777;">예약 내역이
								없습니다.</td>
						</tr>
					</c:if>
				</tbody>

			</table>
		</main>
	</div>

</body>
</html>
