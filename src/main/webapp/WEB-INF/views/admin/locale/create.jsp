<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장비 정보 수정</title>
<link rel="stylesheet" href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" href="<c:url value='/css/admin.css'/>">

<style>

main {
	flex: 1;
	background: #fff;
	padding: 40px;
}

h2 {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-top: 20px;
	font-weight: bold;
	margin-bottom: 6px;
}

input[type=text], textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
}

textarea {
	height: 150px;
	resize: none;
}

.btn-group {
	margin-top: 20px;
	display: flex;
	gap: 10px;
}

.btn {
	padding: 8px 18px;
	border: none;
	border-radius: 6px;
	font-size: 14px;
	cursor: pointer;
	color: white;
}

.submit {
	background-color: #52c41a;
}

.cancel {
	background-color: #ff4d4f;
	text-decoration: none;
	text-align: center;
	display: inline-block;
	line-height: 28px;
}
</style>
</head>

<body>


    <!-- 기존 사용자 헤더 그대로 사용 -->
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <!-- 🔥 admin 전용 영역 시작 -->
    <div class="admin-page">

        <div class="admin-container">

            <!-- 사이드 메뉴 -->
            <aside class="admin-aside">
                <ul>
                    <li><a href="<c:url value='/admin/board/list'/>">게시판 관리</a></li>
                    <li><a href="<c:url value='/admin/board/qna_list'/>">Q&A 관리</a></li>
                    <li><a href="<c:url value='/admin/gear/list'/>">장비 예약 관리</a></li>
                    <li><a href="<c:url value='/admin/locale/list'/>">장소 예약 관리</a></li>
					<li><a href="<c:url value='/admin/gear/update_list'/>">장비 관리</a></li>
					<li><a href="<c:url value='/admin/locale/update_list'/>">장소 관리</a></li>
					<li><a href="<c:url value='/admin/member/list'/>">회원 관리</a></li>
                </ul>
            </aside>   

<main>



<div >
  <h1>장소 신규 등록</h1>
<form method="post" action="<c:url value='/admin/locale/create'/>">

    <!-- 도시 선택 -->
    <label>도시 선택</label>
<select name="cityId" required>
    <c:forEach var="city" items="${cityList}">
        <option value="${city.id}">
            ${city.cityName}
        </option>
    </c:forEach>
</select>

    <!-- 장소 이름 -->
    <label>장소명</label>
    <input type="text" name="placeName" required/>

    <!-- 주소 -->
    <label>주소</label>
    <input type="text" name="placeAddress" required/>

    <!-- 전화번호 -->
    <label>전화번호</label>
    <input type="text" name="placePhone"/>

    <!-- 썸네일 -->
    <label>썸네일 경로</label>
    <input type="text" name="thumbnail"/>

    <!-- 설명 -->
    <label>장소 설명</label>
    <textarea name="placeDescription"></textarea>

    <div class="btn-group">
        <button type="submit" class="btn submit">
            장소 신규 등록
        </button>

        <a href="/admin/locale/list" class="btn cancel">
            등록 취소
        </a>
    </div>

</form>

  </main>
</div>
</div>




<script>
function updateGear() {
  alert("장비 신규 등록이 완료 되었습니다.");
  location.href = "/admin/locale/update_list";
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
