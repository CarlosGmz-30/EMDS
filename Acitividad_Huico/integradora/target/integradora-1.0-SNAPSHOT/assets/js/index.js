// Obtén todos los radio buttons en la tabla
const radioButtons = document.querySelectorAll('input[type="radio"]');
// Todos los button de clase "btn"
const botones = document.querySelectorAll(".btn");
// Botones por id
const btnResumen = document.getElementById("btnResumen");
const btnBorrar = document.getElementById("btnBorrar");
const btnGuardar = document.getElementById("btnGuardar");
const btnCancelar = document.getElementById("btnCancelar");

// Bloqueaamos todos los radio buttons de una vez para obligar a que seleeccionen algo en el select
radioButtons.forEach((radio) => {
    radio.disabled = true;
});
// Obtenemos el input de "search" y lo asignamos a const anioInput
const encuesta = document.getElementById("search");

// Obtemener el select y lo asignamos a const select
const select = document.getElementById("lang");
// Obteener el value del select e input "search" cada que cambie
select.addEventListener("change", (e) => {
    if (e.target.value === "selecciona") {
        radioButtons.forEach((radio) => {
            radio.checked = false;
            radio.disabled = true;
        });
    } else {
        // Obtienes el el cada que cambie el input y comparmos hasta que sea minimo tamaño 4
        encuesta.addEventListener("change", (e) => {
            if (e.target.value.length >= 4) {
                radioButtons.forEach((radio) => {
                    radio.disabled = false;
                });
            } else {
                radioButtons.forEach((radio) => {
                    radio.checked = false;
                    radio.disabled = true;
                });
            }
        });
    }
});

const porcentajeH2 = document.getElementById("percent_cel");

// Parte de la tabla y porcentaje ---------------------------------------
// Función para calcular el porcentaje y mostrarlo

// Obtenemos todas las celdas de la tabla
const tablaCeldas = document.querySelectorAll(".encuesta tbody td");

// Funcion para cambiar el color de la celda
function cambiarColorCelda(opcion, celda) {
    celda.classList.remove('rojo', 'naranja', 'amarillo', 'verde', 'azul');
    // Le asignamos una clase dependiendo de la opcion
    switch (opcion) {
        case "Mala":
            celda.classList.add('rojo');
            break;
        case "Regular":
            celda.classList.add('naranja');
            break;
        case "Buena":
            celda.classList.add('amarillo');
            break;
        case "Muy Buena":
            celda.classList.add('verde');
            break;
        case "Excelente":
            celda.classList.add('azul');
            break;
        default:
            break;
    }
}

function calcularPorcentaje() {
    let totalPuntos = 0;
    let respuestasContestadas = 0;
    radioButtons.forEach((radio) => {
        if (radio.checked) {
            respuestasContestadas++;
            switch (radio.value) {
                case "Mala":
                    totalPuntos += 0;
                    break;
                case "Regular":
                    totalPuntos += 1;
                    break;
                case "Buena":
                    totalPuntos += 2;
                    break;
                case "Muy Buena":
                    totalPuntos += 3;
                    break;
                case "Excelente":
                    totalPuntos += 4;
                    break;
            }
        }
    });
    const totalRadios = radioButtons.length;

    const porcentaje = ((totalPuntos / 32) * 100).toFixed(2);

    const percentContainer = document.getElementById('percent');
    const percentCelContainer = document.getElementById('percent_cel');

    // Muestra el porcentaje en el <h2>
    if (respuestasContestadas === 8) {
        percentCelContainer.textContent = `${porcentaje}%`;

        // Agrega las clases según el rango de porcentaje
        if (porcentaje >= 90) {
            percentCelContainer.classList.remove("verde", "amarillo", "rojo");
            percentCelContainer.classList.add("azul");
            percentContainer.classList.add("azul");
        } else if (porcentaje >= 80 && porcentaje < 90) {
            percentCelContainer.classList.remove("azul", "amarillo", "rojo");
            percentCelContainer.classList.add("verde");
            percentContainer.classList.add("verde");
        } else if (porcentaje >= 70 && porcentaje < 80) {
            percentCelContainer.classList.remove("azul", "verde", "rojo");
            percentCelContainer.classList.add("amarillo");
            percentContainer.classList.add("amarillo");
        } else if (porcentaje >= 60 && porcentaje < 70) {
            percentCelContainer.classList.remove("azul", "verde", "amarillo");
            percentCelContainer.classList.add("naranja");
            percentContainer.classList.add("naranja");
        } else {
            percentCelContainer.classList.remove("azul", "verde", "amarillo", "naranja");
            percentCelContainer.classList.add("rojo");
            percentContainer.classList.add("rojo");
        }
    } else {
        percentCelContainer.textContent = `0.00%`;
    }
}


