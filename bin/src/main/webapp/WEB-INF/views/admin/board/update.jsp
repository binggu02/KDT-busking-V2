<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>QnA 답변 작성</title>

<style>
* { margin:0; padding:0; box-sizing:border-box; }

body {
  font-family: "Pretendard", Arial, sans-serif;
  background:#f5f6f8;
  color:#222;
}

.container {
  max-width: 900px;
  margin: 80px auto;
}

h1 {
  margin-bottom: 30px;
}

.card {
  background: #fff;
  border-radius: 12px;
  padding: 30px;
  box-shadow: 0 6px 15px rgba(0,0,0,.08);
  margin-bottom: 30px;
}

.label {
  font-size: 14px;
  color: #666;
  margin-bottom: 6px;
}

.value {
  font-size: 15px;
  margin-bottom: 20px;
}

textarea {
  width: 100%;
  height: 200px;
  padding: 15px;
  border-radius: 8px;
  border: 1px solid #ccc;
  resize: none;
  font-size: 14px;
}

.btn-group {
  text-align: right;
  margin-top: 20px;
}

.btn {
  display: inline-block;
  padding: 10px 20px;
  border-radius: 8px;
  font-size: 14px;
  border: none;
  cursor: pointer;
  text-decoration: none;
}

.btn-submit {
  background: #ff5a5f;
  color: #fff;
}

.btn-cancel {
  background: #ddd;
  margin-right: 10px;
}
</style>
</head>

<body>

<div class="container">

  <h1>QnA 답변 작성</h1>

  <!-- 질문 내용 -->
  <div class="card">
    <div class="label">제목</div>
    <div class="value">${qna.title}</div>

    <div class="label">작성자</div>
    <div class="value">${qna.writer}</div>

    <div class="label">질문 내용</div>
    <div class="value">${qna.content}</div>
  </div>

  <!-- 답변 작성 -->
  <form>
    <div class="card">
      <div class="label">답변 내용</div>
      <textarea name="answer" placeholder="답변을 입력하세요">${qna.answer}</textarea>

      <div class="btn-group">
        <a class="btn btn-cancel" href="qna_list.jsp">목록으로</a>
        <button type="button" class="btn btn-submit" onclick="submitAnswer()">답변 등록</button>
      </div>
    </div>
  </form>

</div>

<script>
function submitAnswer() {
  alert("답변이 등록되었습니다.");
  location.href = "qna_list.jsp";
}
</script>

</body>
</html>
