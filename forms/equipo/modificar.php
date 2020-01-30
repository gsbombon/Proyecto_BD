<?
require('../../php/conexion.php');
$queryCam = "SELECT CAMP_ID, CAMP_NOMBRE FROM campeonato";
$resultadoCam = $mysqli->query($queryCam);

if(isset($_POST['Crear'])){
        $nombre=$_POST['nomEquipo'];
        $campeonato=$_POST['campeonato'];
        $lema=$_POST['lema'];
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
    $conexion=mysqli_connect("localhost","admin","admin","proyecto_bdfinal");
    $consulta="SELECT * FROM equipo WHERE EQUI_ID = '$id'";
    $resultado=mysqli_query($conexion,$consulta);
    $fila = $resultado->fetch_assoc();
    ?>

    <div class="container">

        <div class="text-center pt-5">
            <h1>Modificar Equipo</h1>
        </div>
        <form id="formulario" class="formulario" method="post" action="../../php/modificarEquipo.php?id=<?php echo $fila['EQUI_ID']; ?>">
            <div class="text-center pt-4">
                <h4>Equipo</h4>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="inputEmail4">Nombre</label>
                    <input type="text" class="form-control" name="nomEquipo" id="nomEquipo" value="<?php echo $fila['EQUI_NOMBRE'] ?>" placeholder="Nombre del equipo">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputLema">Lema</label>
                    <input type="text" class="form-control" name="lema" id="lema" value="<?php echo $fila['EQUI_LEMA'] ?>" placeholder="Lema del equipo">
                </div>
            </div>
            <?php
            include("../../php/validarEquipo.php");
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
