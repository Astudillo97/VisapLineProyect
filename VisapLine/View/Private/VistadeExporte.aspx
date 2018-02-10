<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="VistadeExporte.aspx.cs" Inherits="VisapLine.Model.VistadeExporte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="box box-body">
            <div class="row">
                <div class="col-md-auto col-lg-12" style="overflow-x:scroll">
                    <table class="table table-hover no-border table-striped table-responsive" id="example">
                        <thead>
                            <tr>
                                <th>TIPO DE COMPROBANTE
                                </th>
                                <th>CÓDIGO COMPROBANTE
                                </th>
                                <th>NÚMERO DE DOCUMENTO
                                </th>
                                <th>CUENTA CONTABLE
                                </th>
                                <th>DÉBITO O CRÉDITO
                                </th>
                                <th>VALOR DE LA SECUENCIA
                                </th>
                                <th>AÑO DEL DOCUMENTO
                                </th>
                                <th>MES DEL DOCUMENTO
                                </th>
                                <th>DÍA DEL DOCUMENTO
                                </th>
                                <th>CÓDIGO DEL VENDEDOR
                                </th>
                                <th>CÓDIGO DE LA CIUDAD
                                </th>
                                <th>CÓDIGO DE LA ZONA
                                </th>
                                <th>SECUENCIA
                                </th>
                                <th>CENTRO DE COSTO
                                </th>
                                <th>SUBCENTRO DE COSTO
                                </th>
                                <th>NIT
                                </th>
                                <th>SUCURSAL
                                </th>
                                <th>DESCRIPCIÓN DE LA SECUENCIA
                                </th>
                                <th>NÚMERO DE CHEQUE
                                </th>
                                <th>COMPROBANTE ANULADO
                                </th>
                                <th>CÓDIGO DEL MOTIVO DE DEVOLUCIÓN
                                </th>
                                <th>FORMA DE PAGO
                                </th>
                                <th>PORCENTAJE DEL IVA DE LA SECUENCIA
                                </th>
                                <th>VALOR DE IVA DE LA SECUENCIA
                                </th>
                                <th>BASE DE RETENCIÓN
                                </th>
                                <th>BASE PARA CUENTAS MARCADAS COMO RETEIVA
                                </th>
                                <th>SECUENCIA GRAVADA O EXCENTA
                                </th>
                                <th>PORCENTAJE AIU
                                </th>
                                <th>BASE IVA AIU
                                </th>
                                <th>TIPO Y COMPROBANTE CRUCE
                                </th>
                                <th>NÚMERO DE DOCUMENTO CRUCE
                                </th>
                                <th>NÚMERO DE VENCIMIENTO
                                </th>
                                <th>AÑO VENCIMIENTO DE DOCUMENTO CRUCE
                                </th>
                                <th>MES VENCIMIENTO DE DOCUMENTO CRUCE
                                </th>
                                <th>DÍA VENCIMIENTO DE DOCUMENTO CRUCE
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="repetidor" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("tipocomprobante") %>
                                        </td>
                                        <td><%#Eval("codigocomprobante") %>
                                        </td>
                                        <td><%#Eval("numerodocumento") %>
                                        </td>
                                        <td><%#Eval("cuentacontable") %>
                                        </td>
                                        <td><%#Eval("debitoocredito") %>
                                        </td>
                                        <td><%#Eval("valordelasecuencia") %>
                                        </td>
                                        <td><%#Eval("aniodocumento") %>
                                        </td>
                                        <td><%#Eval("mesdocumento") %>
                                        </td>
                                        <td><%#Eval("diadocumento") %>
                                        </td>
                                        <td><%#Eval("codigovendedor") %>
                                        </td>
                                        <td><%#Eval("codigociudad") %>
                                        </td>
                                        <td><%#Eval("codigozona") %>
                                        </td>
                                        <td><%#Eval("secuencia") %>
                                        </td>
                                        <td><%#Eval("centrodecosto") %>
                                        </td>
                                        <td><%#Eval("subcentrodecosto") %>
                                        </td>
                                        <td><%#Eval("nit") %>
                                        </td>
                                        <td>
                                        </td>
                                        <td><%#Eval("descripciondelasecuencia") %>
                                        </td>
                                        <td><%#Eval("numerodecheque") %>
                                        </td>
                                        <td><%#Eval("comprobanteanulado") %>
                                        </td>
                                        <td><%#Eval("codigomotivodevolucion") %>
                                        </td>
                                        <td><%#Eval("formadepago") %>
                                        </td>
                                        <td><%#Eval("porcentajedelivadelasecuencia") %>
                                        </td>
                                        <td><%#Eval("valordelivadelasecuencia") %>
                                        </td>
                                        <td><%#Eval("basederetencion") %>
                                        </td>
                                        <td><%#Eval("baseparacuentasmarcadascomoreteiva") %>
                                        </td>
                                        <td><%#Eval("secuenciagravadaoexcenta") %>
                                        </td>
                                        <td><%#Eval("porcentajeaiu") %>
                                        </td>
                                        <td><%#Eval("baseivaiu") %>
                                        </td>
                                        <td><%#Eval("tipoycomprobantedecruce") %>
                                        </td>
                                        <td><%#Eval("numerodocumentocruce") %>
                                        </td>
                                        <td><%#Eval("numerodevencimiento") %>
                                        </td>
                                        <td><%#Eval("aniodocumentovenc") %>
                                        </td>
                                        <td><%#Eval("mesdocumentovenc") %>
                                        </td>
                                        <td><%#Eval("diadocumentovenc") %>
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

</asp:Content>
