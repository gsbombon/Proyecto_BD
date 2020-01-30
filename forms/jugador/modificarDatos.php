<!DOCTYPE html>
<html lang="es-ES">

<head>
    <meta charset='utf-8'>
    <title>Productos disponibles</title>
    <style type="text/css">
        body {
            background-image: url(img/bg.jpg);
            background-color: white;
        }

        #buscador,
        h1 {
            margin-top: 3em;
            color: black;
            font-size: 24px;
            text-align: center;
        }

        #apDiv2 {
            position: absolute;
            width: 728px;
            height: 164px;
            z-index: 2;
            left: 317px;
            top: 149px;
        }

        #apDiv2 table tr td {
            color: #000;
        }

        #apDiv3 {
            position: absolute;
            width: 62px;
            height: 66px;
            z-index: 3;
            left: 27px;
            top: 66px;
        }

        .tabla {
            text-align: center;
            background: #FFF;
        }

        .cabecera {
            background: #CCC;
        }

        #apDiv1 {
            position: absolute;
            width: 138px;
            height: 41px;
            z-index: 3;
            left: 1219px;
            top: 24px;
        }

    </style>
    <link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css">
    <script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../Css/estilos.css">
</head>

<body>

    <div id="apDiv1">
        <ul id="MenuBar1" class="MenuBarHorizontal">
            <li>
                <div align="center"><a href="../admin.php">Regresar al Men&uacute;</a></div>
            </li>
        </ul>
    </div>
    <h1>MODIFICAR JUGADOR</h1>

    <div id="apDiv2">

        <table class="tabla" width="726" height="159" border="1">

            <tr class="cabecera">
                <td width="32" height="40">
                    <div align="center">
                        <h3>Id</h3>
                    </div>
                </td>
                <td width="107">
                    <div align="center">
                        <h3>Nombre Jugador</h3>
                    </div>
                </td>
                <td width="129">
                    <div align="center">
                        <h3>Apellido Jugador</h3>
                    </div>
                </td>
                <td width="129">
                    <div align="center">
                        <h3>Dorsal</h3>
                    </div>
                </td>
                <td width="129">
                    <div align="center">
                        <h3>Fecha Nacimiento</h3>
                    </div>
                </td>
                <td width="80">
                    <div align="center">
                        <h3>Modificar</h3>
                    </div>
                </td>
            </tr>

            <?php
    $conexion=mysqli_connect("localhost","admin","admin","proyecto_bdfinal");
    $consulta="SELECT * FROM jugador";
    $resultado=mysqli_query($conexion,$consulta);
    while($fila = $resultado->fetch_assoc()){
    ?>
            <tr>
                <td>
                    <?php
	 echo $fila['JUG_ID'];
	   ?>
                </td>
                <td>
                    <?php
	 echo $fila['JUG_NOMBRE'];
	   ?>
                </td>
                <td>
                    <?php
	 echo $fila['JUG_APELLIDO'];
	   ?>
                </td>
                <td>
                    <?php
	 echo $fila['DORSAL'];
	   ?>
                </td>
                <td>
                    <?php
	 echo $fila['JUG_FECHANACIMIENTO'];
	   ?>
                </td>
                <td>
                    <a href="modificar.php?id=<?php echo $fila['JUG_ID']; ?>">Modificar</a>
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
