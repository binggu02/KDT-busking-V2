<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <title>
    <c:choose>
      <c:when test="${not empty pageTitle}">
        <c:out value="${pageTitle}" />
      </c:when>
      <c:otherwise>장비 예약</c:otherwise>
    </c:choose>
  </title>


  <link rel="stylesheet" href="/css/common.css">

  <link rel="stylesheet" href="/css/gear/list.css">
</head>

<!-- ✅ list.css에서 body.gear-page 사용 -->
<body class="gear-page">


<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

<section class="page-banner">
  <div class="container">
    <div class="page-banner-inner">
      <div class="page-text">
        <h1 class="page-title">장비 예약</h1>
        <div class="breadcrumb">
          <a href="/">홈</a>
          <span class="divider">›</span>
          <span class="current">장비 예약</span>
        </div>
      </div>
    </div>
  </div>
</section>


<main class="main">
  <div class="container">

    <c:if test="${not empty msg}">
      <div class="alert success">${msg}</div>
    </c:if>



    <section class="gear-grid">

      <!-- ✅ 컨트롤러: model.addAttribute("gearList", gearService.findAll()) -->
      <c:forEach var="g" items="${gearList}">

        <!-- ✅ DB: gear_thumbnail = 'acoustic_guitar.jpg' 처럼 파일명만 들어있음
             => 항상 /images/ 를 붙여서 렌더링 -->
        <c:choose>
          <c:when test="${not empty g.gearThumbnail}">
            <!-- 혹시 DB에 '/images/xxx.jpg'로 들어간 데이터도 대비 -->
            <c:choose>
              <c:when test="${g.gearThumbnail.startsWith('/')}">
                <c:url var="imgUrl" value="${g.gearThumbnail}" />
              </c:when>
              <c:otherwise>
                <c:url var="imgUrl" value="/images/gear/${g.gearThumbnail}" />
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise>
            <c:url var="imgUrl" value="/images/busking.png" />
          </c:otherwise>
        </c:choose>

        <!-- ✅ /gear/reserve GET: gearId 없으면 redirect:/gear/list -->
        <c:url var="reserveWithIdUrl" value="/gear/reserve">
          <c:param name="gearId" value="${g.id}" />
        </c:url>

        <a class="gear-link gear-card" href="${reserveWithIdUrl}">
          <div class="thumb"
			     style="background-image:url('<c:out value="${imgUrl}"/>');"
			     aria-label="<c:out value='${g.gearName}'/> 이미지">
			</div>
			<div class="card-body">
			  
			  <div class="card-header">
			    <div class="card-title">
			      <c:out value="${g.gearName}" />
			    </div>
			    <div class="card-quantity">
			      수량 : <c:out value="${g.gearQuantity}" />
			    </div>
			  </div>
			
			  <div class="card-price">
			    ₩<c:out value="${g.gearPrice}" />
			  </div>
			
			  <div class="card-desc">
			    <c:out value="${g.gearDescription}" />
			  </div>
			
			</div>
        </a>

      </c:forEach>

      <!-- 목록 비었을 때 -->
      <c:if test="${empty gearList}">
        <div style="padding:18px; color:#666;">등록된 장비가 없습니다.</div>
      </c:if>

    </section>
  </div>
</main>


  </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
