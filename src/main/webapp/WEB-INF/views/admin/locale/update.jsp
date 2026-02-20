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

<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

<div class="admin-page">
  <div class="admin-container">

    <aside class="admin-aside">
      <ul>
        <li><a href="<c:url value='/admin/board/list'/>">게시판 관리</a></li>
        <li><a href="<c:url value='/admin/board/qna_list'/>">Q&A 관리</a></li>

        <!-- 장비 예약 관리(네 컨트롤러에 맞게 쓰고 있으면 그걸로) -->
        <li><a href="<c:url value='/admin/gear-reservations/list'/>">장비 예약 관리</a></li>

        <li><a href="<c:url value='/admin/locale/list'/>">장소 예약 관리</a></li>

        <!-- ✅ 여기서 '장소 관리'는 update_list로 -->
        <li><a href="<c:url value='/admin/gear/update_list'/>">장비 관리</a></li>
        <li><a href="<c:url value='/admin/locale/update_list'/>">장소 관리</a></li>

        <li><a href="<c:url value='/admin/member/list'/>">회원 관리</a></li>
      </ul>
    </aside>

    <div class="admin-content">
      <h1>장소 정보 수정</h1>

      <!-- ✅ 진짜로 저장되게 POST로 -->
      <form action="<c:url value='/admin/locale/update'/>" method="post">
        <!-- Spring Security 쓰면(POST면) 아래 CSRF도 넣는 게 안전 -->
        <c:if test="${not empty _csrf}">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </c:if>

        <!-- ✅ 컨트롤러는 id를 필수로 받음 -->
        <input type="hidden" name="id" value="${place.id}"/>

        <div class="card">

          <div class="form-group">
            <label>장소명</label>
            <input type="text" name="placeName" value="${place.placeName}" required>
          </div>

          <div class="form-group">
            <label>도시 ID</label>
            <input type="number" name="cityId" value="${place.city.id}">
          </div>

          <div class="form-group">
            <label>주소</label>
            <input type="text" name="placeAddress" value="${place.placeAddress}" required>
          </div>

          <div class="form-group">
            <label>전화번호</label>
            <input type="text" name="placePhone" value="${place.placePhone}">
          </div>

          <div class="form-group">
            <label>썸네일</label>
            <input type="text" name="thumbnail" value="${place.thumbnail}">
          </div>

          <div class="form-group">
            <label>장소 설명</label>
            <textarea name="placeDescription" rows="5">${place.placeDescription}</textarea>
          </div>

          <div class="btn-group">
            <a href="<c:url value='/admin/locale/update_list'/>" class="btn btn-cancel">목록</a>
            <button type="submit" class="btn btn-submit">수정 완료</button>
          </div>

        </div>
      </form>

    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
