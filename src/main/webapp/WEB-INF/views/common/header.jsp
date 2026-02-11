<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>
  <c:choose>
      <c:when test="${not empty pageTitle}">
          ${pageTitle}
      </c:when>
      <c:otherwise>
          Busking Project
      </c:otherwise>
  </c:choose>
  </title>
  
  <link rel="stylesheet" href="/css/common.css">



</head>
<body>

<jsp:include page="nav.jsp"/>