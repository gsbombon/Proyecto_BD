<?php

$conexion=mysqli_connect("localhost","admin","admin","campeonatobd");

 $id=$_REQUEST['id'];
 $jug_nombre=$_POST["nombre"];
 $jug_apellido=$_POST["apellido"];
$jug_dorsal=$_POST["dorsal"];
$jug_fecha=$_POST["fecha"];


 $consulta="UPDATE jugador SET JUG_NOMBRE='$jug_nombre', JUG_APELLIDO='$jug_apellido', DORSAL='$jug_dorsal', JUG_FECHANACIMIENTO='$jug_fecha' WHERE JUG_ID='$id'";
 $resultado=mysqli_query($conexion,$consulta);

    if($resultado)
    {
      header("Location: ../forms/jugador/modificarDatos.php");
    }
    else
    {
      echo "<center><h1>ERROR</h1></center>"; 	  
    } 
?>