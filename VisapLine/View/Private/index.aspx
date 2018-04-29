<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="VisapLine.View.Private.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function donas() {
            $.ajax({
                type: "POST",
                url: "index.aspx/GetChart",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) { }
            }).done(function (response) {
                var aData = [{ text: 'Mes Gratuito', value: 503, color: '#CB4E00' }, { text: 'Pagado', value: 1, color: '#2F3D41' }, { text: 'Facturado', value: 491, color: '#BD0F87' }];
                var arr = [];
                $.each(aData, function (val) {
                    var obj = {};
                    obj.name = val.name;
                    obj.value = val.value;
                    obj.color = val.color;
                    arr.push(obj);
                });
                var ctx = $("#myChart").get(0).getContext("2d");
                var myPieChart = new Chart(ctx).Pie(arr);
            }).error(function (response) { });
        };
        window.onload = donas;
    </script>
    <section class="content-header">
        <h1>Dashboard</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
        </ol>
    </section>
    <section class="content">

        <div class="row" id="administrador" runat="server" visible="false">
    
            <div class="col-lg-6">
                <!-- Default box -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Florencia, Caquetá </h3>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Labeltime" Class="box-title" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="box-body">
                        <center>
                        <img class="img-fluid" src="../../Contenido/images/florencia2.jpg" alt="...">
                            </center>
                    </div>
                </div>
                <!-- /.box -->

            </div>
             
         
            <!-- /.col -->
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-purple">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="Labelregtro" runat="server" Text=""></asp:Label></h3>
                        <p>Contratos Reg</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-user-plus"></i>
                    </div>
                    <%-- <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="Label3" runat="server" Text=""></asp:Label></h3>
                        <p>Usuarios Activos</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-check"></i>
                    </div>
                    <%--  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                </div>
            </div>

            <!-- ./col -->

            <%-- <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="Label7" runat="server" Text="12"></asp:Label></h3>
                        <p>Vencidos</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-close"></i>
                    </div>
              
                </div>
            </div>  --%>
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="Label12" runat="server" Text=""></asp:Label></h3>
                        <p>incidencias Abiertas</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-address-book-o"></i>
                    </div>
                    <%--  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                </div>
            </div>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="col-xl-3 col-md-6 col-6">
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3>
                                    <asp:Label ID="Label12" runat="server" Text=""><%#Eval("num") %></asp:Label>

                                </h3>
                                <p>Contratos <%#Eval("estadoc") %></p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-address-book-o"></i>
                            </div>
                            <%--  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <div class="col-xl-3 col-md-6 col-6">
                        <!-- small box -->
                        <div class="small-box bg-green">
                            <div class="inner">
                                <h3>
                                    <asp:Label ID="Label12" runat="server" Text=""><%#Eval("num") %></asp:Label>
                                </h3>
                                <p>Servicio <%#Eval("estado") %></p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-cog"></i>
                            </div>
                            <%--  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
         
        <div class="row" visible="false" runat="server" id="emple">
            <div id="contenedor">
                <img src="../../Archivos/imgvisap.png" />
            </div>
        </div>
    </section>
</asp:Content>
