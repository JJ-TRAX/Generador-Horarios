// Ventana modal
var modal = document.getElementById("ventanaModal");
// Botón que abre el modal
var boton = document.getElementById("abrirModal");
// Hace referencia al elemento <span> que tiene la X que cierra la ventana
var span = document.getElementsByClassName("cerrar")[0];
// Cuando el usuario hace click en el botón, se abre la ventana
boton.addEventListener("click", function() {
  modal.style.display = "block";
});
// Si el usuario hace click en la x, la ventana se cierra
span.addEventListener("click", function() {
  modal.style.display = "none";
});
// Si el usuario hace click fuera de la ventana modal, se cierra.
window.addEventListener("click", function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
});

// Lógica para el elemento de selección personalizado
var customSelects = document.querySelectorAll('.custom-select');

customSelects.forEach(function(customSelect) {
  var selected = customSelect.querySelector('.select-selected');
  var selectItems = customSelect.querySelector('.select-items');

  selected.addEventListener("click", function(e) {
    e.stopPropagation();
    closeAllSelect(selectItems);
    selectItems.classList.toggle("select-hide");
    this.classList.toggle("select-arrow-active");
  });

  var selectOptions = selectItems.querySelectorAll('div');

  selectOptions.forEach(function(option) {
    option.addEventListener("click", function(e) {
      e.stopPropagation();
      selected.textContent = this.textContent;
      selectItems.classList.add('select-hide');
      selected.classList.remove('select-arrow-active');
    });
  });
});

function closeAllSelect(currentSelectItems) {
  var allSelectItems = document.querySelectorAll(".select-items");
  allSelectItems.forEach(function(item) {
    if (item !== currentSelectItems) {
      item.classList.add('select-hide');
    }
  });
}

var select = document.getElementById("instituciones");

select.addEventListener("change", function() {
    var selectedOption = select.options[select.selectedIndex].text;
    if (selectedOption === 'horario') {
        // Hacer la petición AJAX para obtener y mostrar el horario
        $.ajax({
            method: 'POST',
            url: 'obtener_horario.php', // Archivo PHP para obtener el horario
            data: { database: 'horario' }, // Nombre de la base de datos seleccionada
            success: function(response) {
                // Mostrar el horario generado en la ventana modal
                document.getElementById('horarioGenerado').innerHTML = response;
            },
            error: function(error) {
                console.log('Error al obtener el horario: ' + error);
            }
        });
    }
});
