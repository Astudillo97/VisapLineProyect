<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="detalleservicio.aspx.cs" Inherits="VisapLine.View.Private.detalleservicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:FormView OnPageIndexChanging="FormView1_PageIndexChanging" ID="FormView1" runat="server" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
            <asp:Label ID="lblserv" runat="server" Text="SERVICIO:"></asp:Label>
            <asp:Label ID="lblserv1" runat="server" Text='<%#Eval("idservicios") %>'></asp:Label>
            <asp:Label ID="Label1" runat="server" Text='<%#Eval("referencias")%>'></asp:Label>
            <asp:Label ID="lblip" runat="server" Text="DIRECCION IP:"></asp:Label>
            <asp:Label ID="lblservip" runat="server" Text='<%#Eval("direccionip") %>'></asp:Label>
            <asp:Label ID="lblmegas" runat="server" Text="CANTIDAD DE MEGAS"></asp:Label>
            <asp:Label ID="lblservmg" runat="server" Text='<%#Eval("cantidadmegas") %>'></asp:Label>
        </ItemTemplate>
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />

    </asp:FormView>

</asp:Content>

