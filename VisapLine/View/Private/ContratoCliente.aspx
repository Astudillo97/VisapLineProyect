<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="ContratoCliente.aspx.cs" Inherits="VisapLine.View.Private.ContratoCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        textarea {
            resize: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="respust" runat="server"></asp:ScriptManager>
    <script src="../../Contenido/assets/vendor_components/sweetadlert/sweetalert.min.js"></script>
    <script type="text/javascript">
        function deletealert() {
            swal({
                title: "SE REGISTRO CON EXITO El CLIENTE!",
                text: "Se ha registrado con exito ",
                type: "success"
            });
        }
        function errornocargo() {
            swal({
                title: "DEBE REDIRIGIRSE A REGISTRO DE CLIENTE!",
                text: "NO se a logrado conectarse",
                type: "error"
            }, function () {
                window.location.href = "RegistroTerceros.aspx";
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
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>

    <section class="content-header">
        <h1>Contrato</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Contrato</li>
        </ol>
    </section>
    <section class="content">

        <div class="box box-default">
            <div class="box-header">
                <center><h2 class="card-title">Crear Contrato</h2></center>
            </div>
            <div class="box-body">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Contrato N°:</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="TextBox4" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="box box-default">
                            <div class="box-header with-border">
                                <h3 class="box-title">Datos del Cliente</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-4">
                                        <img src="../../Contenido/images/user2-160x160.jpg" height="125px" width="125px" />
                                    </div>
                                    <div class="col-7">
                                        <div class="form-group row">
                                            <asp:Label ID="Labelidtercero" runat="server" Text="" Visible="false"></asp:Label>
                                            <label class="col-sm-4 col-form-label">Nombre:</label>
                                            <div class="col-sm-8">
                                                <asp:Label ID="Label1" runat="server" CssClass="form-control bg-gray" Width="200px" Height="45" Text=""></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label id="idapellidolabel" runat="server" class="col-sm-4 col-form-label">Apellido:</label>
                                            <div class="col-sm-8">
                                                <asp:Label ID="Label2" CssClass="form-control bg-gray" Width="200px" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">Direccion:</label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="TextBox1" TextMode="MultiLine" Rows="5" Columns="15" runat="server" class="form-control bg-gray" Enabled="false" Width="200px" Height="100px"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="box-header with-border">
                            <h3 class="box-title">Información de Residencia </h3>
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
                        <h3 class="box-title"></h3>
                    </div>
                    <div class="form-element">
                        <div class="box-body">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Tipo Residencia</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="DropDownListtiporedenciacontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Direccion de envio factura:</label>
                                <div class="col-sm-9">
                                    <%--<div id="direccioncasa" runat="server" visible="false">
                                        <asp:DropDownList ID="DropDownListd" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem Value="Cl">CALLE</asp:ListItem>
                                            <asp:ListItem Value="Cr">CARRERA</asp:ListItem>
                                            <asp:ListItem Value="Trans">TRANSVERSAL</asp:ListItem>
                                            <asp:ListItem Value="Diag">DIAGONAL</asp:ListItem>
                                            <asp:ListItem Value="Av">AVENIDA</asp:ListItem>
                                            <asp:ListItem Value="AK">AVENIDA CARRERA</asp:ListItem>
                                            <asp:ListItem Value="AC">AVENIDA CALLE</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:TextBox ID="TextBoxd" runat="server" Width="24px"> </asp:TextBox>
                                        <asp:TextBox ID="TextBoxd2" runat="server" Width="17px" MaxLength="1"></asp:TextBox>
                                        <asp:DropDownList ID="DropDownList2" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>BIS</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:TextBox ID="TextBoxd3" runat="server" Width="17px" MaxLength="1"></asp:TextBox>
                                        <asp:DropDownList ID="DropDownList3" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem Value="N">NORTE</asp:ListItem>
                                            <asp:ListItem Value="S">SUR</asp:ListItem>
                                            <asp:ListItem Value="E">ESTE</asp:ListItem>
                                            <asp:ListItem Value="O">OESTE</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:TextBox ID="TextBoxd5" runat="server" Width="56px"></asp:TextBox>
                                        <asp:TextBox ID="TextBoxd6" runat="server" Width="16px" MaxLength="1"></asp:TextBox>
                                        <asp:TextBox ID="TextBoxd7" runat="server" Width="33px"></asp:TextBox>
                                        <asp:DropDownList ID="DropDownList4" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem Value="N">NORTE</asp:ListItem>
                                            <asp:ListItem Value="S">SUR</asp:ListItem>
                                            <asp:ListItem Value="E">ESTE</asp:ListItem>
                                            <asp:ListItem Value="O">OESTE</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>--%>
                                    <asp:TextBox ID="TextBoxenviofactura" TextMode="MultiLine" Rows="5" Columns="15" runat="server"  class="form-control" Style="text-transform: uppercase; margin-top: 0px; margin-bottom: 0px; height: 105px;"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">
                                    Observacion:                                                       
                                </label>
                                <div class="col-sm-9">
                                    <textarea id="TextArea1" resize="none" data-hidden-buttons="cmdBold" class="form-control" data-iconlibrary="fa" runat="server" cols="20" rows="2" style="text-transform: uppercase; margin-top: 0px; margin-bottom: 0px; height: 105px;"></textarea>
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
                                <label class="col-sm-3 col-form-label">Estrato</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="DropDownListestratocontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true">
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
                                <label id="idsucursallabel" runat="server" class="col-sm-3 col-form-label">Sucursal</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="DropDownListsucursalcontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true">
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
                    <asp:GridView ID="GridView2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" class="table table-bordered table-striped" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView2_PageIndexChanging" PageSize="10" AllowPaging="True">
                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                        <Columns>
                            <asp:CommandField ShowSelectButton="true" SelectText="" ControlStyle-CssClass="glyphicon glyphicon-edit">
                                <ControlStyle CssClass="glyphicon glyphicon-edit"></ControlStyle>
                            </asp:CommandField>
                            <asp:BoundField HeaderText="Codg" DataField="idplan" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Valor" DataField="valor" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Detalle" DataField="detalle" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:CheckBoxField HeaderText="Telefonia" DataField="telefonia" Text=" " ItemStyle-HorizontalAlign="Center" ControlStyle-CssClass="filled-in">
                                <ControlStyle CssClass="filled-in" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:CheckBoxField>
                            <asp:CheckBoxField HeaderText="Television" DataField="television" Text=" " ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" CssClass="filled-in"></ItemStyle>
                            </asp:CheckBoxField>
                            <asp:CheckBoxField HeaderText="Internet" DataField="internet" Text=" " ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:CheckBoxField>
                            <asp:BoundField HeaderText="Subida" DataField="subida" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Bajada" DataField="bajada" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerSettings Mode="NextPreviousFirstLast" />

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
                                    <asp:Label ID="Labelsubidaplancontrato" runat="server" CssClass="form-control bg-gray" Text="0"></asp:Label>BM</label>
                                <asp:Label ID="dnitercero" runat="server" Visible="false" Text=""></asp:Label>

                            </div>
                            <div class="form-group row">
                                <label class="col-sm-8 col-form-label">
                                    Bajada:
                                                                <asp:Label ID="Labelbajadaplancontrato" runat="server" CssClass="form-control bg-gray" Text=" 0"></asp:Label>BM</label>

                            </div>

                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">
                                    Wifi:    
                                </label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="DropDownListWIFI" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>SI</asp:ListItem>
                                        <asp:ListItem>NO</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-8 col-form-label">
                                    Valor: 
                                                        <asp:Label ID="Labelvaloriva" runat="server" CssClass="form-control bg-gray" Text="0"></asp:Label>$
                                </label>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">
                                    Detalle:
                                </label>
                                <textarea id="TextArea1detalleplan" runat="server" readonly="false" rows="5" resize="none" style="text-transform: uppercase; margin-top: 0px; margin-bottom: 0px; width: 210px; height: 115px;" required data-validation-required-message="This field is required"></textarea>

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
                           <%-- <div class="form-group row">
                                <label class="col-sm-12 col-form-label">
                                    Fecha de activacion del servicio:    
                                                            <asp:TextBox ID="Textboxfechaactivacionservicio" runat="server" type="date" class="form-control"></asp:TextBox>
                                </label>
                            </div>--%>
                            <div class="form-group row">
                                <label class="col-sm-12 col-form-label">
                                    Fecha de Facturacion:    
                                                            <asp:TextBox ID="Textboxfechafacturacion" runat="server" type="date" class="form-control"></asp:TextBox>
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
                                    <label class="col-sm-4 col-form-label">
                                        Tipo Contrato:                                                           
                                    </label>
                                    <asp:DropDownList ID="DropDownListtipocontrato" runat="server" Width="180" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Estado:</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="DropDownListestadocontrato" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                            <asp:ListItem>Seleccione</asp:ListItem>
                                            <asp:ListItem>ACTIVO</asp:ListItem>
                                            <asp:ListItem>POR INSTALAR</asp:ListItem>
                                            <asp:ListItem>EXONERADO</asp:ListItem>
                                            <asp:ListItem>INACTIVO</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Iva</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="TextBoxivacontrato" CssClass="form-control" type="number" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-5 col-form-label">
                                        Valor instalacion:                                                        
                                    </label>
                                    <asp:TextBox ID="Textboxvalorinstalacion" runat="server" type="number" Width="150px" class="form-control" placeholder="$"></asp:TextBox>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Total</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" placeholder="$" type="number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <center>

            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" style='width:150px; height:35px' data-target="#modal-default">
                GUARDAR
            </button>

        </center>


        <div class="modal fade" id="modal-default">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title align-content-lg-center">¿Desea guardar el contrato y ir a servicio?</h5>
                    </div>
                    <div class="modal-footer">
                        <center>

                         <table>
                             <tr>
                         <%--    <td> <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button4ontrato" Text="Guardar" OnClick="Button4ontrato_Click" Width="146px" /></td>
                         --%>    <td> <asp:Button ID="Button2" class="btn btn-block btn-info btn-lg" OnClick="Button2_Click" runat="server" Text="Ir a Servicio" Width="146px" /></td>
                        </tr>
                                 </table>
                       
                       </center>

                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </section>


</asp:Content>
