<?
$conexion=mysqli_connect('localhost','admin','admin','campeonatobd');
$equipo1=(int)$_POST['e1'];
$equipo2=(int)$_POST['e2'];
$idPart=$_POST['id'];
intval ($equipo1);
intval ($equipo2);


if($equipo1>$equipo2){
	$puntosEquipo1=3;
	$puntosEquipo2=0;
	
	
}else if($equipo1<$equipo2){
	$puntosEquipo1=0;
	$puntosEquipo2=3;
	
}else{
	$puntosEquipo1=1;
	$puntosEquipo2=1;
	
}
$sql="SELECT EQUI_ID FROM encuentro where PARTIDO_ID='$idPart' ";
$result=mysqli_query($conexion,$sql);
$cont=0;
while($ret = mysqli_fetch_array($result)){
		$equipoId[$cont]=$ret[0];				
		$cont++;
}
echo $equipoId[0];

$sql="UPDATE `encuentro` SET `GOLES` = '$equipo1', `RESULTADO` = '$puntosEquipo1' ,`Estado`=1 WHERE `encuentro`.`PARTIDO_ID` = '$idPart' AND `encuentro`.`EQUI_ID` = '$equipoId[0]';";
	echo mysqli_query($conexion,$sql);

$sql="UPDATE `encuentro` SET `GOLES` = '$equipo2', `RESULTADO` = '$puntosEquipo2' ,`Estado`=1 WHERE `encuentro`.`PARTIDO_ID` = '$idPart'
AND `encuentro`.`EQUI_ID` = '$equipoId[1]';";
	echo mysqli_query($conexion,$sql);



?>