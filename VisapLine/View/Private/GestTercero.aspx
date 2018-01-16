<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="GestTercero.aspx.cs" Inherits="VisapLine.View.Private.GestTercero" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
        function panel2() {
            document.getElementById("pan2").click();
        }
        function panel3() {
            document.getElementById("pan3").click();
        }
        function Emresarial() {
            alert("asdasdadasdad");
                    document.getElementById("<%=apellido_.ClientID%>").value = "NULL::character varying";
                    document.getElementById("<%=_nombre_.ClientID%>").innerHTML = "Razon Social";
                    document.getElementById("<%=estrato_.ClientID%>").value = "3";
                    document.getElementById("<%=tipodoc_.ClientID%>").value = "2";
                    document.getElementById("<%=estado_.ClientID%>").value = "Activo";
                    document.getElementById("divtiposangre").style.display = 'none';
                    document.getElementById("<%=rh_.ClientID%>").value = "Seleccione";
                    document.getElementById("<%=apellido_.ClientID%>").style.display = 'none';
                    document.getElementById("<%=_apellido_.ClientID%>").style.display = 'none';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h2>Gestion del Cliente
        </h2>
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
                <li><a class="active" id="pan1" href="#informacion" data-toggle="tab">Cliente</a></li>
                <li><a href="#registro" id="pan2" data-toggle="tab">Registro</a></li>
                <li><a href="#finalizacion" id="pan3" data-toggle="tab">Finalización</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="informacion">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Clientes</h3>
                                </div>
                                <div class="form-element">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Identificación</label>
                                            <input type="text" class="form-control" runat="server" id="identif_" placeholder="Nit o Identificación">
                                        </div>
                                        <button class="btn btn-primary float-right" runat="server" onserverclick="ConsultarIdentif">Consultar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Listado de clientes</h3>
                                </div>
                                <!-- /.box-header -->
                                <%--<div class="box-body" style="overflow-x: scroll">
                                    <asp:GridView runat="server" ID="tablacliente" AutoGenerateColumns="true" CssClass="table table-bordered table-striped table-responsive p-0" OnRowDataBound="tablacliente_RowDataBound" OnRowCommand="tablacliente_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ver_btn" runat="server" ImageUrl="../../Contenido/images/icons/ver.png" CssClass="btn btn-link" CommandName="Ver" CommandArgument='<%# Eval("identificacion") %>' Text="" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="actualizar_btn" runat="server" ImageUrl="../../Contenido/images/icons/editar.png" class="btn btn-link" CommandName="Editar" CommandArgument='<%# Eval("identificacion") %>' Text="Borrar" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="eliminar_btn" runat="server" ImageUrl="../../Contenido/images/icons/eliminar.png" class="btn btn-link" CommandName="Eliminar" CommandArgument='<%# Eval("identificacion") %>' Text="Borrar" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>--%>
                                <div class="box-body">
                                    <div class="box">
                                        <div class="box-header">
                                            <h3 class="box-title">Clintes</h3>
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <table id="example1" class="table table-bordered table-striped table-responsive">
                                                <thead>
                                                    <tr>
                                                        <th>NUI</th>
                                                        <th>NOMBRE</th>
                                                        <th>DIRECCION</th>
                                                        <th>CORREO</th>
                                                        <th>EXPEDICIÓN</th>
                                                        <th>ESTADO</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        if (tablacliente != null)
                                                        {
                                                            foreach (System.Data.DataRow item in tablacliente.Rows)
                                                            {
                                                    %>
                                                    <tr>
                                                        <td><%=item["identificacion"].ToString() %></td>
                                                        <td><a href="GestTercero.aspx?codigo=<%=item["identificacion"].ToString() %>"><%=item["nombre"].ToString()+" "+item["apellido"].ToString() %></a></td>
                                                        <td><%=item["direccion"].ToString() %></td>
                                                        <td><%=item["correo"].ToString() %></td>
                                                        <td><%=Convert.ToDateTime(item["fechexp"].ToString()).ToString("yyyy-MM-dd") %></td>
                                                        <td><%=item["estado"].ToString() %></td>
                                                    </tr>

                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="registro">
                    <asp:Panel ID="viewedicion" Visible="false" runat="server" CssClass="col-12 alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <label class="text-center" runat="server" id="textediccion"></label>
                        <label runat="server" visible="false" id="codigo"></label>
                    </asp:Panel>
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Información del contrato </h3>
                                </div>
                                <div class="form-element">
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">Tipo Usuario</label>
                                            <div class="col-sm-8">
                                                <!--onchange="myFunction()"-->
                                                <asp:DropDownList runat="server" OnSelectedIndexChanged="tipotercero__SelectedIndexChanged" AutoPostBack="true" ID="tipotercero_" CssClass="form-control" AppendDataBoundItems="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <asp:GridView ID="listTipos" OnRowDeleting="listTipos_RowDeleting" CssClass="table table-bordered table-striped table-responsive row" AutoGenerateColumns="false" runat="server">
                                                <Columns>
                                                    <asp:BoundField DataField="idpersona" Visible="false" HeaderText="idpersona"></asp:BoundField>
                                                    <asp:BoundField DataField="Persona" HeaderText="Persona"></asp:BoundField>
                                                    <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="p-0"></asp:CommandField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">Tipo Documento</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList runat="server" ID="tipodoc_" CssClass="form-control" AppendDataBoundItems="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">Tipo Residencia</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList runat="server" ID="tiporesident_" CssClass="form-control" AppendDataBoundItems="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">Tipo Factura</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList runat="server" ID="tipofact_" CssClass="form-control" AppendDataBoundItems="true">
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
                                    <h3 class="box-title">Información de residencia </h3>
                                </div>
                                <div class="form-element">
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Pais</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList runat="server" ID="pais_" CssClass="form-control" OnSelectedIndexChanged="pais__SelectedIndexChanged" AppendDataBoundItems="true" AutoPostBack="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Departamento</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList runat="server" ID="departamento_" CssClass="form-control select2" OnSelectedIndexChanged="departamento__SelectedIndexChanged" AppendDataBoundItems="true" AutoPostBack="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Municipio</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList runat="server" ID="municipio_" CssClass="form-control" OnSelectedIndexChanged="municipio__SelectedIndexChanged" AppendDataBoundItems="true" AutoPostBack="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Barrio</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList runat="server" ID="barrio_" CssClass="form-control" AppendDataBoundItems="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <a href="#" class="btn btn-primary" onclick="panel3();">Siguiente</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="finalizacion">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Información</h3>
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
                                            <label id="_nombre_" runat="server" class="col-sm-3 col-form-label">Nombre</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="nombre_" runat="server" placeholder="Nombre">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label id="_apellido_" runat="server" class="col-sm-3 col-form-label">Apellido</label>
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
                                    </div>
                                </div>
                            </div>
                            <div class="box box-default">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Telefono</h3>
                                    <div class="box-tools pull-right">
                                        <button type="button" data-toggle="modal" data-target="#modal-primary" class="btn btn-box-tool">
                                            <i class="glyphicon glyphicon-earphone"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="modal fade" id="modal-primary">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <div class="box box-primary bg-transparent">
                                                    <div class="form-element">
                                                        <div class="box-body">
                                                            <div class="form-group row">
                                                                <div class="col-sm-8">
                                                                    <input type="text" class="form-control" id="telefono_" runat="server" placeholder="Telefono o celular">
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <button class="btn btn-primary" runat="server" onserverclick="RegistrarTelefono">Guardar</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
                                <div class="box-body">
                                    <asp:GridView ID="telefonos" OnRowDeleting="telefonos_RowDeleting1" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="false" runat="server">
                                        <Columns>
                                            <asp:BoundField DataField="idtelefono" HeaderText="Codigo"></asp:BoundField>
                                            <asp:BoundField DataField="telefono" HeaderText="Celular"></asp:BoundField>
                                            <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="p-0"></asp:CommandField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Información</h3>
                                </div>
                                <div class="form-element">
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Correo</label>
                                            <div class="col-sm-9">
                                                <input type="email" class="form-control" id="correo_" runat="server" placeholder="Correo">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Direccion</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="Direccion_" runat="server" placeholder="Dirección">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Estrato</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList runat="server" ID="estrato_" CssClass="form-control" AppendDataBoundItems="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                    <asp:ListItem Value="1">Estrato 1</asp:ListItem>
                                                    <asp:ListItem Value="2">Estrato 2</asp:ListItem>
                                                    <asp:ListItem Value="3">Estrato 3</asp:ListItem>
                                                    <asp:ListItem Value="4">Estrato 4</asp:ListItem>
                                                    <asp:ListItem Value="5">Estrato 5</asp:ListItem>
                                                    <asp:ListItem Value="6">Estrato 6</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Estado</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList runat="server" ID="estado_" CssClass="form-control" AppendDataBoundItems="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                    <asp:ListItem>Activo</asp:ListItem>
                                                    <asp:ListItem>Inactivo</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row" id="divtiposangre">
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
                                    </div>
                                    <div class="box-footer">
                                        <button class="btn btn-primary" runat="server" onserverclick="CancelarTercero">Cancelar</button>
                                        <button class="btn btn-primary float-right" runat="server" onserverclick="RegistrarTercero">Guardar</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
