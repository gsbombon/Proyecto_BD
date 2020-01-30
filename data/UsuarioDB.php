<?php	
	
	require_once('conexion.php');
  
	class UsuarioDB
	{

 	function guardar($usu_nombre,$usu_apellido,$usu_cedula,$usu_user,$usu_email,$usu_passw)
 	{
    $Obj_config=new conecta();
	$link=mysqli_connect($Obj_config->get_dbhost(),$Obj_config->get_dbuser(),$Obj_config->get_dbpass(),$Obj_config->get_dbname()) or die('No pudo conectarse : ' .mysqli_error());
    $sql= "INSERT INTO usuarios (Nombre,Apellido,Cedula,Usuario,Email,Contrasena)
    VALUES('$usu_nombre','$usu_apellido','$usu_cedula','$usu_user','$usu_email','$usu_passw')";
    $result = mysqli_query($link,"SET NAMES 'utf8'");
    $result=mysqli_query($link, $sql) or die (mysqli_error($link));
	mysqli_close($link); 
	return $result;
	}

	function guardar_campeonato($camp_division,$camp_categoria,$camp_nombre,$camp_fechaInicio,$camp_fechaFinal)
 	{
    $Obj_config=new conecta();
	$link=mysqli_connect($Obj_config->get_dbhost(),$Obj_config->get_dbuser(),$Obj_config->get_dbpass(),$Obj_config->get_dbname()) or die('No pudo conectarse : ' .mysqli_error());
    $sql= "INSERT INTO campeonato (DIVISION_ID,TIPOCAMP_ID,CAMP_NOMBRE,CAMP_FECHAINICIO,CAMP_FECHAFIN)
    VALUES('$camp_division','$camp_categoria','$camp_nombre','$camp_fechaInicio','$camp_fechaFinal')";
    $result = mysqli_query($link,"SET NAMES 'utf8'");
    $result=mysqli_query($link, $sql) or die (mysqli_error($link));
	mysqli_close($link); 
	return $result;
	}
        
    function guardar_arbitro($arb_nombre,$arb_apellido,$arb_telefono)
 	{
    $Obj_config=new conecta();
	$link=mysqli_connect($Obj_config->get_dbhost(),$Obj_config->get_dbuser(),$Obj_config->get_dbpass(),$Obj_config->get_dbname()) or die('No pudo conectarse : ' .mysqli_error());
    $sql= "INSERT INTO arbitro (ARBITRO_NOMBRE,ARBITRO_APELLIDO,ARBITRO_TELEFONO)
    VALUES('$arb_nombre','$arb_apellido','$arb_telefono')";
    $result = mysqli_query($link,"SET NAMES 'utf8'");
    $result=mysqli_query($link, $sql) or die (mysqli_error($link));
	mysqli_close($link); 
	return $result;
	}
        
    function guardar_equipo($eq_campeonato,$eq_nombre,$eq_correo,$eq_lema)
 	{
    $Obj_config=new conecta();
	$link=mysqli_connect($Obj_config->get_dbhost(),$Obj_config->get_dbuser(),$Obj_config->get_dbpass(),$Obj_config->get_dbname()) or die('No pudo conectarse : ' .mysqli_error());
    $sql= "INSERT INTO equipo (CAMP_ID,EQUI_NOMBRE,EQUI_CORREO,EQUI_LEMA)
    VALUES('$eq_campeonato','$eq_nombre','$eq_correo','$eq_lema')";
    $result = mysqli_query($link,"SET NAMES 'utf8'");
    $result=mysqli_query($link, $sql) or die (mysqli_error($link));
	mysqli_close($link); 
	return $result;
	}
        
    function guardar_jugador($jug_equipo,$jug_nombre,$jug_apellido,$jug_dorsal,$jug_fecha)
 	{
    $Obj_config=new conecta();
	$link=mysqli_connect($Obj_config->get_dbhost(),$Obj_config->get_dbuser(),$Obj_config->get_dbpass(),$Obj_config->get_dbname()) or die('No pudo conectarse : ' .mysqli_error());
    $sql= "INSERT INTO jugador (EQUI_ID,JUG_NOMBRE,JUG_APELLIDO,DORSAL,JUG_FECHANACIMIENTO)
    VALUES('$jug_equipo','$jug_nombre','$jug_apellido','$jug_dorsal','$jug_fecha')";
    $result = mysqli_query($link,"SET NAMES 'utf8'");
    $result=mysqli_query($link, $sql) or die (mysqli_error($link));
	mysqli_close($link); 
	return $result;
	}
	
	function buscar_por_usuario($log_users)
 	{
    $Obj_config=new conecta();
	$link=mysqli_connect($Obj_config->get_dbhost(),$Obj_config->get_dbuser(),$Obj_config->get_dbpass(),$Obj_config->get_dbname()) or die('No pudo conectarse : ' .mysqli_error());
    $sql= "SELECT * FROM usuarios WHERE Usuario = '$log_user'";
    $result = mysqli_query($link,"SET NAMES 'utf8'");
    $result= mysqli_query($link, $sql) or die (mysqli_error($link));
	mysqli_close($link); 
	return $result;
	}

	function modificar_producto($prod_nombre,$prod_descripcion,$prod_precio,$prod_cantidad)
 	{
    $Obj_config=new conecta();
	$link=mysqli_connect($Obj_config->get_dbhost(),$Obj_config->get_dbuser(),$Obj_config->get_dbpass(),$Obj_config->get_dbname()) or die('No pudo conectarse : ' .mysqli_error());
	$sql="UPDATE productos SET Nombre='$prod_nombre', Descripcion='$prod_descripcion', Precio='$prod_precio', Cantidad_disponible='$prod_cantidad' WHERE Id='$id'";
	$result = mysqli_query($link,"SET NAMES 'utf8'");
    $result=mysqli_query($link, $sql) or die (mysqli_error($link));
	mysqli_close($link); 
	return $result;
	}
	
 }
?>