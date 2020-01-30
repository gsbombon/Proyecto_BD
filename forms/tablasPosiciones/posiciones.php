<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Tabla de Posiciones</title>
	<script
	src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
</head>

<body>

	<?php
	require('conexion.php');
	$queryCam = "SELECT CAMP_ID, CAMP_NOMBRE FROM campeonato";
	$resultadoCam = $mysqli->query($queryCam);
	?>
	<center>
    <h1>Tabla de Posiciones</h1>
	
	<h3>Seleccione el Campeonato</h3>
		<form action="">
			<div class="form-group col-md-12">
                    <select id="campeonato" name="campeonato" class="form-control">
                        <option value="0">Seleccionar Campeonato</option>
                        <?php while($rowCam = $resultadoCam->fetch_assoc()){ ?>
                        <option value="<?php echo $rowCam['CAMP_ID']; ?>"><?php echo $rowCam['CAMP_NOMBRE']; ?></option>
                        <?php } ?>
                    </select> 
			</div>
		</form>
	<br>
	</center>
	<div id="resultado"></div>
	
<script type="text/javascript">
	$(document).ready(function(){
		$('#campeonato').val();
		recargarLista();

		$('#campeonato').change(function(){
			recargarLista();
		});
	})
</script>
<script type="text/javascript">
	function recargarLista(){
		$.ajax({
			type:"POST",
			url:"tabla.php",
			data:"id_camp=" + $('#campeonato').val(),
			success:function(r){
				$('#resultado').html(r);
			}
		});
	}
</script>   
</body>
</html>