<jsp:include page="/mostarEncuestas"/>
<jsp:include page="/mostrarTienditas"/>
<jsp:include page="/mostrarPreguntas"/>
<jsp:include page="/mostarResumen"/>

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
                    <td style="border-right: 2px solid #42413D;"><input type="hidden" name="${pregunta.id_pregunta}" value="${pregunta.id_pregunta}">${pregunta.nombre}</td>
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
        <button class="btn_off" id="btnBorrar" style="margin-left: 3%;">
            <img src="${pageContext.request.contextPath}/assets/images/borrar.png" alt="Limpiar"> Limpiar
        </button>
        <button class="btn_off" id="btnCancelar">
            <img src="${pageContext.request.contextPath}/assets/images/error.png" alt="Cancelar"> Cancelar
        </button>
        <button class="btn_off" id="btnResumen"  onclick="mostrarResumen()" >
            <img src="${pageContext.request.contextPath}/assets/images/escritura.png" alt="Resumen"> Resumen
        </button>
        <button class="btn_off" style="margin-right: 3%;" id="btnGuardar" onclick="guardarFormulario()" >
            <img src="${pageContext.request.contextPath}/assets/images/disquete.png" alt="Guardar"> Guardar
        </button>
    </div>
    <div id="resultadoResumen">
        <h2>Resumen:</h2>
        <c:forEach var="resumen" items="${resumen}">
            <p>
                <strong>Tiendita:</strong> ${resumen.tiendita}<br>
                <strong>Encuesta:</strong> ${resumen.encuesta}<br>
                <strong>Pregunta:</strong> ${resumen.pregunta}<br>
                <strong>Respuesta:</strong> ${resumen.respuesta}<br>
                <strong>Promedio Respuestas (%):</strong> ${resumen.promedioRespuestasPorcentaje}%
            </p>
        </c:forEach>
    </div>
</form>


</body>
<script src="${pageContext.request.contextPath}/assets/js/index.js">
        function guardarFormulario() {





        document.getElementById('form').submit();
    }

</script>
<script>
    function mostrarResumen() {
        // Obtener valores de tiendita y encuesta
        var id_tiendita = document.getElementById('lang').value;
        var id_encuesta = document.getElementById('search').value;

        // Validar que se hayan seleccionado tiendita y encuesta
        if (id_tiendita === 'selecciona' || id_encuesta === 'selecciona') {
            // Mostrar un alert en lugar de actualizar el contenido de un div
            alert('Por favor, selecciona tiendita y encuesta');
            return;
        }

        // Realizar la solicitud AJAX al servlet
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '${pageContext.request.contextPath}/mostarResumen?tienditas=' + id_tiendita + '&encuenta=' + id_encuesta, true);

        // Configurar la función de devolución de llamada cuando la solicitud se complete
        xhr.onload = function () {
            if (xhr.status === 200) {
                // Obtener la información adicional de la respuesta
                var tiendita = xhr.getResponseHeader("tiendita");
                var encuesta = xhr.getResponseHeader("encuesta");

                // Construir el mensaje del alert
                var mensaje = 'Tiendita: ' + tiendita + '\nEncuesta: ' + encuesta + '\n' + xhr.responseText;

                // Mostrar el resultado del servlet en un alert
                alert(mensaje);
            } else {
                // Manejar errores si es necesario
                console.error('Error al obtener el resumen');
            }
        };

        // Enviar la solicitud
        xhr.send();
    }
</script>

</html>
