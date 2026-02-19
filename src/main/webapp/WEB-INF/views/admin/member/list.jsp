<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 관리</title>

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
        <h2>회원 관리</h2>

        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>가입일</th>
                    <th>상태</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>user01</td>
                    <td>김버스킹</td>
                    <td>2026-01-10</td>
                    <td class="status active">활동중</td>
                    <td class="manage-btns">
                        <button class="block-btn">차단</button>
                        <button class="view-btn">확인</button>
                    </td>
                </tr>

                <tr>
                    <td>2</td>
                    <td>user02</td>
                    <td>이공연</td>
                    <td>2026-01-12</td>
                    <td class="status block">차단</td>
                    <td class="manage-btns">
                        <button class="active-btn">해제</button>
                        <button class="view-btn">확인</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </main>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
