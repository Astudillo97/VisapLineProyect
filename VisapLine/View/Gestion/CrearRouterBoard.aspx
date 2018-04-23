<%@ Page Title="" Language="C#" MasterPageFile="~/View/Gestion/Gestion.Master" AutoEventWireup="true" CodeBehind="CrearRouterBoard.aspx.cs" Inherits="VisapLine.View.Gestion.CrearRouterBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../Contenido/assets/vendor_components/jquery/dist/jquery.js"></script>
    <script src="../../Contenido/assets/vendor_components/glyphicons/glyphicon.css"></script>
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <asp:Label ID="labelnombre" runat="server" Text="NOMBRE"></asp:Label>
    <asp:TextBox ID="textnombre" runat="server" placeholder="Nombre Router"></asp:TextBox>
    <asp:Label ID="labelipaddress" runat="server" Text="IP DISPOSITIVO"></asp:Label>
    <asp:TextBox ID="textipaddress" runat="server" placeholder="XXX.XXX.XXX.XXX"></asp:TextBox>
    <asp:Label ID="labeluser" runat="server" Text="USUARIO"></asp:Label>
    <asp:TextBox ID="textuser" runat="server" placeholder="User"></asp:TextBox>
    <asp:Label ID="labelpass" runat="server" Text="CONTRASEÑA"></asp:Label> 
    <asp:TextBox ID="textpass" runat="server" TextMode="Password" placeholder="root"></asp:TextBox>
    <asp:Label ID="labelapiport" runat="server" Text="PUERTO DE API"></asp:Label>
    <asp:TextBox ID="textapiport" runat="server" TextMode="Password" placeholder="Any"></asp:TextBox>
    <asp:Label ID="labelzonas" runat="server" Text="ZONA"></asp:Label>
    <asp:DropDownList ID="dropdownzonas" runat="server">
        <asp:ListItem>Selecione</asp:ListItem>
    </asp:DropDownList>
    <asp:Button runat="server" ID="btncrear" Text="CREAR" OnClick="btncrear_Click" />
</asp:Content>
