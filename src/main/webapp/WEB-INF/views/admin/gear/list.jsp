<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장비 예약 관리</title>

	<link rel="stylesheet" href="<c:url value='/css/common.css'/>">
	<link rel="stylesheet" href="<c:url value='/css/admin.css'/>">
	<style type="text/css">
	
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
	</style>
	    
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
	                	<li><a href="<c:url value='/admin/main'/>">대시보드</a></li>
	                    <li><a href="<c:url value='/admin/board/list'/>">게시판 관리</a></li>
	                    <li><a href="<c:url value='/admin/board/qna_list'/>">Q&A 관리</a></li>
	                    <li><a href="<c:url value='/admin/gear/list'/>">장비 예약 관리</a></li>
	                    <li><a href="<c:url value='/admin/locale/list'/>">장소 예약 관리</a></li>
						<li><a href="<c:url value='/admin/gear/update_list'/>">장비 관리</a></li>
						<li><a href="<c:url value='/admin/locale/update_list'/>">장소 관리</a></li>
						<li><a href="<c:url value='/admin/member/list'/>">회원 관리</a></li>
	                </ul>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
