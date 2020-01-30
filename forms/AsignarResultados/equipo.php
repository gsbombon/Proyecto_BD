<?php 
$conexion=mysqli_connect('localhost','admin','admin','campeonatobd');
$jornada=$_POST['jornada'];

		$sql="SELECT partido_id FROM jornada_partido WHERE jornada_id=$jornada;";

	$result=mysqli_query($conexion,$sql);

	$cadena="<label>Partidos</label> 
			<select id='lista4' name='lista4'>";

	while ($ver=mysqli_fetch_row($result)) {
		$cadena=$cadena.'<option value='.$ver[0].'>'.$ver[0].'</option>';
	}
	echo  $cadena."</select>";
	
	?>