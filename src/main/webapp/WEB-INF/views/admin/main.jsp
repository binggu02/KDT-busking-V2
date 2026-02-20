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

<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

<div class="admin-page">
    <div class="admin-container">

        <!-- 사이드 메뉴 -->
        <aside class="admin-aside">
            <ul>
            	<li><a href="<c:url value='/admin/main'/>">대시보드</a></li>
                <li><a href="<c:url value='/admin/board/list'/>">게시판 관리</a></li>
                <li><a href="<c:url value='/admin/board/qna_list'/>">Q&A 관리</a></li>

                <!-- 실제 장비예약 경로에 맞게 -->
                <li><a href="<c:url value='/admin/gear/list'/>">장비 예약 관리</a></li>

                <li><a href="<c:url value='/admin/locale/list'/>">장소 예약 관리</a></li>
                <li><a href="<c:url value='/admin/gear/update_list'/>">장비 관리</a></li>
                <li><a href="<c:url value='/admin/locale/update_list'/>">장소 관리</a></li>
                <li><a href="<c:url value='/admin/member/list'/>">회원 관리</a></li>
            </ul>
        </aside>

        <!-- 메인 콘텐츠 -->
        <main class="admin-main">
            <div class="content-grid">

                <!-- 왼쪽 -->
                <div>

                    <!-- 게시판 관리 -->
                    <div class="section">
                        <h2>게시판 관리</h2>

                        <div class="board-box">
                            <div class="box-inner">

                                <div class="metrics">
                                    <div class="metric">게시글 <b>${boardCount}</b></div>
                                    <div class="metric">회원 <b>${memberCount}</b></div>
                                    <div class="metric">장소예약 <b>${placeReservationCount}</b></div>
                                    <div class="metric">장비예약 <b>${gearReservationCount}</b></div>
                                </div>

                                <div class="box-title">
                                    <span>최근 게시글</span>
                                    <span style="font-size:12px; color:#666;">최신 5개</span>
                                </div>

                                <c:if test="${not empty recentBoards}">
                                    <ul class="list">
                                        <c:forEach var="b" items="${recentBoards}">
                                            <li class="item">
                                                <div class="item-top">
                                                    <div class="item-left">
                                                        <span class="badge badge-id">${b.boardId}</span>
                                                        <span class="item-title">type: ${b.boardTypeId}</span>
                                                    </div>
                                                    <span class="badge">user: ${b.userId}</span>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </c:if>

                                <c:if test="${empty recentBoards}">
                                    <div class="empty">최근 게시글이 없습니다.</div>
                                </c:if>

                            </div>
                        </div>
                    </div>

                    <!-- 예약 관리 -->
                    <div class="section">
                        <h2>예약 관리</h2>

                        <div class="reserve-wrap">

                            <!-- 최근 장소 예약 -->
                            <div class="reserve-box">
                                <div class="box-inner">
                                    <div class="box-title">
                                        <span>최근 장소 예약</span>
                                        <span style="font-size:12px; color:#666;">최신 5개</span>
                                    </div>

                                    <c:if test="${not empty recentPlaceReservations}">
                                        <ul class="list">
                                            <c:forEach var="r" items="${recentPlaceReservations}">
                                                <li class="item">
                                                    <div class="item-top">
                                                        <div class="item-left">
                                                            <span class="badge badge-id">${r.id}</span>
                                                            <span class="item-title">
                                                                <c:out value="${r.place.placeName}"/>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="item-meta">
                                                        <span>📅 <c:out value="${r.reservationDate}"/></span>
                                                        <span>⏰ <c:out value="${r.startTime}"/>~<c:out value="${r.endTime}"/></span>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:if>

                                    <c:if test="${empty recentPlaceReservations}">
                                        <div class="empty">최근 장소 예약이 없습니다.</div>
                                    </c:if>
                                </div>
                            </div>

                            <!-- 최근 장비 예약 -->
                            <div class="reserve-box">
                                <div class="box-inner">
                                    <div class="box-title">
                                        <span>최근 장비 예약</span>
                                        <span style="font-size:12px; color:#666;">최신 5개</span>
                                    </div>

                                    <c:if test="${not empty recentGearReservations}">
                                        <ul class="list">
                                            <c:forEach var="gr" items="${recentGearReservations}">
                                                <li class="item">
                                                    <div class="item-top">
                                                        <div class="item-left">
                                                            <span class="badge badge-id">${gr.id}</span>
                                                            <span class="item-title">
                                                                <c:out value="${gr.gear.gearName}"/>
                                                            </span>
                                                        </div>
                                                        <span class="badge"><c:out value="${gr.member.name}"/></span>
                                                    </div>
                                                    <div class="item-meta">
                                                        <span>🕒 <c:out value="${gr.startDatetime}"/></span>
                                                        <span>→ <c:out value="${gr.endDatetime}"/></span>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:if>

                                    <c:if test="${empty recentGearReservations}">
                                        <div class="empty">최근 장비 예약이 없습니다.</div>
                                    </c:if>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

                <!-- 오른쪽 -->
                <div class="section">
                    <h2>회원 관리</h2>

                    <div class="member-box">
                        <div class="box-inner">
                            <div class="box-title">
                                <span>최근 가입 회원</span>
                                <span style="font-size:12px; color:#666;">최신 5명</span>
                            </div>

                            <c:if test="${not empty recentMembers}">
                                <ul class="list">
                                    <c:forEach var="m" items="${recentMembers}">
                                        <li class="item">
                                            <div class="item-top">
                                                <div class="item-left">
                                                    <span class="badge badge-id">${m.id}</span>
                                                    <span class="item-title"><c:out value="${m.name}"/></span>
                                                </div>
                                                <span class="badge"><c:out value="${m.memberId}"/></span>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:if>

                            <c:if test="${empty recentMembers}">
                                <div class="empty">최근 회원이 없습니다.</div>
                            </c:if>

                        </div>
                    </div>
                </div>

            </div>
        </main>

    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
