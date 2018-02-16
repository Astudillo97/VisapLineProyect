<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="PagCaja.aspx.cs" Inherits="VisapLine.View.Private.PagCaja" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="respust" runat="server"></asp:ScriptManager>
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript">
        function deletealert() {
            swal({
                title: "SE REGISTRO CON EXITO!",
                text: "Se ha registrado con exito ",
                type: "success"
            }, function () {
                window.location.href = "pagzona.aspx";
            });

        }
        function alerterror() {
            swal("SE HA DETECTADO UN ERROR!", "Informe ha soporte tecnico del error", "error");
        }
        function activarcajalert() {
            swal("LA CAJA SE HA ACTIVADO CON EXITO!", "La activacion se ha realizado con exito", "success");
        }
        function elimalert() {
            swal("SE HA CERRADO LA CAJA CON EXITO!", "Se ha realizado la operacion con exito ", "success");
        }
        function elimalertCAJA() {
            swal("LA CAJA YA ESTA ABIERTA!", "Se ha realizado la operacion con exito ", "error");
        }
        function elimalertcerrado() {
            swal("LA CAJA YA ESTA CERRADA!", "Se ha realizado la operacion con exito ", "error");
        }
    </script>
    <section class="content-header">
        <h1>BIENVENIDO A LA CAJA</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Caja</li>
        </ol>
    </section>
    <section class="content">


        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">CAJA    
                    <asp:Label CssClass="form-control-label" ID="Labelestado" ForeColor="Green" runat="server" Text="ACTIVO"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Text="Valor de Ingresos: ">
                        <asp:Label ID="Labelingresos" runat="server" ForeColor="Green" Text="label"></asp:Label></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label3" runat="server" Text="Valor de Egresos: ">
                        <asp:Label ID="Labelegresos" runat="server" ForeColor="Red" Text="Label"></asp:Label></asp:Label>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Labeltime" runat="server" Text="Label"></asp:Label>
                    <asp:Timer ID="Timer1" OnLoad="Timer1_Load" runat="server" Interval="30000"></asp:Timer>
      
                </h3>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="row">
                        <div class="col-6">
                            <asp:Button ID="Button1" runat="server" class="btn btn-block btn-success btn-lg" Width="146px" Height="35px" OnClick="Button1_Click" Text="ABRIR CAJA 1" />
                        </div>
                        <div class="col-6">

                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group row">
                            </div>

                        </div>
                        <div class="col-6">
                            <asp:Button ID="Button2" class="btn btn-block btn-danger btn-lg" Width="146px" Height="35px" OnClick="Button2_Click" runat="server" Text="CERRAR CAJA 1" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="box box-default">
            <div class="box-header with-border">
                <h2 class="box-title">Registro de Cajas</h2>
            </div>
            <!-- /.box-header -->

            <div class="box-body">

                <asp:GridView ID="GridView1" runat="server" class="table table-bordered table-striped table-responsive" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5">
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:CommandField ShowSelectButton="true" SelectText="" ControlStyle-CssClass="glyphicon glyphicon-edit" />
                        <asp:BoundField HeaderText="Codigo de Caja" DataField="idcaja" />
                        <asp:BoundField HeaderText="Fecha de Apertura" DataField="apertura" />
                        <asp:BoundField HeaderText="Fecha Cierre" DataField="cierre" />
                        <asp:BoundField HeaderText="Valor Inicial" DataField="valorinicial" />
                        <asp:BoundField HeaderText="Valor Cierre" DataField="valorfinal" />
                        <asp:BoundField HeaderText="Ingresos" DataField="ingresos" />
                        <asp:BoundField HeaderText="Egresos" DataField="egresos" />
                    </Columns>

                    <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerSettings Mode="NextPreviousFirstLast" />

                    <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="#EFF3FB"></RowStyle>

                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </div>
        </div>
    </section>
</asp:Content>
