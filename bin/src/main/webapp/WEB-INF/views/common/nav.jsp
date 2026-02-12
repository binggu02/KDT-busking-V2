<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="header">
  <div class="container header-inner">
    <a class="logo" href="<c:url value='/'/>">
      <img src="/images/buskinglogo.png" alt="BUSKING RESERVATION" class="logo-icon">
    </a>
    <nav class="nav">
      <a href="<c:url value='/gear/list'/>">장비 예약</a>
      <a href="<c:url value='/locale/list'/>">지역별 장소 예약</a>
      <a href="<c:url value='/board/main'/>">게시판</a>
    </nav>
    <div class="auth">
		<c:choose>
		    <c:when test="${not empty sessionScope.loginUser}">
		        <a href="<c:url value='/member/logout'/>">Logout</a>
				<a href="<c:url value='/mypage'/>">mypage</a>
		    </c:when>
		    <c:otherwise>
		        <a href="<c:url value='/member/login'/>">Login</a>
		    </c:otherwise>
		</c:choose>
    </div>
  </div>
</header>