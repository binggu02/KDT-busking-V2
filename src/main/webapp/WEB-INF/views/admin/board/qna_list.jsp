<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            text-decoration: none;
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

<header class="header">

    <a href="/"><img src="./images/buskinglogo.png" class="logo-img"></a>

    <div class="menu">
        <span>장비 예약</span>
        <span>지역별 장소 예약</span>
        <span>게시판</span>
        <!-- 로그아웃 버튼 링크로 변경 -->
        <a class="logout" href="<c:url value='/admin/logout'/>">logout</a>
    </div>
</header>

<div class="container">
    <aside>
        <ul>
            <li onclick="location.href='/admin/board/list'">게시판 관리</li>
            <li onclick="location.href='/admin/board/qna_list'">Q&A 관리</li>
            <li onclick="location.href='admin_gear.html'"><b>장비 예약 관리</b></li>
            <li onclick="location.href='admin_location.html'"><b>장소 예약 관리</b></li>
            <li onclick="location.href='admin_member.html'"><b>회원 관리</b></li>
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

</body>
</html>
