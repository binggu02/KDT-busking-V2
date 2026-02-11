<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>가입 완료</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: "맑은 고딕", sans-serif;
            background: linear-gradient(135deg, #111, #333);
            color: #fff;
        }
        .card {
            background: rgba(0,0,0,0.65);
            padding: 50px 60px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 20px 50px rgba(0,0,0,0.4);
        }
        h1 {
            margin-bottom: 16px;
        }
        p {
            color: #ddd;
            margin-bottom: 28px;
        }
        .btn-group {
            display: flex;
            gap: 14px;
            justify-content: center;
        }
        a {
            display: inline-block;
            padding: 12px 22px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 700;
        }
        .login {
            background: #fff;
            color: #000;
        }
        .home {
            border: 1px solid #fff;
            color: #fff;
        }
        a:hover {
            opacity: 0.85;
        }
    </style>
</head>
<body>

<div class="card">
    <h1>가입이 완료되었습니다</h1>
    <p>
        이제 버스킹 예약 서비스를 자유롭게 이용하실 수 있습니다.
    </p>

    <div class="btn-group">
        <a href="/member/login" class="login">로그인</a>
        <a href="/" class="home">메인으로</a>
    </div>
</div>

</body>
</html>
