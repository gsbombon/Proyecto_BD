<?
require('../php/conexion.php');
$queryCam = "SELECT CAMP_ID, CAMP_NOMBRE FROM campeonato";
$resultadoCam = $mysqli->query($queryCam);

if(isset($_POST['Crear'])){
        $nombre=$_POST['nomEquipo'];
        $campeonato=$_POST['campeonato'];
        $correo=$_POST['correo'];
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

    <title>Crear Equipo</title>
</head>

<body>

    <div class="container">

        <div class="text-center pt-5">
            <h1>Crear Equipos</h1>
        </div>
        <form id="formulario" class="formulario" method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF'])?>">
            <div class="text-center pt-4">
                <h4>Equipo</h4>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="inputState">Campeonato</label>
                    <select id="campeonato" name="campeonato" class="form-control">
                        <option value="0">Seleccionar Campeonato</option>
                        <?php while($rowCam = $resultadoCam->fetch_assoc()){ ?>
                        <option value="<?php echo $rowCam['CAMP_ID']; ?>"><?php echo $rowCam['CAMP_NOMBRE']; ?></option>
                        <?php } ?>
                    </select>
                </div>
                <div class="form-group col-md-12">
                    <label for="inputEmail4">Nombre</label>
                    <input type="text" class="form-control" name="nomEquipo" id="nomEquipo" value="<?php if(isset($nombre)) echo $nombre ?>" placeholder="Nombre del equipo" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="inputLema">Correo</label>
                    <input type="text" class="form-control" name="correo" id="correo" value="<?php if(isset($lema)) echo $lema ?>" placeholder="Lema del equipo" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="inputLema">Lema</label>
                    <input type="text" class="form-control" name="lema" id="lema" value="<?php if(isset($lema)) echo $lema ?>" placeholder="Lema del equipo" required>
                </div>
            </div>
            <?php
            include("../php/validarEquipo.php");
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
