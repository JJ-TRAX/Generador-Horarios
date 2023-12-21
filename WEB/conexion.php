<?php
$servername = "localhost"; 
$username = "root"; 
$password = "Unetenet1234@"; 
$dbname = "horario"; 

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}


// Consulta para obtener los nombres de las bases de datos
$sql = "SHOW DATABASES";
$result = $conn->query($sql);

// Comprobar si se obtuvieron resultados
if ($result->num_rows > 0) {
    // Inicio del select
    echo '<select id="instituciones">';
    echo '<option value="0">Escoger Institución:</option>';
    
    // Generar las opciones del select con los nombres de las bases de datos
    while ($row = $result->fetch_assoc()) {
        echo '<option value="' . $row['Database'] . '">' . $row['Database'] . '</option>';
    }
    
    // Cierre del select
    echo '</select>';
} else {
    echo "No se encontraron bases de datos.";
}

// Cerrar la conexión
$conn->close();
?>

