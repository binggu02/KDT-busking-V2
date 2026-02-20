<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:"Pretendard", Arial, sans-serif; }
        body { background-color:#e5e5e5; }

        .header {
            position:fixed; top:0; left:0; width:100%; height:80px;
            background:url("<c:url value='/images/busking.png'/>") center/cover no-repeat;
            display:flex; align-items:center; justify-content:flex-end; padding-right:40px; z-index:1000;
        }
        .header::before {
            content:""; position:absolute; inset:0;
            background:rgba(0,0,0,0.4); z-index:1;
        }
        .logo-img {
            position:absolute; left:30px; top:50%;
            transform:translateY(-50%); height:120px; z-index:2;
        }
        .logout {
            color:#fff; font-size:14px; border:1px solid #fff;
            padding:6px 16px; border-radius:20px; text-decoration:none; z-index:2;
        }

        .container {
            margin-top:100px;
            width:600px;
            margin-left:auto;
            margin-right:auto;
            background:#fff;
            padding:40px;
            border-radius:8px;
        }

        .field { margin-bottom:20px; }
        .field label { display:block; margin-bottom:6px; font-weight:bold; }
        .field input, .field textarea {
            width:100%;
            padding:10px;
            border:1px solid #ccc;
            border-radius:6px;
            font-size:14px;
        }
        textarea { resize:none; height:200px; }

        .btn-area {
            margin-top:20px;
            text-align:right;
        }

        .btn {
            padding:8px 18px;
            border:none;
            border-radius:6px;
            cursor:pointer;
            font-size:14px;
            text-decoration:none;
        }

        .save { background:#ff4d4f; color:white; }
        .cancel { background:#999; color:white; }
    </style>
</head>
<body>

<header class="header">
    <a href="<c:url value='/admin/main'/>">
        <img src="<c:url value='/images/buskinglogo.png'/>" class="logo-img" alt="로고">
    </a>
    <a class="logout" href="<c:url value='/admin/logout'/>">logout</a>
</header>

<div class="container">
    <h2>게시글 수정</h2>

    <form method="post" action="<c:url value='/admin/board/revise'/>">

        <!-- hidden id -->
        <input type="hidden" name="boardId" value="${board.boardId}">

        <div class="field">
            <label>제목</label>
            <input type="text" name="title" value="${board.title}" required>
        </div>

        <div class="field">
            <label>내용</label>
            <textarea name="content" required>${board.content}</textarea>
        </div>

        <div class="btn-area">
            <a href="<c:url value='/admin/board/list'/>" class="btn cancel">취소</a>
            <button type="submit" class="btn save">저장</button>
        </div>

    </form>
</div>

</body>
</html>

이게 관리자 페이지 게시판 수정 부분 