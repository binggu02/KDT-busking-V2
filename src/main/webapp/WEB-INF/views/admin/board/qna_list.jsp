<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Q&A 관리</title>

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
                <tr>
                    <td>1</td>
                    <td>예약 취소는 어떻게 하나요?</td>
                    <td>user01</td>
                    <td>2026-01-22</td>
                    <td class="manage-btns">
                        <button class="delete">삭제</button>
                        <button class="edit">답변</button>
                        <button class="view">확인</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </main>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
