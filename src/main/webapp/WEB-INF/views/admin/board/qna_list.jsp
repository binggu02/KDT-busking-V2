<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Q&A 관리</title>

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
						<li><a href="<c:url value='/admin/gear/update'/>">장비 관리</a></li>
						<li><a href="<c:url value='/admin/locale/update'/>">장소 관리</a></li>
						<li><a href="<c:url value='/admin/member/list'/>">회원 관리</a></li>
	                </ul>
	            </aside>   

    <main>
        <h2>Q&A 관리</h2>

        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>질문 제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${not empty boardList}">
                    <c:forEach var="b" items="${boardList}">
                        <tr>
                            <td><c:out value="${b.boardId}"/></td>
                            <td><c:out value="${b.title}"/></td>
                            <td><c:out value="${b.userId}"/></td>
                            <td><c:out value="${b.createWriterAt}"/></td>
                            <td class="manage-btns">
                                <a class="view" href="<c:url value='/admin/board/view'><c:param name='id' value='${b.boardId}'/></c:url>">확인</a>
                                <a class="edit" href="<c:url value='/admin/board/edit'><c:param name='id' value='${b.boardId}'/></c:url>">답변</a>
                                
                                <!-- 삭제 버튼 -->
                                <form method="post" action="<c:url value='/admin/board/delete'/>" style="display:inline;">
                                    <input type="hidden" name="boardId" value="${b.boardId}">
                                    <input type="hidden" name="boardTypeId" value="${b.boardTypeId}">
                                    <button type="submit" class="delete" onclick="return confirm('정말 삭제할까요?');">삭제</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>

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
