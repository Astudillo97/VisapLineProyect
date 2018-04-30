<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="VisapLineWeb.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>VisapLine</title>


    <meta charset="utf-8" />
    <link rel="shortcut icon" href="../../Content/images/imgvisap.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,700,600,300' rel='stylesheet' type='text/css' />




    <link rel="stylesheet" type="text/css" href="../../Content/css/bootstrap.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="../../Content/css/magnific-popup.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="../../Content/css/flexslider.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="../../Content/css/animate.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="../../Content/css/font-awesome.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="../../Content/css/jquery.bxslider.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="../../Content/css/YTPlayer.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="../../Content/css/style.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="../../Content/css/responsive.css" media="screen" />

    <script src="http://www.youtube.com/player_api" id="YTAPI"></script>

    <style>
        /* menu desplegable */

        #menu ul ul {
            display: none;
            position: absolute;
            top: 100%;
            width: 350px;
            left: 0;
            background: #eee;
            padding: 0;
        }

            /* items del menu desplegable */

            #menu ul ul li {
                float: none;
                width: 350px
            }

            /* enlaces de los items del menu desplegable */

            #menu ul ul a {
                line-height: 120%;
                padding: 10px 15px;
            }

        /* items del menu desplegable al pasar el ratón */

        #menu ul li:hover > ul {
            display: block;
        }
    </style>
</head>

