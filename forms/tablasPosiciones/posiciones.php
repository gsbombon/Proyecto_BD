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

	<?
	$equipos=array();
	$equipoId=array();
	$pj=array();
	$pganado=array();
	$pperdido=array();
	$pempatado=array();
	$puntos=array();
	$goles=array();
	$equipo2=array();
	$config["sql_host"] = "localhost";  
	$config["sql_user"] = "admin";  
	$config["sql_pass"] = "admin";  
	$config["sql_database"] = "campeonatobd";  
	$sql_link = mysql_connect($config['sql_host'], $config['sql_user'], $config['sql_pass']) or die(mysql_error($sql_link));  
	mysql_select_db($config['sql_database'],$sql_link); 
	global $config, $sql_link;  
	$q="SELECT E.EQUI_ID,Q.EQUI_NOMBRE FROM encuentro E,equipo Q,campeonato C WHERE E.EQUI_ID=Q.EQUI_ID group by Q.EQUI_NOMBRE";
	$result = mysql_query($q, $sql_link) or die (mysqli_error());
	$cont=0;
	
    while($ret = mysql_fetch_array($result)){
		$equipoId[$cont]=$ret[0];
		$equipos[$cont]=$ret[1];				
		$cont++;
	}
	
	for ($i=0;$i<$cont;$i++){			
		$q="SELECT COUNT(equi_id) FROM encuentro WHERE EQUI_ID=$equipoId[$i] AND Estado=1";
	$result = mysql_query($q, $sql_link) or die (mysqli_error());
	$ret = mysql_fetch_array($result);
	$pj[$i]= $ret[0];
	
	}
	for ($i=0;$i<$cont;$i++){			
		$q="SELECT COUNT(*) FROM encuentro WHERE resultado=3 AND equi_id=$equipoId[$i] AND Estado=1";
	$result = mysql_query($q, $sql_link) or die (mysqli_error());
	$ret = mysql_fetch_array($result);
	$pganado[$i]= $ret[0];
	
	}
	for ($i=0;$i<$cont;$i++){			
		$q="SELECT COUNT(*) FROM encuentro WHERE resultado=1 AND equi_id=$equipoId[$i] AND Estado=1";
	$result = mysql_query($q, $sql_link) or die (mysqli_error());
	$ret = mysql_fetch_array($result);
	$pempatado[$i]= $ret[0];
	
	}
	for ($i=0;$i<$cont;$i++){			
		$q="SELECT COUNT(*) FROM encuentro WHERE resultado=0 AND equi_id=$equipoId[$i] AND Estado=1";
	$result = mysql_query($q, $sql_link) or die (mysqli_error());
	$ret = mysql_fetch_array($result);
	$pperdido[$i]= $ret[0];
	
	}
	
	for ($i=0;$i<$cont;$i++){		
	$q="SELECT SUM(goles) FROM encuentro WHERE Equi_ID=$equipoId[$i] AND Estado=1;";
	$result = mysql_query($q, $sql_link) or die (mysqli_error());
	$ret = mysql_fetch_array($result);
	$goles[$i]= $ret[0];
	
	}
	
		for ($i=0;$i<$cont;$i++){		
	$q="SELECT SUM(resultado)  FROM encuentro WHERE Equi_ID=$equipoId[$i] AND Estado=1;";
	$result = mysql_query($q, $sql_link) or die (mysqli_error());
	$ret = mysql_fetch_array($result);
	$puntos[$i]= $ret[0];
	
	}
	
	
	
	for ($i=0;$i<sizeof($pj);$i++){
		$q="UPDATE `tabla_posiciones` SET `TABLA_PARTIDOSJUGADOS` = '$pj[$i]', `TABLA_PARTIDOSGANADOS` = '$pganado[$i]',`TABLA_PARTIDOS_EMPATADOS` = '$pempatado[$i]', `TABLA_PARTIDOSPERDIDOS` = '$pperdido[$i]', `TABLA_GOLESFAVOR` = '$goles[$i]', `TABLA_PUNTOS` = '$puntos[$i]' WHERE `tabla_posiciones`.`EQUI_ID` = $equipoId[$i];";
		$result = mysql_query($q, $sql_link) or die (mysqli_error());
		
			
	}

?>
	
	
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