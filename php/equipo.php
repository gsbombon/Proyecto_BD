<?php
require('../negocio/RN_Usuario.php'); 

 $eq_nombre=$_POST["nomEquipo"];
 $eq_campeonato=$_POST["campeonato"];
 $eq_lema=$_POST["lema"];
 $eq_correo=$_POST["correo"];
     
   $Obj_UsuarioBT=new UsuarioBT(); 
    if ($Obj_UsuarioBT->guardar_equipo($eq_campeonato,$eq_nombre,$eq_correo,$eq_lema))
    {
      echo '<script languaje="Javascript">location.href="../forms/admin.php"</script>';
    }
    else
    {
      echo "<center><h1>ERROR</h1></center>"; 	  
    } 
?>