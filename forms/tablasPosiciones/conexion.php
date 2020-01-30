<?

$mysqli = new mysqli("localhost","admin","admin","campeonatobd");

if(mysqli_connect_errno()){
    echo 'Comexion Fallidad : ',mysqli_connect_error();
    exit();
}

?>