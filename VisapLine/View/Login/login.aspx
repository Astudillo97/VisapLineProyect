<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="VisapLine.View.Login.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="../../Contenido/images/favicon.ico" />
    <title>Login</title>
    <%--    <script>
        function nobackbutton() {
            window.location.hash = "no-back-button";
            window.location.hash = "Again-No-back-button" //chrome
            window.onhashchange = function () { window.location.hash = "no-back-button"; }
        }
    </script>--%>
    <link rel="stylesheet" href="../../Contenido/assets/vendor_components/bootstrap/dist/css/bootstrap.min.css" />

    <!-- Bootstrap 4.0-->
    <link rel="stylesheet" href="../../Contenido/assets/vendor_components/bootstrap/dist/css/bootstrap-extend.css" />

    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../Contenido/assets/vendor_components/font-awesome/css/font-awesome.min.css" />

    <!-- Ionicons -->
    <link rel="stylesheet" href="../../Contenido/assets/vendor_components/Ionicons/css/ionicons.min.css" />

    <!-- Theme style -->
    <link rel="stylesheet" href="../../Contenido/css/master_style.css" />

    <!-- apro_admin Skins. Choose a skin from the css/skins
	   folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../Contenido/css/skins/_all-skins.css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" />
    <script type="text/javascript">
        function redirect() {
            location.href = "../Private/index.aspx";
        }
    </script>
</head>
<body class="hold-transition login-page">

    <form method="post" runat="server">
        <div class="login-box">
            <div class="login-logo">
                <a href="#"><b>Visap</b>Line</a>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Iniciar Session</p>

                <div class="form-element">
                    <div class="form-group has-feedback">
                        <input type="text" class="form-control" runat="server" id="user_" placeholder="Usuario" />
                        <span class="ion ion-email form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" runat="server" id="pas_" placeholder="Contraseña" />
                        <span class="ion ion-locked form-control-feedback"></span>
                    </div>
                </div>
                <!-- /.social-auth-links -->

                <div class="margin-top-30 text-center">
                    <p>¿Eres socio o funcionario? <a href="#" data-toggle="modal" data-target="#creacion">Obtener acceso</a></p>
                </div>
                <div class="row">
                    <!-- /.col -->
                    <div class="col-12 text-center">
                        <asp:Button class="btn btn-block btn-flat margin-top-10 btn-primary" ID="btnInciarSession" OnClick="Login" runat="server" Text="INICIAR SESSION" />
                    </div>
                    <!-- /.col -->
                </div>
                <div class="row fa-align-right">
                    <a href="#" data-toggle="modal" data-target="#modal-primary"><i class="ion ion-locked"></i>¿Olvido la contraseña?</a><br />
                </div>

                <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="alert alert-error row ">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <label class="text-center" runat="server" id="textError"></label>
                </asp:Panel>
            </div>
            <!-- /.login-box-body -->
        </div>
        <!-- /.login-box -->
        <div class="modal fade" id="modal-primary">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Recuperación de la contraseña</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="box box-primary bg-transparent">
                            <div class="form-element">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" runat="server" id="correo" placeholder="Ingrese su correo" />
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">NIT</label>
                                        <input type="text" class="form-control" runat="server" id="nui" placeholder="Ingrese su Numero unico" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary float-right" runat="server" onserverclick="RecuperarContraseña">Gurdar Cambios</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <div class="modal fade" id="creacion">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Obtención de credenciales</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="box box-primary bg-transparent">
                            <div class="form-element">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Numero Unico de identificación</label>
                                        <input type="text" class="form-control" runat="server" id="nui_cre" placeholder="Ingrese su Numero unico" />
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Usuario</label>
                                        <input type="email" class="form-control" runat="server" id="usuario_cre" placeholder="Ingrese un usuario" />
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Contraseña</label>
                                        <input type="email" class="form-control" runat="server" id="password_cre" placeholder="Ingrese la contraseña" />
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Confrime Contraseña</label>
                                        <input type="email" class="form-control" runat="server" id="password2_cre" placeholder="Vuelva a escribir la contraseña" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary float-right" runat="server" onserverclick="CrearUsuario">Gurdar Cambios</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </form>

    <!-- jQuery 3 -->
    <script src="../../Contenido/assets/vendor_components/jquery/dist/jquery.min.js"></script>

    <!-- popper -->
    <script src="../../Contenido/assets/vendor_components/popper/dist/popper.min.js"></script>

    <!-- Bootstrap 4.0-->
    <script src="../../Contenido/assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>

</body>
</html>
