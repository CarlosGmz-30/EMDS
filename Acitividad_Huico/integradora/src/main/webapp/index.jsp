<jsp:include page="/mostarEncuestas"/>
<jsp:include page="/mostrarTienditas"/>
<jsp:include page="/mostrarPreguntas"/>
<jsp:include page="/mostrarRespuestas"/>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty encuestas}">
    <jsp:forward page="/mostarEncuestas"/>
</c:if>
<c:if test="${empty tiendas}">
    <jsp:forward page="/mostrarTienditas"/>
</c:if>
<c:if test="${empty preguntas}">
    <jsp:forward page="/mostrarPreguntas"/>
</c:if>
<c:if test="${empty respuestas}">
    <jsp:forward page="/mostrarRespuestas"/>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.27/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.27/dist/sweetalert2.min.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
    <script src="${pageContext.request.contextPath}/assets/js/styles.js"></script>
    <title>SIGCAT</title>
</head>

<body>
<form id="form" action="${pageContext.request.contextPath}/crearRespuestas" method="post">

    <header class="header" id="site-header">
        <div id="search-container">
            <div id="search-container-1">
                <div id="logo">
                    <h1>Tiendita</h1>
                    <img src="${pageContext.request.contextPath}/assets/images/tienda.png" alt="Logo">
                </div>
                <div style="width: 100%;">
                    <select name="tienditas" id="lang">
                        <option value="selecciona"></option>
                        <c:forEach items="${tiendas}" var="tienda">
                            <option value="${tienda.id_tiendita}">${tienda.nombre}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div id="search-container-2">
                <div id="calendar-0">
                    <p>encuesta</p>
                </div>
                <div id="calendar-1">
                    <img src="${pageContext.request.contextPath}/assets/images/calendario.png" alt="Calendario">
                </div>
                <div id="calendar-2">
                    <select name="encuenta" id="search">
                        <option value="selecciona"></option>
                        <c:forEach items="${encuestas}" var="encuesta">
                            <option value="${encuesta.id_encuesta}">${encuesta.nombre}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
    </header>

    <div id="system_name">
        <div>
            <h1 id="tittle1">SIGCAT -</h1>

        </div>
        <div id="tittle">
            <h1>Sistema de Gestión de Calidad de Tienditas</h1>
        </div>
    </div>

    <div id="table">
        <table class="encuesta">
            <thead>
            <tr>
                <th style="width: 20%;">Característica</th>
                <th style="width: 15%;">
                    <img src="${pageContext.request.contextPath}/assets/images/cara-triste.png" alt="mala">
                    Mala
                </th>
                <th style="width: 15%;">
                    <img src="${pageContext.request.contextPath}/assets/images/confundido.png" alt="">
                    Regular
                </th>
                <th style="width: 15%;">
                    <img src="${pageContext.request.contextPath}/assets/images/guau.png" alt="">
                    Buena
                </th>
                <th style="width: 15%;">
                    <img src="${pageContext.request.contextPath}/assets/images/sonrisas.png" alt="">
                    Muy Buena
                </th>
                <th style="width: 15%;">
                    <img src="${pageContext.request.contextPath}/assets/images/risa.png" alt="">
                    Excelente
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${preguntas}" var="pregunta">
                <tr>
                    <td style="border-right: 2px solid #42413D;"><input type="hidden" name="${pregunta.id_pregunta}"
                                                                        value="${pregunta.id_pregunta}">${pregunta.nombre}
                    </td>
                    <td><input type="radio" name="${pregunta.nombre}" value="Mala" class="mala"></td>
                    <td><input type="radio" name="${pregunta.nombre}" value="Regular" class="regular"></td>
                    <td><input type="radio" name="${pregunta.nombre}" value="Buena" class="buena"></td>
                    <td><input type="radio" name="${pregunta.nombre}" value="Muy Buena" class="muy_buena"></td>
                    <td><input type="radio" name="${pregunta.nombre}" value="Excelente" class="excelente"></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div id="percent-container">
        <div id="percent-tittle">
            <h1>Porcentaje:</h1>
        </div>
        <div id="percent">
            <div>
                <h2 id="percent_cel">% 0.00</h2>
            </div>
        </div>
    </div>

    <div id="buttons_container">
        <button class="btn_off" id="btnBorrar" style="margin-left: 3%;" disabled>
            <img src="${pageContext.request.contextPath}/assets/images/borrar.png" alt="Limpiar"> Limpiar
        </button>
        <button class="btn_off" id="btnCancelar" disabled>
            <img src="${pageContext.request.contextPath}/assets/images/error.png" alt="Cancelar"> Cancelar
        </button>
        <button class="btn_off" id="btnResumen" onclick="mostrarResumen()" disabled type="button">
            <img src="${pageContext.request.contextPath}/assets/images/escritura.png" alt="Resumen"> Resumen
        </button>
        <button class="btn_off" style="margin-right: 3%;" id="btnGuardar" onclick="guardarFormulario()" disabled>
            <img src="${pageContext.request.contextPath}/assets/images/disquete.png" alt="Guardar"> Guardar
        </button>
    </div>
</form>

</body>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/index.js"></script>
<script>
    function guardarFormulario() {
        document.getElementById('form').submit();
    }

    function mostrarResumen() {
        const selectedEncuestaId = document.getElementById('search').value;
        // Realizar una solicitud AJAX al servlet
        $.get('${pageContext.request.contextPath}/mostrarResumen', {idEncuesta: selectedEncuestaId}, function (data) {
            Swal.fire({
                title: 'Resumen',
                html: '<p>Número de tiendas: ' + data.numTiendas + '</p>' +
                    '<p>Número de tiendas evaluadas: ' + data.numTiendasEvaluadas + '</p>' +
                    '<p>Promedio General: ' + data.promedioGeneral + '</p>'
            });
        });
    }
</script>

</html>
