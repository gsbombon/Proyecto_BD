<?php
require ("../php/validarLogin.php"); 

    if(isset($_POST['Iniciar'])){
        $usuario=$_POST['user'];
        $contrasena=$_POST['passw'];
    }
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>
<link href="../css/estilos.css" rel="stylesheet" type="text/css">
</head>

<body>
<form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF'])?>" class="form">
  <h2>Inicio Sesion</h2>
  <label for="">Usuario: </label>
	<input type="text" name="user" value="<?php if(isset($usuario)) echo $usuario ?>" placeholder="Ingrese su usuario" required ><br>
  <label for="">Contraseña:</label>
	<input type="password" name="passw" placeholder="Ingrese su contraseña" required><br>
  <input type="submit" name="Iniciar" value="Iniciar Sesion" class="button"> 
  <?php
        if(isset($_POST['Iniciar'])){
            if($array['contar']==0){
                echo "<p class='error'> Usuario o Contraseña  incorrecta </p>" ;
            }
        }
        ?>
</form>

</body>
</html>
