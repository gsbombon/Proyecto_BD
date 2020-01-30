<?
require('../php/conexion.php');
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

    <title>Crear Equipo</title>
</head>

<body>

    <div class="container">

        <div class="text-center pt-5">
            <h1>INSCRIBIR JUGADOR</h1>
        </div>
        <form id="formulario" class="formulario" method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF'])?>">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputNombre">Nombres</label>
                    <input type="text" class="form-control" name="nombre" id="nombre" value="<?php if(isset($nombre)) echo $nombre ?>" placeholder="Nombre Completo">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputApellido">Apellidos</label>
                    <input type="text" class="form-control" name="apellido" id="apellido" value="<?php if(isset($apellido)) echo $apellido ?>" placeholder="Apellido Completo">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="inputDorsal">Dorsal</label>
                    <input type="text" class="form-control" name="dorsal" id="dorsal" value="<?php if(isset($dorsal)) echo $dorsal ?>" placeholder="Dorsal">
                </div>
                <div class="form-group col-md-4">
                    <label for="inputFechaNac">Fecha de Nacimiento</label>
                    <input type="date" class="form-control" name="fecha" id="fecha" value="<?php if(isset($dorsal)) echo $dorsal ?>" placeholder="Fecha">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputState">Equipo</label>
                    <select id="equipo" name="equipo" class="form-control">
                        <option value="0">Seleccionar Equipo</option>
                        <?php while($rowEqui = $resultadoEqui->fetch_assoc()){ ?>
                        <option value="<?php echo $rowEqui['EQUI_ID']; ?>"><?php echo $rowEqui['EQUI_NOMBRE']; ?></option>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <?php
            include("../php/validarJugador.php");
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
