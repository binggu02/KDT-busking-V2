<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/mypage.css">

</head>
<body class="mypage-page">

	<header class="header">
		<div class="container header-inner">
			<a class="logo" href="<c:url value='/'/>"> <img
				src="images/buskinglogo.png" alt="BUSKING RESERVATION"
				class="logo-icon">
			</a>
			<nav class="nav">
				<a href="<c:url value='/gear/list'/>">장비 예약</a> <a
					href="<c:url value='/locale/list'/>">지역별 장소 예약</a> <a
					href="<c:url value='/board'/>">게시판</a>
			</nav>
			<div class="auth">
				<a class="pill" href="<c:url value='/member/logout'/>">logout</a> <a
					class="pill" href="<c:url value='/mypage'/>">mypage</a>
			</div>
		</div>
	</header>

	<section class="banner">
		<div class="banner-inner">
			<h1>마이페이지</h1>
		</div>
	</section>

	<main class="main">
		<div class="container">

			<!-- 프로필 카드 -->
			<section class="profile-card">
				<div class="profile-left">
					<div class="avatar" aria-label="프로필 이미지"></div>
					<div class="profile-basic">
						<div class="nickname-row">
							<h2 class="nickname">
								<c:out value="${member.nickname}" default="닉네임" />
							</h2>
							<span class="badge">일반 회원</span>
						</div>
						<c:url var="updateUrl" value="/mypage/update" />
						<button type="button" class="btn btn-black"
							onclick="location.href='${updateUrl}'">프로필 수정</button>
					</div>
				</div>
				<div class="profile-right">
					<dl class="info">
						<div class="info-row">
							<dt>ID</dt>
							<dd>
								<c:out value="${member.memberId}" default="example_user" />
							</dd>
						</div>
						<div class="info-row">
							<dt>전화</dt>
							<dd>
								<c:out value="${member.phone}" default="010-1234-5678" />
							</dd>
						</div>
						<div class="info-row">
							<dt>이메일</dt>
							<dd>
								<c:out value="${member.email}" default="user@example.com" />
							</dd>
						</div>
						<div class="info-row">
							<dt>가입일</dt>
							<dd>-</dd>
						</div>
					</dl>
				</div>
			</section>

			<!-- 탭 -->
			<section class="tabs">
				<button class="tab active" data-tab="place">장소 예약 내역</button>
				<button class="tab" data-tab="gear">장비 대여 내역</button>
				<button class="tab" data-tab="post">내 게시글</button>
			</section>

			<!-- 탭 패널 -->
			<section class="tab-panels">
				<div class="tab-panel show" data-panel="place">

					<!-- 1) 장소 예약 내역 -->
					<section class="list">
						<c:choose>
							<c:when test="${empty placeReservations}">
								<article class="list-item">
									<div class="item-left">
										<h3 class="item-title">장소 예약 내역이 없습니다.</h3>
										<p class="item-meta">예약 후 이곳에서 확인할 수 있어요.</p>
									</div>
									<div class="item-right">
										<button class="btn outline" type="button"
											onclick="location.href='${pageContext.request.contextPath}/locale/list'">
											장소 예약하기</button>
									</div>
								</article>
							</c:when>

							<c:otherwise>
								<c:forEach var="r" items="${placeReservations}">
									<article class="list-item">
										<div class="item-left">
											<h3 class="item-title">
												<c:out value="${r.place.placeName}" />
												·
												<c:out value="${r.bandName}" />
												(
												<c:out value="${r.bandCount}" />
												명)
											</h3>
											<p class="item-meta">
												<c:out value="${r.reservationDate}" />
												·
												<c:out value="${r.startTime}" />
											</p>
										</div>

										<div class="item-right">
											<span class="status ${r.status ? 'done' : 'pending'}">
												${r.status ? '완료' : '취소'} </span>
										</div>
									</article>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</section>
				</div>




				<!-- 2) 장비 대여 내역 -->
				<div class="tab-panel" data-panel="gear">
					<section class="list">
						<c:choose>
							<c:when test="${empty gearReservations}">
								<article class="list-item">
									<div class="item-left">
										<h3 class="item-title">장비 대여 내역이 없습니다.</h3>
										<p class="item-meta">대여 후 이곳에서 확인할 수 있어요.</p>
									</div>
									<div class="item-right">
										<button class="btn outline" type="button"
											onclick="location.href='${pageContext.request.contextPath}/gear/list'">
											장비 대여하기</button>
									</div>
								</article>
							</c:when>

							<c:otherwise>
								<c:forEach var="gr" items="${gearReservations}">
									<article class="list-item">
										<div class="item-left">
											<h3 class="item-title">
												<c:out value="${gr.gear.gearName}" />
											</h3>
											<p class="item-meta">
												<c:out value="${gr.startDatetime}" />
												~
												<c:out value="${gr.endDatetime}" />
											</p>
										</div>

										<div class="item-right">
											<span
												class="status ${gr.status == 'RESERVED' ? 'pending' : 'done'}">
												<c:out value="${gr.status}" />
											</span>
										</div>
									</article>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</section>
				</div>


				<!-- 3) 내 게시글 -->
				<div class="tab-panel" data-panel="post">
					<section class="list">
						<article class="list-item">
							<div class="item-left">
								<h3 class="item-title">내 게시글 기능은 아직 연결되지 않았습니다.</h3>
								<p class="item-meta">게시판 기능 연결 후 여기에서 확인할 수 있어요.</p>
							</div>
							<div class="item-right">
								<button class="btn outline" type="button"
									onclick="location.href='${pageContext.request.contextPath}/board/main'">
									게시판 가기</button>
							</div>
						</article>
					</section>
				</div>



			</section>

		</div>
	</main>

	<footer class="footer">
		<div class="container">
			<p>© Busking Reservation</p>
		</div>
	</footer>
<!-- 이전 코드
	<script>
  // 탭 전환 JS
  const tabs = document.querySelectorAll(".tab");
  const panels = document.querySelectorAll(".tab-panel");

  tabs.forEach(tab => {
    tab.addEventListener("click", () => {
      const target = tab.dataset.tab;
      tabs.forEach(t => t.classList.remove("active"));
      tab.classList.add("active");
      panels.forEach(p => p.classList.toggle("show", p.dataset.panel === target));
    });
  });
</script> -->

<!-- 현재 적용된 코드 -->
<script>
  const tabs = document.querySelectorAll(".tab");
  const panels = document.querySelectorAll(".tab-panel");

  function openTab(target) {
    tabs.forEach(t => t.classList.toggle("active", t.dataset.tab === target));
    panels.forEach(p => p.classList.toggle("show", p.dataset.panel === target));
  }

  // 서버에서 내려준 activeTab 기준으로 초기 탭 오픈
  const initialTab = "${activeTab}";
  openTab(initialTab || "place");

  tabs.forEach((btn) => {
    btn.addEventListener("click", () => openTab(btn.dataset.tab));
  });
</script>


</body>
</html>
