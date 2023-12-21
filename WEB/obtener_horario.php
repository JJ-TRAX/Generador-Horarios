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

// Consulta SQL para obtener el horario de lunes a viernes por horas, aulas, profesores y periodos
$sql = "SELECT 
            d.nombre AS dia,
            p.nombre AS periodo,
            p.hora_inicio,
            p.hora_fin,
            a.`número` AS aula,
            pr.nombre AS profesor,
            m.nombre AS materia,
            c.nombre AS curso
        FROM 
            horario h
        JOIN
            dia d ON h.id_dia = d.id_dia
        JOIN
            periodo p ON h.id_periodo = p.id_periodo
        JOIN
            aula a ON h.id_aula = a.id_aula
        JOIN
            profesor pr ON h.id_profesor = pr.id_profesor
        JOIN
            materia m ON h.id_materia = m.id_materia
        JOIN
            curso c ON h.id_curso = c.id_curso
        WHERE
            d.nombre IN ('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes')";

// Ejecutar la consulta
$result = $conn->query($sql);

// Almacena los datos en un arreglo asociativo agrupados por periodo y día
$horario = array();
while ($row = $result->fetch_assoc()) {
    $horario[$row['periodo']][$row['dia']][] = $row;
}

// Cerrar la conexión
$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Horario Escolar</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Definir el área de desplazamiento */
        .scrollable-table {
            max-height: 400px; /* Altura máxima */
            overflow-y: auto; /* Activar el scroll vertical si es necesario */
        }
    </style>
</head>
<body>
    <h1>Horario Escolar</h1>
    <div class="scrollable-table">
        <?php foreach ($horario as $periodo => $dias) : ?>
            <h2><?= $periodo ?></h2>
            <table>
                <tr>
                    <th>Día</th>
                    <th>Hora Inicio</th>
                    <th>Hora Fin</th>
                    <th>Aula</th>
                    <th>Profesor</th>
                    <th>Materia</th>
                    <th>Curso</th>
                </tr>
                <?php foreach ($dias as $dia => $clases) : ?>
                    <?php foreach ($clases as $clase) : ?>
                        <tr>
                            <td rowspan="<?= count($clases) ?>"><?= $dia ?></td>
                            <td><?= $clase['hora_inicio'] ?></td>
                            <td><?= $clase['hora_fin'] ?></td>
                            <td><?= $clase['aula'] ?></td>
                            <td><?= $clase['profesor'] ?></td>
                            <td><?= $clase['materia'] ?></td>
                            <td><?= $clase['curso'] ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php endforeach; ?>
            </table>
        <?php endforeach; ?>
    </div>    
    <form action="generar_pdf.php" method="post">
        <button type="submit" id="generarPDF" name="generarPDF">Generar PDF</button>
    </form>
</body>
</html>
