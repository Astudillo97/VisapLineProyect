<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="RegistroTerceros.aspx.cs" Inherits="VisapLine.View.Private.RegistroTerceros" %>

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
            });
        }
        function alerterror() {
            swal("NO SE REGISTRO!", "No se registro el formulario", "error");
        }
        function nocontro() {
            swal("NO SE ENCONTRO NINGUN REGISTRO!", "Registra por favor el cliente", "success");
        }
        function errorsoft() {
            swal("NO SE COMPLETO TODO EL FORMULARIO!", "Verficar los campos", "error");
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
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-3 col-form-label">CC o Nit:</label>
                            <div class="col-sm-9">
                                <asp:TextBox runat="server" CssClass="form-control" ID="texboxdni" Style="text-transform: uppercase"></asp:TextBox>
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

        <%--        NATURAL--%>


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
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label"></label>
                                            <div class="col-sm-8">
                                                <asp:GridView ID="telefonos" OnRowDeleting="telefonos_RowDeleting" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="false" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                                    <Columns>
                                                        <asp:BoundField DataField="idtelefono" HeaderText="Codigo"></asp:BoundField>
                                                        <asp:BoundField DataField="telefono" HeaderText="Celular"></asp:BoundField>
                                                        <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="p-0"></asp:CommandField>
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
                                    <label class="col-sm-3 col-form-label">Depart</label>
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
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <center>
                     <asp:Button ID="Button3" class="btn btn-block btn-success btn-lg" OnClick="Button3_Click" runat="server" Text="Guardar" Width="143px" Height="30px" />
                      </center>
        </div>


        <%--     COPORATIVO--%>

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
                                        <asp:GridView ID="GridViewtelefonocorpo" OnRowDeleting="GridViewtelefonocorpo_RowDeleting" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="false" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                            <Columns>
                                                <asp:BoundField DataField="idtelefono" HeaderText="Codigo"></asp:BoundField>
                                                <asp:BoundField DataField="telefono" HeaderText="Celular"></asp:BoundField>
                                                <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="p-0"></asp:CommandField>
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
                                        <label class="col-sm-3 col-form-label">Depart</label>
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
                                                <asp:ListItem>ACTIVO</asp:ListItem>
                                                <asp:ListItem>INACTIVO</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="box box-default">
                            <div class="box-header with-border">
                                <h3 class="box-title">Sucursal    
                                </h3>
                                <div class="box-tools pull-right">
                                    <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Buttonsucursal" Text="+" Width="40px" Height="31px" OnClick="Buttonsucursal_Click" />
                                </div>
                            </div>
                            <div class="form-element" id="divsucursal" visible="false" runat="server">
                                <div class="box-body">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Nombre:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBoxnombresucursaltercero" Style="text-transform: uppercase" class="form-control" runat="server" placeholder="Nombre"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Descripcion:</label>
                                        <div class="col-sm-9">
                                            <textarea id="TextAreadescripcionsucursal" class="form-control" data-iconlibrary="fa" data-hidden-buttons="cmdBold" runat="server" cols="20" rows="2" style="text-transform: uppercase; margin-top: 0px; margin-bottom: 0px; height: 97px;"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Direccion:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBoxdireccionsucursal" runat="server" class="form-control" placeholder="Direccion" Style="text-transform: uppercase"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Barrio</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="DropDownListbarriosucursal" CssClass="form-control" runat="server">
                                                <asp:ListItem>Seleccione</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-9">
                                            <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Buttoncargarsucursal" Text="Cargar" Width="80px" Height="31px" OnClick="Buttoncargarsucursal_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="box box-default">
                            <div class="box-header with-border">
                                <h3 class="box-title">Sucursal    
                                </h3>
                            </div>
                            <div class="form-element">
                                <asp:GridView ID="GridViewsucursalecorpo" OnRowDeleting="GridViewsucursalecorpo_RowDeleting" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="false" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                    <Columns>
                                        <asp:BoundField DataField="idsucursal" HeaderText="Codigo"></asp:BoundField>
                                        <asp:BoundField DataField="nombre" HeaderText="Nombre"></asp:BoundField>
                                        <asp:BoundField DataField="descripcion" HeaderText="Descripcion"></asp:BoundField>
                                        <asp:BoundField DataField="direccion" HeaderText="Direccion"></asp:BoundField>
                                        <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="p-0"></asp:CommandField>
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
            </div>
            <center>
            <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button6" Text="Guardar" Width="143px" Height="30px" OnClick="Button6_Click" />
            </center>
        </div>

        <%-- ESPECIAL--%>

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
                                        <asp:GridView ID="GridViewtelefonoempresa" OnRowDeleting="GridViewtelefonoempresa_RowDeleting" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="false" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                            <Columns>
                                                <asp:BoundField DataField="idtelefono" HeaderText="Codigo"></asp:BoundField>
                                                <asp:BoundField DataField="telefono" HeaderText="Celular"></asp:BoundField>
                                                <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="p-0"></asp:CommandField>
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
                                        <label class="col-sm-3 col-form-label">Estado</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="DropDownListestadoempresa" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                <asp:ListItem>ACTIVO</asp:ListItem>
                                                <asp:ListItem>INACTIVO</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="box box-default">
                            <div class="box-header with-border">
                                <h3 class="box-title">Sucursal    
                                </h3>
                                <div class="box-tools pull-right">
                                    <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Buttoncargarsucursalempre" Text="+" Width="40px" Height="31px" OnClick="Buttoncargarsucursalempre_Click" />
                                </div>
                            </div>
                            <div class="form-element" id="divsucursalempre" visible="false" runat="server">
                                <div class="box-body">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Nombre:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBoxnombresucursalempre" Style="text-transform: uppercase" class="form-control" runat="server" placeholder="Nombre"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Descripcion:</label>
                                        <div class="col-sm-9">
                                            <textarea id="TextAreadescripcionsucursalempre" runat="server" cols="20" rows="2" class="form-control" data-iconlibrary="fa" data-hidden-buttons="cmdBold" style="text-transform: uppercase; margin-top: 0px; margin-bottom: 0px; height: 97px;"></textarea>

                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Direccion:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBoxdireccionsucursalempre" runat="server" class="form-control" placeholder="Direccion" Style="text-transform: uppercase"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Barrio</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="DropDownListbarriosucursalempre" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                                <asp:ListItem>Seleccione</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-9">
                                            <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Buttoncargarsucursalempresatbla" Text="Cargar" Width="80px" Height="31px" OnClick="Buttoncargarsucursalempresatbla_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="box box-default">
                            <div class="box-header with-border">
                                <h3 class="box-title">Sucursal    
                                </h3>
                            </div>
                            <div class="form-element">
                                <asp:GridView ID="GridViewsucursalempre" OnRowDeleting="GridViewsucursalempre_RowDeleting" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="false" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                    <Columns>
                                        <asp:BoundField DataField="idsucursal" HeaderText="Codigo"></asp:BoundField>
                                        <asp:BoundField DataField="nombre" HeaderText="Nombre"></asp:BoundField>
                                        <asp:BoundField DataField="descripcion" HeaderText="Descripcion"></asp:BoundField>
                                        <asp:BoundField DataField="direccion" HeaderText="Direccion"></asp:BoundField>
                                        <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="p-0"></asp:CommandField>
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
            </div>
            <center>
                <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button8" Text="Guardar" Width="146px" OnClick="Button8_Click" />
             </center>
        </div>
    </section>
</asp:Content>
