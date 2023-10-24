// Obtén todos los radio buttons en la tabla
const radioButtons = document.querySelectorAll('input[type="radio"]');
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
