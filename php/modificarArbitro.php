<?php

$conexion=mysqli_connect("localhost","admin","admin","proyecto_bdfinal");
$id=$_REQUEST['id'];
 $arb_nombre=$_POST["nomArbitro"];
 $arb_apellido=$_POST["apellidoArbitro"];
 $arb_telefono=$_POST["telfArbitro"];

 $consulta="UPDATE arbitro SET ARBITRO_NOMBRE='$arb_nombre', ARBITRO_APELLIDO='$arb_apellido', ARBITRO_TELEFONO='$arb_telefono' WHERE ARBITRO_ID='$id'";
 $resultado=mysqli_query($conexion,$consulta);

    if($resultado)
    {
      header("Location: ../forms/arbitro/modificarDatos.php");
    }
    else
    {
      echo "<center><h1>ERROR</h1></center>"; 	  
    } 
?>