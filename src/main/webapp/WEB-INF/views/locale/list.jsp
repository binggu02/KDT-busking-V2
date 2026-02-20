<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${pageTitle}</title>

  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
  
  <link rel="stylesheet" href="<c:url value='/css/locale/list.css'/>" />
</head>

<body>
	
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

  <main class="main">
    <div class="container">
      <h2 style="margin: 0 0 16px;">지역 선택</h2>

      <!-- FE UI 템플릿 + BE 데이터(cities)만 주입 -->
      <section class="region-grid" aria-label="지역 선택">
        <c:forEach var="city" items="${cities}">
          <a class="region-btn" href="<c:url value='/locale/${city.cityCode}'/>">
            <span class="pin" aria-hidden="true">
              <svg viewBox="0 0 24 24" width="22" height="22">
                <path d="M12 21s7-4.6 7-11a7 7 0 1 0-14 0c0 6.4 7 11 7 11z" fill="none" stroke="currentColor" stroke-width="2"/>
                <circle cx="12" cy="10" r="2.5" fill="none" stroke="currentColor" stroke-width="2"/>
              </svg>
            </span>
            <span class="txt">${city.cityName}</span>
          </a>
        </c:forEach>
      </section>
    </div>
  </main>

    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
