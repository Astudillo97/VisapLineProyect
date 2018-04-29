<%@ Page Title="" Language="C#" enableEventValidation="true" MasterPageFile="~/View/Gestion/Gestion.Master" AutoEventWireup="true" CodeBehind="secrestr.aspx.cs" Inherits="VisapLine.View.Gestion.secrestr" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script src="../../Contenido/assets/vendor_components/jquery/dist/jquery.js"></script>
    <script src="../../Contenido/assets/vendor_components/glyphicons/glyphicon.css"></script>
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <asp:ScriptManager ID="scrip" runat="server"></asp:ScriptManager>
    <script>
    function deletealert() {
            swal("ORDEN CREADA CON EXITO!", "Su orden ser creo con el numero ", "success", function () { location.reload() });
    }</script>
    <asp:GridView runat="server" id="grivsecre" OnRowCommand="grivsecre_RowCommand" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField HeaderText="nombre">
                <ItemTemplate>
                    <%# Eval("name") %>
                </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="desactivar">
                <ItemTemplate>
                    <asp:Button CommandArgument='<%# Eval("name") %>' CommandName="desact" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
