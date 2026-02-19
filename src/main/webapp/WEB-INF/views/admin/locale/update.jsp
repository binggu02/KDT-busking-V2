<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장소 정보 수정</title>

<link rel="stylesheet" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">
</head>

<body>

    <!-- 기존 사용자 헤더 그대로 사용 -->
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <!-- 🔥 admin 전용 영역 시작 -->
    <div class="admin-page">

        <div class="admin-container">

            <!-- 사이드 메뉴 -->
            <aside class="admin-aside">
                <ul>
                    <li><a href="<c:url value='/admin/board/list'/>">게시판 관리</a></li>
                    <li><a href="<c:url value='/admin/board/qna_list'/>">Q&A 관리</a></li>
                    <li><a href="<c:url value='/admin/gear/list'/>">장비 예약 관리</a></li>
                    <li><a href="<c:url value='/admin/locale/list'/>">장소 예약 관리</a></li>
					<li><a href="<c:url value='/admin/gear/update'/>">장비 관리</a></li>
					<li><a href="<c:url value='/admin/locale/update'/>">장소 관리</a></li>
					<li><a href="<c:url value='/admin/member/list'/>">회원 관리</a></li>
                </ul>
            </aside>   
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
