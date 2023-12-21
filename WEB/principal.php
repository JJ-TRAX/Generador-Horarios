<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Generador de horarios automáticos</title>    
    <link rel="stylesheet" href="principal.css">
</head>
<body>
    <div class="bo">
        <div class="titulo">
            <h1 style="font-family: Arial;"><strong>Generador de horarios automáticos</strong></h1>
        </div>
        <div class="logo">
            <img class="logo1" src="./logo/LOGO-UNIR.png" width="300px" height="300px">
            <img class="logo2" src="./logo/descarga.jpeg" width="150px" height="200px">
        </div>
        <div class="count">
            <h2>Generar Horarios</h2>
            <div class="custom-select" style="width:280px;">
                <?php include 'conexion.php'; ?>
            </div>
            <br>
            <button id="abrirModal" class="btn primary">Generar horario</button>
            <div id="ventanaModal" class="modal">
                <div class="contenido-modal">
                    <span class="cerrar">&times;</span>
                    <h2>Horarios</h2>
                    <div id="horarioGenerado">
                        <!-- Aquí se mostrará el horario generado -->
                    </div>
                </div>
            </div>
        </div>          
    </div>
    <div class="name">
        Autores:<br>
        Luis Francisco Torrejón Arias<br>
        Yamil Chirico Rodriguez <br>
        Juan José Alcívar Aguirre               
    </div>
    <script src="./alert.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        // Cuando el usuario hace clic en el botón "Generar Horario"
        $('#abrirModal').on('click', function() {
            // Hacer una petición AJAX para llamar al controlador y obtener el horario generado
            $.ajax({
                method: 'POST',
                url: 'generador_horarios/Controllers/HorarioController.cs', // Ruta al controlador HorarioController
                data: { generarHorario: true }, // Marca para el controlador ejecutar el algoritmo
                success: function(response) {
                    // Mostrar el horario generado en la ventana modal
                    $('#horarioGenerado').html(response); // Insertar los datos del horario generado
                    $('#ventanaModal').css('display', 'block'); // Mostrar la ventana modal
                },
                error: function(error) {
                    console.log('Error al obtener el horario: ' + error);
                }
            });
        });
    });
    </script>
</body>
</html>
