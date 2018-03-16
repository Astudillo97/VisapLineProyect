<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="consultadefactura.aspx.cs" Inherits="VisapLine.View.Private.consultadefactura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="content">
        <div class="box box-body row">
            <asp:TextBox ID="fecha1_" TextMode="Date" CssClass="form-control col-2" runat="server"></asp:TextBox>
            <asp:TextBox ID="fecha2_" TextMode="Date" CssClass="form-control col-2" runat="server"></asp:TextBox>
            <asp:dropdownlist CssClass="form-control col-4" AppendDataBoundItems="true" ID="select" runat="server">
                <asp:ListItem>Seleccione</asp:ListItem>
            </asp:dropdownlist>
            <asp:Button Text="Buscar" CssClass=" form-control col-4 btn btn-success" OnClick="BuscarByEstado"  runat="server" />
        </div>
        <div class="box box-body">
            <div class="row">
                <div class="col-md-auto col-lg-12" style="overflow-x: scroll">
                    <table class="table table-hover no-border table-striped table-responsive" id="example">
                        <thead>
                            <tr>
                                <th>FS
                                </th>
                                <th>NIT/CC
                                </th>
                                <th>NOMBRE
                                </th>
                                <th>DIRECCION
                                </th>
                                <th>TELEF
                                </th>
                                <th>TIPO
                                </th>
                                <th>VISTO
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="repetidor" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <th><%#Eval("fs") %>
                                        </th>
                                        <th><%#Eval("identificacion") %>
                                        </th>
                                        <th><%#Eval("nombre") %>
                                        </th>
                                        <th><%#Eval("direccion") %>
                                        </th>
                                        <th><%#Eval("telefono") %>
                                        </th>
                                        <th><%#Eval("tipoterceros") %>
                                        </th>
                                        <th>
                                            <asp:CheckBox Text="Visto" runat="server" />
                                        </th>
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
