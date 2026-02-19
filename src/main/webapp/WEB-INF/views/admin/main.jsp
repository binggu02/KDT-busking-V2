<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Busking Admin</title>

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

        /* ===== 헤더 (고정) ===== */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 80px;
            background: url("./images/busking.png") center / cover no-repeat;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            padding-right: 40px;
            z-index: 1000;
        }

        /* 배너 어두운 오버레이 (글씨 잘 보이게) */
        .header::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
            z-index: 1;
        }

        /* 로고 */
        .logo-img {
            position: absolute;
            left: 30px;
            top: 50%;
            transform: translateY(-50%);
            height: 120px;
            z-index: 2;
        }

        /* 메뉴 */
        .menu {
            display: flex;
            align-items: center;
            gap: 30px;
            z-index: 2;
        }

        .menu span {
            color: #ffffff;
            font-size: 14px;
            cursor: pointer;
        }

        .menu span:hover {
            opacity: 0.8;
        }

        /* 로그아웃 */
        .logout {
            color: white;
            border: 1px solid white;
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 13px;
            cursor: pointer;
        }

        .logout:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        /* ===== 전체 레이아웃 ===== */
        .container {
            display: flex;
            margin-top: 80px; /* 고정 헤더 높이만큼 */
            height: calc(100vh - 80px);
        }

        /* 사이드바 */
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

        /* 메인 */
        main {
            flex: 1;
            background-color: #ffffff;
            padding: 40px;
            overflow-y: auto;
        }

        /* 콘텐츠 */
        .content-grid {
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 40px;
        }

        .section {
            margin-bottom: 50px;
        }

        .section h2 {
            font-size: 18px;
            margin-bottom: 20px;
        }

        /* 게시판 관리 */
        .board-box {
            width: 100%;
            height: 180px;
            background-color: #e0e0e0;
        }

        /* 예약 관리 */
        .reserve-wrap {
            display: flex;
            gap: 30px;
        }

        .reserve-box {
            width: 200px;
            height: 220px;
            background-color: #e0e0e0;
        }

        /* 회원 관리 */
        .member-box {
            width: 100%;
            height: 500px;
            background-color: #e0e0e0;
        }
    </style>
</head>

<body>

<!-- 헤더 -->
<header class="header">
    <a href="../admin/main.jsp">
        <img src="./images/buskinglogo.png" class="logo-img" alt="로고">
    </a>

    <div class="menu">
        <span>장비 예약</span>
        <span>지역별 장소 예약</span>
        <span>게시판</span>
        <div class="logout">logout</div>
    </div>
</header>

<!-- 본문 -->
<div class="container">
    <aside>
    <ul>
        <li><a href="<c:url value='/admin/board/list'/>">게시판 관리</a></li>
        <li><a href="<c:url value='/admin/board/qna_list'/>">Q&A 관리</a></li>

        <li><a href="<c:url value='/admin/gear/list'/>">장비 예약 관리</a></li>
        <li><a href="<c:url value='/admin/locale/list'/>">장소 예약 관리</a></li>

        <!-- ✅ 추가: 장비/장소 정보 수정(업데이트) -->
        <li><a href="<c:url value='/admin/gear/update_list'/>">장비 정보 업데이트</a></li>
        <li><a href="<c:url value='/admin/place/update'/>">장소 정보 업데이트</a></li>

        <li><a href="<c:url value='/admin/member/list'/>">회원 관리</a></li>
    </ul>
</aside>



    <main>
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
</div>

</body>
</html>
