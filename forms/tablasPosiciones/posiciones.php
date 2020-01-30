<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Tabla de Posiciones</title>
</head>

<body>
<!--
    <div id="apDiv1">
        <ul id="MenuBar1" class="MenuBarHorizontal">
            <li>
                <div align="center"><a href="../admin.php">Regresar al Men&uacute;</a></div>
            </li>
        </ul>
    </div>
--->
    <h1>Tabla de Posiciones</h1>

    <div id="apDiv2">

        <table class="tabla" width="726" height="159" border="1">

            <tr class="cabecera">
                <td width="32" height="40">
                    <div align="center">
                        <h3>Posicion</h3>
                    </div>
                </td>
                <td width="107">
                    <div align="center">
                        <h3>Equipo</h3>
                    </div>
                </td>
                <td width="129">
                    <div align="center">
                        <h3>PJ</h3>
                    </div>
                </td>
                <td width="129">
                    <div align="center">
                        <h3>PG</h3>
                    </div>
                </td>
                <td width="129">
                    <div align="center">
                        <h3>PP</h3>
                    </div>
                </td>
                <td width="80">
                    <div align="center">
                        <h3>PE</h3>
                    </div>
                </td>
				<td width="80">
                    <div align="center">
                        <h3>GF</h3>
                    </div>
                </td>
				<td width="80">
                    <div align="center">
                        <h3>Puntos</h3>
                    </div>
                </td>
            </tr>

            <?php
    $conexion=mysqli_connect("localhost","admin","admin","campeonatofutbol");
		
    $consulta="
	SELECT @i := @i + 1 as Posicion, e.equi_nombre, TABLA_PARTIDOSJUGADOS, TABLA_PARTIDOSGANADOS, TABLA_PARTIDOSPERDIDOS, TABLA_GOLESFAVOR, TABLA_PUNTOS 
	FROM campeonatofutbol.tabla_posiciones T,campeonatofutbol.equipo E
	CROSS JOIN (select @i := 0) r
	WHERE T.equi_ID=E.equi_id AND T.CAMP_ID=1
	ORDER BY TABLA_PUNTOS DESC;";
    $resultado=mysqli_query($conexion,$consulta);
    while($fila = $resultado->fetch_assoc()){
    ?>
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
                    <?php echo $fila['TABLA_PARTIDOSPERDIDOS']; ?>
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
    </div>
    <script type="text/javascript">
        var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {
            imgDown: "SpryAssets/SpryMenuBarDownHover.gif",
            imgRight: "SpryAssets/SpryMenuBarRightHover.gif"
        });
    </script>
    
</body>
</html>