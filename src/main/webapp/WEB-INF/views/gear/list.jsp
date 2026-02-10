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

  <!-- 정적 경로 -->
  <c:url var="commonCss" value="/css/common.css" />
  <c:url var="mainCss" value="/css/main.css" />
  <c:url var="listCss" value="/css/gear/list.css" />

  <link rel="stylesheet" href="${commonCss}" />
  <link rel="stylesheet" href="${mainCss}" />
  <link rel="stylesheet" href="${listCss}" />
</head>

<!-- ✅ list.css에서 body.gear-page 사용 -->
<body class="gear-page">

<c:url var="homeUrl" value="/" />
<c:url var="gearListUrl" value="/gear/list" />
<c:url var="localeListUrl" value="/locale/list" />
<c:url var="boardListUrl" value="/board/list" />
<c:url var="mypageUrl" value="/mypage/main" />
<c:url var="logoutUrl" value="/member/logout" />

<c:url var="headerBgUrl" value="/images/busking.png" />
<c:url var="logoUrl" value="/images/buskinglogo.png" />

<header class="header" style="background-image: url('${headerBgUrl}');">
  <div class="container header-inner">
    <a class="logo" href="${homeUrl}">
      <img src="${logoUrl}" alt="BUSKING RESERVATION" class="logo-icon" />
    </a>

    <nav class="nav">
      <a href="${gearListUrl}" class="is-active">장비 예약</a>
      <a href="${localeListUrl}">지역별 장소 예약</a>
      <a href="${boardListUrl}">게시판</a>
    </nav>

    <div class="auth">
      <a class="pill" href="${mypageUrl}">my page</a>
      <a class="pill" href="${logoutUrl}">logout</a>
    </div>
  </div>
</header>

<main class="main">
  <div class="container">

    <!-- ✅ 디버깅용: DB에서 넘어온 개수 (문제 해결되면 지워도 됨) -->
    <div style="margin:10px 0; color:#666; font-size:12px;">
      gearList count : <c:out value="${gearList.size()}" />
    </div>

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
                <c:url var="imgUrl" value="/images/${g.gearThumbnail}" />
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise>
            <c:url var="imgUrl" value="/images/busking.png" />
          </c:otherwise>
        </c:choose>

        <!-- ✅ /gear/reserve GET: gearId 없으면 redirect:/gear/list -->
        <c:url var="reserveWithIdUrl" value="/gear/reserve">
          <c:param name="gearId" value="${g.gearId}" />
        </c:url>

        <a class="gear-link gear-card" href="${reserveWithIdUrl}">
          <div class="thumb"
               style="background-image:url('${imgUrl}');"
               aria-label="<c:out value='${g.gearName}'/> 이미지"></div>

          <div class="card-body">
            <div class="card-title"><c:out value="${g.gearName}" /></div>
            <div class="card-price">₩<c:out value="${g.gearPrice}" /></div>
            <div class="card-desc"><c:out value="${g.gearDescription}" /></div>
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

<footer class="footer">
  <div class="container">
    <p>© Busking Reservation</p>
  </div>
</footer>

</body>
</html>
