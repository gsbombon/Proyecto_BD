<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Tabla de Posiciones</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
	<?php
	$conexion=mysqli_connect("localhost","admin","admin","campeonatobd");
		$campID=$_POST['id_camp'];
    $consulta="
	SELECT @i := @i + 1 as Posicion, e.equi_nombre, TABLA_PARTIDOSJUGADOS, TABLA_PARTIDOSGANADOS, TABLA_PARTIDOS_EMPATADOS, TABLA_PARTIDOSPERDIDOS, TABLA_GOLESFAVOR, TABLA_PUNTOS 
	FROM tabla_posiciones T,equipo E 
	CROSS JOIN (select @i := 0) r 
	WHERE T.equi_ID=E.equi_id AND T.CAMP_ID=$campID 
	ORDER BY TABLA_PUNTOS DESC";
    $resultado=mysqli_query($conexion,$consulta);
	?>
	<table class="table" width="100%" height="20%" border="1" >
				<thead class="thead-dark">
					<tr>
					  <th scope="col">Posicion</th>
					  <th scope="col">Equipo</th>
					  <th scope="col">PJ.</th>
					  <th scope="col">PG.</th>
					  <th scope="col">PP.</th>
					  <th scope="col">GF.</th>
					  <th scope="col">DG.</th>
					  <th scope="col">Pts.</th>
					</tr>
				  </thead>

            <?php   while($fila = $resultado->fetch_assoc()){   ?>
            <tr>
                <td>
                    <?php echo $fila['Posicion']; ?>
                </td>
                <td>
                    <?php echo $fila['equi_nombre']; ?>
                </td>
                <td>
                    <?php echo $fila['TABLA_PARTIDOSJUGADOS']; ?>
                </td>
                <td>
                    <?php echo $fila['TABLA_PARTIDOSGANADOS']; ?>
                </td>
                <td>
                    <?php echo $fila['TABLA_PARTIDOS_EMPATADOS']; ?>
                </td>
				<td>
                    <?php echo $fila['TABLA_PARTIDOSPERDIDOS']; ?>
                </td>
                <td>
					<?php echo $fila['TABLA_GOLESFAVOR']; ?>
                </td>
				<td>
					<?php echo $fila['TABLA_PUNTOS']; ?>
                </td>
            </tr>
            <?php
	}
	?>
        </table>
</body>
</html>