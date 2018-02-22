<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="GestCaja.aspx.cs" Inherits="VisapLine.View.Private.GestCaja" %>

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
        <h1>Registro de Movimientos de la CAJA</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Caja</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="box box-default">
            <div class="box-header with-border">
                <h2 class="box-title">Registro de ingresos de la Caja</h2>
            </div>
            <!-- /.box-header -->

            <div class="box-body">

                <asp:GridView ID="GridView1" runat="server" class="table table-bordered table-striped table-responsive" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5">
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField HeaderText="Codigo" DataField="idpagos" />
                        <asp:BoundField HeaderText="Fecha de pago" DataField="fechapago" />
                        <asp:BoundField HeaderText="N° Factura" DataField="factura_idfactura" />
                        <asp:BoundField HeaderText="Pago" DataField="pagado" />
                        <asp:BoundField HeaderText="Valor iva" DataField="ivafac" />
                        <asp:BoundField HeaderText="Total" DataField="totalfac" />
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
                <!-- /.row -->

            </div>
            <!-- /.box-body -->
        </div>




        <div class="box box-default">
            <div class="box-header with-border">
                <h2 class="box-title">Registro de Egresos de la Caja</h2>
            </div>
            <!-- /.box-header -->

            <div class="box-body">

                <asp:GridView ID="GridView2" runat="server" class="table table-bordered table-striped table-responsive" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging" PageSize="5">
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField HeaderText="Codigo" DataField="idegresos" />
                        <asp:BoundField HeaderText="Fecha de pago" DataField="fechaegreso" />
                        <asp:BoundField HeaderText="Detalle" DataField="observacion" />
                        <asp:BoundField HeaderText="Motivo" DataField="motivo" />
                        <asp:BoundField HeaderText="Total" DataField="valoregreso" />
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
                <!-- /.row -->

            </div>
            <!-- /.box-body -->
        </div>


    </section>

</asp:Content>
