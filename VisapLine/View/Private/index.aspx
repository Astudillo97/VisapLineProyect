<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="VisapLine.View.Private.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

        <div class="row">
            <!-- /.col -->
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-purple">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="Labelregtro" runat="server" Text="1"></asp:Label></h3>
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
                            <asp:Label ID="Label3" runat="server" Text="12"></asp:Label></h3>
                        <p>Usuarios Activos</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-check"></i>
                    </div>
                    <%--  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="Label2" runat="server" Text="2"></asp:Label>$</h3>

                        <p>Ingresos del dia</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-fw fa-dollar"></i>
                    </div>
                    <%--  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="Label5" runat="server" Text="2"></asp:Label>$</h3>

                        <p>Egresos del dia</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-fw fa-dollar"></i>
                    </div>
                    <%--  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                </div>
            </div>

            <%--        <br/><canvas id="myChart" width="200" height="200"></canvas>
        <div class="row">
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <h3>255</h3>

                        <p>New Orders</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-shopping-bag"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>
                </div>
            </div>--%>
            <!-- ./col -->

            <!-- ./col -->
            <div class="col-md-6 col">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="Label4" runat="server" Text="2"></asp:Label>$</h3>

                        <p>Ingresos del mes</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-fw fa-dollar"></i>
                    </div>
                    <%--  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                </div>
            </div>




            <!-- ./col -->

            <div class="col-md-6 col">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="Label6" runat="server" Text="2"></asp:Label>$</h3>

                        <p>Egresos del mes</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-fw fa-dollar"></i>
                    </div>
                    <%--  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="Label7" runat="server" Text="12"></asp:Label></h3>
                        <p>Vecidos</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-close"></i>
                    </div>
                    <%--  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="Label8" runat="server" Text="12"></asp:Label></h3>
                        <p>Pagos</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-fw fa-money"></i>
                    </div>
                    <%--  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="Label1" runat="server" Text="12"></asp:Label></h3>
                        <p>Incidencias Abiertas</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-wrench"></i>
                    </div>
                    <%--  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                </div>
            </div>
              <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="Label9" runat="server" Text="12"></asp:Label></h3>
                        <p>Contratos sin servicios</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-address-book-o"></i>
                    </div>
                    <%--  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>--%>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
