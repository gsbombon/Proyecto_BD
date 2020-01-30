<?php 
$conexion=mysqli_connect('localhost','admin','admin','campeonatobd');
$campeonato=$_POST['campeonato'];

	$sql="SELECT num_jornada FROM jornada,calendario c WHERE c.camp_id=$campeonato;";

	$result=mysqli_query($conexion,$sql);

	$cadena="<label>Jornadas</label> 
			<select id='lista3' name='lista3'>";

	while ($ver=mysqli_fetch_row($result)) {
		$cadena=$cadena.'<option value='.$ver[0].'>'.$ver[0].'</option>';
	}
	echo  $cadena."</select>";	
	
	echo "<div id='partidos'></div>";
	echo "<script>
	$(document).ready(function(){
		$('#lista3').change(function(){
			recargarLista();
		});
	})
	
	</script>";	
	
	echo "<script> 
	function recargarLista(){
		$.ajax({
			type:'POST',
			url:'partidos.php',
			data:'jornada=' + $('#lista3').val(),
			success:function(r){
				$('#partidos').html(r);
			}
		});
	}
	</script>";
?>