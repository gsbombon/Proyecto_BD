<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pagina Admin</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="../css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="../css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="../css/flaticon.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="../css/swiper.min.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="../css/style.css">

    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	<script
	src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
    <script>
		
        /*			$(document).ready(function(){
	    		$('#btnCrearCampeonato').click(function(){
	       		$("#contenido").attr('src', 'campeonato/crear.html');
	    									 });

	    		$('#btnRegisJugador').click(function(){
	       		$("#contenido").attr('src', 'jugador/registrar.html');
	    									 });

	    		$('#btnRegEquipo').click(function(){
	       		$("#contenido").load("equipo/crear.html");
	    									 });
				
				$('#btn-contactos').click(function(){
	       		$("#contenido").load("contactos.html");
	    									 });
				
										
			});*/
        function prueba(view) {

            var element = document.getElementById(view);

            var ocultar = document.getElementsByClassName("visible");
            ocultar[0].style.display = 'none';
            ocultar[0].className = "oculto";
            element.style.display = 'block';
            element.className = "visible";
        }

    </script>

</head>

<body>
    <!--::header part start::-->
    <header class="header_area">
        <div class="sub_header">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-4 col-xl-6">
                        <div id="logo">
                            <a href="index.html" class="nav-link"><img src="img/banner/logo.png" alt="" title="" width="80px" /><span>LIGA DEPORTIVA ORIENTAL</span></a>
                        </div>
                    </div>
                    <div class="col-md-8 col-xl-6">
                        <div class="sub_header_social_icon float-right">
                            <a href="../index.html" class="register_icon"><i class="ti-arrow-right"></i>Cerrar Sesion</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="main_menu">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Campeonato
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="crearCampeonato" onclick="prueba(this.className)">Crear</a>
                                            <a class="dropdown-item" href="../forms/campeonato/modificarDatos.php" id="eonato">Modificar</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Equipos
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="crearEquipo" onclick="prueba(this.className)">Crear</a>
                                            <a class="dropdown-item" href="../forms/equipo/modificarDatos.php">Modificar</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
										<a class="nav-link" href="tablasPosiciones/posiciones.php">TABLA DE POSICIONES</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Jugadores
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="crearJugador" onclick="prueba(this.className)">Registrar</a>
                                            <a class="dropdown-item" href="../forms/jugador/modificarDatos.php" id="btnModifJugador">Modificar</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Árbitros
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="crearArbitro" onclick="prueba(this.className)">Registrar</a>
                                            <a class="dropdown-item" href="../forms/arbitro/modificarDatos.php" id="btnModifArbitro">Modificar</a>
                                        </div>
                                    </li>
                                </ul>
                                <div class="header_social_icon d-none d-lg-block">
                                    <ul>
                                        <li><a href="https://www.facebook.com/L.D.B.ORIENTAL/"><i class="ti-facebook"></i></a></li>
                                        <li>
                                            <a href="#"> <i class="ti-twitter"></i></a>
                                        </li>
                                        <li><a href="#"><i class="ti-instagram"></i></a></li>
                                        <li><a href="#"><i class="ti-skype"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                        <div class="header_social_icon d-block d-lg-none">
                            <ul>
                                <li><a href="#"><i class="ti-facebook"></i></a></li>
                                <li>
                                    <a href="#"> <i class="ti-twitter"></i></a>
                                </li>
                                <li><a href="#"><i class="ti-instagram"></i></a></li>
                                <li><a href="#"><i class="ti-skype"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header part end-->

    <!-- banner part start-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-content-center">
                <div class="col-lg-7 col-xl-5">
                    <div class="banner_text">
                        <h1><span>Liga Deportiva</span><br>
                            Barrial "Oriental"</h1>
                        <p>Filial de Federacion de Ligas Barriales del Canton Quito</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner part start-->

    <!-- about part start-->
    <div id="contenido">
        <section class="section_padding">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-6 offset-xl-1 col-xl-4">
                        <div class="about_img">
                            <img src="img/about.png" alt="">
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-4">
                        <div class="visible">
                            <h4>Acerca de</h4>
                            <h2>Bienvenido <br>
                                A la Liga Deportiva <br>
                                Barrial Oriental</h2>
                            <p>La Liga Deportiva Barrial "Oriental" fue fundada en Quito, el 6 de marzo de 1965, pertenece a la Parroquia Eloy Alfaro, del Cantón Quito, tiene como finalidad, fomentar el deporte barrial, la recreación y la cultura.</p>
                            <p>Es ajeno a todo asunto de carácter político, religioso y se sujeta a la ley y Reglamento General de Educación Física, Deportes y Recreación, a los Estatutos y Reglamentos de FEDENALIGAS, Estatutos y Reglamentos de la Federación de Ligas Barriales y Parroquiales del Cantón Quito. </p>
                            <a href="#" class="btn_2">Leer Mas</a>
                        </div>
                        <div id="crearCampeonato" class="oculto">
                            <?php
                        include("campeonato/crear.php");
                        ?>
                        </div>
                        <div id="crearEquipo" class="oculto">
                            <?php
                        include("equipo/crear.php");
                        ?>
                        </div>
                        <div id="crearJugador" class="oculto">
                            <?php
                        include("jugador/registrar.php");
                        ?>
                        </div>
                        <div id="crearArbitro" class="oculto">
                            <?php
							include("arbitro/crear.php");
							?>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- about part start-->

    <br><br>
    <hr><br><br>

    <footer class="copyright_part">
        <div class="container">
            <div class="row align-items-center">
                <p class="footer-text m-0 col-lg-8 col-md-12">
                    Universidad de las Fuerzas Armadas "ESPE"
                    <br>Autores:
                    <br>* Steven Bombon
                    <br>* Luis Loachamin
                    <br>* Edwin Caiza
                </p>
                <div class="col-lg-4 col-md-12 text-center text-lg-right footer-social">
                    <a href="#"><i class="ti-facebook"></i></a>
                    <a href="#"> <i class="ti-twitter"></i> </a>
                    <a href="#"><i class="ti-instagram"></i></a>
                    <a href="#"><i class="ti-skype"></i></a>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer part end-->

    <!-- jquery plugins here-->
    <!-- jquery -->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- aos js -->

    <script src="js/aos.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="js/masonry.pkgd.js"></script>
    <!-- particles js -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- carousel js -->
    <script src="js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="js/swiper_custom.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>


</body>

</html>
