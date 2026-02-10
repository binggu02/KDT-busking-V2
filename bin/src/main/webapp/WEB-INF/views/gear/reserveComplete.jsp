<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title><c:out value="${pageTitle}" /></title>

  <!-- ✅ URL/리소스는 var로 분리 -->
  <c:url var="commonCssUrl" value="/css/common.css" />
  <c:url var="mainCssUrl" value="/css/main.css" />
  <c:url var="completeCssUrl" value="/css/gear/reserveComplete.css" />

  <c:url var="homeUrl" value="/" />
  <c:url var="gearListUrl" value="/gear/list" />
  <c:url var="mypageUrl" value="/mypage/main" />
  <c:url var="localeListUrl" value="/locale/list" />
  <c:url var="boardListUrl" value="/board/list" />
  <c:url var="logoutUrl" value="/member/logout" />

  <c:url var="headerBgUrl" value="/images/busking.png" />
  <c:url var="logoUrl" value="/images/buskinglogo.png" />

  <link rel="stylesheet" href="${commonCssUrl}" />
  <link rel="stylesheet" href="${mainCssUrl}" />
  <link rel="stylesheet" href="${completeCssUrl}" />
</head>

<body>
<header class="header" style="background-image:url('${headerBgUrl}');">
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

<main class="main complete-main">
  <div class="container">
    <section class="complete-wrap">
      <div class="complete-box">

        <div class="check-icon" aria-hidden="true">
          <svg width="58" height="58" viewBox="0 0 24 24" fill="none">
            <path d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10Z"
                  stroke="currentColor" stroke-width="1.8"/>
            <path d="M7 12.2l3.1 3.1L17.4 8.9"
                  stroke="currentColor" stroke-width="2.0" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </div>

        <h2 class="complete-title">예약이 완료되었습니다 !</h2>

        <article class="mini-card">
          <div class="mini-thumb" id="cThumb" aria-label="선택 장비 이미지"></div>

          <div class="mini-body">
            <div class="mini-gear" id="cGearName">-</div>

            <dl class="mini-info">
              <div class="mini-row">
                <dt>예약자 명 :</dt>
                <dd id="cUserName">-</dd>
              </div>
              <div class="mini-row">
                <dt>전화번호 :</dt>
                <dd id="cPhone">-</dd>
              </div>
              <div class="mini-row">
                <dt>e-mail :</dt>
                <dd id="cEmail">-</dd>
              </div>
              <div class="mini-row">
                <dt>사용 기간 :</dt>
                <dd id="cPeriod">-</dd>
              </div>
            </dl>
          </div>
        </article>

        <div class="complete-actions">
          <button class="btn-line" type="button" id="btnGearList">장비 더 보기</button>
          <button class="btn-dark" type="button" id="btnMypage">마이페이지</button>
        </div>

      </div>
    </section>
  </div>
</main>

<footer class="footer">
  <div class="container">
    <p>© Busking Reservation</p>
  </div>
</footer>

<script>
  const URL_GEAR_LIST = "${gearListUrl}";
  const URL_MYPAGE = "${mypageUrl}";
  const CTX = "<c:out value='${pageContext.request.contextPath}'/>";

  document.getElementById("btnGearList").addEventListener("click", () => {
    location.href = URL_GEAR_LIST;
  });
  document.getElementById("btnMypage").addEventListener("click", () => {
    location.href = URL_MYPAGE;
  });

  function safeText(v, fallback) {
    if (v === null || v === undefined) return fallback || "";
    const s = String(v);
    return s.length ? s : (fallback || "");
  }

  function resolveImgUrl(img) {
    if (!img) return "";
    const s = String(img).trim();

    // 위험 스킴 차단
    if (/^(javascript:|data:)/i.test(s)) return "";

    // 외부 URL은 https?만 허용
    if (/^https?:\/\//i.test(s)) return s;

    // 상대경로 처리
    if (s.startsWith("/")) return CTX + s;
    return CTX + "/" + s;
  }

  function prettyDT(dt) {
    if (!dt) return "-";
    return String(dt).replace("T", " ");
  }

  // ✅ reserve.jsp에서 저장한 키와 반드시 동일해야 함
  const raw = sessionStorage.getItem("gearReservationInfo");

  if (!raw) {
    alert("예약 정보가 없습니다. 장비 목록으로 이동합니다.");
    location.replace(URL_GEAR_LIST);
  }

  let data = null;
  try { data = JSON.parse(raw); } catch (e) { data = null; }

  if (!data || typeof data !== "object") {
    alert("예약 정보가 손상되었습니다. 장비 목록으로 이동합니다.");
    sessionStorage.removeItem("gearReservationInfo");
    location.replace(URL_GEAR_LIST);
  }

  document.getElementById("cGearName").textContent = safeText(data.gear && data.gear.name, "-");
  document.getElementById("cUserName").textContent = safeText(data.user && data.user.name, "-");
  document.getElementById("cPhone").textContent    = safeText(data.user && data.user.phone, "-");
  document.getElementById("cEmail").textContent    = safeText(data.user && data.user.email, "-");

  const start = prettyDT(data.period && data.period.start);
  const end   = prettyDT(data.period && data.period.end);
  document.getElementById("cPeriod").textContent = start + " ~ " + end;

  const thumb = document.getElementById("cThumb");
  const imgUrl = resolveImgUrl(data.gear && data.gear.img);

  if (imgUrl) {
    thumb.style.backgroundImage = 'url("' + imgUrl.replace(/"/g, "%22") + '")';
    thumb.style.backgroundSize = "cover";
    thumb.style.backgroundPosition = "center";
  } else {
    thumb.style.background = "#e6e6e6";
  }
</script>
</body>
</html>
