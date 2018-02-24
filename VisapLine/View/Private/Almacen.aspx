<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Almacen.aspx.cs" Inherits="VisapLine.View.Private.Almacen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../Contenido/assets/vendor_components/jquery/dist/jquery.js"></script>
    <script src="../../Contenido/assets/vendor_components/glyphicons/glyphicon.css"></script>
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <asp:ScriptManager ID="scripservicc" runat="server"></asp:ScriptManager>
    <script type="text/javascript">
        function nointro() {
            window.addEventListener("keypress", function (event) {
                if (event.keyCode == 13) {
                    event.preventDefault();
                }
            }, false);
        }
        function panel1() {
            document.getElementById("pan1").click();
        }
        function panel2() {
            document.getElementById("pan2").click();
        }
        function panel3() {
            document.getElementById("pan3").click();
        }
        function panel4() {
            document.getElementById("pan4").click();
        }
        function panel5() {
            document.getElementById("pan5").click();
        }
        function panel6() {
            document.getElementById("pan6").click();
        }
        function openModal() {
            $('#agregardetalle').modal('show');
        }
        function dialog(ctl, event, cosa) {
            event.preventDefault();
            swal({
                title: "¡CUIDADO, LO QUE VA HA HACER PUEDE SER IRREVERSIBLE!",
                text: "Desea eliminar este rejistro?",
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
                    url: "Almacen.aspx/eliminardetallecompara",
                    data: '{compra : ' + cosa + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                    }
                }
                )
                    .done(function (data) {
                        swal({
                            title: "OPERACION REALIZADA EXITO!",
                            text: "Se elimino el registro!",
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
        function nodata() {
            swal("ALGO HA OCURRIDO!", "No se encontraron registros", "error");
        };
    </script>
    <section class="content-header">
        <h1>Gestion del Inventario
        </h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Inventario</a></li>
            <li class="breadcrumb-item active">Registro</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li><a href="#Comprass" id="pan1" data-toggle="tab" class="active">Compras</a></li>
                <li><a href="#Inventarioss" id="pan2" data-toggle="tab">Inventario</a></li>
                <li><a href="#Tipoproduct" id="pan3" data-toggle="tab">Tipo de Productos</a></li>
                <li><a href="#Proveedors" id="pan4" data-toggle="tab">Proveedores</a></li>
                <li><a href="#Fabricantess" id="pan5" data-toggle="tab">Fabricantes</a></li>
                <li><a href="#Modeloss" id="pan6" data-toggle="tab">Modelos</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="Comprass">
                    <div class="row" id="rowinsertar" runat="server">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Compras</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-element">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Numero de pedido</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control col-10" id="numeropedido_" runat="server" placeholder="Serial">
                                                <button class="btn btn-success col-1" id="consultarcompra" runat="server" onserverclick="consltarcompra"><span class="glyphicon glyphicon-search"></span></button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Valor</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="valor_" runat="server" placeholder="Serial">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Proveedor</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList runat="server" ID="listProveedor_" CssClass="form-control" AppendDataBoundItems="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title"></h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-element">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Fecha de Pedido</label>
                                            <div class="col-sm-9">
                                                <input type="date" class="form-control" id="fechped_" runat="server" placeholder="Serial">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Fecha de Llegada</label>
                                            <div class="col-sm-9">
                                                <input type="date" class="form-control" id="fechlleg_" runat="server" placeholder="Serial">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button class="btn btn-success float-right" runat="server" onserverclick="RegistrarCompra">Guardar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:FormView ID="formcompra" CssClass="col-12" runat="server">
                        <ItemTemplate>
                            <div class="row" id="rowcosnultar" runat="server">

                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="box box-primary">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">Compras</h3>
                                        </div>
                                        <div class="box-body">
                                            <div class="form-element">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Numero de pedido</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="Text1" runat="server" value='<%#Eval("numeropedido") %>'>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Valor</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="Text2" runat="server" value='<%#Eval("valor") %>'>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Proveedor</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="Text3" runat="server" value='<%#Eval("prov") %>'>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="box box-primary">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"></h3>
                                        </div>
                                        <div class="box-body">
                                            <div class="form-element">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Fecha de Pedido</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="Text4" runat="server" value='<%#Eval("fechapedido") %>'>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Fecha de Llegada</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="Text5" runat="server" value='<%#Eval("fechallegada") %>'>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#agregardetalle">REGISTRAR DETALLE</button>
                    <div class="modal fade" id="agregardetalle" data-backdrop="”static”">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">DETALLE DEL PRODUCTO COMPRADO <span class="glyphicon glyphicon-shopping-cart"></span></h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-6">
                                            <asp:Label ID="lvldroptipoprod" runat="server">TIPO DE PRODUCTO</asp:Label>
                                        </div>
                                        <div class="col-6">
                                            <asp:DropDownList ID="droptipoproduc" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropmodelo_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divcaracteristicaequipo" runat="server" visible="false">
                                        <div class="row">
                                            <div class="col-6">
                                                <asp:Label ID="lbldropmarca" runat="server">FABRICANTE</asp:Label>
                                            </div>
                                            <div class="col-6">
                                                <asp:DropDownList ID="dropmarca" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropmarca_SelectedIndexChanged"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6">
                                                <asp:Label ID="lblmodelo" runat="server">MODELO</asp:Label>
                                            </div>
                                            <div class="col-6">
                                                <asp:DropDownList ID="dropmodelo" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6">
                                                <asp:Label ID="lblmac" runat="server">MAC</asp:Label>
                                            </div>
                                            <div class="col-6">
                                                <asp:TextBox ID="txtmac" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6">
                                                <asp:Label ID="lblserial" runat="server">SERIAL</asp:Label>
                                            </div>
                                            <div class="col-6">
                                                <asp:TextBox ID="txtserial" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6">
                                                <asp:Label ID="lblcantidad" runat="server">CANTIDAD</asp:Label>
                                            </div>
                                            <div class="col-6">
                                                <asp:TextBox ID="txtcantidad" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6">
                                                <asp:Label ID="lblvidautil" runat="server">VIDA UTIL</asp:Label>
                                            </div>
                                            <div class="col-6">
                                                <asp:TextBox ID="txtvidautil" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6">
                                                <asp:Label ID="lbldescripcion" runat="server">DESCRIPCION</asp:Label>
                                            </div>
                                            <div class="col-6">
                                                <asp:TextBox ID="txtdescripcion" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="divocultoinsumos" runat="server" visible="false">
                                        <asp:GridView CssClass="table table-responsive no-border" OnSelectedIndexChanged="insumos_SelectedIndexChanging" AutoGenerateColumns="false" ID="insumos" runat="server">
                                            <Columns>
                                                <asp:BoundField HeaderText="CODIGO" DataField="idinventario" />
                                                <asp:BoundField HeaderText="DESCRIPCION" DataField="descripcion" />
                                                <asp:TemplateField HeaderText="CANTIDAD">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="gvtxtcantidad" runat="server"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField ShowSelectButton="true" ItemStyle-CssClass="btn btn-success" ControlStyle-ForeColor="White" SelectText="AGREGAR" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">CERRAR</button>
                                    <asp:Button Visible="false" ID="confimarregistro" runat="server" Text="AGREGAR" OnClick="confimarregistro_Click" CssClass="btn btn-success" />
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <div class="row col">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Detalle Compra</h3>
                            </div>
                            <div class="box-body">
                                <asp:GridView runat="server" ID="tablacompras" AutoGenerateColumns="false" class="table table-bordered table-striped table-responsive">
                                    <Columns>
                                        <asp:BoundField HeaderText="PRODUCTO" DataField="tipoproducto" />
                                        <asp:BoundField HeaderText="DETALLE" DataField="detalle" />
                                        <asp:BoundField HeaderText="CANTIDAD" DataField="cantidad" />
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <%----%>
                                                <a role="button" href="#" onclick='return dialog(this,event,<%# Eval("idcompra")%>);'>
                                                    <span class="glyphicon glyphicon-trash"></span>
                                                </a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                            </div>
                            <!-- /.box-footer-->
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="Inventarioss">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
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
                                            <label class="col-sm-3 col-form-label">Vida Util</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="vidautil_" runat="server" placeholder="Vida Uil">
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
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Inventario</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-element">
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
                                    <button class="btn btn-primary" runat="server" onserverclick="RegistrarInventario">Guardar</button>
                                </div>

                            </div>

                        </div>
                        <div class="box-body col">
                            <table class="table table-bordered table-striped table-responsive no-border" id="example" >
                                <thead>
                                    <tr>
                                        <th>DESCIPCION
                                        </th>
                                        <th>CANTIDAD
                                        </th>
                                        <th>UNIDAD
                                        </th>
                                        <th>TIPO PRODUCTO
                                        </th>
                                        <th>MODELO
                                        </th>
                                        <th>VIDA UTIL
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="repeteidordeinventario" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <th>
                                                    <label><%#Eval("descripcion") %></label>
                                                    <label><%# Eval("serial") %></label>
                                                    <label><%# Eval("mac") %></label>
                                                </th>
                                                <th>
                                                    <label><%# Eval("cantidad") %></label>
                                                </th>
                                                <th>UNIDAD
                                                </th>
                                                <th>
                                                    <label><%# Eval("tipoproducto") %></label>
                                                </th>
                                                <th>
                                                    <label><%# Eval("fabricante") %></label>
                                                    <label><%# Eval("modelo") %></label>
                                                </th>
                                                <th>
                                                    <label><%# Eval("vidautil") %></label>
                                                </th>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="Tipoproduct">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Tipo de Producto</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-element">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Producto</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="tipoproducto" runat="server" placeholder="Tipo de producto">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button class="btn btn-primary" runat="server" onserverclick="RegistrarTipoProducto">Guardar</button>
                                </div>
                            </div>
                            <div class="box box-default collapsed-box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Tipos de producto</h3>
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <asp:GridView runat="server" ID="tablatipoproducto" AutoGenerateColumns="false" class="table table-bordered table-striped table-responsive" OnRowCommand="tablatipoproducto_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="tipoproducto" HeaderText="Tipo de Producto"></asp:BoundField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="eliminar_btn" runat="server" ImageUrl="../../Contenido/images/icons/eliminar.png" class="btn btn-link" CommandName="Eliminar" CommandArgument='<%# Eval("idtipoproducto") %>' Text="Borrar" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                </div>
                                <!-- /.box-footer-->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="Proveedors">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Proveedores</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-element">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Nit Proveedor</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="nit_" runat="server" placeholder="XXXXXXXXXXXXX-X">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Razón Social</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="razonsocail_" runat="server" placeholder="example S.A">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Telefono</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="telefono_" runat="server" placeholder="Telefono o celular">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Correo</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="correo_" runat="server" placeholder="Example@empresa.com">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button class="btn btn-primary" runat="server" onserverclick="RegistrarProveedor">Guardar</button>
                                </div>
                            </div>
                            <div class="box box-default collapsed-box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Proveedores</h3>

                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <asp:GridView runat="server" ID="tablaproveedores" AutoGenerateColumns="false" class="table table-bordered table-striped table-responsive" OnRowCommand="tablaproveedores_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="identificacion" HeaderText="Identificación"></asp:BoundField>
                                            <asp:BoundField DataField="nombre" HeaderText="Razon Social"></asp:BoundField>
                                            <asp:BoundField DataField="telefono" HeaderText="Telefono"></asp:BoundField>
                                            <asp:BoundField DataField="correo" HeaderText="Correo"></asp:BoundField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="eliminar_btn" runat="server" ImageUrl="../../Contenido/images/icons/eliminar.png" class="btn btn-link" CommandName="Eliminar" CommandArgument='<%# Eval("idterceros") %>' Text="Borrar" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                </div>
                                <!-- /.box-footer-->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="Fabricantess">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Fabricante</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-element">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Fabricante</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="fabricante_" runat="server" placeholder="Fabricante">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button class="btn btn-primary" runat="server" onserverclick="RegistrarFabricante">Guardar</button>
                                </div>
                            </div>
                            <div class="box box-default collapsed-box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Fabricantes</h3>

                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <asp:GridView runat="server" ID="tablafabricantes" AutoGenerateColumns="false" class="table table-bordered table-striped table-responsive" OnRowCommand="tablafabricantes_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="fabricante" HeaderText="idfabricante"></asp:BoundField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="eliminar_btn" runat="server" ImageUrl="../../Contenido/images/icons/eliminar.png" class="btn btn-link" CommandName="Eliminar" CommandArgument='<%# Eval("idfabricante") %>' Text="Borrar" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                </div>
                                <!-- /.box-footer-->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="Modeloss">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Modelos</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-element">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Modelo</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="modelo_" runat="server" placeholder="Modelo" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Fabricante</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList runat="server" ID="listfabricante" CssClass="form-control" AppendDataBoundItems="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Wifi</label>
                                            <div class="col-sm-9">
                                                <asp:CheckBox ID="checkwifi" runat="server" Text=" "></asp:CheckBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button class="btn btn-primary" runat="server" onserverclick="RegistrarModelo">Guardar</button>
                                </div>
                            </div>
                            <div class="box box-default collapsed-box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Modelos</h3>
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <asp:GridView runat="server" ID="tablamodelo" AutoGenerateColumns="false" class="table table-bordered table-striped table-responsive" OnRowCommand="tablamodelo_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="modelo" HeaderText="Modelo"></asp:BoundField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="eliminar_btn" runat="server" ImageUrl="../../Contenido/images/icons/eliminar.png" class="btn btn-link" CommandName="Eliminar" CommandArgument='<%# Eval("idmodelo") %>' Text="Borrar" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                </div>
                                <!-- /.box-footer-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
