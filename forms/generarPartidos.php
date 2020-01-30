
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
      <div class="text-center pt-5">
            <h1>Generar Calendario</h1>
        </div>
<?php
$equipoId=array();
$equipoNom=array();
$equipos=array();
$equipo1=array();
$equipo2=array();
$numEquipos=array();
$id=array();
$config["sql_host"] = "localhost";  
$config["sql_user"] = "admin";  
$config["sql_pass"] = "admin";  
$config["sql_database"] = "campeonatobd";  
$sql_link = mysql_connect($config['sql_host'], $config['sql_user'], $config['sql_pass']) or die(mysql_error($sql_link));  
mysql_select_db($config['sql_database'],$sql_link); 
    global $config, $sql_link;  
	if(isset($_POST["submit"]) && $_SERVER["REQUEST_METHOD"] == "POST"){
		$idCampeonato=$_POST["division"];
		
	//seleccionar id equipos
	$conexion=mysqli_connect('localhost','admin','admin','campeonatobd');
	$sql="SELECT  CAMP_ID,CAMP_NOMBRE FROM CAMPEONATO";

	$result=mysqli_query($conexion,$sql);

		$q="SELECT * FROM equipo WHERE camp_id=$idCampeonato;";
		$result = mysql_query($q, $sql_link) or die (mysqli_error());
		$cont=0;	
    	while($ret = mysql_fetch_array($result)){
		$equipoId[$cont]=$ret[0];	
		$equipoNom[$cont]=$ret[2];		
		$cont++;
		}	
	//seleccionar partidos
	$q="SELECT COUNT(*) FROM equipo WHERE camp_id=$idCampeonato;";
	$result = mysql_query($q, $sql_link) or die (mysqli_error());
	$ret = mysql_fetch_array($result);
	$numEquipos[0]= $ret[0];
	//id de los partidos 
	$q="SELECT count(*) FROM partido;";
	$result = mysql_query($q, $sql_link) or die (mysqli_error());
	$ret = mysql_fetch_array($result);
	$id[0]= $ret[0];
	$primary=$id[0]+1;
	//ide de la jornada
	$q="SELECT count(*) FROM jornada;";
	$result = mysql_query($q, $sql_link) or die (mysqli_error());
	$ret = mysql_fetch_array($result);
	$id[0]= $ret[0];
	$priJornada=$id[0]+1;
	//echo "El ultimo index es".$tamano;
	
		
		$N =$numEquipos[0];
			for ($i = 0; $i<(($N-1)/2); $i++) {
 	 		 $g1[$i] = $i;
   			$g2[$i] = $N-$i-1;
   		}
		$cont=0;		
	
for ($j = 0; $j<$N-1; $j++) {//j son los rounds
  	 //anuncia los grupos
	 $q="INSERT INTO `jornada` (`JORNADA_ID`,`CALENDARIO_ID`, `NUM_JORNADA`, `JORNADA_FECHA`) VALUES ($priJornada,'1', '$j', '2020-03-13');";
	$result = mysql_query($q, $sql_link) or die (mysqli_error());
			echo "<table border='1' class='table table-striped'><tr><td><b>Jornada ".$j."</b></td></tr> ";
			echo "<tr><td>";
			$conta=0;
			
		foreach ($g1 as $equipo1) {
			echo "EQUIPO LOCAL: ".$equipoNom[$equipo1]."<BR>";
 			echo "EQUIPO2 VISITANTE: ".$equipoNom[$g2[$conta]]."<BR>";
			$equipo1=$equipoId[$equipo1];
			$equipo2=$equipoId[$g2[$conta]];
			$q="INSERT INTO `partido` (`PARTIDO_ID`, `CAMP_ID`, `ARBITRO_ID`, `CANCHA_ID`, `PARTIDO_HORA`) VALUES ('$primary', '1', '1', '1', '18:00:00');";
			$result = mysql_query($q, $sql_link) or die (mysqli_error());
			$q="INSERT INTO `jornada_partido` (`CAMP_ID`, `PARTIDO_ID`, `JORNADA_ID`) VALUES ('1', '$primary', '$priJornada');";
			$result = mysql_query($q, $sql_link) or die (mysqli_error());
			$q="INSERT INTO `encuentro` (`EQUI_ID`, `PARTIDO_ID`, `GOLES`, `RESULTADO`) VALUES ('$equipo1','$primary', '0', '0');";
			$result = mysql_query($q, $sql_link) or die (mysqli_error());
			$q="INSERT INTO `encuentro` (`EQUI_ID`, `PARTIDO_ID`, `GOLES`, `RESULTADO`) VALUES ('$equipo2','$primary', '0', '0');";
			$result = mysql_query($q, $sql_link) or die (mysqli_error());
			$conta++;
			$cont++;
			$primary++;
			echo "<br><br><br>"; 
		}
		echo "</td></tr><tr><td>";
		echo "</td></tr>";
// Calculamos la siguiente jornada
 		   $temp1 = $g2[0];
   			 $temp2 = $g1[($N/2)-1];
  		 for ($k = 0; $k<$N/2; $k++) {
   			   if ($k == ($N/2)-1) {
         			$g1[1] = $temp1;
        			 $g2[($N/2)-1] = $temp2;
      			} else {
        			 $g1[($N/2)-1-$k] = $g1[($N/2)-1-$k-1];
        			 $g2[$k] = $g2[$k+1];			 	
      			}		
   		}
		$priJornada++;

echo "</table>";
}
}

?>

<?
require('../php/conexion.php');
$queryDiv = "SELECT DIVISION_ID, DIVISION_DETALLE FROM division";
$resultadoDiv = $mysqli->query($queryDiv);
$queryTipo = "SELECT TIPOCAMP_ID, TIPOCAMP_TIPO FROM tipo_campeonato";
$resultadoTipo = $mysqli->query($queryTipo); 
$campeonato="SELECT  CAMP_ID,CAMP_NOMBRE FROM CAMPEONATO";
$resultadoCampeonato= $mysqli->query($campeonato); 
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Generar Partidos</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<script
	src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	

<body>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
<select id="camp" name="division" class="form-control" >
                        <option value="0">Seleccionar Campeonato</option>
                        <?php while($rowDiv = $resultadoCampeonato->fetch_assoc()){ ?>
                        <option value="<?php echo $rowDiv['CAMP_ID']; ?>"><?php echo $rowDiv['CAMP_NOMBRE']; ?></option>
                        <?php 
						
						} ?>                        
     </select>
     <input type="submit" value= "Generar" name="submit"/>
</form>