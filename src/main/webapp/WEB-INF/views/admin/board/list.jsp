<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판 관리</title>
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
        <h2>게시판 관리</h2>

        <table>
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>관리</th>
            </tr>
            </thead>

            <tbody>
            <!-- ✅ 실제 데이터가 있으면 반복 -->
            <c:if test="${not empty boardList}">
                <c:forEach var="b" items="${boardList}">
                    <tr>
                        <td><c:out value="${b.id}"/></td>
                        <td><c:out value="${b.title}"/></td>
                        <td><c:out value="${b.writer}"/></td>
                        <td><c:out value="${b.createdAt}"/></td>
                        <td class="manage-btns">
                            <!-- 확인(상세) -->
                            <a class="view" href="<c:url value='/board/view'><c:param name='id' value='${b.id}'/></c:url>">확인</a>

                            <!-- 삭제(POST로 처리 권장) -->
                            <form method="post" action="<c:url value='/admin/board/delete'/>" style="display:inline;">
                                <input type="hidden" name="id" value="${b.id}">
                                <button type="submit" class="delete"
                                        onclick="return confirm('정말 삭제할까요?');">삭제</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>

            <!-- ✅ 데이터 없을 때 -->
            <c:if test="${empty boardList}">
                <tr>
                    <td class="empty" colspan="5">게시글이 없습니다.</td>
                </tr>
            </c:if>
            </tbody>
        </table>

    </main>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
