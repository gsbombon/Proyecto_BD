
<?php 
$conexion=mysqli_connect('localhost','admin','admin','campeonatobd');
$partido=$_POST['equipo'];
	$sql="SELECT q.equi_nombre,q.equi_id FROM encuentro e,equipo q where e.EQUI_ID=q.EQUI_ID AND e.PARTIDO_ID=$partido;";
	$cadena="<form method='post' id='frmajax'>
	<table border='1'>";
	$result=mysqli_query($conexion,$sql);
	$cont=0;
	$nombre=array();
	while ($ver=mysqli_fetch_row($result)) {
		$nombre[$cont]=$ver[0];
		$cont++;
	}
	$cadena=$cadena."ID PARTIDO<input type='number' name='id' id='id' value='$partido'><BR>$nombre[0]<input type='number' name='e1' id='e1'><BR>$nombre[1]<input type='number' name='e2' id='e2'>
	<BR><button id='btnguardar'>Guardar datos</button>
	</form>";
	echo  $cadena;

	
	
		echo "<script>
	$(document).ready(function(){
		$('#btnguardar').click(function(){
			var datos=$('#frmajax').serialize();
			var idPartido=$partido;
			$.ajax({
				type:'POST',
				url:'resultados.php',
				data:datos,
				success:function(r){
				alert('Resultado registrado');
				}
			});

			return false;
		});
	});
</script>";

	
?>

