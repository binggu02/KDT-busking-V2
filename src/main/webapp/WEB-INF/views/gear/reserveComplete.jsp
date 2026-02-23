<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>예약 완료</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gear/reserveComplete.css" />
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

<main class="complete-main">
  <div class="container">
  	<div class="complete-wrap">
  	<div class="complete-box">

      <h2>예약이 완료되었습니다 🎉</h2>

      <c:if test="${not empty msg}">
        <div class="alert success">${msg}</div>
      </c:if>

      <p>마이페이지에서 예약 내역을 확인할 수 있습니다.</p>

     <div class="complete-actions">
	  <a class="btn-line" href="${pageContext.request.contextPath}/gear/list">
	    장비 목록으로
	  </a>
	  <a class="btn-dark" href="${pageContext.request.contextPath}/mypage">
	    마이페이지로
	  </a>
	</div>

    </div>
  	</div>
    
  </div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
