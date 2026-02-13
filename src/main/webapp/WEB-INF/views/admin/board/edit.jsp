<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Q&A 답변 작성</title>

    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:"Pretendard", Arial, sans-serif; }
        body { background-color:#e5e5e5; }

        .header {
            position: fixed; top:0; left:0; width:100%; height:80px;
            background:url("/images/busking.png") center/cover no-repeat;
            display:flex; align-items:center; justify-content:flex-end;
            padding-right:40px; z-index:1000;
        }
        .header::before { content:""; position:absolute; inset:0; background:rgba(0,0,0,0.4); z-index:1; }
        .logo-img { position:absolute; left:30px; top:50%; transform:translateY(-50%); height:120px; z-index:2; }
        .menu { display:flex; gap:30px; z-index:2; }
        .menu span, .menu a { color:white; font-size:14px; cursor:pointer; text-decoration:none; }
        .logout { border:1px solid white; padding:6px 16px; border-radius:20px; }

        .container { display:flex; margin-top:80px; min-height:calc(100vh - 80px); }
        aside { width:220px; background-color:#d9d9d9; padding:30px 20px; }
        aside ul { list-style:none; }
        aside li { margin-bottom:20px; font-size:15px; cursor:pointer; }
        aside li:hover { font-weight:bold; }

        main { flex:1; background:#fff; padding:40px; }

        h2 { margin-bottom:20px; }
        label { display:block; margin-top:20px; font-weight:bold; margin-bottom:6px; }
        input[type=text], textarea {
            width:100%; padding:10px; border:1px solid #ccc; border-radius:6px; font-size:14px;
        }
        textarea { height:150px; resize:none; }
        .btn-group { margin-top:20px; display:flex; gap:10px; }
        .btn { padding:8px 18px; border:none; border-radius:6px; font-size:14px; cursor:pointer; color:white; }
        .submit { background-color:#52c41a; }
        .cancel { background-color:#ff4d4f; text-decoration:none; text-align:center; display:inline-block; line-height:28px; }
    </style>
</head>

<body>

<header class="header">
    <a href="/"><img src="/images/buskinglogo.png" class="logo-img"></a>
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
            <li onclick="location.href='/admin/board/list'">게시판 관리</li>
            <li onclick="location.href='/admin/board/qna_list'">Q&A 관리</li>
            <li onclick="location.href='admin_gear.html'"><b>장비 예약 관리</b></li>
            <li onclick="location.href='admin_location.html'"><b>장소 예약 관리</b></li>
            <li onclick="location.href='admin_member.html'"><b>회원 관리</b></li>
        </ul>
    </aside>

    <main>
        <h2>Q&A 답변 작성</h2>

        <!-- ✅ form action을 /edit로 변경 -->
        <form action="<c:url value='/admin/board/edit'/>" method="post">
            <input type="hidden" name="boardId" value="${board.boardId}">

            <label>질문 제목</label>
            <input type="text" value="${board.title}" readonly>

            <label>질문 내용</label>
            <textarea readonly>${board.content}</textarea>

            <label>답변 작성</label>
            <textarea name="answer" placeholder="답변을 작성하세요..." required>${board.answer}</textarea>

            <div class="btn-group">
                <button type="submit" class="btn submit">답변 등록</button>
                <a href="<c:url value='/admin/board/qna_list'/>" class="btn cancel">취소</a>
            </div>
        </form>
    </main>
</div>

</body>
</html>
