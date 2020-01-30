<?php
//require ("../data/conexion.php");
$conexion=mysqli_connect("localhost","admin","admin","proyecto_bdfinal");
session_start();

$usuario=$_POST["user"];
$contrasena=$_POST["passw"];

$consulta="SELECT COUNT(*) as contar from usuario where USU_CORREO='$usuario' and USU_PASSWORD='$contrasena'";
$resultado=mysqli_query($conexion,$consulta);
$array=mysqli_fetch_array($resultado);

if(isset($_POST['Iniciar'])){
    if($array['contar']>0){
        $_SESSION['username']=$usuario;
        header("location:../forms/admin.php");
    }
}
?>