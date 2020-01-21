<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>
<style type="text/css">
body {
	background-color: #0CF;
	background-image: url(../img/1014803.jpg);
}
</style>
</head>

<body>
<center>
<h1>DATOS DEL PARTIDO</h1>
<table width="450" height="40">
<tr>
<td><center><strong>EQUIPO 1</center></td>
<td><center><strong>EQUIPO 2</center></td>

</tr>

</table>
<table width="450" height="281" border="0">
  <tr>
    <td>
      <img src="../img/jugador-de-futbol.png" width="46" height="46" alt="juga" />
      </td>
    <td><img src="../img/tarjeta-roja.png" width="46" height="46" alt="tra" /></td>
    <td><img src="../img/lanzando.png" width="46" height="46" alt="ama" /></td>
    <td><img src="../img/deporte.png" width="46" height="46" alt="balon" ></td>
     <td>
      <img src="../img/jugador-de-futbol.png" width="46" height="46" alt="juga" />
      </td>
    <td><img src="../img/tarjeta-roja.png" width="46" height="46" alt="tra" /></td>
    <td><img src="../img/lanzando.png" width="46" height="46" alt="ama" /></td>
    <td><img src="../img/deporte.png" width="46" height="46" alt="balon" ></td>
  </tr>
  <tr>
    <td>
	<center>
	<?php 
	echo "<br><br>";
	
	for($i=0;$i<11;$i++){
		echo "<select style='width:80px; height:25px' ><option>Select</option></select>";
		echo "<br><br>";
	}
	?>
    </center>
    </td>
    <td>
    <center>
	<?php 
	echo "<br><br>";
	for($i=0;$i<11;$i++){
		echo "<input type='text' style='width:30px;height:19px'>";
		echo "<br><br>";
	}
	
	?>
    </center>
    </td>
    <td>
    <center>
	<?php 
	
	echo "<br><br>";
	for($i=0;$i<11;$i++){
		echo "<input type='text' style='width:30px;height:19px'>";
		echo "<br><br>";
	}
	
	?>
    </center>
    </td>
    <td>
    <center>
	<?php 
	
	echo "<br><br>";
	for($i=0;$i<11;$i++){
		echo "<input type='text' style='width:30px;height:19px'>";
		echo "<br><br>";
	}
	
	?>
    </center>
     <td>
	<center>
	<?php 
		echo "<br><br>";
	for($i=0;$i<11;$i++){
		echo "<select style='width:80px; height:25px' ><option>Select</option></select>";
		echo "<br><br>";
	}
	?>
    </center>
    </td>
    <td>
    <center>
	<?php 
	echo "<br><br>";
	for($i=0;$i<11;$i++){
		echo "<input type='text' style='width:30px;height:19px'>";
		echo "<br><br>";
	}
	?>
    </center>
    </td>
    <td>
    <center>
	<?php 
	echo "<br><br>";
	for($i=0;$i<11;$i++){
		echo "<input type='text' style='width:30px;height:19px'>";
		echo "<br><br>";
	}
	?>
    </center>
    </td>
    <td>
    <center>
	<?php 
	echo "<br><br>";
	for($i=0;$i<11;$i++){
		echo "<input type='text' style='width:30px;height:19px'>";
		echo "<br><br>";
	}
	?>
    </center>
    </td>
  </tr>
</table>
<input type="button" value="Guardar"/>

</center>
</body>
</html>