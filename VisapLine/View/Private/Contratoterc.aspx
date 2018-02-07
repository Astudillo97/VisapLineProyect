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

        function botonmodalcontrato() {
            document.getElementById("botonmodalcontr").click();
        }



    </script>
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
                title: "SE REGISTRO CON EXITO El CLIENTE!",
                text: "Se ha registrado con exito ",
                type: "success"
            });
        }
        function alerterror() {
            swal("NO SE REGISTRO!", "No se registro el formulario", "error");
        }
        function nocontro() {
            swal("NO SE ENCOTRO NINGUN REGISTRO!", "Debe registrar el cliente", "error");
        }
        function errorsoft() {
            swal("SE ENCONTRADO UN ERROR, CONTACTESE CON EL ADMINISTRADOR!", "Debe registrar el cliente", "error");
        }
    </script>


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
            <div class="box box-primary">
                <div class="box-header">
                    <center><h2 class="card-title">Crear Contrato</h2></center>
                </div>
                <div class="box-body">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">
                            Codigo: 
                                    <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
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
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label6" runat="server" Text="Nombre: "></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="Label7" runat="server" Text=""></asp:Label>

                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label10" runat="server" Text="Nit: "></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label12" runat="server" Text="Correo: "></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label13" runat="server" Text=""></asp:Label>

                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label14" runat="server" Text="Direccion:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label15" runat="server" Text=""></asp:Label>
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
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Sucursal</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownListsucursalcontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true" OnSelectedIndexChanged="DropDownListsucursalcontrato_SelectedIndexChanged">
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
                                            <label class="col-sm-3 col-form-label">Direccion</label>
                                            <div class="col-sm-9">
                                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Style="text-transform: uppercase" placeholder="CLL 27 2B-17"></asp:TextBox>
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
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Envio de Factura</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                    <asp:ListItem>CORREO</asp:ListItem>
                                                    <asp:ListItem>DOMICILIO</asp:ListItem>
                                                    <asp:ListItem>AMBOS</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">
                                                Observacion:                                                       
                                            </label>
                                            <div class="col-sm-9">
                                                <textarea id="TextArea1" cols="20" runat="server" rows="5" resize="none" data-hidden-buttons="cmdBold" style="margin-top: 0px; margin-bottom: 0px; height: 118px;"></textarea>

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
                                <asp:GridView ID="GridView2" runat="server" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" class="table table-bordered table-striped" AutoGenerateColumns="false" OnRowDataBound="GridView2_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="true" />
                                        <asp:BoundField HeaderText="Codg" DataField="idplan" />
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
                                                Subida:<asp:Label ID="Labeldipalcontra" runat="server" Text="Label" Visible="false"></asp:Label>
                                                <asp:Label ID="Labelsubidaplancontrato" runat="server" Text=" 0"></asp:Label>BM</label>

                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-8 col-form-label">
                                                Bajada:
                                                                <asp:Label ID="Labelbajadaplancontrato" runat="server" Text=" 0"></asp:Label>BM</label>

                                        </div>
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
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-form-label">
                                                Fecha de Finalizacion de permanencia:   
                                                            <asp:TextBox ID="Textboxfechafinalizacionpermanencia" runat="server" type="date" class="form-control"></asp:TextBox>
                                            </label>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-form-label">
                                                Fecha de activacion del servicio:    
                                                            <asp:TextBox ID="Textboxfechaactivacionservicio" runat="server" type="date" class="form-control"></asp:TextBox>
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
                                                    Fecha de Facturacion:    
                                                            <asp:TextBox ID="Textboxfechafacturacion" runat="server" type="date" class="form-control"></asp:TextBox>
                                                </label>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">
                                                    Factura Unica:                                                           
                                                </label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownListfacturaunicacontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                        <asp:ListItem>Seleccione</asp:ListItem>
                                                        <asp:ListItem>UNICA</asp:ListItem>
                                                        <asp:ListItem>GRUPAL</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-12 col-form-label">
                                                    Tipo Contrato:                                                           
                                                </label>
                                                <div class="col-sm-12">
                                                    <asp:DropDownList ID="DropDownListtipocontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                        <asp:ListItem>Seleccione</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Estado:</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownListestadocontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                        <asp:ListItem>Seleccione</asp:ListItem>
                                                        <asp:ListItem>ACTIVO</asp:ListItem>
                                                        <asp:ListItem>INACTIVO</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Iva</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBoxivacontrato" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Total</h3>
                                </div>
                                <div class="col-sm-8">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Total</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" placeholder="$" type="number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-9">

                                            <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button4cargarmodalcontrato" Text="Guardar" OnClick="Button4cargarmodalcontrato_Click" Width="146px" />
                                            <a href="#" id="botonmodalcontr" data-toggle="modal" data-target="#modal-contrato"></a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="modal-contrato">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">¿Esta seguro que quiere guardar el contrato?</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="box box-primary bg-transparent">
                            <div class="row">
                                <div class="col-sm-6">
                                    <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Buttonguardarcontrato" Text="Crear Contrato" Width="146px" OnClick="Buttonguardarcontrato_Click" />
                                </div>
                                <div class="col-sm-6">
                                    <asp:Button ID="Button4" runat="server" Text="Cancelar" class="btn btn-block btn-danger btn-lg" Width="146px" data-dismiss="modal" />
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
