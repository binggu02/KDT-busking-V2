<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
=======

>>>>>>> origin/test_v2
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Q&A 관리</title>

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

        /* ===== 헤더 ===== */
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

        .header::before {
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.4);
            z-index: 1;
        }

        .logo-img {
            position: absolute;
            left: 30px;
            top: 50%;
            transform: translateY(-50%);
            height: 120px;
            z-index: 2;
        }

        .menu {
            display: flex;
            gap: 30px;
            z-index: 2;
        }

        .menu span {
            color: white;
            font-size: 14px;
            cursor: pointer;
        }

        .logout {
            color: white;
            border: 1px solid white;
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 13px;
            cursor: pointer;
        }

        /* ===== 레이아웃 ===== */
        .container {
            display: flex;
            margin-top: 80px;
            min-height: calc(100vh - 80px);
        }

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

        .manage-btns button {
            border: none;
            padding: 6px 14px;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
            color: white;
        }

        .delete { background-color: #ff4d4f; }
        .edit { background-color: #ff7875; }
        .view { background-color: #ff4d4f; }
    </style>
</head>

<body>

<header class="header">
<<<<<<< HEAD
    <a href="./home.html">
=======
    <a href="../main.jsp">
>>>>>>> origin/test_v2
        <img src="./images/buskinglogo.png" class="logo-img">
    </a>

    <div class="menu">
        <span>장비 예약</span>
        <span>지역별 장소 예약</span>
        <span>게시판</span>
        <div class="logout">logout</div>
    </div>
</header>

<div class="container">
     <aside>
        <ul>
<<<<<<< HEAD
            <li onclick="location.href='admin_board.html'">게시판 관리</li>
            <li onclick="location.href='admin_qna.html'">Q&A 관리</li>
            <li onclick="location.href='admin_gear.html'"><b>장비 예약 관리</b></li>
            <li onclick="location.href='admin_location.html'"><b>장소 예약 관리</b></li>
          <li onclick="location.href='admin_member.html'"><b>회원 관리</b></li>
=======
			<li><a href="./board/list.jsp">게시판 관리</a></li>
			      <li><a href="./board/qna_list.jsp">Q&A 관리</a></li>
			      <li><a href="./gear/list.jsp">장비 예약 관리</a></li>
			      <li><a href="./locale/list.jsp">장소 예약 관리</a></li>
			      <li><a href="./locale/list.jsp">회원 관리</a></li>
>>>>>>> origin/test_v2
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

</body>
</html>
