<?php
require('../negocio/RN_Usuario.php'); 

 $arb_nombre=$_POST["nomArbitro"];
 $arb_apellido=$_POST["apellidoArbitro"];
 $arb_telefono=$_POST["telfArbitro"];
 
   $Obj_UsuarioBT=new UsuarioBT(); 
    if ($Obj_UsuarioBT->guardar_arbitro($arb_nombre,$arb_apellido,$arb_telefono))
    {
      echo '<script languaje="Javascript">location.href="../forms/admin.php"</script>';
    }
    else
    {
      echo "<center><h1>ERROR</h1></center>"; 	  
    } 
?>