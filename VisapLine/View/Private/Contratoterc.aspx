<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Contratoterc.aspx.cs" Inherits="VisapLine.View.Private.Contratoterc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function panel2() {
            document.getElementById("contr").click();

        }
        function botonmodal() {
            document.getElementById("botonmodal").click();
        }
        function botonmodalcorporativo() {
            document.getElementById("botonmodalcorpo").click();
        }
        function botonmodalempresa() {
            document.getElementById("botonmodalempre").click();
        }
    </script>
    <style>
        textarea {
            resize: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>Contrato</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Contrato</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>

    <section class="content">

        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li><a class="active" id="inf" href="#informacion" data-toggle="tab">Cliente</a></li>
                <li><a href="#contrato" id="contr" data-toggle="tab">Registro Contrato</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="informacion">

                    <!-- Basic Forms -->
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <center><h3 class="card-title">Registro de Cliente</h3></center>
                            <div class="box-tools pull-right">
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <h5>Tipo Persona<span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <asp:DropDownList ID="tipotercero" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="tipotercero_SelectedIndexChanged">
                                                <asp:ListItem>Seleccione</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <%-- NATURAL--%>
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
                                                                        <label class="col-sm-4 col-form-label">Identificación</label>
                                                                        <div class="col-sm-8">
                                                                            <div class="form-group row">
                                                                                <asp:TextBox ID="TextBox1identificacion" class="form-control" Style="text-transform: uppercase" placeholder="Identificación" runat="server" Width="154px"></asp:TextBox>
                                                                                <div class="col-md-auto">
                                                                                    <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button2" Text="buscar" OnClick="Button2_Click" Width="100px" Height="30px" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
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
                                                                        <asp:GridView ID="telefonos" OnRowDeleting="telefonos_RowDeleting" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="false" runat="server">
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
                                                                            <asp:ListItem>Activo</asp:ListItem>
                                                                            <asp:ListItem>Inactivo</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                                <div class="box-footer">

                                                                    <asp:Button ID="Button3" class="btn btn-block btn-success btn-lg" runat="server" Text="Verificar" OnClick="Button3_Click" Width="143px" Height="30px" />

                                                                    <a href="#" id="botonmodal" data-toggle="modal" data-target="#modal-natural" visible="false"></a>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%----CORPORATIVO--%>
                                        <div class="form-group" id="iddivcorporativo" visible="false" runat="server">
                                            <div class="controls">
                                                <div class="row">
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                                        <div class="box box-primary">
                                                            <div class="box-header with-border">
                                                                <h3 class="box-title">Información Corporativa</h3>
                                                            </div>
                                                            <div class="form-element">
                                                                <div class="box-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 col-form-label">Nit</label>
                                                                        <div class="col-sm-8">
                                                                            <div class="form-group row">
                                                                                <asp:TextBox ID="TextBox1corporativo" class="form-control" placeholder="Nit" runat="server" Width="154px"></asp:TextBox>
                                                                                <div class="col-md-auto">
                                                                                    <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Buscarcorporativo" Text="buscar" Width="100px" Height="30px" OnClick="Buscarcorporativo_Click" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 col-form-label">Direccion</label>
                                                                        <div class="col-sm-8">
                                                                            <asp:TextBox ID="TextBoxdireccioncorpo" class="form-control" Style="text-transform: uppercase" placeholder="Dirección" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 col-form-label">Tipo Documento</label>
                                                                        <div class="col-sm-8">
                                                                            <asp:DropDownList ID="DropDownList1tipodocucorpo" CssClass="form-control" AppendDataBoundItems="true" runat="server">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 col-form-label">Tipo Factura</label>
                                                                        <div class="col-sm-8">
                                                                            <asp:DropDownList ID="DropDownList3tipofactucorpo" runat="server" CssClass="form-control" AppendDataBoundItems="true">
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
                                                                        <label class="col-sm-3 col-form-label">Nombre</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:TextBox ID="TextBoxnombrecorpo" class="form-control" runat="server" Style="text-transform: uppercase" placeholder="Nombre"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">

                                                                        <div class="col-sm-9">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Expedicion</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:TextBox ID="TextBoxexpedicioncorpo" type="date" runat="server" class="form-control" placeholder="Apellido"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Correo</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:TextBox ID="TextBoxcorreocorpo" type="email" runat="server" CssClass="form-control" placeholder="Correo"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Telefono</label>
                                                                        <div class="col-sm-9">
                                                                            <div class="form-group row">
                                                                                <asp:TextBox ID="TextBoxtelefocorpo" type="number" runat="server" CssClass="form-control" placeholder="Telefono" Width="232px"></asp:TextBox>
                                                                                <div class="col-md-auto">
                                                                                    <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Buttontelefonocorpo" Text="+" Width="37px" Height="31px" OnClick="Buttontelefonocorpo_Click" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <asp:GridView ID="GridViewtelefonocorpo" OnRowDeleting="telefonocorpo_RowDeleting" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="false" runat="server">
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
                                                </div>
                                                <div class="row">
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                                        <div class="box box-primary">
                                                            <div class="box-header with-border">
                                                                <h3 class="box-title">Información del domicilio </h3>
                                                            </div>
                                                            <div class="form-element">
                                                                <div class="box-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Pais</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownList4paiscorpo" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownList4paiscorpo_SelectedIndexChanged">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Departamento</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownList5departcorpo" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownList5departcorpo_SelectedIndexChanged">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Municipio</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownList6municorpo" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownList6municorpo_SelectedIndexChanged">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Barrio</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownList7barricorpo" runat="server" CssClass="form-control" AppendDataBoundItems="true">
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
                                                                            <asp:DropDownList ID="DropDownListresidenciacorpo" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Estrato</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownListestratocorpo" runat="server" CssClass="form-control" AppendDataBoundItems="true">
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
                                                                            <asp:DropDownList ID="DropDownList10estadocorpo" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                                <asp:ListItem>Activo</asp:ListItem>
                                                                                <asp:ListItem>Inactivo</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="box-footer">
                                                                <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button6" Text="Verificar" Width="143px" Height="30px" OnClick="Button6_Click" />
                                                                <a href="#" id="botonmodalcorpo" data-toggle="modal" data-target="#modal-corporativo"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>


                                        <%--EMPRESA--%>
                                        <div class="form-group" id="iddivempresa" visible="false" runat="server">
                                            <div class="controls">
                                                <div class="row">
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                                        <div class="box box-primary">
                                                            <div class="box-header with-border">
                                                                <h3 class="box-title">Información Corporativa</h3>
                                                            </div>
                                                            <div class="form-element">
                                                                <div class="box-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 col-form-label">Nit</label>
                                                                        <div class="col-sm-8">
                                                                            <div class="form-group row">
                                                                                <asp:TextBox ID="TextBox1empresa" class="form-control" placeholder="Nit" runat="server" Width="154px"></asp:TextBox>
                                                                                <div class="col-md-auto">
                                                                                    <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Buttonbuscarempresa" Text="buscar" Width="100px" Height="30px" OnClick="Buttonbuscarempresa_Click" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 col-form-label">Direccion</label>
                                                                        <div class="col-sm-8">
                                                                            <asp:TextBox ID="TextBoxdireccionempresa" class="form-control" Style="text-transform: uppercase" placeholder="Dirección" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 col-form-label">Tipo Documento</label>
                                                                        <div class="col-sm-8">
                                                                            <asp:DropDownList ID="DropDownListtipodocumentoempresa" CssClass="form-control" AppendDataBoundItems="true" runat="server">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 col-form-label">Tipo Factura</label>
                                                                        <div class="col-sm-8">
                                                                            <asp:DropDownList ID="DropDownListtipofacturaempresa" runat="server" CssClass="form-control" AppendDataBoundItems="true">
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
                                                                        <label class="col-sm-3 col-form-label">Nombre</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:TextBox ID="TextBoxnombreempresa" class="form-control" runat="server" Style="text-transform: uppercase" placeholder="Nombre"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">

                                                                        <div class="col-sm-9">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Expedicion</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:TextBox ID="TextBoxexdicionempresa" type="date" runat="server" class="form-control"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Correo</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:TextBox ID="TextBoxcorreoempresa" type="email" runat="server" CssClass="form-control" placeholder="Correo"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Telefono</label>
                                                                        <div class="col-sm-9">
                                                                            <div class="form-group row">
                                                                                <asp:TextBox ID="TextBoxtelefonoempresa" type="number" runat="server" CssClass="form-control" placeholder="Telefono" Width="232px"></asp:TextBox>
                                                                                <div class="col-md-auto">
                                                                                    <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="cargartelefonoempresa" Text="+" Width="37px" Height="31px" OnClick="cargartelefonoempresa_Click" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <asp:GridView ID="GridViewtelefonoempresa" OnRowDeleting="telefonoempresa_RowDeleting" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="false" runat="server">
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
                                                </div>
                                                <div class="row">
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                                        <div class="box box-primary">
                                                            <div class="box-header with-border">
                                                                <h3 class="box-title">Información del domicilio </h3>
                                                            </div>
                                                            <div class="form-element">
                                                                <div class="box-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Pais</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownListpaisempresa" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListpaisempresa_SelectedIndexChanged">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Departamento</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownListdepartamentoempresa" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListdepartamentoempresa_SelectedIndexChanged">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Municipio</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownListmunicipioempresa" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListmunicipioempresa_SelectedIndexChanged">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Barrio</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownListbarrioempresa" runat="server" CssClass="form-control" AppendDataBoundItems="true">
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
                                                                            <asp:DropDownList ID="DropDownListtiporeidenciaempresa" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Estrato</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownListestratoempresa" runat="server" CssClass="form-control" AppendDataBoundItems="true">
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
                                                                        <label class="col-sm-3 col-form-label">Estado</label>modal-empresarial
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownListestadoempresa" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                                <asp:ListItem>Activo</asp:ListItem>
                                                                                <asp:ListItem>Inactivo</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="box-footer">
                                                                <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button8" Text="Verificar" Width="146px" OnClick="Button8_Click" />
                                                                <a href="#" id="botonmodalempre" data-toggle="modal" data-target="#modal-empresarial"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>

                                    </div>

                                </div>
                                <!-- /.col -->

                                <!-- /.row -->
                            </div>
                            <!-- /.box-body -->
                        </div>

                        <!-- /.box -->
                    </div>
                    <!-- /.box -->
                </div>

                <div class="tab-pane" id="contrato">
                    <div class="box box-primary">
                        <div class="box-header">
                            <center><h2 class="card-title">Crear Contrato</h2></center>
                        </div>


                        <div class="box-body">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">
                                    Codigo:  
                                    <asp:TextBox ID="Textboxcodigocontrato" runat="server" class="form-control" Style="text-transform: uppercase"></asp:TextBox>
                                </label>

                            </div>
                            <div class="box-header with-border">

                                <h3 class="box-title">Información Personal</h3>
                            </div>
                            <div class="row">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="form-element">
                                        <div class="box-body">
                                            <div class="form-group row">
                                                <div class="col-md-auto">
                                                    <table class="table table-responsive" id="tablanatural" visible="false" runat="server">
                                                        <tr>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label1" runat="server" Text="Nombre: "></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Labelnombrecontrato" runat="server" Text=""></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Label2" runat="server" Text="Apellido: "></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Labelapellidocontrato" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label3" runat="server" Text="Cedula o Nit: "></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Labelcedulacontrato" runat="server" Text=""></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Label4" runat="server" Text="Correo: "></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Labelcorreocontrato" runat="server" Text=""></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label5" runat="server" Text="Direccion:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Labeldireccioncontrato" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table class="table table-responsive" id="Tablecorporacionempresa" visible="false" runat="server">
                                                        <tr>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label6" runat="server" Text="Nombre: "></asp:Label><asp:Label ID="Label7" runat="server" Text=""></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Label10" runat="server" Text="Nit: "></asp:Label><asp:Label ID="Label11" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label12" runat="server" Text="Correo: "></asp:Label><asp:Label ID="Label13" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label14" runat="server" Text="Direccion:"></asp:Label><asp:Label ID="Label15" runat="server" Text=""></asp:Label>
                                                            </td>

                                                        </tr>
                                                    </table>
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
                                                        <asp:DropDownList ID="DropDownListpaiscontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListpaiscontrato_SelectedIndexChanged">
                                                            <asp:ListItem>Seleccione</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Departamento</label>
                                                    <div class="col-sm-9">
                                                        <asp:DropDownList ID="DropDownListdepartamentocontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListdepartamentocontrato_SelectedIndexChanged">
                                                            <asp:ListItem>Seleccione</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Municipio</label>
                                                    <div class="col-sm-9">
                                                        <asp:DropDownList ID="DropDownListmunicipiocontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListmunicipiocontrato_SelectedIndexChanged">
                                                            <asp:ListItem>Seleccione</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Barrio</label>
                                                    <div class="col-sm-9">
                                                        <asp:DropDownList ID="DropDownListbarriocontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                            <asp:ListItem>Seleccione</asp:ListItem>
                                                        </asp:DropDownList>

                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Estrato</label>
                                                    <div class="col-sm-9">
                                                        <asp:DropDownList ID="DropDownListestratocontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListestratocontrato_SelectedIndexChanged">
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
                                                    <label class="col-sm-3 col-form-label">Direccion</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" placeholder="CLL 27 2B-17"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Tipo Residencia</label>
                                                    <div class="col-sm-9">
                                                        <asp:DropDownList ID="DropDownListtiporedenciacontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                            <asp:ListItem>Seleccione</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="box box-default">
                                    <div class="box box-primary">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">Planes</h3>
                                        </div>

                                        <div class="row" style="overflow-y: scroll">
                                            <asp:GridView ID="GridView2" runat="server" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" class="table table-bordered table-striped table-responsive" AutoGenerateColumns="false" OnRowDataBound="GridView2_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                                <Columns>
                                                    <asp:CommandField ShowSelectButton="true" />
                                                    <asp:BoundField HeaderText="Codigo de Plan" DataField="idplan" />
                                                    <asp:BoundField HeaderText="Valor" DataField="valor" />
                                                    <asp:BoundField HeaderText="Detalle" DataField="detalle" />
                                                    <asp:CheckBoxField HeaderText="Telefonia" DataField="telefonia" Text=" " ItemStyle-CssClass="filled-in chk-col-green" />
                                                    <asp:CheckBoxField HeaderText="Television" DataField="television" Text=" " />
                                                    <asp:CheckBoxField HeaderText="Internet" DataField="internet" Text=" " />
                                                    <asp:BoundField HeaderText="Subida" DataField="subida" />
                                                    <asp:BoundField HeaderText="Bajada" DataField="bajada" />
                                                    <asp:BoundField HeaderText="Medio Conexion" DataField="medioconexion" />
                                                    <asp:CheckBoxField HeaderText="Wifi" DataField="wifi" Text=" " />
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                                <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                                                <RowStyle BackColor="#EFF3FB"></RowStyle>

                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                                <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                                                <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                                                <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                                                <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                                            </asp:GridView>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
                                    <div class="box box-primary">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">Plan seleccionado</h3>
                                        </div>
                                        <div class="form-element">
                                            <div class="box-body">
                                                <div class="form-group row">
                                                    <label class="col-sm-8 col-form-label">
                                                        Subida:
                                                                <asp:Label ID="Labelsubidaplancontrato" runat="server" Text=" 0"></asp:Label>BM</label>

                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-8 col-form-label">
                                                        Bajada:
                                                                <asp:Label ID="Labelbajadaplancontrato" runat="server" Text=" 0"></asp:Label>BM</label>

                                                </div>

                                                <div class="form-group row">
                                                    <label class="col-sm-8 col-form-label">
                                                        Detalle:<textarea id="TextArea1detalleplan" runat="server" data-iconlibrary="fa" rows="5" readonly="true" resize="none" data-hidden-buttons="cmdBold" style="margin-top: 0px; margin-bottom: 0px; height: 118px;" required data-validation-required-message="This field is required"></textarea>

                                                    </label>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
                                    <div class="box box-primary">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"></h3>
                                        </div>
                                        <div class="form-element">
                                            <div class="box-body">
                                                <div class="form-group row">
                                                    <label class="col-sm-8 col-form-label">
                                                        Conectividad:
                                                                <asp:Label ID="Labelmedioconexionplancontrato" runat="server" Text="Ninguna"></asp:Label>
                                                    </label>

                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-8 col-form-label">
                                                        Valor: 
                                                        <asp:Label ID="Labelvaloriva" runat="server" Text="0"></asp:Label>$
                                                    </label>
                                                </div>

                                                <div class="form-group row">
                                                    <label class="col-sm-5 col-form-label">
                                                        Valor instalacion:                                                        
                                                    </label>
                                                    <div class="col-sm-5">
                                                        <asp:TextBox ID="Textboxvalorinstalacion" runat="server" type="number" class="form-control" placeholder="$"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-12 col-form-label">
                                                        Fecha de Inicio de permanencia: 
                                                            <asp:TextBox ID="Textboxfechainiciopermanencia" runat="server" type="date" class="form-control"></asp:TextBox>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
                                    <div class="box box-primary">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"></h3>
                                            <div class="form-element">
                                                <div class="box-body">

                                                    <div class="form-group row">
                                                        <label class="col-sm-12 col-form-label">
                                                            Fecha de Finalizacion de permanencia:   
                                                            <asp:TextBox ID="Textbox4" runat="server" type="date" class="form-control"></asp:TextBox>
                                                        </label>

                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-12 col-form-label">
                                                            Fecha de activacion del servicio:
                                                             <asp:TextBox ID="Textbox5" runat="server" type="date" class="form-control"></asp:TextBox>
                                                        </label>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Estado</label>
                                                        <div class="col-sm-9">
                                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                <asp:ListItem>Activo</asp:ListItem>
                                                                <asp:ListItem>Inactivo</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Iva</label>
                                                        <div class="col-sm-9">
                                                            <asp:TextBox ID="TextBoxivacontrato" CssClass="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-12 col-form-label">
                                                            Sub Total:     
                                                            <asp:TextBox ID="Textbox2" runat="server" type="number" class="form-control" placeholder="$"></asp:TextBox>
                                                        </label>

                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-12 col-form-label">
                                                            Total:   
                                                            <asp:TextBox ID="Textbox3" runat="server" type="number" class="form-control" placeholder="$"></asp:TextBox>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div class="modal fade" id="modal-natural">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Confirmacion de datos Personales</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="box box-primary bg-transparent">
                                <div class="form-element">
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <th>Datos Insertados</th>
                                                    <th>Datos Insertados</th>
                                                </tr>

                                                <tr>
                                                    <td>Tipo Persona:<asp:Label ID="labelnaturaltipopersona" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Identificacion:<asp:Label ID="labelidentificacionnatural" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Tipo Documento:<asp:Label ID="labeltipodocumentonatural" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Tipo Factura:<asp:Label ID="labeltipofacturanatural" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Nombre:<asp:Label ID="labelnombrenatural" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Apellido:<asp:Label ID="labelapellidonatural" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Nacimiento:<asp:Label ID="labelnacimientonatural" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Correo:<asp:Label ID="labelcorreonatural" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Estado:<asp:Label ID="labelestadonatural" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Barrio:<asp:Label ID="labelbarrionatural" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Residencia:<asp:Label ID="labeltiporesidencianatural" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Estrato:<asp:Label ID="labelestratonatural" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button1" Text="Guardar" Width="146px" OnClick="Button1_Click" />
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="Button5" runat="server" Text="Cancelar" class="btn btn-block btn-danger btn-lg" Width="146px" data-dismiss="modal" />
                                                    </td>
                                                </tr>

                                            </table>
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



            <div class="modal fade" id="modal-corporativo">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Confirmacion de datos</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="box box-primary bg-transparent">
                                <div class="form-element">
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <th>Datos Insertados</th>
                                                    <th>Datos Insertados</th>
                                                </tr>

                                                <tr>
                                                    <td>Tipo:<asp:Label ID="labeltipocorporativo" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Nit:<asp:Label ID="labelnitcorporativo" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Tipo Documento:<asp:Label ID="labeltipodocumentocorporativo" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Tipo Factura:<asp:Label ID="labeltipofacturacorporativo" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Nombre:<asp:Label ID="labelnombrecorporativo" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Expedicion:<asp:Label ID="labelexpedicioncorporativo" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Residencia:<asp:Label ID="labelresidenciacorporativo" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Correo:<asp:Label ID="labelcorreocorporativo" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Estrato:<asp:Label ID="labelestratocorporativo" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Barrio:<asp:Label ID="label1barriocorporativo" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Estado:<asp:Label ID="labelestadocorporativo" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Buttonguardarcorpo" Text="Guardar" Width="143px" Height="30px" OnClick="Buttonguardarcorpo_Click" />

                                                    </td>
                                                    <td>
                                                        <asp:Button ID="Button7" runat="server" Text="Cancelar" class="btn btn-block btn-danger btn-lg" Width="146px" data-dismiss="modal" />
                                                    </td>
                                                </tr>

                                            </table>
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


            <div class="modal fade" id="modal-empresarial">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Confirmacion de datos</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="box box-primary bg-transparent">
                                <div class="form-element">
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <th>Datos Insertados</th>
                                                    <th>Datos Insertados</th>
                                                </tr>

                                                <tr>
                                                    <td>Tipo:<asp:Label ID="label1tipoempresarial" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Nit:<asp:Label ID="labelnitempresarial" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Tipo Documento:<asp:Label ID="labeltipodocuemntoempresarial" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Tipo Factura:<asp:Label ID="labeltipofacturalempresarial" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Nombre:<asp:Label ID="labelnombreempresarial" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Expedicion:<asp:Label ID="labelexpedicionempresarial" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Residencia:<asp:Label ID="labelresidenciaempresarial" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Correo:<asp:Label ID="labelcorreoempresarial" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Estrato:<asp:Label ID="labelestratoempresarial" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                    <td>Barrio:<asp:Label ID="labelbarrioempresarial" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Estado:<asp:Label ID="label1estadoempresarial" class="col-sm-4 col-form-label" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Buttonguardarempresa" Text="Verificar" Width="143px" Height="30px" OnClick="Buttonguardarempresa_Click" />

                                                    </td>
                                                    <td>
                                                        <asp:Button ID="Button9" runat="server" Text="Cancelar" class="btn btn-block btn-danger btn-lg" Width="146px" data-dismiss="modal" />
                                                    </td>
                                                </tr>

                                            </table>
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

        </div>

    </section>

</asp:Content>
