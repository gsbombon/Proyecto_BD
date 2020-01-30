<?
if(isset($_POST['Crear'])){
        $nombre=$_POST['nomArbitro'];
        $apellido=$_POST['apellidoArbitro'];
        $telefono=$_POST['telfArbitro'];
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
            <h1>Agregar Arbitro</h1>
			<hr>	
        </div>
        <form id="formulario" method="post" class="formulario" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF'])?>">
            <div class="text-center pt-4">
                <h4>Arbitro</h4>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="">Nombre</label>
                    <input type="text" class="form-control" name="nomArbitro" id="nomArbitro" value="<?php if(isset($nombre)) echo $nombre ?>" placeholder="Ingrese nombre">
                </div>
                <div class="form-group col-md-12">
                    <label for="">Apellido</label>
                    <input type="text" class="form-control" name="apellidoArbitro" id="apellidoArbitro" value="<?php if(isset($apellido)) echo $apellido ?>" placeholder="Ingrese apellido">
                </div>
				<div class="form-group col-md-12">
                    <label for="">Telefono</label>
                    <input type="text" class="form-control" name="telfArbitro" id="telfArbitro" value="<?php if(isset($telefono)) echo $telefono ?>" placeholder="Ingrese telefono">
                </div>

            </div>
            <?php
            include("../php/validarArbitro.php");
            ?>
			<input type="submit" class="btn btn-primary" name="Crear" value="Registrar Arbitro" id="regArbitro"></input>
        </form>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>