<?php
$servername = "localhost"; 
$username = "root"; 
$password = "Unetenet1234@"; 
$dbname = "horario";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

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

$result = $conn->query($sql);

$horario = array();
while ($row = $result->fetch_assoc()) {
    $horario[$row['periodo']][$row['dia']][] = $row;
}

require_once('tcpdf/tcpdf.php');

$pdf = new TCPDF('P', 'mm', 'A4', true, 'UTF-8', false);

$pdf->SetCreator('Nombre del Creador');
$pdf->SetAuthor('Nombre del Autor');
$pdf->SetTitle('Horario Escolar');
$pdf->SetSubject('Horario Escolar - PDF');
$pdf->SetKeywords('Horario, Escolar, PDF');

$pdf->AddPage();

$html = '<h1>Horario Escolar</h1>
        <div class="scrollable-table">';

foreach ($horario as $periodo => $dias) {
    $html .= "<h2>$periodo</h2>
               <table>
                   <tr>
                       <th>Día</th>
                       <th>Hora Inicio</th>
                       <th>Hora Fin</th>
                       <th>Aula</th>
                       <th>Profesor</th>
                       <th>Materia</th>
                       <th>Curso</th>
                   </tr>";

    foreach ($dias as $dia => $clases) {
        foreach ($clases as $clase) {
            $html .= "<tr>
                         <td rowspan='" . count($clases) . "'>$dia</td>
                         <td>{$clase['hora_inicio']}</td>
                         <td>{$clase['hora_fin']}</td>
                         <td>{$clase['aula']}</td>
                         <td>{$clase['profesor']}</td>
                         <td>{$clase['materia']}</td>
                         <td>{$clase['curso']}</td>
                      </tr>";
        }
    }

    $html .= "</table>";
}

$html .= '</div>';

$pdf->writeHTML($html, true, false, true, false, '');

$pdf->Output('horario_escolar.pdf', 'I');

$conn->close();
?>
