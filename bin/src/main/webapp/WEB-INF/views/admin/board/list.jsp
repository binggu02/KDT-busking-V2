<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판 관리</title>
    <style>
        /* (너 CSS 거의 그대로 두고) */
        * { margin:0; padding:0; box-sizing:border-box; font-family:"Pretendard", Arial, sans-serif; }
        body { background-color:#e5e5e5; }
        .header { position:fixed; top:0; left:0; width:100%; height:80px;
            background:url("<c:url value='/images/busking.png'/>") center/cover no-repeat;
            display:flex; align-items:center; justify-content:flex-end; padding-right:40px; z-index:1000; }
        .header::before { content:""; position:absolute; inset:0; background:rgba(0,0,0,0.4); z-index:1; }
        .logo-img { position:absolute; left:30px; top:50%; transform:translateY(-50%); height:120px; z-index:2; }
        .menu { display:flex; gap:30px; z-index:2; }
        .logout { color:#fff; font-size:14px; border:1px solid #fff; padding:6px 16px; border-radius:20px; text-decoration:none; z-index:2; }

        .container { display:flex; margin-top:80px; height:calc(100vh - 80px); }
        aside { width:220px; background-color:#d9d9d9; padding:30px 20px; }
        aside ul { list-style:none; }
        aside li { margin-bottom:20px; }
        aside a { text-decoration:none; color:#000; font-weight:bold; }

        main { flex:1; background:#fff; padding:40px; overflow:auto; }
        table { width:100%; border-collapse:collapse; text-align:center; }
        th, td { padding:14px; border-bottom:1px solid #ddd; }
        thead { background:#f2f2f2; }

        .manage-btns { display:flex; justify-content:center; gap:10px; }
        .manage-btns a, .manage-btns button {
            border:none; padding:6px 14px; border-radius:6px; font-size:13px; cursor:pointer;
            color:white; text-decoration:none; display:inline-block;
        }
        .delete { background-color:#ff4d4f; }
        .edit { background-color:#ff7875; }
        .view { background-color:#ff4d4f; }
        .empty { padding:30px; color:#666; }
    </style>
</head>

<body>

<header class="header">
    <a href="<c:url value='/admin/main'/>">
        <img src="<c:url value='/images/buskinglogo.png'/>" class="logo-img" alt="로고">
    </a>

    <div class="menu">
        <span>장비 예약</span>
        <span>지역별 장소 예약</span>
        <span>게시판</span>
        <a class="logout" href="<c:url value='/admin/logout'/>">logout</a>
    </div>
</header>

<div class="container">
    <aside>
        <ul>
            <li><a href="<c:url value='/admin/board/list'/>">게시판 관리</a></li>
            <li><a href="<c:url value='/admin/board/qna_list'/>">Q&A 관리</a></li>
            <li><a href="<c:url value='/admin/gear/list'/>">장비 예약 관리</a></li>
            <li><a href="<c:url value='/admin/locale/list'/>">장소 예약 관리</a></li>
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
                            <a class="view" href="<c:url value='/admin/board/view'><c:param name='id' value='${b.id}'/></c:url>">확인</a>

                            <!-- 수정(수정폼) -->
                            <a class="edit" href="<c:url value='/admin/board/edit'><c:param name='id' value='${b.id}'/></c:url>">수정</a>

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

</body>
</html>
