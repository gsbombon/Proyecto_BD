<?

require_once("../data/UsuarioDB.php");

class UsuarioBT
{
	function guardar($usu_nombre,$usu_apellido,$usu_cedula,$usu_user,$usu_email,$usu_passw)
	{
    $Obj_usuario=new UsuarioDB();
	return $Obj_usuario->guardar(strtoupper($usu_nombre),strtoupper($usu_apellido),$usu_cedula,$usu_user,$usu_email,$usu_passw);
	}

	function guardar_campeonato($camp_division,$camp_categoria,$camp_nombre,$camp_fechaInicio,$camp_fechaFinal)
	{
    $Obj_usuario=new UsuarioDB();
	return $Obj_usuario->guardar_campeonato($camp_division,$camp_categoria,$camp_nombre,$camp_fechaInicio,$camp_fechaFinal);
	}
    
    function guardar_arbitro($arb_nombre,$arb_apellido,$arb_telefono)
	{
    $Obj_usuario=new UsuarioDB();
	return $Obj_usuario->guardar_arbitro($arb_nombre,$arb_apellido,$arb_telefono);
	}
    
    function guardar_equipo($eq_campeonato,$eq_nombre,$eq_correo,$eq_lema)
	{
    $Obj_usuario=new UsuarioDB();
	return $Obj_usuario->guardar_equipo($eq_campeonato,$eq_nombre,$eq_correo,$eq_lema);
	}
	
    function guardar_jugador($jug_equipo,$jug_nombre,$jug_apellido,$jug_dorsal,$jug_fecha)
	{
    $Obj_usuario=new UsuarioDB();
	return $Obj_usuario->guardar_jugador($jug_equipo,$jug_nombre,$jug_apellido,$jug_dorsal,$jug_fecha);
	}
    
	function login($log_user)
	{
    $Obj_usuario=new UsuarioDB();
	return $Obj_usuario->buscar_por_usuario($log_user);
	}

	function modificar_producto($prod_nombre,$prod_descripcion,$prod_precio,$prod_cantidad)
	{
    $Obj_usuario=new UsuarioDB();
	return $Obj_usuario->modificar_producto(strtoupper($prod_nombre),$prod_descripcion,$prod_precio,$prod_cantidad);
	}

	function cambiar_estado($usu_cedula){
        $obj_cambio = new UsuarioDB();
        return $obj_cambio->cambiar_estado($usu_cedula);
    }

}
?>
