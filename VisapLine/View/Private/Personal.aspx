<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="VisapLine.View.Private.Personal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
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
        <h1>Gestion del Personal
        </h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item" ><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Peronal</a></li>
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
                <li><a class="active" id="pan1" href="#informacion" data-toggle="tab">Personal</a></li>
                <li><a href="#contratos" id="pan2" data-toggle="tab">Registro</a></li>
                <li><a href="#insidencias" id="pan3" data-toggle="tab">Rol del Usuario</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="informacion">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Personal</h3>
                                </div>
                                <div class="form-element">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Identificación</label>
                                            <input type="text" class="form-control" runat="server" id="identif_" placeholder="Identificación">
                                        </div>
                                        <button class="btn btn-primary float-right" runat="server" onserverclick="ConsultarUsuario">Consultar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Datos del Empleado</h3>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <asp:GridView runat="server" ID="tablausuario" AutoGenerateColumns="false" class="table table-bordered table-striped table-responsive" OnRowDataBound="tablausuario_RowDataBound" OnRowCommand="tablausuario_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="identificacion" HeaderText="Cedula"></asp:BoundField>
                                            <asp:BoundField DataField="nombre" HeaderText="Nombre"></asp:BoundField>
                                            <asp:BoundField DataField="apellido" HeaderText="Apellido"></asp:BoundField>
                                            <asp:BoundField DataField="fechanat" HeaderText="Fecha"></asp:BoundField>
                                            <asp:BoundField DataField="usuario" HeaderText="Usuario"></asp:BoundField>
                                            <asp:BoundField DataField="rol" HeaderText="Cargo"></asp:BoundField>
                                            <asp:BoundField DataField="estado" HeaderText=""></asp:BoundField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ver_btn" Width="40" runat="server" ImageUrl="../../Contenido/images/icons/ver.png" CssClass="btn btn-link" CommandName="Ver" CommandArgument='<%# Eval("identificacion") %>' Text="" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="actualizar_btn" Width="40" runat="server" ImageUrl="../../Contenido/images/icons/editar.png" class="btn btn-link" CommandName="Editar" CommandArgument='<%# Eval("identificacion") %>' Text="" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="eliminar_btn" Width="40" runat="server" ImageUrl="../../Contenido/images/icons/eliminar.png" class="btn btn-link" CommandName="Eliminar" CommandArgument='<%# Eval("identificacion") %>' Text="" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="contratos">
                    <asp:Panel ID="viewedicion" Visible="false" runat="server" CssClass="col-12 alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <label class="text-center" runat="server" id="textediccion"></label>
                        <label runat="server" visible="false" id="codigo"></label>
                    </asp:Panel>
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Información Personal</h3>
                                </div>
                                <div class="form-element">
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Identificación</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="identificacion_" runat="server" placeholder="Nit o Identificación">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Nombre</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="nombre_" runat="server" placeholder="Nombre">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Apellido</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="apellido_" runat="server" placeholder="Apellido">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Nacimiento</label>
                                            <div class="col-sm-9">
                                                <input type="date" class="form-control" id="fecnac_" runat="server" placeholder="Apellido">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Tipo Sangre</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList runat="server" ID="rh_" CssClass="form-control">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                    <asp:ListItem>O+</asp:ListItem>
                                                    <asp:ListItem>O-</asp:ListItem>
                                                    <asp:ListItem>A+</asp:ListItem>
                                                    <asp:ListItem>A-</asp:ListItem>
                                                    <asp:ListItem>B+</asp:ListItem>
                                                    <asp:ListItem>B-</asp:ListItem>
                                                    <asp:ListItem>AB+</asp:ListItem>
                                                    <asp:ListItem>AB-</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Estado</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList runat="server" ID="estado_" CssClass="form-control select2">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                    <asp:ListItem Value="true">Activo</asp:ListItem>
                                                    <asp:ListItem Value="false">Inactivo</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Correo</label>
                                            <div class="col-sm-9">
                                                <input type="email" class="form-control" id="correo_" runat="server" placeholder="Correo">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button class="btn btn-primary" runat="server" onserverclick="CancelarPersonal">Cancelar</button>
                                    <button class="btn btn-primary float-right" runat="server" onserverclick="RegistrarPersonal">Guardar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="insidencias">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Usuario y Rol </h3>
                                </div>
                                <div class="form-element">
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Usuario de acceso</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="usuario_" disabled runat="server" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Información de Contacto</h3>
                                </div>
                                <div class="form-element">
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">Tipo Usuario</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList runat="server" ID="rol_" CssClass="form-control" AppendDataBoundItems="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button class="btn btn-primary" runat="server" onserverclick="RegistrarRol">Guardar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
