<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="CrearFactura.aspx.cs" Inherits="VisapLine.View.Private.CrearFactura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        textarea {
            resize: none;
        }
    </style>

    <script type="text/javascript">
        window.onload = function cerrar() {
            setTimeout(function () {
                document.getElementById("<%=Alerta.ClientID%>").style.display = 'none';
            }, 5000);
        }
        function deletealertinci() {
            swal("LA INCIDENCIA FUE CREADA CON EXITO!", "", "success");
        }
        function alerterrorinci() {
            swal("EL REGISTRO NO SE PUDO COMPLETAR!", "Verifique la informacion ingresada y vuelva intentar", "error");
        }
        function panelbutton() {
            document.getElementById('idbusqueda').click();
        }
        function panelmodalinci() {
            document.getElementById('idincidencia').click();
        }
        function panelincidencia() {
            document.getElementById('pan2').click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>Crear Factura</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Finanzas</a></li>
            <li class="breadcrumb-item active">Crear Factura</li>
        </ol>
    </section>
    <section class="content-header">
        <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <label class="text-center" runat="server" id="textError"></label>
        </asp:Panel>
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Buscar Cliente</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-12">
                        <div class="tab-pane">
                            <div class="form-group row">
                                <label for="exampleInputPassword1" class="col-md-2">Busqueda</label>
                                <input type="text" class="form-control col-md-6" runat="server" id="identif_" placeholder="Nit, Identificación, nombre, apellido, abonado">
                                <button class="btn btn-success col-md-2" runat="server" onserverclick="ConsultarIdentif">Consultar</button>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
            </div>
            <div class="row" runat="server" id="datos" visible="true">
                <div class="col-6">
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title">Datos del Cliente</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-6">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <img src="../../Contenido/images/user2-160x160.jpg" height="115px" width="115px" />
                                    <br />
                                    <br />
                                    <div class="form-group row" id="tipocliente">
                                        <label id="Label1" runat="server" class="col-sm-3 col-form-label">PERSONA</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" readonly id="_tipocliente" runat="server" placeholder="PERSONA">
                                        </div>
                                    </div>
                                    <div class="form-group row" id="dividentificacion">
                                        <label class="col-sm-3 col-form-label">CC/NIT</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" readonly id="identificacion_" runat="server" placeholder="Nit o Identificación">
                                        </div>
                                    </div>
                                    <div class="form-group row" id="divnombre">
                                        <label id="_nombr" runat="server" class="col-sm-3 col-form-label">CLIENTE</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" readonly id="_nombre_" runat="server" placeholder="Nombre">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">

                                    <div class="form-group row" id="divemail">
                                        <label id="_email_" runat="server" class="col-sm-4 col-form-label">CORREO</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" readonly id="_correo_" runat="server" placeholder="Correo">
                                        </div>
                                    </div>
                                    <div class="form-group row" id="divestado">
                                        <label id="Label2" runat="server" class="col-sm-4 col-form-label">ESTADO</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" readonly id="_estado_" runat="server" placeholder="Estado">
                                        </div>
                                    </div>
                                    <div class="form-group row" id="divtelefono">
                                        <label id="Label5" runat="server" class="col-sm-4 col-form-label">TELEFONO</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" readonly id="_telefono_" runat="server" placeholder="TELEFONO">
                                        </div>
                                    </div>
                                    <div class="form-group row" id="divdireccion">
                                        <label id="Label6" runat="server" class="col-sm-4 col-form-label">DIRECCION</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" readonly id="_direccion_" runat="server" placeholder="DIRECCION">
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Datos del Contrato</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Nombre:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="Label7" runat="server" CssClass="form-control bg-gray" Height="35px" Width="150px" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Apellido:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="Label8" CssClass="form-control bg-gray" runat="server" Height="35px" Width="150px" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Direccion:</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="TextBox1" TextMode="MultiLine" Enabled="false" Rows="5" Columns="15" runat="server" class="form-control bg-gray" Width="150px" Height="100px"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Nombre:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="Label3" runat="server" CssClass="form-control bg-gray" Height="35px" Width="150px" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Apellido:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="Label4" CssClass="form-control bg-gray" runat="server" Height="35px" Width="150px" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Direccion:</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="TextBox2" TextMode="MultiLine" Enabled="false" Rows="5" Columns="15" runat="server" class="form-control bg-gray" Width="150px" Height="100px"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Datos del Contrato</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Nombre:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="Label9" runat="server" CssClass="form-control bg-gray" Height="35px" Width="150px" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Apellido:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="Label10" CssClass="form-control bg-gray" runat="server" Height="35px" Width="150px" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Direccion:</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="TextBox3" TextMode="MultiLine" Enabled="false" Rows="5" Columns="15" runat="server" class="form-control bg-gray" Width="150px" Height="100px"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Nombre:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="Label11" runat="server" CssClass="form-control bg-gray" Height="35px" Width="150px" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Apellido:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="Label12" CssClass="form-control bg-gray" runat="server" Height="35px" Width="150px" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Direccion:</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="TextBox4" TextMode="MultiLine" Enabled="false" Rows="5" Columns="15" runat="server" class="form-control bg-gray" Width="150px" Height="100px"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#panelbusqueda" id="idbusqueda" class="row" data-target=".bs-example-modal-lg" data-toggle="modal"></a>
        <div class="modal fade bs-example-modal-lg" runat="server" id="panelbusqueda" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myLargeModalLabel">Resultados</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="tab-pane" runat="server" id="panelconsulta">
                            <div class="box box-primary" style="overflow-x: auto">
                                <asp:GridView runat="server" ID="consultacliente" CssClass="table table-bordered table-striped table-responsive" OnSelectedIndexChanging="consultacliente_SelectedIndexChanging" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="identificacion" HeaderText="CC/NIT"></asp:BoundField>
                                        <asp:TemplateField HeaderText="USUARIO">
                                            <ItemTemplate>
                                                <label runat="server"><%#Eval("nombre") %> <%#Eval("apellido") %></label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="estado" HeaderText="ESTADO"></asp:BoundField>
                                        <asp:BoundField DataField="direccion" HeaderText="DIRECCION"></asp:BoundField>
                                        <asp:BoundField DataField="tipoterceros" HeaderText="PERSONA"></asp:BoundField>
                                        <asp:CommandField SelectText="" ControlStyle-CssClass="glyphicon glyphicon-search" ShowSelectButton="True"></asp:CommandField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </section>
</asp:Content>
