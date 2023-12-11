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
                <tr id="${pregunta.id_pregunta}">
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
    const selectTienda = document.getElementById('lang');
    const selectEncuesta = document.getElementById('search');
    const radiosBtns = document.querySelectorAll('input[type="radio"]');
    let idTienda = 0;
    let idEncuesta = 0;

    selectTienda.addEventListener("change", (e) => {
        if (e.target.value !== 'selecciona') {
            idTienda = e.target.value;
            selectEncuesta.addEventListener("change", (e) => {
                if (e.target.value !== 'selecciona') {
                    idEncuesta = e.target.value;
                    encuestaRespondida(idTienda, idEncuesta);
                }
            })
        }
    })

    function encuestaRespondida(tiendaId, encuestaId) {
        fetch('${pageContext.request.contextPath}/mostrarRespuestas?idTiendita=' + tiendaId + '&idEncuesta=' + encuestaId)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (data.id_tiendita !== null) {
                    Swal.fire({
                        // centrarlo hasta arriba y en el centro
                        position: 'top-center',
                        title: 'Encuesta respondida',
                        html: '<p><h1>La tienda ya ha respondido esta encuesta</h1></p>',
                        icon: 'warning',
                        preConfirm: () => {
                            // Limpiar radio buttons
                            resetRadioButtons();
                            // Restablecer valores de los selects
                            resetSelects();
                            // Restablecer colores de las celdas
                            resetTDColores();
                            // Restablecer porcentaje a 0.00% y quitarle la clase de color
                            resetPercent();
                            // Deshabilitar botones
                            disableButtons();
                        },
                        // si le da click fuera del alert se cierra y se ejecuta el preConfirm
                        onclose: () => {
                            // Limpiar radio buttons
                            resetRadioButtons();
                            // Restablecer valores de los selects
                            resetSelects();
                            // Restablecer colores de las celdas
                            resetTDColores();
                            // Restablecer porcentaje a 0.00% y quitarle la clase de color
                            resetPercent();
                            // Deshabilitar botones
                            disableButtons();
                        }
                    });

                    for (let i = 0; i < data.id_pregunta.length; i++) {
                        const pregunta = data.id_pregunta[i];
                        const valor = parseInt(data.valor[i], 10); // Convertir a entero
                        const trElement = document.getElementById(pregunta);
                        if (trElement) {
                            let classToFind;
                            switch (valor) {
                                case 1:
                                    classToFind = 'mala';
                                    break;
                                case 2:
                                    classToFind = 'regular';
                                    break;
                                case 3:
                                    classToFind = 'buena';
                                    break;
                                case 4:
                                    classToFind = 'muy_buena';
                                    break;
                                case 5:
                                    classToFind = 'excelente';
                                    break;
                                default:
                                    classToFind = '';
                            }

                            if (classToFind) {
                                const radioBtn = trElement.querySelector('input[type="radio"].' + classToFind);

                                if (radioBtn) {
                                    radioBtn.checked = true;
                                    const tdElement = radioBtn.closest('td');
                                    if (tdElement) {
                                        // Cambiar la clase del <td> que contiene el radio button
                                        tdElement.className = classToFind;
                                        // Cambiar el color de la celda
                                        cambiarColorCelda1(tdElement);
                                    }
                                }
                            }
                        }
                    }

                    calcularPorcentaje();
                } else {
                    console.log('Encuesta no respondida');
                }
            })
            .catch(error => {
                console.error('Error al realizar la petición:', error);
            });
    }

    function guardarFormulario() {
        document.getElementById('form').submit();
    }

    function getColorClass(promedio) {
        if (promedio >= 90) {
            return "azul";
        } else if (promedio >= 80 && promedio < 90) {
            return "verde";
        } else if (promedio >= 70 && promedio < 80) {
            return "amarillo";
        } else if (promedio >= 60 && promedio < 70) {
            return "naranja";
        } else {
            return "rojo";
        }
    }

    function mostrarResumen() {
        const selectedEncuestaId = document.getElementById('search').value;
        // Realizar una solicitud AJAX al servlet
        $.get('${pageContext.request.contextPath}/mostrarResumen', {idEncuesta: selectedEncuestaId}, function (data) {
            const promedio = data.promedioGeneral;
            const color = getColorClass(promedio);
            Swal.fire({
                title: 'Resumen',
                icon: 'info',
                html: '<p><h2>Número de tiendas: ' + data.numTiendas + '</h2></p>' +
                    '<p><h3>Número de tiendas evaluadas: ' + data.numTiendasEvaluadas + '</h3></p>' +
                    '<p id="totalAvg" class="' + color + '">Promedio General: ' + data.promedioGeneral + '</p>'
            });
        });
    }

    function cambiarColorCelda1(celda) {
        celda.classList.remove('rojo', 'naranja', 'amarillo', 'verde', 'azul');
        // Obtener la clase actual del elemento
        const currentClass = celda.className;

        // Le asignamos una clase dependiendo de la clase actual
        switch (currentClass) {
            case "mala":
                celda.classList.add('rojo');
                break;
            case "regular":
                celda.classList.add('naranja');
                break;
            case "buena":
                celda.classList.add('amarillo');
                break;
            case "muy_buena":
                celda.classList.add('verde');
                break;
            case "excelente":
                celda.classList.add('azul');
                break;
            default:
                break;
        }
    }

    function resetRadioButtons() {
        const radioButtons = document.querySelectorAll('input[type="radio"]');
        radioButtons.forEach(radio => {
            radio.checked = false;
            radio.disabled = true; // Deshabilitar radio buttons
        });
    }

    function resetSelects() {
        const selects = document.querySelectorAll('select');
        selects.forEach(select => {
            select.selectedIndex = 0;
        });
    }

    function resetTDColores() {
        const tdElements = document.querySelectorAll('td');
        tdElements.forEach(td => {
            td.classList.remove('rojo', 'naranja', 'amarillo', 'verde', 'azul');
        });
    }

// quitarle la clase al h1 con id percent_cel y se le vuelva a poder el porcentaje 0.0%
    function resetPercent() {
        const percent = document.getElementById('percent_cel');
        percent.classList.remove('rojo', 'naranja', 'amarillo', 'verde', 'azul');
        percent.innerHTML = '0.00%';
    }

    // deshabilitar botones
    function disableButtons() {
        //const btnBorrar = document.getElementById('btnBorrar');
        const btnCancelar = document.getElementById('btnCancelar');
        const btnResumen = document.getElementById('btnResumen');
        const btnGuardar = document.getElementById('btnGuardar');

        btnCancelar.disabled = true;
        btnCancelar.classList.remove("btn");
        btnCancelar.classList.add("btn_off");
        // Boton Guardar
        btnGuardar.disabled = true;
        btnGuardar.classList.remove("btn");
        btnGuardar.classList.add("btn_off");
        // Boton Resumen
        btnResumen.disabled = true;
        btnResumen.classList.remove("btn");
        btnResumen.classList.add("btn_off");
        // Boton Borrar
        //btnBorrar.disabled = true;
        //btnBorrar.classList.remove("btn");
        //btnBorrar.classList.add("btn_off");
    }
</script>
</html>