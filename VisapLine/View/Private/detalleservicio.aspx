<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="detalleservicio.aspx.cs" Inherits="VisapLine.View.Private.detalleservicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-6">
        <asp:FormView
            OnModeChanging="FormView1_ModeChanging"
            CssClass="box box-body" 
            OnPageIndexChanging="FormView1_PageIndexChanging" 
            ID="FormView1" 
            runat="server" 
            AllowPaging="True" 
            BackColor="White" 
            BorderColor="#CCCCCC" 
            BorderStyle="None" 
            BorderWidth="1px" 
            CellPadding="4" 
            ForeColor="Black" 
            GridLines="Horizontal">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <EditItemTemplate>
                <div class="box box-default">
                    <div class="row">
                        <div class="col-12">
                            <table class="table table-responsive">
                                <tr>
                                    <td>
                                        <asp:Label CssClass="" ID="lblserv" runat="server" Text="SERVICIO:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblserv1" runat="server" Text='<%#Eval("idservicios") %>'></asp:Label>
                                        <asp:TextBox ID="Label1" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label CssClass="" ID="lblip" runat="server" Text="DIRECCION IP:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="lblservip" runat="server" ></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label CssClass="" ID="lblmegas" runat="server" Text="CANTIDAD DE MEGAS"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="lblservmg" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label CssClass="" ID="Label2" runat="server" Text="DIRECCION"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Label3" runat="server" ></asp:TextBox>
                                        <asp:TextBox ID="Label4" runat="server" ></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label CssClass="" ID="Label5" runat="server" Text="ESTRATO:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Label6" runat="server" ></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label CssClass="" ID="Label7" runat="server" Text="ESTADO DE SERVICIO"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Label8" runat="server" ></asp:TextBox>
                                    </td>
                                </tr>                             
                            </table>
                             <asp:LinkButton ID="EditButton" CssClass="btn bg-navy margin" runat="server" CausesValidation="False"
                            CommandName="cambiaraeditar" Text="Editar" />
                        </div>                      
                    </div>
                </div>
            </EditItemTemplate>
            <ItemTemplate>
                <div class="box box-default">
                    <div class="row">
                        <div class="col-12">
                            <table class="table table-responsive">
                                <tr>
                                    <td>
                                        <asp:Label CssClass="" ID="lblserv" runat="server" Text="SERVICIO:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblserv1" runat="server" Text='<%#Eval("idservicios") %>'></asp:Label>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("referencias")%>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label CssClass="" ID="lblip" runat="server" Text="DIRECCION IP:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblservip" runat="server" Text='<%#Eval("direccionip") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label CssClass="" ID="lblmegas" runat="server" Text="CANTIDAD DE MEGAS"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblservmg" runat="server" Text='<%#Eval("cantidadmegas") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label CssClass="" ID="Label2" runat="server" Text="DIRECCION"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("direcion") %> '></asp:Label>
                                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("barrios") %> '></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label CssClass="" ID="Label5" runat="server" Text="ESTRATO:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text='<%#Eval("estrato") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label CssClass="" ID="Label7" runat="server" Text="ESTADO DE SERVICIO"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" Text='<%#Eval("estado") %>'></asp:Label>
                                    </td>
                                </tr>                             
                            </table>
                             <asp:LinkButton ID="EditButton" CssClass="btn bg-navy margin" runat="server" CausesValidation="False"
                            CommandName="edit" Text="Editar" />
                        </div>                      
                    </div>
                </div>
            </ItemTemplate>
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />

        </asp:FormView>
    </div>
</asp:Content>