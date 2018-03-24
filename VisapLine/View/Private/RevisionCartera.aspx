<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="RevisionCartera.aspx.cs" Inherits="VisapLine.View.Private.RevisionCartera" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../Contenido/assets/vendor_components/jquery/dist/jquery.js"></script>
    <script src="../../Contenido/assets/vendor_components/glyphicons/glyphicon.css"></script>
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <asp:ScriptManager ID="scrippagos" runat="server"></asp:ScriptManager>
    <script type="text/javascript">
</script>
    <section class="content-header">
        <h1>REPORTE DE CARTERA
        </h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Servicios</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="tab-pane" id="Individual">
            <div class="row">
                <div class="box box-default collapsed-box">
                    <div class="box-header with-border">
                        <h3 class="box-title">CARTERA</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <asp:Label runat="server" ID="lblmes" CssClass="form-control col-2 no-border" Text="SELECCIONE EL MES"></asp:Label>
                            <asp:DropDownList runat="server" ID="dropmes" class="form-control border-top-0 border-left-0 border-right-0 col-1">
                                <asp:ListItem Text="-SELECCIONE-" Value="0"></asp:ListItem>
                                <asp:ListItem Text="ENERO" Value="1"></asp:ListItem>
                                <asp:ListItem Text="FEBRERO" Value="2"></asp:ListItem>
                                <asp:ListItem Text="MARZO" Value="3"></asp:ListItem>
                                <asp:ListItem Text="ABRIL" Value="4"></asp:ListItem>
                                <asp:ListItem Text="MAYO" Value="5"></asp:ListItem>
                                <asp:ListItem Text="JUNIO" Value="6"></asp:ListItem>
                                <asp:ListItem Text="JULIO" Value="7"></asp:ListItem>
                                <asp:ListItem Text="AGOSTO" Value="8"></asp:ListItem>
                                <asp:ListItem Text="SEPTIEMBRE" Value="9"></asp:ListItem>
                                <asp:ListItem Text="OCTUBRE" Value="10"></asp:ListItem>
                                <asp:ListItem Text="NOVIEMBRE" Value="11"></asp:ListItem>
                                <asp:ListItem Text="DICIEMBRE" Value="12"></asp:ListItem>
                            </asp:DropDownList>
                            <button runat="server" id="btnconsultarcarteara" onserverclick="btnconsultarcarteara_ServerClick"><span class="glyphicon glyphicon-search"></span></button>
                        </div>
                        <div class="row">
                            <table class="table table-bordered table-striped table-responsive no-border tablaexcel">
                                <thead style="background-color: #507CD1">
                                    <tr>
                                        <td style="color: white">#
                                        </td>
                                        <td style="color: white">IDENTIFICACION
                                        </td>
                                        <td style="color: white">ESTADO
                                        </td>
                                        <td style="color: white">TERCERO
                                        </td>
                                        <td style="color: white">CONTRATO
                                        </td>
                                        <td style="color: white">ESTADO CONTRATO
                                        </td>
                                        <td style="color: white">FACTURA
                                        </td>
                                        <td style="color: white">FECHA DE EMISION
                                        </td>
                                        <td style="color: white">VALOR MENSUAL
                                        </td>
                                        <td style="color: white">VALOR FACTURADO
                                        </td>
                                        <td style="color: white">IVA
                                        </td>
                                        <td style="color: white">VALOR IVA
                                        </td>
                                        <td style="color: white">SALDO
                                        </td>
                                        <td style="color: white">TOTAL CALCULADO
                                        </td>                                       
                                        <td style="color: white">TOTAL TOTAL
                                        </td>
                                        <td style="color: white">TOTAL FACTURADO
                                        </td>
                                        <td style="color: white">ESTADO FACTURA
                                        </td>
                                        <td style="color: white">PAGADO
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="repetidors" runat="server" OnItemDataBound="repetidors_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td style="color: black"><%#Eval("idter") %>
                                                </td>
                                                <td style="color: black"><%#Eval("identificacionter") %>
                                                </td>
                                                <td <%# Eval("estadoterc").Equals("ACTIVO")?"style='color: green'":Eval("estadoterc").Equals("ELIMINADO")?"style='color: red'":Eval("estadoterc").Equals("SUSPENDIDO")?"style='color: yellow'":"style='color: blue'" %>><%#Eval("estadoterc") %>
                                                </td>
                                                <td style="color: black"><%#Eval("terceroter") %>
                                                </td>
                                                <td style="color: black"><%#Eval("idcont") %>
                                                </td>
                                                <td <%# Eval("estadocont").Equals("ACTIVO")?"style='color: green'":Eval("estadocont").Equals("ELIMINADO")?"style='color: red'":Eval("estadocont").Equals("SUSPENDIDO")?"style='color: yellow'":"style='color: blue'" %>><%#Eval("estadocont") %>
                                                </td>
                                                <td style="color: black"><%#Eval("facturafac") %>
                                                </td>
                                                <td style="color: black"><%#Eval("fechemision")is DBNull ?"--------":Convert.ToDateTime(Eval("fechemision")).ToString("dd-MM-yyyy") %>
                                                </td>
                                                <td style="color: black"><%#Convert.ToString(Eval("valorplan")).Replace(',','.').ToString()%>
                                                </td>
                                                <td style="color: black"><%#Convert.ToString(Eval("valorfact")).Replace(',','.') %>
                                                </td>
                                                <td style="color: black"><%#Eval("ivacont") %>%
                                                </td>
                                                <td style="color: black"><%#Convert.ToString(Eval("valiva")).Replace(',','.') %>
                                                </td>      
                                                <td style="color: black"><%#Convert.ToString(Eval("saldocont")).Replace(',','.') %>
                                                </td> 
                                                <td style="color: black"><%#Convert.ToString(Eval("totalconiv")).Replace(',','.') %>
                                                </td>
                                                <td style="color: black"><%#Convert.ToString(Eval("totaltol")).Replace(',','.') %>
                                                </td>
                                                <td style="color: black"><%#Convert.ToString(Eval("totalfact")).Replace(',','.') %>
                                                </td>
                                                <td  <%# Eval("estadofac").Equals("Pagado")?"style='color: green'":Eval("estadofac").Equals("Facturado")?"style='color: red'":Eval("estadofac").Equals("Abonado")?"style='color: yellow'":"style='color: blue'" %>><%#Eval("estadofac") %>
                                                </td>
                                                <td style="color: black"><%#Convert.ToString(Eval("pagado")).Replace(',','.') %>
                                                </td> 
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                                <tfoot style="background-color: #507CD1">
                                    <tr>
                                        <td style="color: white">
                                        </td>
                                        <td style="color: white">
                                        </td>
                                        <td style="color: white">
                                        </td>
                                        <td style="color: white">
                                        </td>
                                        <td style="color: white">
                                        </td>
                                        <td style="color: white">
                                        </td>
                                        <td style="color: white">
                                        </td>
                                        <td style="color: white">TOTAL :
                                        </td>
                                        <td style="color: white"><asp:Label runat="server" ID="totalsuscripto"></asp:Label>
                                        </td>
                                        <td style="color: white"><asp:Label runat="server" ID="totalfacturado"></asp:Label>
                                        </td>
                                        <td style="color: white">
                                        </td>
                                        <td style="color: white"><asp:Label runat="server" ID="totaliva"></asp:Label>
                                        </td>
                                        <td style="color: white"><asp:Label runat="server" ID="totalsaldo"></asp:Label>
                                        </td>
                                        <td style="color: white"><asp:Label runat="server" ID="totalconiva"></asp:Label>
                                        </td>                                       
                                        <td style="color: white"><asp:Label runat="server" ID="totaltotal"></asp:Label>
                                        </td>
                                        <td style="color: white"><asp:Label runat="server" ID="totalfactura"></asp:Label>
                                        </td>
                                        <td style="color: white">
                                        </td>
                                        <td style="color: white"><asp:Label runat="server" ID="totalpagado"></asp:Label>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
