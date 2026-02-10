<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장비 정보 수정</title>

<style>
* { margin:0; padding:0; box-sizing:border-box; }
body {
  font-family: "Pretendard", Arial, sans-serif;
  background:#f5f6f8;
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
}

.form-group {
  margin-bottom: 20px;
}

label {
  display: block;
  margin-bottom: 6px;
  font-size: 14px;
  color: #555;
}

input, textarea, select {
  width: 100%;
  padding: 10px;
  font-size: 14px;
  border-radius: 8px;
  border: 1px solid #ccc;
}

textarea {
  height: 120px;
  resize: none;
}

.btn-group {
  margin-top: 30px;
  text-align: right;
}

.btn {
  display: inline-block;
  padding: 10px 20px;
  border-radius: 8px;
  border: none;
  cursor: pointer;
  font-size: 14px;
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
  <h1>장비 정보 수정</h1>

  <!-- form 유지 (하지만 submit 안 씀) -->
  <form>
    <input type="hidden" name="equipmentId" value="${equipment.id}"/>

    <div class="card">

      <div class="form-group">
        <label>장비명</label>
        <input type="text" name="name" value="${equipment.name}">
      </div>

      <div class="form-group">
        <label>장비 종류</label>
        <select name="category">
          <option value="기타" ${equipment.category=='기타'?'selected':''}>기타</option>
          <option value="피아노" ${equipment.category=='피아노'?'selected':''}>피아노</option>
          <option value="베이스" ${equipment.category=='베이스'?'selected':''}>베이스</option>
          <option value="드럼" ${equipment.category=='드럼'?'selected':''}>드럼</option>
          <option value="마이크" ${equipment.category=='마이크'?'selected':''}>마이크</option>
          <option value="스피커" ${equipment.category=='스피커'?'selected':''}>스피커</option>
        </select>
      </div>

      <div class="form-group">
        <label>대여 금액 (₩)</label>
        <input type="number" name="price" value="${equipment.price}">
      </div>

      <div class="form-group">
        <label>재고 수량</label>
        <input type="number" name="stock" value="${equipment.stock}">
      </div>

      <div class="form-group">
        <label>대여 가능 여부</label>
        <select name="available">
          <option value="Y" ${equipment.available=='Y'?'selected':''}>가능</option>
          <option value="N" ${equipment.available=='N'?'selected':''}>불가</option>
        </select>
      </div>

      <div class="form-group">
        <label>장비 설명</label>
        <textarea name="description">${equipment.description}</textarea>
      </div>

      <div class="btn-group">
        <a href="./list.jsp" class="btn btn-cancel">목록</a>
        <button type="button" class="btn btn-submit" onclick="updateGear()">수정 완료</button>
      </div>

    </div>
  </form>
</div>

<script>
function updateGear() {
  alert("장비 정보가 수정되었습니다.");
  location.href = "gear_list.jsp";
}
</script>

</body>
</html>
