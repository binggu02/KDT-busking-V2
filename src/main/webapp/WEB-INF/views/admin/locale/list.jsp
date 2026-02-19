<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장소 예약 관리</title>
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
						<li><a href="<c:url value='/admin/gear/update'/>">장비 관리</a></li>
						<li><a href="<c:url value='/admin/locale/update'/>">장소 관리</a></li>
						<li><a href="<c:url value='/admin/member/list'/>">회원 관리</a></li>
	                </ul>
	            </aside>   
    <main>
        <h2>장소 예약 관리</h2>

			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>장소</th>
						<th>예약자ID</th>
						<th>예약일</th>
						<th>사용일</th>
						<th>관리</th>
					</tr>
				</thead>

				<tbody>
					<c:if test="${empty reservationList}">
						<tr>
							<td colspan="6" style="padding: 30px; color: #777;">예약 내역이
								없습니다.</td>
						</tr>
					</c:if>

					<c:forEach var="r" items="${reservationList}">
						<tr>
							<td>${r.id}</td>

							<td><c:choose>
									<c:when test="${not empty r.place}">
                  ${r.place.placeName}
                </c:when>
									<c:otherwise>(장소정보 없음)</c:otherwise>
								</c:choose></td>

							<td><c:choose>
									<c:when test="${not empty r.userId}">
                  ${r.userId}
                </c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose></td>

							<td>${r.createdAt}</td>
							<td>${r.reservationDate}</td>

							<td class="manage-btns">
								<form method="post"
									action="<c:url value='/admin/locale/${r.id}/delete'/>"
									onsubmit="return confirm('정말 삭제할까요?');">
									<button class="delete-btn" type="submit">삭제</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</main>
	</div>

</body>
</html>
