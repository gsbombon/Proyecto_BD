<!DOCTYPE html>
<html lang="es-ES">

<head>
    <meta charset='utf-8'>
    <title>Modificar Datos Arbitros</title>
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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>

    <div id="apDiv1">
        <ul id="MenuBar1" class="MenuBarHorizontal">
            <li>
                <div align="center"><a href="../admin.php">Regresar al Men&uacute;</a></div>
            </li>
        </ul>
    </div>
    <h1>MODIFICAR ARBITRO</h1>

    <div id="apDiv2">
				<table class="table" width="100%" height="20%" border="1" >
				<thead class="thead-dark">
					<tr>
					  <th scope="col">ID</th>
					  <th scope="col">Nombre Arbitro</th>
					  <th scope="col">Apellido Arbitro</th>
					  <th scope="col">Telefono</th>
					  <th scope="col">Modificar</th>
					</tr>
				  </thead>

            <?php
    $conexion=mysqli_connect("localhost","admin","admin","campeonatobd");
    $consulta="SELECT * FROM arbitro";
    $resultado=mysqli_query($conexion,$consulta);
    while($fila = $resultado->fetch_assoc()){
    ?>
            <tr>
                <td>
                    <?php
	 echo $fila['ARBITRO_ID'];
	   ?>
                </td>
                <td>
                    <?php
	 echo $fila['ARBITRO_NOMBRE'];
	   ?>
                </td>
                <td>
                    <?php
	 echo $fila['ARBITRO_APELLIDO'];
	   ?>
                </td>
                <td>
                    <?php
	 echo $fila['ARBITRO_TELEFONO'];
	   ?>
                </td>
                <td>
                    <a href="modificar.php?id=<?php echo $fila['ARBITRO_ID']; ?>">Modificar</a>
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
