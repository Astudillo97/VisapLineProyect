<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="detalleservicio.aspx.cs" Inherits="VisapLine.View.Private.detalleservicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../Contenido/assets/vendor_components/jquery/dist/jquery.js"></script>
    <script src="../../Contenido/assets/vendor_components/glyphicons/glyphicon.css"></script>
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <asp:ScriptManager runat="server" ID="scripdatalle"></asp:ScriptManager>
    <script type="text/javascript">
        function openModal() {
            $('#mymodal2').modal('show');
        }
        function dialog(ctl, event, cosa) {
            event.preventDefault();
            swal({
                title: "¡CUIDADO, LO QUE VA HA HACER PUEDE SER IRREVERSIBLE!",
                text: "asignar este equipo?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Aceptar",
                cancelButtonText: "Cancel",
                closeOnConfirm: true,
                closeOnCancel: true
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "detalleservicio.aspx/Cambiarequipo_Click",
                    data: '{equipo : ' + cosa + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                    }
                }
                )
                    .done(function (data) {
                        swal({
                            title: "ASIGNACION CREADA CON EXITO!",
                            text: "Se registro correctamente el equipo!",
                            type: "success"
                        }, function () { location.reload(true); }
                        );
                        $('#orders-history').load(document.URL + ' #orders-history');


                    }).error(function (data) {
                        swal("ASIGNACION FALLIDA!", "No se pudo realizar la operacion contactese con el soporte", "error");
                    });
            })
                ;
        }
    </script>
    <section class="content-header">
        <h1>DETALLE DE SERVICIO</h1>
        <div>
            <asp:Button runat="server" CssClass="btn btn-danger" Text="VOLVER" ID="volver" OnClick="volver_Click" />
        </div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Servicios</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="row">
            <div class="col-md-12 col-lg-6">
                <asp:FormView OnItemUpdating="FormView1_ItemUpdating" OnModeChanging="FormView1_ModeChanging"
                    CssClass="box box-body" OnPageIndexChanging="FormView1_PageIndexChanging" ID="FormView1"
                    runat="server" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                    BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                    <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <EditItemTemplate>
                        <div class="box box-default">
                            <div class="row">
                                <div class="col-12">
                                    <table class="table table-responsive">
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="Label9" runat="server" Text="USUARIO :"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label10" runat="server" Text='<%#Eval("datospertercero") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="Label1" runat="server" Text="SERVICIO:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblserv1" runat="server" Text='<%#Eval("detalleplan") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="lblserv" runat="server" Text="REFERENCIA:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblidup" runat="server" Text='<%#Eval("idserviciosserv") %>'></asp:Label>
                                                <asp:TextBox TextMode="MultiLine" Columns="35" Rows="2" Style="resize: none" ID="txbrefup" runat="server" Text='<%#Eval("referenciasserv")%>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="lblip" runat="server" Text="DIRECCION IP:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txbipup" runat="server" Text='<%#Eval("direccionipserv") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="lblmegas" runat="server" Text="CANTIDAD DE MEGAS"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txbcmegup" runat="server" Text='<%#Eval("cantidadmegasserv") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="Label2" runat="server" Text="DIRECCION"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="dropbarrio"></asp:DropDownList>
                                                <br />
                                                <asp:TextBox TextMode="MultiLine" Columns="35" Rows="2" Style="resize: none" ID="txbdirecup" runat="server" Text='<%#Eval("direcionpunt") %> '></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="Label5" runat="server" Text="ESTRATO:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txbestratoup" runat="server" Text='<%#Eval("estratoserv") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="Label7" runat="server" Text="ESTADO DE SERVICIO"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txbestadoup" runat="server" Text='<%#Eval("estadoserv") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:LinkButton ID="Cambiar" CssClass="btn bg-navy margin" runat="server" CausesValidation="False"
                                        CommandName="Update" Text="Actualizar" />
                                    <asp:LinkButton ID="cancel" CssClass="btn bg-navy margin" runat="server" CausesValidation="false"
                                        CommandName="Cancel" Text="Cancelar"></asp:LinkButton>

                                </div>
                            </div>
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div class="box box-default">
                            <div class="row">
                                <div class="col-12">
                                    <table class="table table-responsive">
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="Label9" runat="server" Text="USUARIO :"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label10" runat="server" Text='<%#Eval("datospertercero") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="lblserv" runat="server" Text="SERVICIO:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblserv1" runat="server" Text='<%#Eval("detalleplan") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="lblip" runat="server" Text="DIRECCION IP:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblservip" runat="server" Text='<%#Eval("direccionipserv") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="lblmegas" runat="server" Text="CANTIDAD DE MEGAS"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblservmg" runat="server" Text='<%#Eval("cantidadmegasserv") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="Label2" runat="server" Text="DIRECCION"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label3" runat="server" Text='<%#Eval("direcionpunt") %> '></asp:Label>
                                                <asp:Label ID="Label4" runat="server" Text='<%#Eval("barriosbarr") %> '></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="Label5" runat="server" Text="ESTRATO:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label6" runat="server" Text='<%#Eval("estratoserv") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="Label7" runat="server" Text="ESTADO DE SERVICIO"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label8" runat="server" Text='<%#Eval("estadoserv") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:LinkButton ID="EditButton" CssClass="btn bg-navy margin" runat="server" CausesValidation="False"
                                        CommandName="edit" Text="Editar" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                </asp:FormView>
            </div>
            <div id="divcaracteristicas" runat="server" class="col-md-12 col-lg-6">
                <div class="box box-body">
                    <div class="row">
                        <asp:GridView ID="GridViewcaracter" CssClass="table table-responsive table-bordered" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderText="Codigo" DataField="planservicios_has_caracteristicascolcol" />
                                <asp:BoundField HeaderText="Caracteristica(s)" DataField="caracteristicacol" />
                                <asp:BoundField HeaderText="Cantidad" DataField="cantidadcol" />
                                <asp:BoundField HeaderText="" DataField="unidadcol" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

            </div>
            <div id="equipo" runat="server" visible="true" class="col-md-12 col-lg-auto">
                <div class="box box-body">
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#mymodal2">
                        <span class="glyphicon glyphicon-edit"></span>CAMBIAR EQUIPO 
                    </button>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#agregardetalle">
                        <span class="glyphicon glyphicon-save">AGREGAR NUEVO</span>
                    </button>
                    <div class="row col">
                        <asp:GridView AutoGenerateColumns="FALSE" ID="gridequipoasignado" HeaderStyle-ForeColor="White" HeaderStyle-BackColor=" #0198f4" CssClass="table table-responsive no-border" runat="server">
                            <Columns>
                                <asp:BoundField HeaderText="SERIAL" DataField="serialcol" />
                                <asp:BoundField HeaderText="MAC" DataField="maccol" />
                                <asp:BoundField HeaderText="DESCRIPCION" DataField="descripcioncol" />
                                <asp:BoundField HeaderText="PRODUCTO" DataField="tipoproductocol" />
                                <asp:BoundField HeaderText="MODELO" DataField="modelocol" />
                                <asp:BoundField HeaderText="FABRICANTE" DataField="fabricantecol" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

            </div>
            <div class="modal fade bs-example-modal-lg" id="mymodal2" data-backdrop="”static”">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">SELECCIONAR EQUIPO <span class="glyphicon glyphicon-edit"></span></h4>
                        </div>
                        <div class="modal-body">

                            <table class="table no-border table-striped table-responsive" id="example1">
                                <thead style="background-color: #0198f4;">
                                    <tr>
                                        <th><font color="white">SERIAL</font>
                                        </th>
                                        <th><font color="white">MAC</font>
                                        </th>
                                        <th><font color="white">MARCA</font>
                                        </th>
                                        <th><font color="white">MODELO</font>
                                        </th>
                                        <th><font color="white">TIPO</font>
                                        </th>
                                        <th><font color="white">WIFI</font>
                                        </th>
                                    </tr>
                                </thead>
                                <tfoot style="background-color: #0198f4;">
                                    <tr>
                                        <th><font color="white">SERIAL</font>
                                        </th>
                                        <th><font color="white">MAC</font>
                                        </th>
                                        <th><font color="white">MARCA</font>
                                        </th>
                                        <th><font color="white">MODELO</font>
                                        </th>
                                        <th><font color="white">TIPO</font>
                                        </th>
                                        <th><font color="white">WIFI</font>
                                        </th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <asp:Repeater ID="repetidordecolumnar" runat="server">
                                        <ItemTemplate>
                                            <tr onclick='return dialog(this,event,<%# Eval("idinventario") %>);'>
                                                <td><%# Eval("serial") %>
                                                </td>
                                                <td><%# Eval("mac")%>
                                                </td>
                                                <td><%# Eval("fabricante") %>
                                                </td>
                                                <td><%# Eval("modelo") %>
                                                </td>
                                                <td><%# Eval("tipoproductovalue") %>
                                                </td>
                                                <td><%# Eval("wifi") %>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">CERRAR</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="agregardetalle" data-backdrop="”static”">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">ASIGNAR EQUIPO EXISTENTE (TEMPORAL)</h4>
                        </div>
                        <div class="modal-body">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Inventario</h3>
                                        <label runat="server" id="codigoCompra" visible="false"></label>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-element">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Serial</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="serial_" runat="server" placeholder="Serial">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Mac</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="mac_" runat="server" placeholder="Mac">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Descripción</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="descripcion_" runat="server" placeholder="Descripción">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Estado</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList runat="server" ID="estado_" CssClass="form-control" AppendDataBoundItems="true">
                                                        <asp:ListItem>Seleccione</asp:ListItem>
                                                        <asp:ListItem>Activo</asp:ListItem>
                                                        <asp:ListItem>Inactivo</asp:ListItem>
                                                        <asp:ListItem>Da&#241;ado</asp:ListItem>
                                                        <asp:ListItem>Vendido</asp:ListItem>
                                                        <asp:ListItem>Prestado</asp:ListItem>
                                                        <asp:ListItem>Disponible</asp:ListItem>
                                                        <asp:ListItem>Revisi&#243;n</asp:ListItem>
                                                        <asp:ListItem>Obsoleto</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Fabricante</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList runat="server" ID="fabricante_inv" CssClass="form-control" AppendDataBoundItems="true">
                                                        <asp:ListItem>Seleccione</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Modelo</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList runat="server" ID="modelo_inv" CssClass="form-control" AppendDataBoundItems="true">
                                                        <asp:ListItem>Seleccione</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Tipo Producto</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList runat="server" ID="tipoproducto_inv" CssClass="form-control" AppendDataBoundItems="true">
                                                        <asp:ListItem>Seleccione</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button class="btn btn-primary" runat="server">Guardar</button>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">CERRAR</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </div>
    </section>

</asp:Content>
