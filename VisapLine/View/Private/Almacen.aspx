<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Almacen.aspx.cs" Inherits="VisapLine.View.Private.Almacen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function panel1() {
            document.getElementById("pan1").click();
        }
        function panel2() {
            document.getElementById("pan2").click();
        }
        function panel3() {
            document.getElementById("pan3").click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>Gestion del Cliente
        </h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
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
                <li><a href="#Compras" id="pan1" data-toggle="tab" class="active">Compras</a></li>
                <li><a href="#Inventario" id="pan2" data-toggle="tab">Inventario</a></li>
                <li><a href="#Tipoproduct" id="pan3" data-toggle="tab">Tipo de Productos</a></li>
                <li><a href="#Proveedor" id="pan4" data-toggle="tab">Proveedores</a></li>
                <li><a href="#Fabricantes" id="pan5" data-toggle="tab">Fabricantes</a></li>
                <li><a href="#Modelos" id="pan6" data-toggle="tab">Modelos</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="Compras">
                </div>
                <div class="tab-pane" id="Inventario">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Inventario</h3>
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
                                    <button class="btn btn-primary" runat="server" onserverclick="RegistrarTipoProducto">Guardar</button>
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
                                    <asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="false" class="table table-bordered table-striped table-responsive" OnRowCommand="tablatipoproducto_RowCommand">
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
                <div class="tab-pane" id="Proveedor">
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
                                                <input type="text" class="form-control" id="nit_" runat="server" placeholder="Telefono o celular">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Razón Social</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="razonsocail_" runat="server" placeholder="Telefono o celular">
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
                                                <input type="text" class="form-control" id="correo_" runat="server" placeholder="Telefono o celular">
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
                                            <asp:BoundField DataField="nit" HeaderText="Identificación"></asp:BoundField>
                                            <asp:BoundField DataField="razonsocial" HeaderText="Razon Social"></asp:BoundField>
                                            <asp:BoundField DataField="telefono" HeaderText="Telefono"></asp:BoundField>
                                            <asp:BoundField DataField="correo" HeaderText="Correo"></asp:BoundField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="eliminar_btn" runat="server" ImageUrl="../../Contenido/images/icons/eliminar.png" class="btn btn-link" CommandName="Eliminar" CommandArgument='<%# Eval("idproveedor") %>' Text="Borrar" />
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
                <div class="tab-pane" id="Fabricantes">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Fabricante</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-element">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Nit Proveedor</label>
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
                <div class="tab-pane" id="Modelos">
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
                                            <label class="col-sm-3 col-form-label">Tipo Factura</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList runat="server" ID="listfabricante" CssClass="form-control" AppendDataBoundItems="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
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
