<?php
require('../negocio/RN_Usuario.php'); 

 $jug_nombre=$_POST["nombre"];
 $jug_apellido=$_POST["apellido"];
$jug_dorsal=$_POST["dorsal"];
    $jug_fecha=$_POST["fecha"];
    $jug_equipo=$_POST["equipo"];
 
   $Obj_UsuarioBT=new UsuarioBT(); 
    if ($Obj_UsuarioBT->guardar_jugador($jug_equipo,$jug_nombre,$jug_apellido,$jug_dorsal,$jug_fecha))
    {
      echo '<script languaje="Javascript">location.href="../forms/admin.php"</script>';
    }
    else
    {
      echo "<center><h1>ERROR</h1></center>"; 	  
    } 
?>