// Objeto para almacenar el estado de cada radio button
const radioStates = {};

// Wacha cuando hay cambios en los radio buttons
radioButtons.forEach((radio) => {
    radio.addEventListener("change", (e) => {
        const opcionSeleccionada = e.target.value;
        const celda = e.target.closest('td');
        const fila = celda.closest('tr');

        // Si está seleccionado, quita todas las clases de color de la fila actual
        radioButtons.forEach((otherRadio) => {
            const otherCelda = otherRadio.closest('td');
            const otherFila = otherCelda.closest('tr');
            if (otherRadio !== e.target && otherFila === fila) {
                otherCelda.classList.remove("rojo", "naranja", "amarillo", "verde", "azul");
            }
        });

        // Guarda el estado del radio button
        radioStates[`${fila.rowIndex}-${opcionSeleccionada}`] = e.target.checked;

        // Aplica o quita la clase correspondiente a la celda
        if (e.target.checked) {
            cambiarColorCelda(opcionSeleccionada, celda);
        } else {
            celda.classList.remove("rojo", "naranja", "amarillo", "verde", "azul");
        }

        // Calcula y muestra el porcentaje
        calcularPorcentaje();
    });
});

// Calcula y muestra el porcentaje inicial
calcularPorcentaje();


// Función para quitar las clases de color de todas las celdas
function quitarColores() {
    tablaCeldas.forEach((celda) => {
        celda.classList.remove("rojo", "naranja", "amarillo", "verde", "azul");
    });
}

// funcion para quitar el color del div de porcentaje
function quitarColorDiv() {
    porcentajeH2.classList.remove("rojo", "naranja", "amarillo", "verde", "azul");
}
// Acaba la parte de la tabla y porcentaje ------------------------------
// ------ FUNCIPES DE LOS BOTONES ------

// BOTON CANCELAR
// Para habilitar el boton cancelar:
//  Si anioInput y select no estan vacios, habilitar btnCancelar
encuesta.addEventListener("change", () => {
    if (encuesta.value !== "" && select.value !== "selecciona") {
        btnCancelar.disabled = false;
        btnCancelar.classList.remove("btn_off");
        btnCancelar.classList.add("btn");
    }
});
// si se da click en el boton borrar radioButtons y regresar el select a selecciona y borrar el input
btnCancelar.addEventListener("click", () => {
    radioButtons.forEach((radio) => {
        radio.checked = false;
        radio.disabled = true;
    });
    quitarColores(); // Llama a la función para quitar los colores
    quitarColorDiv()
    select.value = "selecciona";
    encuesta.value = "";
    btnCancelar.disabled = true;
    btnCancelar.classList.remove("btn");
    btnCancelar.classList.add("btn_off");
    porcentajeH2.textContent = `0.00%`;
});

// BOTON BORRAR
// Para habilitar el boton borrar:
// Si radioButtons esta seleccionado al menos uno, habilitar btnBorrar
radioButtons.forEach((radio) => {
    radio.addEventListener("change", () => {
        if (radio.checked) {
            btnBorrar.disabled = false;
            btnBorrar.classList.remove("btn_off");
            btnBorrar.classList.add("btn");
        }
    });
});

// Si se da click en el boton borrar, borrar todos los radio buttons seleccionados
btnBorrar.addEventListener("click", () => {
    radioButtons.forEach((radio) => {
        radio.checked = false;
    });
    quitarColores(); // Llama a la función para quitar los colores
    quitarColorDiv()
    btnBorrar.disabled = true;
    btnBorrar.classList.remove("btn");
    btnBorrar.classList.add("btn_off");
    porcentajeH2.textContent = `0.00%`;
});