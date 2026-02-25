<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="ko">

		<head>
			<meta charset="UTF-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<title>회원 탈퇴</title>

			<link rel="stylesheet" href="/css/common.css">
			<link rel="stylesheet" href="/css/myPage.css">
		</head>

		<body>
			<div class="login-wrapper withdraw-card">

				<body class="withdraw-page">


					<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
					

					<section class="page-banner">
					  <div class="container">
					    <div class="page-banner-inner">
					      <div class="page-text">
					        <h1 class="page-title">마이페이지</h1>
					        <div class="breadcrumb">
					          <a href="/">홈</a>
					          <span class="divider">›</span>
					          <a href="/mypage?tab=place">대시보드</a>
					          <span class="divider">›</span>
							  <a href="/mypage/update">회원 정보 수정</a>
							  <span class="divider">›</span>
							  <span class="current">회원 탈퇴</span>
					        </div>
					      </div>
					    </div>
					  </div>
					</section>

					<main class="main">
						<div class="container">
							<div class="login-wrapper withdraw-card">

								<form id="withdrawForm" action="/mypage/withdraw" method="post">
									<!-- ✅ 제목/설명 -->
									<h2 class="withdraw-title">정말 탈퇴 하시겠습니까?</h2>

									<p class="withdraw-desc">
										회원 탈퇴 시 계정 정보가 삭제되며, 예약/결제 내역은 정책에 따라 보관될 수 있습니다.
									</p>
									<p class="withdraw-desc">
										계속하시려면 비밀번호를 입력해주세요.
									</p>

									<!-- ✅ 비밀번호 입력 (자물쇠 X, 보기/숨기기 O) -->
									<div class="field withdraw-field">
										<label for="pw1">비밀번호</label>

										<div class="input-toggle">
											<input type="password" id="pw1" name="pw1" placeholder="비밀번호 입력"
												autocomplete="current-password" />
											<button type="button" class="toggle-btn" aria-label="비밀번호 보기"
												data-target="#pw1">
												보기
											</button>
										</div>
									</div>

									<!-- ✅ 버튼 -->
									<div class="btn-col withdraw-actions">
										<button id="btnWithdraw" class="joinok-btn danger" type="submit">
											완전히 탈퇴하기
										</button>
										<button class="joinok-btn" type="button" onclick="location.href='redirect:/'">
											취소
										</button>
									</div>

								</form>

							</div>
						</div>
						</main>
						</body>
						</div>
						
					</main>

					<jsp:include page="/WEB-INF/views/common/footer.jsp" />
					<script>
						// ✅ 보기/숨기기 토글
						document.querySelectorAll(".toggle-btn").forEach((btn) => {
							btn.addEventListener("click", () => {
								const input = document.querySelector(btn.dataset.target);
								if (!input) return;

								const isHidden = input.type === "password";
								input.type = isHidden ? "text" : "password";

								btn.textContent = isHidden ? "숨김" : "보기";
								btn.setAttribute("aria-label", isHidden ? "비밀번호 숨기기" : "비밀번호 보기");
							});
						});

						// ✅ 탈퇴 버튼: 비밀번호 입력 확인 + 팝업 확인 후 진행
						const withdrawBtn = document.getElementById("btnWithdraw");
						const form = document.getElementById("withdrawForm");
						const pwInput = document.getElementById("pw1");

						form.addEventListener("submit", (e) => {
							const pw = pwInput.value.trim();

							// 비밀번호 미입력 방지
							if (!pw) {
								e.preventDefault(); // submit 막기
								alert("비밀번호를 입력해주세요.");
								pwInput.focus();
								return;
							}

							// 탈퇴 확인 팝업
							const ok = confirm("정말로 탈퇴하시겠습니까? 이 작업은 되돌릴 수 없습니다.");
							if (!ok) {
								e.preventDefault(); // submit 막기
								return;
							}

							// ✅ 정상 제출 시 서버 컨트롤러로 POST 전송
						});
					</script>
				</body>

		</html>