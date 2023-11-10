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

// Función para calcular el porcentaje y mostrarlo
function calcularPorcentaje() {
    let totalPuntos = 0;
    let respuestasContestadas = 0;
    radioButtons.forEach((radio) => {
        if (radio.checked) {
            respuestasContestadas++;
            console.log(radioButtons.length);
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

    // Muestra el porcentaje en el <h2>
    if (respuestasContestadas === 8) {
        porcentajeH2.textContent = `${porcentaje}%`;
    } else {
        porcentajeH2.textContent = `0.00%`;
    }
}

// Escucha cambios en los radio buttons
radioButtons.forEach((radio) => {
    radio.addEventListener("change", calcularPorcentaje);
});

// Calcula y muestra el porcentaje inicial
calcularPorcentaje();

// ------ FUNCIPES DE LOS BOTONES ------

// BOTON CANCELAR
// Para habilitar el boton cancelar:
//  Si anioInput y select no estan vacios, habilitar btnCancelar
anioInput.addEventListener("change", (e) => {
    if (e.target.value.length === 4) {
        btnCancelar.disabled = false;
        btnCancelar.classList.remove("btn_off");
        btnCancelar.classList.add("btn");
    } else {
        btnCancelar.disabled = true;
    }
});
// si se da click en el boton borrar radioButtons y regresar el select a selecciona y borrar el input
btnCancelar.addEventListener("click", () => {
    radioButtons.forEach((radio) => {
        radio.checked = false;
        radio.disabled = true;
    });
    select.value = "selecciona";
    anioInput.value = "";
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
// Si se da click en el boton borrar, borrar todos los radio buttons sleccionados
btnBorrar.addEventListener("click", () => {
    radioButtons.forEach((radio) => {
        radio.checked = false;
    });
    btnBorrar.disabled = true;
    btnBorrar.classList.remove("btn");
    btnBorrar.classList.add("btn_off");
    porcentajeH2.textContent = `0.00%`;
});