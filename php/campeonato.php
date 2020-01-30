<?php
require('../negocio/RN_Usuario.php'); 

 $camp_nombre=$_POST["nomCampeonato"];
 $camp_division=$_POST["division"];
$camp_categoria=$_POST["categoria"];
    $camp_fechaInicio=$_POST["fechaInicio"];
    $camp_fechaFinal=$_POST["fechaFin"];
 
   $Obj_UsuarioBT=new UsuarioBT(); 
    if ($Obj_UsuarioBT->guardar_campeonato($camp_division,$camp_categoria,$camp_nombre,$camp_fechaInicio,$camp_fechaFinal))
    {
      echo '<script languaje="Javascript">location.href="../forms/admin.php"</script>';
    }
    else
    {
      echo "<center><h1>ERROR</h1></center>"; 	  
    } 
?>