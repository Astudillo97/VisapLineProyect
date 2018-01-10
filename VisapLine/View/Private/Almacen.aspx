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
        function panel4() {
            document.getElementById("pan4").click();
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
    <asp:panel id="Alerta" visible="false" runat="server" cssclass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:panel>
    <section class="content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li><a href="#Compras" id="pan1" data-toggle="tab" class="active">Compras</a></li>
                <li><a href="#Inventarios" id="pan2" data-toggle="tab">Registro</a></li>
                <li><a href="#Configuracion" id="pan3" data-toggle="tab">Telefono</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="Compras">
                </div>
                <div class="tab-pane" id="Inventarios">
                </div>
                <div class="tab-pane" id="Configuracion">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
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
                                            <i class="fa fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    
                                </div>
                                <!-- /.box-footer-->
                            </div>

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
                            <div class="box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Proveedores</h3>

                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    
                                </div>
                                <!-- /.box-footer-->
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
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
                            <div class="box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Fabricantes</h3>

                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    
                                </div>
                                <!-- /.box-footer-->
                            </div>

                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Modelos</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-element">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Modelo</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="modelo_" runat="server" placeholder="Telefono o celular">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">Tipo Factura</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList runat="server" ID="fabricante" CssClass="form-control" AppendDataBoundItems="true">
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
                            <div class="box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Modelos</h3>

                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    
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
