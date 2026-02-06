<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장소 정보 수정</title>

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
  <h1>장소 정보 수정</h1>

  <!-- form 유지 (submit 안 씀) -->
  <form>
    <input type="hidden" name="placeId" value="${place.id}"/>

    <div class="card">

      <div class="form-group">
        <label>장소명</label>
        <input type="text" name="name" value="${place.name}">
      </div>

      <div class="form-group">
        <label>지역</label>
        <input type="text" name="region" value="${place.region}">
      </div>

      <div class="form-group">
        <label>주소</label>
        <input type="text" name="address" value="${place.address}">
      </div>

      <div class="form-group">
        <label>수용 인원</label>
        <input type="number" name="capacity" value="${place.capacity}">
      </div>

      <div class="form-group">
        <label>대관 가능 여부</label>
        <select name="available">
          <option value="Y" ${place.available=='Y'?'selected':''}>가능</option>
          <option value="N" ${place.available=='N'?'selected':''}>불가</option>
        </select>
      </div>

      <div class="form-group">
        <label>장소 설명</label>
        <textarea name="description">${place.description}</textarea>
      </div>

      <div class="btn-group">
        <a href="./list.jsp" class="btn btn-cancel">목록</a>
        <button type="button" class="btn btn-submit" onclick="updatePlace()">수정 완료</button>
      </div>

    </div>
  </form>
</div>

<script>
function updatePlace() {
  alert("장소 정보가 수정되었습니다.");
  location.href = "locale_list.jsp";
}
</script>

</body>
</html>
