<%@ Page Title="Reporte Visapline C & C Vision SAS" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="VisapLine.View.Private.Reporte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h2>Reporte de clientes
        </h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Reporte</a></li>
            <li class="breadcrumb-item active">Cliente</li>
        </ol>
    </section>
    <asp:panel id="Alerta" visible="false" runat="server" cssclass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:panel>
    <section class="content">
        <div class="tab-pane">
            <div class="row">
                <div class="col-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Parametros de la consulta</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" id="colap" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                    <i class="fa fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="form-element">
                                <div class="row" style="overflow-x:auto">
                                    <div class="col-4">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">CASO:</label>
                                            <div class="col-sm-8">
                                                <asp:dropdownlist id="caso" runat="server" cssclass="form-control" appenddatabounditems="true" AutoPostBack="true" OnSelectedIndexChanged="caso_SelectedIndexChanged">
                                                                <asp:ListItem Text="Seleccione" />
                                                                <asp:ListItem value="ESTADOTER" Text="POR ESTADO TERCERO" />
                                                    <asp:ListItem value="ESTADOCONT" Text="POR ESTADO CONTRATO" />
                                                    <asp:ListItem value="ESTADOSER" Text="POR ESTADO SERVICIO" />
                                                    <asp:ListItem value="FACTURAFECHA" Text="FECHA FACTURA" />
                                                    <asp:ListItem value="CONTRATOFECHA" Text="FECHA CONTARTO" />
                                                    <asp:ListItem value="SALDOS" Text="SALDOS" />
                                                    <asp:ListItem value="BARRIOS" Text="BARRIOS" />
                                                    <asp:ListItem value="PLANES" Text="PLANES" />
                                                    <asp:ListItem value="TIPO" Text="TIPO SERVICIO" />
                                                    <asp:ListItem value="METHODO" Text="METODO DE ENVIO" />

                                                            </asp:dropdownlist>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">ESTADO:</label>
                                            <div class="col-sm-8">
                                                <asp:dropdownlist id="estado" cssclass="form-control" appenddatabounditems="true" runat="server">
                                                                <asp:ListItem Text="Seleccione" />
                                                            </asp:dropdownlist>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">BARRIO:</label>
                                            <div class="col-sm-8">
                                                <asp:dropdownlist id="barrio" cssclass="form-control" appenddatabounditems="true" runat="server">
                                                                <asp:ListItem Text="Seleccione" />
                                                            </asp:dropdownlist>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">PLAN:</label>
                                            <div class="col-sm-8">
                                                <asp:dropdownlist id="plan" appenddatabounditems="true" cssclass="form-control" runat="server">
                                                                <asp:ListItem Text="Seleccione" />
                                                            </asp:dropdownlist>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">Tipo:</label>
                                            <div class="col-sm-8">
                                                <asp:dropdownlist id="tipo" cssclass="form-control" runat="server" AppendDataBoundItems="true">
                                                                <asp:ListItem Text="Seleccione" />
                                                            </asp:dropdownlist>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">EstadoNN:</label>
                                            <div class="col-sm-8">
                                                <asp:dropdownlist id="estadoserv" cssclass="form-control" runat="server">
                                                                <asp:ListItem Text="Seleccione" />
                                                            </asp:dropdownlist>
                                            </div>
                                        </div>

                                        <div class="form-group row">

                                            <label class="col-sm-4 col-form-label">FECHA INICIO</label>
                                            <div class="col-sm-8">
                                                <asp:textbox id="fechainicio" TextMode="Date" cssclass="form-control" runat="server" placeholder="INICIO"></asp:textbox>
                                            </div>

                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">FECHA FIN</label>
                                            <div class="col-sm-8">
                                                <asp:textbox id="fechafin" TextMode="Date" cssclass="form-control" runat="server" placeholder="FIN"></asp:textbox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">SALDO</label>
                                            <div class="col-sm-8">
                                                <asp:textbox runat="server" id="saldo" cssclass="form-control" placeholder="Direccion" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">METODO</label>
                                            <div class="col-sm-8">
                                                <asp:dropdownlist id="methenvio" cssclass="form-control" runat="server" AppendDataBoundItems="true">
                                                                <asp:ListItem Text="Seleccione" />
                                                </asp:dropdownlist>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <a href="#" id="BUSCAR" onserverclick="BUSCAR_ServerClick" class="btn btn-success float-right" runat="server">CONSULTAR</a>
                        </div>
                    </div>
                    <div class="box box-primary">
                        <div class="row col-lg-12 col-sm-12 col-xl-12 col-md-12" style="overflow-x:scroll;">
                            <table class="table table-bordered table-responsive table-striped no-border tablaexcel" >
                                <thead style="background-color: #507CD1">
                                    <tr>
                                        <td style="color: white">NIT/CC
                                        </td>
                                        <td style="color: white">#CONT
                                        </td>
                                        <td style="color: white">NOMBRE
                                        </td>
                                        <td style="color: white">CELULAR
                                        </td>
                                        <td style="color: white">ESTADO TERCERO
                                        </td>
                                        <td style="color: white">ESTADO CONTRATO
                                        </td>
                                        <td style="color: white">ESTADO SERVICIO
                                        </td>
                                        <td style="color: white">FECHA CONTRATO
                                        </td>
                                        <td style="color: white">DIRECCION
                                        </td>
                                        <td style="color: white">PLAN
                                        </td>
                                        <td style="color: white">SUSCRIPCION
                                        </td>
                                        <td style="color: white">SALDO
                                        </td>
                                        <td style="color: white">TIPO
                                        </td>                                       
                                        <td style="color: white">BARRIO
                                        </td>
                                        <td style="color: white">AFINIDAD
                                        </td>
                                        <td style="color: white">ULTIMO PAGO
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="repetidors" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td style="color: black"><%#Eval("nit") %>
                                                </td>
                                                <td style="color: black"><%#Eval("contrato") %>
                                                </td>
                                                <td style="color: black"><%#Eval("nombre") %>
                                                </td>
                                                <td style="color: black"><%#Eval("telefonos") %>
                                                </td>
                                                <td <%# Eval("estadoter").Equals("ACTIVO")?"style='color: green'":Eval("estadoter").Equals("ELIMINADO")?"style='color: red'":Eval("estadoter").Equals("SUSPENDIDO")?"style='color: coffee'":"style='color: blue'" %>><%#Eval("estadoter") %>
                                                </td>
                                                <td <%# Eval("estadocont").Equals("ACTIVO")?"style='color: green'":Eval("estadocont").Equals("ELIMINADO")?"style='color: red'":Eval("estadocont").Equals("SUSPENDIDO")?"style='color: coffee'":"style='color: blue'" %>><%#Eval("estadocont") %>
                                                </td>
                                                <td <%# Eval("estadoser").Equals("ACTIVO")?"style='color: green'":Eval("estadoser").Equals("ELIMINADO")?"style='color: red'":Eval("estadoser").Equals("SUSPENDIDO")?"style='color: coffee'":"style='color: blue'" %>><%#Eval("estadoser") %>
                                                </td>
                                                <td style="color: black"><%#Eval("fechacont")is DBNull ?"":Convert.ToDateTime(Eval("fechacont")).ToString("dd-MM-yyyy") %>
                                                </td>
                                                <td style="color: black"><%#Eval("direccion") %>
                                                </td>
                                                <td style="color: black"><%#Eval("plan") %>
                                                </td>
                                                <td style="color: black"><%#Convert.ToString(Eval("suscripcion"))%>
                                                </td>
                                                <td style="color: black"><%#Convert.ToString(Eval("saldototal")) %>
                                                </td>
                                                <td style="color: black"><%#Eval("tiposerv") %>
                                                </td>
                                                <td style="color: black"><%#Convert.ToString(Eval("barrioserv")).Replace(',','.') %>
                                                </td>      
                                                <td style="color: black"><%#Convert.ToString(Eval("afinida")).Replace(',','.') %>
                                                </td> 
                                                <td style="color: black"><%#Eval("ultimopago")is DBNull ?"":Convert.ToDateTime(Eval("ultimopago")).ToString("dd-MM-yyyy") %>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