<body>
    <form id="sever">
    </form>

    <!-- Container -->
    <div id="container">

        <!-- Header
		    ================================================== -->
        <header class="clearfix">
            <!-- Static navbar -->
            <div class="navbar navbar-default navbar-static-top">
                <div class="innher-header">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">
                            <img height="50px" src="../../Content/images/imgvisap.png" /></a>
                    </div>
                    <div class="navbar-collapse collapse dropdown">
                        <nav id="menu">
                            <ul class="nav navbar-nav navbar-right">

                                <li><a class="active" href="#home-section">Inicio</a></li>
                                <li><a href="#services-section">Servicios</a></li>
                                <li><a href="#about-section">Nosotros</a></li>
                                <li><a href="#team-section">Información para usuarios</a>
                                    <ul class="dropdown-menu " role="menu">
                                        <li role="presentation"><a href="#" role="menuitem" tabindex="-1">Factores de limitación de velocidad de internet</a></li>
                                        <li role="presentation"><a href="Indicadores.aspx" role="menuitem" tabindex="-1">Indicadores de Calidad del Servicio de Internet</a></li>
                                        <li role="presentation"><a href="PQRS.aspx" role="menuitem" tabindex="-1">PQRS</a></li>
                                    </ul>
                                </li>
                                <li><a href="#contact-section">Contactanos</a></li>


                            </ul>

                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- End Header -->
        <!-- home 
			================================================== -->
        <div class="section">
            <div id="home-section">

                <div class="flexslider">
                    <ul class="slides">
                        <li>
                            <div class="flexcaption">
                                <img src="../../Content/images/imgvisap.png" />
                                <%--	<h1> <span class="diff-color">Visap</span>Line</h1>
                                	<p>Comunicación sin límites </p>--%>
                            </div>
                        </li>
                        <li>
                            <div class="flexcaption">
                                <h1>Solicita tu servicio <span></span></h1>
                                <p>Suscribete y adquiere nuestros servicios </p>
                                <a href="#" data-toggle="modal" data-target="#miModal"><span>Abrir modal</span></a>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
        <!-- End home -->





        <!-- services 
			================================================== -->
        <div class="section">
            <div id="services-section">
                <div class="container">
                    <div class="title-section triggerAnimation animated" data-animate="bounceIn">
                        <h1>Nuestros servicios</h1>
                        <p></p>
                    </div>

                    <div class="services-box">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="services-post triggerAnimation animated" data-animate="fadeInLeft">
                                    <a href="#"><i class="fa fa-bullhorn"></i></a>
                                    <div class="services-post-content">
                                        <h3>Provedor de internet</h3>
                                        <p>Somos proveedores del servicio de internet.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="services-post triggerAnimation animated" data-animate="fadeInUp">
                                    <a href="#"><i class="fa fa-flag-o"></i></a>
                                    <div class="services-post-content">
                                        <h3>Instalación de redes</h3>
                                        <p>Instalación redes de comunicaciones para cualquier entorno.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="services-post triggerAnimation animated" data-animate="fadeInRight">
                                    <a href="#"><i class="fa fa-suitcase"></i></a>
                                    <div class="services-post-content">
                                        <h3>Venta de equipos</h3>
                                        <p>Venta de equipos para instalación de redes de telecomunicación.</p>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="img-holder triggerAnimation animated" data-animate="bounceIn">
                        <img alt="" src="../../Content/image.png">
                    </div>



                </div>
            </div>
        </div>
        <!-- End services -->


        <!-- about 
			================================================== -->
        <div class="section">
            <div id="about-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="biography triggerAnimation animated" data-animate="fadeInLeft">
                                <div class="about-title">
                                    <h2>Nuestra Empresa</h2>

                                </div>
                                <p style="text-align:justify"><span>C&C VISION LTDA “VISAPLINE”</span> es una empresa proveedora de los Servicios de Internet, Voz, Datos y Vídeo, con licencia desde el año 2001, cobertura total en 15 Municipios del Caquetá y el resto del país, contamos con unas instalaciones en fibra óptica de 46.5 kilómetros, en el municipio de Florencia con cabecera GPON de Última Tecnología. Llegamos a lugares que por su situación Geográfica no cuentan con cobertura de comunicaciones. Igualmente somos integradores de soluciones en Sistemas o Circuitos cerrados de televisión, Cámaras de Vigilancia y soluciones en energía solar, entre otros. Nos hemos consolidado como la empresa líder en innovación de comunicaciones en el departamento. Que beneficia finalmente al cliente que adquiere nuestros servicios. </p>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />


                            <div class="clients triggerAnimation animated" data-animate="fadeInRight">
                               
                                <img height="350px" src="../../Content/images/nuestra-empresa.jpg" />
                            </div>
                        </div>
                    </div>
                    <div class="last-row">
                        <div class="col-md-6">
                            <div class="biography triggerAnimation animated" data-animate="fadeInLeft">
                                 <div class="about-title">
                                     <h2>MISIÓN</h2>
                                </div>
                                    <p style="text-align:justify"><span>C&C VISION LTDA</span>. Desarrolla efectivamente servicios en Tecnología de la Información y las Comunicaciones, permanentes y de alto impacto a través de redes Inalámbricas, Fibra óptica, Satelital, Microondas. Hasta el usuario final, con responsabilidad social y sostenibilidad ambiental, buscando la eficiencia, eficacia en los procesos de comunicación de usuarios y empresas con el mundo. </p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="biography triggerAnimation animated" data-animate="fadeInLeft" >
                                <div class="about-title">
                                    <h2>VISIÓN</h2>
                                </div>
                                <p style="text-align:justify"><span>C&C VISION LTDA</span>. Será en el 2018, una empresa líder en el mercado de telecomunicaciones con altos niveles de satisfacción de sus clientes y vinculados, con la generación de amplios beneficios sociales en armonía con el medio ambiente. Específicamente para el Departamento del Caquetá. Implementando las mejores ideas en el campo de las TIC.</p>
                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>
        <!-- End about -->

        <!-- blog 
			================================================== -->
        <div class="section">
            <div id="team-section">


                <div class="title-section triggerAnimation animated" data-animate="bounceIn">
                    <h1>Nuestros Planes</h1>
                    <p>Ofrecemos diferentes planes hechos a tu medida</p>
                </div>

                <div class="team-box triggerAnimation animated" data-animate="fadeInDown">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">

                            <div class="item active">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="staff-post">
                                                <img alt="" src="../../Contenido/plan3mb.png">

                                                <h2><a class="diff-color">PLAN BRONCE</a></h2>
                                                <p>Ideal para las tareas básicas del hogar, reproducir música, hacer consultas, revisar tu correo electronico.</p>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="staff-post">
                                                <img alt="" src="../../Contenido/plan4mb.png">

                                                <h2><a class="diff-color">PLAN PLATA </a></h2>
                                                <p>Ideal para las tareas básicas del hogar, reproducir música, hacer consultas, revisar tu correo electronico, reproducción de videos en calidad media y video conferencias.   </p>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="staff-post">
                                                <img alt="" src="../../Contenido/plan5mb.png">

                                                <h2><a href="single-post.html">PLAN ORO</a></h2>
                                                <p>Ideal para las tareas básicas del hogar, reproducir música, hacer consultas, revisar tu correo electronico, reproducción de videos en calidad alta y video conferencias, soporte para varios dispositivos conectados.</p>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="staff-post">
                                                <img alt="" src="../../Contenido/plan8mb.png">
                                             
                                                <h2><a href="single-post.html">PLAN PLATINO</a></h2>
                                                <p>Ideal para las tareas básicas del hogar, reproducir música, hacer consultas, revisar tu correo electronico, reproducción de videos en HD y video conferencias, soporte para varios dispositivos conectados, ideal para juegos online y descargas pesadas.</p>
                                            </div>
                                        </div>
                                           </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="staff-post">
                                                <img alt="" src="../../Contenido/plan10mb.png">
                                                  <h2><a href="single-post.html">PLAN DIAMANTE</a></h2>
                                                <p>Ideal para las tareas básicas del hogar, reproducir música, hacer consultas, revisar tu correo electronico, reproducción de videos en HD y video conferencias, soporte para varios dispositivos conectados, ideal para juegos online y descargas pesadas.</p>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                                 
                        </div>
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
                    </div>
                </div>

            </div>

        </div>
    <!-- End blog -->


    <!-- contact 
			================================================== -->
    <div class="section">
        <div id="contact-section">
           

            <div class="contact-content">
                <div class="container">

                    <div class="title-section white triggerAnimation animated" data-animate="bounceIn">
                        <h1>Contáctanos</h1>

                    </div>

                    <div class="row">
                        <div class="col-md-6 triggerAnimation animated" data-animate="fadeInLeft">
                            <div class="contact-info">
                                <h1>Información adicional</h1>
                                <p>Escribenos tus inquietudes.</p>

                            </div>
                            <ul class="contact-info-list">
                                <li><i class="fa fa-home"></i>Carrera 10 # 15-60 Barrio Centro Edificio Pioneros 2do piso Oficina 4 Florencia-Caquetá</li>
                                <li><i class="fa fa-phone"></i> <a>(+57) 318 490 3427 </a> <a> (+57) 310 246 6908</a>  </li>
                                <li><i class="fa fa-envelope"></i><a href="#">  visapline@gmail.com</a> <a>gerencia@visapline.com</a></li>
                            </ul>
                        </div>
                        <div class="col-md-6 triggerAnimation animated" data-animate="fadeInRight">
                            <form id="contact-form">
                                <div class="text-fields">
                                    <div class="float-input">
                                        <input name="Nombre" id="name" type="text" placeholder="Nombre">
                                        <span><i class="fa fa-user"></i></span>
                                    </div>
                                    <div class="float-input">
                                        <input name="Correo" id="mail" type="text" placeholder="Correo">
                                        <span><i class="fa fa-envelope-o"></i></span>
                                    </div>

                                </div>

                                <div class="submit-area">
                                    <textarea name="comment" id="comment" placeholder="Mensaje"></textarea>
                                    <input type="submit" id="submit_contact" class="main-button" value="Enviar Mensaje">
                                    <div id="msg" class="message"></div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
    <!-- End contact -->


    <!-- footer 
			================================================== -->
    <footer>
        <div class="container">
            <p>&#169; 2018 VisapLine,  All Rights Reserved</p>
            <ul class="social-icons">
                <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a class="rss" href="#"><i class="fa fa-rss"></i></a></li>
                <li><a class="google" href="#"><i class="fa fa-google-plus"></i></a></li>
                <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                <li><a class="pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
            </ul>
        </div>
    </footer>
    <!-- End footer -->
    <div class="modal fade" id="miModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Suscribirse</h4>
                </div>
                <div class="modal-body">
                    Texto del modal
                </div>
            </div>
        </div>
    </div>
    </div>
	<!-- End Container -->

    <div class="preloader">
        <img alt="" src="images/preloader.gif">
    </div>


    <script type="text/javascript" src="../../Content/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../Content/js/jquery.migrate.js"></script>
    <script type="text/javascript" src="../../Content/js/jquery.mb.YTPlayer.js"></script>
    <script type="text/javascript" src="../../Content/js/jquery.appear.js"></script>
    <script type="text/javascript" src="../../Content/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="../../Content/js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="../../Content/js/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="../../Content/js/bootstrap.js"></script>
    <script type="text/javascript" src="../../Content/js/waypoints.js"></script>
    <script type="text/javascript" src="../../Content/js/jquery.imagesloaded.min.js"></script>
    <script type="text/javascript" src="../../Content/js/jquery.isotope.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7z3qSfW7_1ArWHGs69jHLbLw-jOOGwuk"></script>
    <script type="text/javascript" src="../../Content/js/gmap3.min.js"></script>
    <script type="text/javascript" src="../../Content/js/smooth-scroll.js"></script>
    <script type="text/javascript" src="../../Content/js/plugins-scroll.js"></script>
    <script type="text/javascript" src="../../Content/js/script.js"></script>

</body>
</html>
