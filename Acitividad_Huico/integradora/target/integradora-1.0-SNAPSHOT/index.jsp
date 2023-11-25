<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<header class="header" id="site-header">
    <div id="search-container">
        <div id="search-container-1">
            <div id="logo">
                <h1>Tiendita</h1>
                <img src="${pageContext.request.contextPath}/assets/images/tienda.png" alt="Logo">
            </div>
            <div style="width: 100%;">
                <form action="#">
                    <select name="tienditas" id="lang">
                        <option value="selecciona"></option>
                        <option value="Tienda 1">Tienda 1</option>
                        <option value="Tienda 2">Tienda 2</option>
                        <option value="Tienda 3">Tienda 3</option>
                        <option value="Tienda 4">Tienda 4</option>
                        <option value="Tienda 5">Tienda 5</option>
                    </select>
                    <input type="submit" value="send" id="send">
                </form>
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
                <input type="text" placeholder="" id="search">
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
        <tr>
            <td style="border-right: 2px solid #42413D;">Funcionalidad
                <img src="${pageContext.request.contextPath}/assets/images/funcional.png" alt="Funcionalidad"
                     style="height: 40px; width: 40px; float: right; margin-right: 5%;">
            </td>
            <td><input type="radio" name="Funcionalidad" value="Mala" class="mala"></td>
            <td><input type="radio" name="Funcionalidad" value="Regular" class="regular"></td>
            <td><input type="radio" name="Funcionalidad" value="Buena" class="buena"></td>
            <td><input type="radio" name="Funcionalidad" value="Muy Buena" class="muy_buena"></td>
            <td><input type="radio" name="Funcionalidad" value="Excelente" class="excelente"></td>
        </tr>
        <tr>
            <td style="border-right: 2px solid #42413D;">Confiabilidad
                <img src="${pageContext.request.contextPath}/assets/images/confiabilidad.png" alt="Confiabilidad"
                     style="height: 40px; width: 40px; float: right; margin-right: 5%;">
            </td>
            <td><input type="radio" name="Confiabilidad" value="Mala" class="mala"></td>
            <td><input type="radio" name="Confiabilidad" value="Regular" class="regular"></td>
            <td><input type="radio" name="Confiabilidad" value="Buena" class="buena"></td>
            <td><input type="radio" name="Confiabilidad" value="Muy Buena" class="muy_buena"></td>
            <td><input type="radio" name="Confiabilidad" value="Excelente" class="excelente"></td>
        </tr>
        <tr>
            <td style="border-right: 2px solid #42413D;">Usabilidad
                <img src="${pageContext.request.contextPath}/assets/images/usabilidad.png" alt="Usabilidad"
                     style="height: 40px; width: 40px; float: right; margin-right: 5%;"">
            </td>
            <td><input type="radio" name="Usabilidad" value="Mala" class="mala"></td>
            <td><input type="radio" name="Usabilidad" value="Regular" class="regular"></td>
            <td><input type="radio" name="Usabilidad" value="Buena" class="buena"></td>
            <td><input type="radio" name="Usabilidad" value="Muy Buena" class="muy_buena"></td>
            <td><input type="radio" name="Usabilidad" value="Excelente" class="excelente"></td>
        </tr>
        <tr>
            <td style="border-right: 2px solid #42413D;">Rendimiento
                <img src="${pageContext.request.contextPath}/assets/images/rendimiento.png" alt="Rendimiento"
                     style="height: 40px; width: 40px; float: right; margin-right: 5%;">
            </td>
            <td><input type="radio" name="Rendimiento" value="Mala" class="mala"></td>
            <td><input type="radio" name="Rendimiento" value="Regular" class="regular"></td>
            <td><input type="radio" name="Rendimiento" value="Buena" class="buena"></td>
            <td><input type="radio" name="Rendimiento" value="Muy Buena" class="muy_buena"></td>
            <td><input type="radio" name="Rendimiento" value="Excelente" class="excelente"></td>
        </tr>
        <tr>
            <td style="border-right: 2px solid #42413D;">Mantenimiento
                <img src="${pageContext.request.contextPath}/assets/images/mantenimiento-web.png" alt="Mantenimiento"
                     style="height: 40px; width: 40px; float: right; margin-right: 5%;">
            </td>
            <td><input type="radio" name="Mantenimiento" value="Mala" class="mala"></td>
            <td><input type="radio" name="Mantenimiento" value="Regular" class="regular"></td>
            <td><input type="radio" name="Mantenimiento" value="Buena" class="buena"></td>
            <td><input type="radio" name="Mantenimiento" value="Muy Buena" class="muy_buena"></td>
            <td><input type="radio" name="Mantenimiento" value="Excelente" class="excelente"></td>
        </tr>
        <tr>
            <td style="border-right: 2px solid #42413D;">Portabilidad
                <img src="${pageContext.request.contextPath}/assets/images/portabilidad.png" alt="Portabilidad"
                     style="height: 40px; width: 40px; float: right; margin-right: 5%;">
            </td>
            <td><input type="radio" name="Portabilidad" value="Mala" class="mala"></td>
            <td><input type="radio" name="Portabilidad" value="Regular" class="regular"></td>
            <td><input type="radio" name="Portabilidad" value="Buena" class="buena"></td>
            <td><input type="radio" name="Portabilidad" value="Muy Buena" class="muy_buena"></td>
            <td><input type="radio" name="Portabilidad" value="Excelente" class="excelente"></td>
        </tr>
        <tr>
            <td style="border-right: 2px solid #42413D;">Seguridad
                <img src="${pageContext.request.contextPath}/assets/images/escudo-seguro.png" alt="Seguridad"
                     style="height: 40px; width: 40px; float: right; margin-right: 5%;">
            </td>
            <td><input type="radio" name="Seguridad" value="Mala" class="mala"></td>
            <td><input type="radio" name="Seguridad" value="Regular" class="regular"></td>
            <td><input type="radio" name="Seguridad" value="Buena" class="buena"></td>
            <td><input type="radio" name="Seguridad" value="Muy Buena" class="muy_buena"></td>
            <td><input type="radio" name="Seguridad" value="Excelente" class="excelente"></td>
        </tr>
        <tr>
            <td style="border-right: 2px solid #42413D;">Compatibilidad
                <img src="${pageContext.request.contextPath}/assets/images/compatibilidad.png" alt="Compatibilidad"
                     style="height: 40px; width: 40px; float: right; margin-right: 5%;">
            </td>
            <td><input type="radio" name="Compatibilidad" value="Mala" class="mala"></td>
            <td><input type="radio" name="Compatibilidad" value="Regular" class="regular"></td>
            <td><input type="radio" name="Compatibilidad" value="Buena" class="buena"></td>
            <td><input type="radio" name="Compatibilidad" value="Muy Buena" class="muy_buena"></td>
            <td><input type="radio" name="Compatibilidad" value="Excelente" class="excelente"></td>
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
    <button class="btn_off" id="btnResumen">
        <img src="${pageContext.request.contextPath}/assets/images/escritura.png" alt="Resumen"> Resumen
    </button>
    <button class="btn_off" style="margin-right: 3%;" id="btnGuardar">
        <img src="${pageContext.request.contextPath}/assets/images/disquete.png" alt="Guardar"> Guardar
    </button>
</div>

</body>
<script src="${pageContext.request.contextPath}/assets/js/index.js"></script>

</html>
