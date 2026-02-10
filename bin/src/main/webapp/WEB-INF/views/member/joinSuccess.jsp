<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입 완료</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: "맑은 고딕", sans-serif;
            background: #f5f5f5;
        }
        .box {
            background: #fff;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            text-align: center;
        }
        h2 {
            margin-bottom: 12px;
        }
        p {
            color: #555;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="box">
    <h2>🎉 회원가입 완료</h2>
    <p>버스킹 예약 서비스 가입을 환영합니다.</p>

    <script>
        // 2초 후 최종 완료 페이지로 이동
        setTimeout(() => {
            location.href = "/member/joinfinal";
        }, 2000);
    </script>
</div>

</body>
</html>
