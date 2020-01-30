<?php
if(isset($_POST['Crear'])){
    $cont=0;
    if(empty($nombre)){
        echo "<p class='error'>*Agrega una área</p>";
    }else{
        $cont=$cont+1;
    }
    if(empty($campeonato)){
        echo "<p class='error'>*Agrega una asignatura</p>";
    }else{
        $cont=$cont+1;
    }
    if(empty($correo)){
        echo "<p class='error'>*Agrega una asignatura</p>";
    }else{
        $cont=$cont+1;
    }
    if(empty($lema)){
        echo "<p class='error'>*Agrega una asignatura</p>";
    }else{
        $cont=$cont+1;
    }
    if($cont==4){
        include("equipo.php");
    }
}
?>