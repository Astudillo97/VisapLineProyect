<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="facturacion.aspx.cs" Inherits="VisapLine.View.Public.facturacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
            <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <label class="text-center" runat="server" id="textError"></label>
            </asp:Panel>
            IDENTIFICACIÓN/NIT:&nbsp; <asp:TextBox ID="identificacion_" runat="server" />
            &nbsp;&nbsp;
            <asp:Button Text="Generar" BackColor="#66FF66" OnClick="Unnamed_Click" runat="server" />
                <br />
                <br />
            <br />
            <asp:GridView runat="server" OnRowCommand="allfactura_RowCommand" AutoGenerateColumns="False" ID="allfactura">
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" Wrap="true" />
                <Columns>
                    <asp:BoundField DataField="facturaventa" HeaderText="FS"></asp:BoundField>
                    <asp:BoundField DataField="identificacion" HeaderText="NIT/IDENTIF"></asp:BoundField>
                    <asp:TemplateField HeaderText="Tercero">
                        <ItemTemplate>
                            <label runat="server"><%#Eval("nombre") %> <%#Eval("apellido") %></label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="correo" HeaderText="Correo"></asp:BoundField>
                    <asp:BoundField DataField="fechaemision" DataFormatString="{0:d}" HeaderText="Emision"></asp:BoundField>
                    <asp:BoundField DataField="estadof" HeaderText="Estado"></asp:BoundField>
                    <asp:BoundField DataField="totalfac" HeaderText="Valor"></asp:BoundField>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="btn1" runat="server" CssClass="glyphicon glyphicon-copy" CommandName="verfactura" CommandArgument='<%# Eval("idfactura") %>' Text="DESCARGAR" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
                </center>
        </div>
    </form>
</body>
</html>
