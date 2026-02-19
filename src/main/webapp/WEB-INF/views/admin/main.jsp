<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Busking Admin</title>

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

            <!-- 메인 콘텐츠 -->
            <main class="admin-main">
                <div class="content-grid">

                    <!-- 왼쪽 -->
                    <div>
                        <div class="section">
                            <h2>게시판 관리</h2>
                            <div class="board-box"></div>
                        </div>

                        <div class="section">
                            <h2>예약 관리</h2>
                            <div class="reserve-wrap">
                                <div class="reserve-box"></div>
                                <div class="reserve-box"></div>
                            </div>
                        </div>
                    </div>

                    <!-- 오른쪽 -->
                    <div class="section">
                        <h2>회원 관리</h2>
                        <div class="member-box"></div>
                    </div>

                </div>
            </main>

        </div> <!-- admin-container 끝 -->

    </div> <!-- admin-page 끝 -->

    <!-- 기존 footer 그대로 -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
