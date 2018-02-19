<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="VisaPlane.visapline.Private.Error1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="../../Contenido/images/favicon.ico" />

    <title>Error! lo sentimos</title>

    <!-- Bootstrap 4.0-->
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

</head>
<body class="hold-transition">
    <div class="error-body">
        <div class="error-page">

            <div class="error-content">
                <div class="container">
                    <h2 class="headline text-red">:(</h2>

                    <h3 class="margin-top-0"><i class="fa fa-warning text-red"></i>
                        <asp:Label ID="error_s" runat="server" Text=""></asp:Label>
                        !</h3>

                    <p>
                        Intentalo mas tarde
                    </p>
                    <div class="text-center">
                        <a href="index.aspx" class="btn btn-info btn-block btn-flat margin-top-10">Volver a la plataforma</a>
                    </div>

                </div>
            </div>
            <!-- /.error-content -->
            <footer class="main-footer">
                Copyright &copy; 2017 <a href="index.aspx">VisapLine</a>. Todos los derechos reservados.
            </footer>

        </div>
        <!-- /.error-page -->
    </div>




    <!-- jQuery 3 -->
    <script src="../../Contenido/assets/vendor_components/jquery/dist/jquery.min.js"></script>

    <!-- popper -->
    <script src="../../Contenido/assets/vendor_components/popper/dist/popper.min.js"></script>

    <!-- Bootstrap 4.0-->
    <script src="../../Contenido/assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
