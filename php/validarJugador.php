<?php
if(isset($_POST['Crear'])){
    $cont=0;
    if(empty($nombre)){
        echo "<p class='error'>*Agrega una área</p>";
    }else{
        $cont=$cont+1;
    }
    if(empty($apellido)){
        echo "<p class='error'>*Agrega una asignatura</p>";
    }else{
        $cont=$cont+1;
    }
    if($cont==2){
        include("jugador.php");
    }
}
?>