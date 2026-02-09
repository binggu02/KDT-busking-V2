<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Pretendard", Arial, sans-serif;
        }

        body { background-color: #e5e5e5; }

        /* ===== HEADER ===== */
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
            inset: 0;
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

        .menu span, .logout {
            color: white;
            font-size: 14px;
        }

        .logout {
            border: 1px solid white;
            padding: 6px 16px;
            border-radius: 20px;
        }

        /* ===== LAYOUT ===== */
        .container {
            display: flex;
            margin-top: 80px;
            height: calc(100vh - 80px);
        }

        aside {
            width: 220px;
            background-color: #d9d9d9;
            padding: 30px 20px;
        }

        aside ul { list-style: none; }
        aside li {
            margin-bottom: 20px;
            font-weight: bold;
            cursor: pointer;
        }

        main {
            flex: 1;
            background: white;
            padding: 40px;
        }

        /* ===== DETAIL ===== */
        .post-header {
            border-bottom: 2px solid #ddd;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }

        .post-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .post-info {
            font-size: 14px;
            color: #777;
            display: flex;
            gap: 20px;
        }

        .post-content {
            min-height: 250px;
            line-height: 1.8;
            font-size: 16px;
            margin-bottom: 40px;
            white-space: pre-line;
        }

        .btn-area {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .btn-area button {
            border: none;
            padding: 8px 18px;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            color: white;
        }

        .btn-list { background-color: #999; }
        .btn-edit { background-color: #ff7875; }
        .btn-delete { background-color: #ff4d4f; }
    </style>
</head>

<body>

<header class="header">
<<<<<<< HEAD
    <a href="home.html">
=======
    <a href="../home.jsp">
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



    <main>
        <div class="post-header">
            <div class="post-title">공지사항</div>
            <div class="post-info">
                <span>작성자: 관리자</span>
                <span>작성일: 2026-01-20</span>
            </div>
        </div>

        <div class="post-content">
안녕하세요.
버스킹 플랫폼을 이용해주셔서 감사합니다.

본 게시글은 공지사항 예시입니다.
서비스 이용 시 참고 바랍니다.
        </div>

        <div class="btn-area">
<<<<<<< HEAD
            <button class="btn-list" onclick="location.href='boardmain.html'">목록</button>
=======
            <button class="btn-list" onclick="location.href='./board/main.jsp'">목록</button>
>>>>>>> origin/test_v2
            <button class="btn-edit">수정</button>
           <button class="btn-delete" onclick="deletePost()">삭제</button>

        </div>
        <script>
  function deletePost() {
    if (confirm("삭제하시겠습니까?")) {
      alert("게시글이 삭제되었습니다.");
<<<<<<< HEAD
      location.href = "./boardmain.html"; // 게시판 목록으로 이동
=======
      location.href = "./board/main.jsp"; // 게시판 목록으로 이동
>>>>>>> origin/test_v2
    }
  }
</script>

    </main>
</div>
 <!-- 댓글 영역 -->
<section class="comment-section">
  <h3 class="comment-title">댓글</h3>

  <!-- 댓글 목록 -->
  <div class="comment-list" id="commentList">
    <!-- JS로 댓글 들어감 -->
  </div>

  <!-- 댓글 작성 -->
  <div class="comment-write">
    <input type="text" id="commentWriter" placeholder="작성자" />
    <textarea id="commentContent" placeholder="댓글을 입력하세요"></textarea>
    <button type="button" onclick="addComment()">댓글 등록</button>
  </div>
</section>

</body>
</html>
