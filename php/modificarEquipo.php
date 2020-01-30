<?php

$conexion=mysqli_connect("localhost","admin","admin","campeonatobd");

$id=$_REQUEST['id'];
 $eq_nombre=$_POST["nomEquipo"];
 $eq_lema=$_POST["lema"];


 $consulta="UPDATE equipo SET EQUI_NOMBRE='$eq_nombre', EQUI_LEMA='$eq_lema' WHERE EQUI_ID='$id'";
 $resultado=mysqli_query($conexion,$consulta);

    if($resultado)
    {
      header("Location: ../forms/equipo/modificarDatos.php");
    }
    else
    {
      echo "<center><h1>ERROR</h1></center>"; 	  
    } 
?>