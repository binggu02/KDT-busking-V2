<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장비 정보 수정</title>
</head>

<body>
    <h2>장비 정보 수정</h2>

    <form method="post" action="<c:url value='/admin/gear/update'/>">
        <input type="hidden" name="id" value="${gear.id}"/>

        <div>
            <label>장비명</label>
            <input type="text" name="gearName" value="${gear.gearName}" required/>
        </div>

        <div>
            <label>수량</label>
            <input type="number" name="gearQuantity" value="${gear.gearQuantity}" min="0" required/>
        </div>

        <div>
            <label>가격(원)</label>
            <input type="number" name="gearPrice" value="${gear.gearPrice}" min="0" required/>
        </div>

        <div>
            <label>썸네일 경로</label>
            <input type="text" name="gearThumbnail" value="${gear.gearThumbnail}"/>
        </div>

        <div>
            <label>설명</label>
            <textarea name="gearDescription">${gear.gearDescription}</textarea>
        </div>

        <button type="submit">저장</button>
        <a href="<c:url value='/admin/gear/update_list'/>">취소</a>
    </form>
</body>
</html>
