<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Contratoterc.aspx.cs" Inherits="VisapLine.View.Private.Contratoterc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function panel2() {
            document.getElementById("reg").click();
        }
        function panel3() {
            document.getElementById("pan3").click();
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>Contrato</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Registro</li>
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
                <li><a href="#contratos" id="reg" data-toggle="tab">Registro Contrato</a></li>
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
                                            <asp:DropDownList ID="tipotercero" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" required data-validation-required-message="This field is required" OnSelectedIndexChanged="tipotercero_SelectedIndexChanged">
                                                <asp:ListItem>Seleccione</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group" id="iddivnatural" visible="false" runat="server">

                                            <div class="controls">
                                                <div class="row">
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                                        <div class="box box-primary">
                                                            <div class="box-header with-border">
                                                                <h3 class="box-title">Información </h3>
                                                            </div>
                                                            <div class="form-element">
                                                                <div class="box-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 col-form-label">Direccion</label>
                                                                        <div class="col-sm-8">
                                                                            <asp:TextBox ID="TextBoxdireccion" class="form-control" placeholder="Dirección" runat="server"></asp:TextBox>
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
                                                                        <label class="col-sm-4 col-form-label">Tipo Residencia</label>
                                                                        <div class="col-sm-8">

                                                                            <asp:DropDownList ID="DropDownListtipord" runat="server" CssClass="form-control" AppendDataBoundItems="true">
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
                                                                <h3 class="box-title">Información Personal</h3>
                                                            </div>
                                                            <div class="form-element">
                                                                <div class="box-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Identificación</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:TextBox ID="TextBox1identificacion" class="form-control" placeholder="Identificación" runat="server"></asp:TextBox>

                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Nombre</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:TextBox ID="TextBoxnombre" class="form-control" runat="server" placeholder="Nombre"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Apellido</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:TextBox ID="TextBox1apellido" class="form-control"  placeholder="Apellido" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Nacimiento</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:TextBox ID="TextBox1fecnac" type="date" runat="server" class="form-control" placeholder="Apellido"></asp:TextBox>
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
                                                                            <asp:DropDownList ID="DropDownListpais" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Departamento</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownListdepartamento" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true">
                                                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Municipio</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownListmunicipio" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true">
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
                                                                <h3 class="box-title">Información Personal</h3>
                                                            </div>
                                                            <div class="form-element">
                                                                <div class="box-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Correo</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:TextBox ID="TextBoxcorreo" type="email" runat="server" CssClass="form-control" placeholder="Correo"></asp:TextBox>

                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Estrato</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:DropDownList ID="DropDownListestrato" runat="server" CssClass="form-control"  AppendDataBoundItems="true" AutoPostBack="true"  OnSelectedIndexChanged="DropDownListestrato_SelectedIndexChanged">
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
                                                                        <label class="col-sm-3 col-form-label">Iva</label>
                                                                        <div class="col-sm-9">
                                                                            <asp:TextBox ID="TextBoxiva" class="form-control" placeholder="Iva" runat="server"></asp:TextBox>

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
                                                                </div>
                                                            </div>
                                                            <div class="box-footer">
                                                                <button class="btn btn-primary" runat="server">Cancelar</button>
                                                                <button class="btn btn-primary float-right" runat="server">Guardar</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group" id="divcorporacion" visible="false" runat="server">
                                            <h5>Tipo Persona<span class="text-danger">*</span></h5>
                                            <div class="controls">
                                            </div>
                                        </div>
                                        <div class="form-group" id="divempresa" visible="false" runat="server">
                                            <h5>Tipo Persona<span class="text-danger">*</span></h5>
                                            <div class="controls">
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

            </div>
        </div>
    </section>

</asp:Content>
