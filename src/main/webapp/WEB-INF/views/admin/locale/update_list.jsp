<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장소 정보 업데이트(목록)</title>

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
            background-color: #fff;
        }

        thead {
            background-color: #f3f3f3;
        }

        th, td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        .manage-btns {
            display: flex;
            justify-content: center;
            gap: 8px;
        }

        .manage-btns button, .manage-btns a {
            border: none;
            padding: 6px 14px;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
            color: white;
            text-decoration: none;
            display: inline-block;
        }

        .delete { background-color: #ff4d4f; }
        .edit { background-color: #ff7875; }
        .view { background-color: #ff4d4f; }
        .empty { padding: 30px; color: #666; }
        
        
.page-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.btn-write {
  padding: 10px 20px;
  font-size: 14px;
  font-weight: 600;

  background: linear-gradient(135deg, #111, #333);
  color: #fff;

  border: none;
  border-radius: 999px;

  cursor: pointer;
  transition: all 0.25s ease;

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
				
				
				<div class="page-header">
					<h2>장소 관리 > 장소 정보 리스트</h2>
					<button class="btn-write" onclick="location.href='<c:url value="/admin/locale/create"/>'">장소 신규 등록</button>
					
				</div>

				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>도시ID</th>
							<th>장소명</th>
							<th>주소</th>
							<th>전화</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="p" items="${placeList}">
							<tr>
								<td>${p.id}</td>
								<td><c:out value="${p.city.id}" /></td>
								<td><c:out value="${p.placeName}" /></td>
								<td><c:out value="${p.placeAddress}" /></td>
								<td><c:out value="${p.placePhone}" /></td>
								<td class="manage-btns">
								<a class="edit" href="<c:url value='/admin/locale/update'/>?id=${p.id}">수정</a>
								<a class="edit" href="<c:url value='/admin/locale/delete'/>?id=${p.id}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
								</td>
							</tr>
						</c:forEach>

						<c:if test="${empty placeList}">
							<tr>
								<td colspan="6">장소가 없습니다.</td>
							</tr>
						</c:if>

					</tbody>
				</table>
			</main>




		</div>
	</div>







<jsp:include page="/WEB-INF/views/common/footer.jsp" />


</body>
</html>
