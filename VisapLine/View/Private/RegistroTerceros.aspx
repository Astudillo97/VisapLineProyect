<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="RegistroTerceros.aspx.cs" Inherits="VisapLine.View.Private.RegistroTerceros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        textarea {
            resize: none;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript">
        function deletealert() {
            swal({
                title: "SE REGISTRO CON EXITO!",
                text: "Se ha registrado con exito ",
                type: "success"
            }, function () {
                window.location.href = "GestContrato.aspx";
            });
        }
        function alerterror() {
            swal("NO SE REGISTRO!", "No se registro el formulario", "error");
        }
        function nocontro() {
            swal("NO SE ENCOTRO NINGUN REGISTRO!", "Debe registrar el cliente", "error");
        }
    </script>
    <section class="content-header">
        <h1>Registro de Clientes</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Registro terceros</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>

    <section class="content">
        <div class="box box-default">
            <div class="box-header with-border">
                <center><h3 class="card-title">Registro de Cliente</h3></center>
                <div class="box-tools pull-right">
                </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-3 col-form-label">CC o Nit:</label>
                            <div class="col-sm-9">
                                <asp:TextBox runat="server" type="number" CssClass="form-control" ID="texboxdni" Style="text-transform: uppercase"></asp:TextBox>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button1" Text="Consultar" OnClick="Button1_Click" Width="146px" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- /.col -->
            <div class="box-body" id="tipopersona" runat="server" visible="false">
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <h5>Tipo Persona<span class="text-danger">*</span></h5>
                            <div class="controls">
                                <asp:DropDownList ID="tipotercero" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="tipotercero_SelectedIndexChanged">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group" id="iddivnatural" visible="false" runat="server">
            <div class="controls">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Información Personal</h3>
                            </div>
                            <div class="form-element">
                                <div class="box-body">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Direccion</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="TextBoxdireccion" Style="text-transform: uppercase" class="form-control" placeholder="Dirección" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Tipo Documento</label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="DropDownListtipodocu" CssClass="form-control" AppendDataBoundItems="true" runat="server">
                                                <asp:ListItem>Seleccione</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Tipo Factura</label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                <asp:ListItem>Seleccione</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Telefono</label>
                                        <div class="col-sm-9">
                                            <div class="form-group row">
                                                <asp:TextBox ID="TextBoxtelefononatu" type="number" runat="server" CssClass="form-control" placeholder="Telefono" Width="232px"></asp:TextBox>
                                                <div class="col-md-auto">
                                                    <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="textboxtelefonoplus" Text="+" Width="37px" Height="31px" OnClick="textboxtelefonoplus_Click" />
                                                </div>
                                            </div>
                                        </div>
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
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"></h3>
                            </div>
                            <div class="form-element">
                                <div class="box-body">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Nombre</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBoxnombre" Style="text-transform: uppercase" class="form-control" runat="server" placeholder="Nombre"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Apellido</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBox1apellido" class="form-control" Style="text-transform: uppercase" placeholder="Apellido" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Nacimiento</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBox1fecnac" type="date" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Correo</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBoxcorreo" type="email" runat="server" CssClass="form-control" placeholder="Correo"></asp:TextBox>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
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
                                        <asp:DropDownList ID="DropDownListpais" runat="server" CssClass="form-control" AppendDataBoundItems="true" OnSelectedIndexChanged="DropDownListpais_SelectedIndexChanged" AutoPostBack="True">
                                            <asp:ListItem>Seleccione</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Departamento</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="DropDownListdepartamento" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListdepartamento_SelectedIndexChanged">
                                            <asp:ListItem>Seleccione</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Municipio</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="DropDownListmunicipio" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListmunicipio_SelectedIndexChanged">
                                            <asp:ListItem>Seleccione</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Barrio</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="DropDownListbarrio" runat="server" CssClass="form-control" AppendDataBoundItems="true">
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
                        <div class="form-element">
                            <div class="box-body">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Tipo Residencia</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="DropDownListtiporesi" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                            <asp:ListItem>Seleccione</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Estrato</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="DropDownListestrato" runat="server" CssClass="form-control" AppendDataBoundItems="true">
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
                                        <asp:DropDownList ID="DropDownListestado" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                            <asp:ListItem>Seleccione</asp:ListItem>
                                            <asp:ListItem>ACTIVO</asp:ListItem>
                                            <asp:ListItem>INACTIVO</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="box-footer">

                                    <asp:Button ID="Button3" class="btn btn-block btn-success btn-lg" runat="server" Text="Verificar" Width="143px" Height="30px" />


                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>



    </section>

</asp:Content>
