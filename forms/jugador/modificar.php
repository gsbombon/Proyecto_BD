<?
require('../../php/conexion.php');
$queryEqui = "SELECT EQUI_ID, EQUI_NOMBRE FROM equipo";
$resultadoEqui = $mysqli->query($queryEqui);

if(isset($_POST['Crear'])){
        $nombre=$_POST['nombre'];
        $apellido=$_POST['apellido'];
        $dorsal=$_POST['dorsal'];
        $fecha=$_POST['fecha'];
        $equipo=$_POST['equipo'];
    }
?>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Modificar Equipo</title>
</head>

<body>

   <?php
    $id=$_REQUEST['id'];
    $conexion=mysqli_connect("localhost","admin","admin","campeonatobd");
    $consulta="SELECT * FROM jugador WHERE JUG_ID = '$id'";
    $resultado=mysqli_query($conexion,$consulta);
    $fila = $resultado->fetch_assoc();
    ?>
   
    <div class="container">

        <div class="text-center pt-5">
            <h1>MODIFICAR JUGADOR</h1>
        </div>
        <form id="formulario" class="formulario" method="post" action="../../php/modificarJugador.php?id=<?php echo $fila['JUG_ID']; ?>">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputNombre">Nombres</label>
                    <input type="text" class="form-control" name="nombre" id="nombre" value="<?php echo $fila['JUG_NOMBRE'] ?>" placeholder="Nombre Completo">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputApellido">Apellidos</label>
                    <input type="text" class="form-control" name="apellido" id="apellido" value="<?php echo $fila['JUG_APELLIDO'] ?>" placeholder="Apellido Completo">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="inputDorsal">Dorsal</label>
                    <input type="text" class="form-control" name="dorsal" id="dorsal" value="<?php echo $fila['DORSAL'] ?>" placeholder="Dorsal">
                </div>
                <div class="form-group col-md-4">
                    <label for="inputFechaNac">Fecha de Nacimiento</label>
                    <input type="date" class="form-control" name="fecha" id="fecha" value="<?php echo $fila['JUG_FECHANACIMIENTO'] ?>" placeholder="Fecha">
                </div>
            </div>
            <?php
            include("../../php/validarJugador.php");
            ?>
            <input type="submit" name="Crear" class="btn btn-primary">Registrar</input>
        </form>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>
