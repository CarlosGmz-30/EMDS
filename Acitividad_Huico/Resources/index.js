// Obtén todos los radio buttons en la tabla
const radioButtons = document.querySelectorAll('input[type="radio"]');

// Bloqueaamos todos los botones de una vez para obligar a que seleeccionen algo en el select
radioButtons.forEach((radio) => {
    radio.disabled = true;
});
// Obtenemos el input de año y lo asignamos a const anioInput
const anioInput = document.getElementById("search");
// Limit a 4 digitos el input de año
anioInput.addEventListener("input", (e) => {
    if (e.target.value.length > 4) {
        e.target.value = e.target.value.slice(0, 4);
    }
});
// Obtemener el select y lo asignamos a const select
const select = document.getElementById("lang");
// Obteener el value del select e input cada que cambie
select.addEventListener("change", (e) => {
    if (e.target.value === "selecciona") {
        radioButtons.forEach((radio) => {
            radio.checked = false;
            radio.disabled = true;
        });
    } else {
        // Obtienes el el cada que cambie el input y comparmos hasta que sea de tamaño 4
        anioInput.addEventListener("change", (e) => {
            if (e.target.value.length === 4) {
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
