<%@ page import="mx.edu.utez.integradora.models.Resumen.Resumen" %>
<%@ page import="java.util.List" %>
<jsp:include page="/mostrarResumen"/>
<%--
  Created by IntelliJ IDEA.
  User: spart
  Date: 12/6/2023
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.

<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Resumen de la tiendita</title>
</head>
<body>
<h1>Tienditas</h1>

<c:choose>
    <c:when test="${empty param.tienditas and empty param.encuenta}">
        <p>No se enviaron los ID de tiendita ni encuesta.</p>
    </c:when>
    <c:when test="${empty param.tienditas}">
        <p>No se envió el ID de tiendita.</p>
    </c:when>
    <c:when test="${empty param.encuenta}">
        <p>No se envió el ID de encuesta.</p>
    </c:when>
    <c:otherwise>
        <h1>Lista de la tiendita</h1>
        <c:forEach var="resumen" items="${resumen}">
            <p><b>Tiendita: ${resumen.idTiendita}</b></p>
            <p><b>Encuesta: ${resumen.idEncuesta}</b></p>
            <p>---------------------------------------</p>
        </c:forEach>
    </c:otherwise>
</c:choose>

<!-- Esto es un FENIX-->
<!-- Agrega el siguiente código al final de tu página JSP -->
<button class="btn_off" id="btnRegresarIndex" onclick="regresarIndex()">
    <img src="${pageContext.request.contextPath}/assets/images/regresar.png" alt="Regresar al Index"> Regresar al Index
</button>

<script>
    function regresarIndex() {
        window.location.href = "${pageContext.request.contextPath}/index.jsp";
    }
</script>
</body>
</html>
