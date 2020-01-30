<?php

$conexion=mysqli_connect("localhost","admin","admin","campeonatobd");

 $id=$_REQUEST['id'];
 $camp_nombre=$_POST["nomCampeonato"];
 $camp_fechaInicio=$_POST["fechaInicio"];
$camp_fechaFin=$_POST["fechaFin"];


 $consulta="UPDATE campeonato SET CAMP_NOMBRE='$camp_nombre', CAMP_FECHAINICIO='$camp_fechaInicio', CAMP_FECHAFIN='$camp_fechaFin' WHERE CAMP_ID='$id'";
 $resultado=mysqli_query($conexion,$consulta);

    if($resultado)
    {
      header("Location: ../forms/campeonato/modificarDatos.php");
    }
    else
    {
      echo "<center><h1>ERROR</h1></center>"; 	  
    } 
?>