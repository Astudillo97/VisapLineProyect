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
                <div class="box-body col">
                    <table class="table table-hover table-responsive" id="pagosdeingreso">
                        <thead style="background-color: #507CD1">
                            <tr>
                                <th style="color: white">Codigo
                                </th>
                                <th style="color: white">N° de Factura
                                </th>
                                <th style="color: white">Fecha
                                </th>
                                <th style="color: white">Identificacion
                                </th>
                                <th style="color: white">Nombre
                                </th>
                                <th style="color: white">Apellido
                                </th>
                                <th style="color: white">Registro
                                </th>
                                <th style="color: white">Iva
                                </th>
                                <th style="color: white">Valor
                                </th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>

                                    <tr>
                                        <th>
                                            <label><%#Eval("idpagos") %></label>
                                        </th>
                                        <th>
                                            <label><%#Eval("facturaventa") %></label>
                                        </th>
                                        <th>
                                            <label><%#Eval("fechapago") %></label>
                                        </th>
                                        <th>
                                            <label><%#Eval("identificacionfac") %> </label>
                                        </th>
                                        <th>
                                            <label><%#Eval("nombrefac") %> </label>
                                        </th>
                                        <th>
                                            <label><%#Eval("Apellidofac") %> </label>
                                        </th>
                                        <th>
                                            <label><%#Eval("nombrereg") %> </label>
                                        </th>
                                        <th>
                                            <label><%#Eval("ivafac") %> </label>
                                        </th>
                                        <th>
                                            <label><%#Eval("pagado") %> </label>
                                        </th>


                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        <tfoot style="background-color: #507CD1">
                            <tr>
                               <th style="color: white">Codigo
                                </th>
                                <th style="color: white">N° de Factura
                                </th>
                                <th style="color: white">Fecha
                                </th>
                                <th style="color: white">Identificacion
                                </th>
                                <th style="color: white">Nombre
                                </th>
                                <th style="color: white">Apellido
                                </th>
                                <th style="color: white">Registro
                                </th>
                                <th style="color: white">Iva
                                </th>
                                <th style="color: white">Valor
                                </th>
                            </tr>
                        </tfoot>

                    </table>
                </div>

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
                <div class="box-body col">
                    <table class="table table-hover table-responsive" id="pagosdeegreso">
                        <thead style="background-color: #507CD1">
                            <tr>
                                <th style="color: white">IdEgreso
                                </th>
                                <th style="color: white">Fecha
                                </th>
                                <th style="color: white">Observacion
                                </th>
                                <th style="color: white">Motivo
                                </th>
                                <th style="color: white">Valor
                                </th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="repeteidordeinventario" runat="server">
                                <ItemTemplate>

                                    <tr>
                                        <th>
                                            <label><%#Eval("idegresos") %></label>
                                        </th>
                                        <th>
                                            <label><%#Eval("fechaegreso") %></label>
                                        </th>
                                        <th>
                                            <label><%#Eval("observacion") %></label>
                                        </th>
                                        <th>
                                            <label><%#Eval("motivo") %> </label>
                                        </th>
                                        <th>
                                            <label><%#Eval("valoregreso") %> </label>
                                        </th>


                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        <tfoot style="background-color: #507CD1">
                            <tr>
                                <th style="color: white">IdEgreso
                                </th>
                                <th style="color: white">Fecha
                                </th>
                                <th style="color: white">Observacion
                                </th>
                                <th style="color: white">Motivo
                                </th>
                                <th style="color: white">Valor
                                </th>
                            </tr>
                        </tfoot>

                    </table>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.box-body -->
        </div>
    </section>
</asp:Content>
