<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>장비 정보 업데이트(목록)</title>
</head>
<body>
<h2>장비 정보 업데이트</h2>

<table border="1" cellpadding="8" cellspacing="0">
  <thead>
  <tr>
    <th>ID</th>
    <th>장비명</th>
    <th>수량</th>
    <th>가격</th>
    <th>관리</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="g" items="${gearList}">
    <tr>
      <td>${g.id}</td>
      <td>${g.gearName}</td>
      <td>${g.gearQuantity}</td>
      <td>${g.gearPrice}</td>
      <td>
        <!-- ✅ GET /admin/gear/update?id=... -->
        <a href="<c:url value='/admin/gear/update'/>?id=${g.id}">수정</a>
      </td>
    </tr>
  </c:forEach>

  <c:if test="${empty gearList}">
    <tr><td colspan="5">장비가 없습니다.</td></tr>
  </c:if>
  </tbody>
</table>

</body>
</html>
