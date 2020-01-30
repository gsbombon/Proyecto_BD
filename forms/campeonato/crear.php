<?
require('../php/conexion.php');
$queryDiv = "SELECT DIVISION_ID, DIVISION_DETALLE FROM division";
$resultadoDiv = $mysqli->query($queryDiv);
$queryTipo = "SELECT TIPOCAMP_ID, TIPOCAMP_TIPO FROM tipo_campeonato";
$resultadoTipo = $mysqli->query($queryTipo);

if(isset($_POST['Crear'])){
        $nombre=$_POST['nomCampeonato'];
        $division=$_POST['division'];
        $categoria=$_POST['categoria'];
        $fechaInicio=$_POST['fechaInicio'];
        $fechaFin=$_POST['fechaFin'];
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

    <title>Crear Campeonato</title>
</head>

<body>

    <div class="container">

        <div class="text-center pt-5">
            <h1>Crear Campeonato</h1>
			<hr>	
        </div>
        <form id="formulario" class="formulario" method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF'])?>">
            <div class="text-center pt-4">
                <h4>Campeonato</h4>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="inputEmail4">Nombre</label>
                    <input type="text" class="form-control" id="nomCampeonato" name="nomCampeonato" value="<?php if(isset($nombre)) echo $nombre ?>" placeholder="Nombre del campeonato" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="inputState">Division</label>
                    <select id="division" name="division" class="form-control" value="<?php if(isset($division)) echo $division ?>" required>
                        <option value="0">Seleccionar Division</option>
                        <?php while($rowDiv = $resultadoDiv->fetch_assoc()){ ?>
                        <option value="<?php echo $rowDiv['DIVISION_ID']; ?>"><?php echo $rowDiv['DIVISION_DETALLE']; ?></option>
                        <?php } ?>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="inputState">Tipo</label>
                    <select id="categoria" name="categoria" class="form-control" required>
                        <option value="0">Seleccione Tipo</option>
                        <?php while($rowTipo = $resultadoTipo->fetch_assoc()){ ?>
                        <option value="<?php echo $rowTipo['TIPOCAMP_ID']; ?>"><?php echo $rowTipo['TIPOCAMP_TIPO']; ?></option>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <div class="text-center pt-4">
                <h4>Fecha</h4>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="">Fecha Inicio</label>
                    <input type="date" class="form-control" id="fechaInicio" name="fechaInicio" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="">Fecha Final</label>
                    <input type="date" class="form-control" id="fechaFin" name="fechaFin" required>
                </div>
            </div>
            <?php
            include("../php/validarCampeonato.php");
            ?>
            <input type="submit" name="Crear" class="btn btn-primary">Crear Campeonato</input>
        </form>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>