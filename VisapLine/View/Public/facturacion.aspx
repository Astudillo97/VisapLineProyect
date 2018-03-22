<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="facturacion.aspx.cs" Inherits="VisapLine.View.Public.facturacion" %>

<!DOCTYPE html>
<style type="text/css">
    img {
        height: auto;
        max-width: 100%;
    }

    #contenedor {
        width: 25%;
        height: 25%;
        top: 30%;
        left: 37.5%;
        position: absolute;
    }
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Facturacion</title>

    <!-- Bootstrap 4.0-->
    <link rel="stylesheet" href="../../Contenido/assets/vendor_components/bootstrap/dist/css/bootstrap.css">

    <!-- Bootstrap 4.0-->
    <link rel="stylesheet" href="../../Contenido/assets/vendor_components/bootstrap/dist/css/bootstrap-extend.css">

    <!-- font awesome -->
    <link rel="stylesheet" href="../../Contenido/assets/vendor_components/font-awesome/css/font-awesome.css">

    <!-- ionicons -->
    <link rel="stylesheet" href="../../Contenido/assets/vendor_components/Ionicons/css/ionicons.css">

    <!-- theme style -->
    <link rel="stylesheet" href="../../Contenido/css/master_style.css">

    <!-- apro_admin skins. choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../Contenido/css/skins/_all-skins.css">

    <!-- weather weather -->
    <link rel="stylesheet" href="../../Contenido/assets/vendor_components/weather-icons/weather-icons.css">

    <!-- jvectormap -->
    <link rel="stylesheet" href="../../Contenido/assets/vendor_components/jvectormap/jquery-jvectormap.css">

    <!-- date picker -->
    <link rel="stylesheet" href="../../Contenido/assets/vendor_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.css">

    <!-- daterange picker -->
    <link rel="stylesheet" href="../../Contenido/assets/vendor_components/bootstrap-daterangepicker/daterangepicker.css">

    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="../../Contenido/assets/vendor_plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.css">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

    <link href="../../Contenido/assets/vendor_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
    <link rel="icon" href="../../Contenido/images/favicon.ico">
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div id="contenedor">
            <img src="../../Archivos/Presentación1.jpg" />
        </div>
        <div>
            <center>            
            <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <label class="text-center" runat="server" id="textError"></label>
            </asp:Panel>
                <br />
                <br />
 <table>
                   <tr>
  <td>IDENTIFICACIÓN/NIT:</td>
  <td><asp:TextBox ID="identificacion_" runat="server" /></td>
  <td><asp:Button Text="Generar" class="btn btn-block btn-success" Width="143px" Height="30px" OnClick="Unnamed_Click" runat="server" />
      </td>  
</tr>
 </table>      
               <br />
                <br />          
            <asp:GridView runat="server" OnRowCommand="allfactura_RowCommand" AutoGenerateColumns="False" ID="allfactura" CellPadding="4" ForeColor="#333333" GridLines="None">
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" Wrap="true" />
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="facturaventa" HeaderText="FS"></asp:BoundField>
                    <asp:BoundField DataField="identificacion" HeaderText="NIT/IDENTIF"></asp:BoundField>
                    <asp:TemplateField HeaderText="Tercero">
                        <ItemTemplate>
                            <label runat="server"><%#Eval("nombre") %> <%#Eval("apellido") %></label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="correo" HeaderText="Correo"></asp:BoundField>
                    <asp:BoundField DataField="fechaemision" DataFormatString="{0:d}" HeaderText="Emision"></asp:BoundField>
                    <asp:BoundField DataField="estadof" HeaderText="Estado"></asp:BoundField>
                    <asp:BoundField DataField="totalfac" HeaderText="Valor"></asp:BoundField>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="btn1" runat="server" CssClass="glyphicon glyphicon-copy" CommandName="verfactura" CommandArgument='<%# Eval("idfactura") %>' Text="DESCARGAR" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
                </center>
        </div>
    </form>
    <script src="../../Contenido/assets/vendor_components/jquery/dist/jquery.js"></script>

    <!-- jQuery UI 1.11.4 -->
    <script src="../../Contenido/assets/vendor_components/jquery-ui/jquery-ui.js"></script>

    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>

    <!-- popper -->
    <script src="../../Contenido/assets/vendor_components/popper/dist/popper.min.js"></script>

    <!-- Bootstrap 4.0-->
    <script src="../../Contenido/assets/vendor_components/bootstrap/dist/js/bootstrap.js"></script>

    <!-- ChartJS -->
    <script src="../../Contenido/assets/vendor_components/chart-js/chart.js"></script>

    <!-- Sparkline -->
    <script src="../../Contenido/assets/vendor_components/jquery-sparkline/dist/jquery.sparkline.js"></script>

    <!-- jvectormap -->
    <script src="../../Contenido/assets/vendor_plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="../../Contenido/assets/vendor_plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

    <!-- jQuery Knob Chart -->
    <script src="../../Contenido/assets/vendor_components/jquery-knob/js/jquery.knob.js"></script>

    <!-- daterangepicker -->
    <script src="../../Contenido/assets/vendor_components/moment/min/moment.min.js"></script>
    <script src="../../Contenido/assets/vendor_components/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- datepicker -->
    <script src="../../Contenido/assets/vendor_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>

    <!-- Bootstrap WYSIHTML5 -->
    <script src="../../Contenido/assets/vendor_plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.js"></script>

    <!-- Slimscroll -->
    <script src="../../Contenido/assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- FastClick -->
    <script src="../../Contenido/assets/vendor_components/fastclick/lib/fastclick.js"></script>

    <!-- apro_admin App -->
    <script src="../../Contenido/js/template.js"></script>

    <!-- apro_admin dashboard demo (This is only for demo purposes) -->
    <script src="../../Contenido/js/pages/dashboard.js"></script>

    <!-- apro_admin for demo purposes -->
    <script src="../../Contenido/js/demo.js"></script>

    <!-- weather for demo purposes -->
    <script src="../../Contenido/assets/vendor_plugins/weather-icons/WeatherIcon.js"></script>



    <!-- Nuevos Insersiones -->
    <!-- DataTables -->
    <script src="../../Contenido/assets/vendor_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../../Contenido/assets/vendor_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

    <!-- This is data table -->
    <script src="../../Contenido/assets/vendor_plugins/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>

    <!-- start - This is for export functionality only -->
    <script src="../../Contenido/assets/vendor_plugins/DataTables-1.10.15/extensions/Buttons/js/dataTables.buttons.min.js"></script>
    <script src="../../Contenido/assets/vendor_plugins/DataTables-1.10.15/extensions/Buttons/js/buttons.flash.min.js"></script>
    <script src="../../Contenido/assets/vendor_plugins/DataTables-1.10.15/ex-js/jszip.min.js"></script>
    <script src="../../Contenido/assets/vendor_plugins/DataTables-1.10.15/ex-js/pdfmake.min.js"></script>
    <script src="../../Contenido/assets/vendor_plugins/DataTables-1.10.15/ex-js/vfs_fonts.js"></script>
    <script src="../../Contenido/assets/vendor_plugins/DataTables-1.10.15/extensions/Buttons/js/buttons.html5.min.js"></script>
    <script src="../../Contenido/assets/vendor_plugins/DataTables-1.10.15/extensions/Buttons/js/buttons.print.min.js"></script>
    <!-- end - This is for export functionality only -->

    <!-- apro_admin for Data Table -->
    <script src="../../Contenido/js/pages/data-table.js"></script>

</body>
</html>
