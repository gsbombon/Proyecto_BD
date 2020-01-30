<script
	src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
      <div class="text-center pt-5">
            <h1>Asignar Resultados</h1>
        </div>
<?php 
$conexion=mysqli_connect('localhost','admin','admin','campeonatobd');
	$sql="SELECT  CAMP_ID,CAMP_NOMBRE FROM CAMPEONATO";

	$result=mysqli_query($conexion,$sql);
echo "<div class='form-control'";
	$cadena="<label>Campeonato</label> 
			<select id='lista2' name='lista2'>";

	while ($ver=mysqli_fetch_row($result)) {
		$cadena=$cadena.'<option value='.$ver[0].'>'.$ver[1].'</option>';
	}
	echo  $cadena."</select>";

	
	echo "<div id='jornadas' class='form-control'></div>";
	echo "</div>";
	echo "<script>
	$(document).ready(function(){
		$('#lista2').val(1);
		recargarLista();

		$('#lista2').change(function(){
			recargarLista();
		});
	})
	
	</script>";	
	
	echo "<script> 
	function recargarLista(){
		$.ajax({
			type:'POST',
			url:'jornadas.php',
			data:'campeonato=' + $('#lista2').val(),
			success:function(r){
				$('#jornadas').html(r);
			}
		});
	}
	</script>";
	
?>