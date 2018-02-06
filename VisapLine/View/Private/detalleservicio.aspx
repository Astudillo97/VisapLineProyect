<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="detalleservicio.aspx.cs" Inherits="VisapLine.View.Private.detalleservicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content-header">
        <h1>DETALLE DE SERVICIO</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Servicios</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="row">
            <div class="col-md-12 col-lg-6">
                <asp:FormView OnItemUpdating="FormView1_ItemUpdating" OnModeChanging="FormView1_ModeChanging"
                    CssClass="box box-body" OnPageIndexChanging="FormView1_PageIndexChanging" ID="FormView1"
                    runat="server" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                    BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
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
                                                <asp:Label ID="lblidup" runat="server" Text='<%#Eval("idservicios") %>'></asp:Label>
                                                <asp:TextBox ID="txbrefup" runat="server" Text='<%#Eval("referencias")%>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="lblip" runat="server" Text="DIRECCION IP:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txbipup" runat="server" Text='<%#Eval("direccionip") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="lblmegas" runat="server" Text="CANTIDAD DE MEGAS"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txbcmegup" runat="server" Text='<%#Eval("cantidadmegas") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="Label2" runat="server" Text="DIRECCION"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="dropbarrio"></asp:DropDownList>
                                                <br />
                                                <asp:TextBox ID="txbdirecup" runat="server" Text='<%#Eval("direcion") %> '></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="Label5" runat="server" Text="ESTRATO:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txbestratoup" runat="server" Text='<%#Eval("estrato") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="" ID="Label7" runat="server" Text="ESTADO DE SERVICIO"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txbestadoup" runat="server" Text='<%#Eval("estado") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:LinkButton ID="Cambiar" CssClass="btn bg-navy margin" runat="server" CausesValidation="False"
                                        CommandName="Update" Text="Actualizar" />
                                    <asp:LinkButton ID="cancel" CssClass="btn bg-navy margin" runat="server" CausesValidation="false"
                                        CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
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
                <div class=" box-body col-auto">
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="VOLVER" ID="volver" OnClick="volver_Click" />
                </div>
            </div>
            <div id="divcaracteristicas" runat="server" visible="false" class="col-md-12 col-lg-6">
                <div class="box box-body">
                    <div class="row">
                        <asp:GridView ID="GridViewcaracter" CssClass="table table-responsive table-bordered" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderText="Codigo" DataField="planservicios_has_caracteristicascolcol" />
                                <asp:BoundField HeaderText="Caracteristica(s)" DataField="caracteristicacol" />
                                <asp:BoundField HeaderText="Cantidad" DataField="cantidadcol" />
                                <asp:BoundField HeaderText="" DataField="unidadcol" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

            </div>
            <div id="div1" runat="server" class="col-md-12 col-lg-6">
                <div class="box box-body">
                    <div class="row col">
                        <table class="table no-border table-striped table-responsive"id="example1" >
                            <thead style="background-color:#0198f4; ">
                                <tr>
                                    <th><font color="white">SERIAL</font>
                                    </th>
                                    <th><font color="white">MAC</font>
                                    </th>
                                    <th><font color="white">MARCA</font>
                                    </th>
                                    <th><font color="white">MODELO</font>
                                    </th>
                                    <th><font color="white">TIPO</font>
                                    </th>
                                    <th><font color="white">WIFI</font>
                                    </th>
                                </tr>
                            </thead>
                            <tfoot style="background-color:#0198f4; ">
                                <tr>
                                    <th><font color="white">SERIAL</font>
                                    </th>
                                    <th><font color="white">MAC</font>
                                    </th>
                                    <th><font color="white">MARCA</font>
                                    </th>
                                    <th><font color="white">MODELO</font>
                                    </th>
                                    <th><font color="white">TIPO</font>
                                    </th>
                                    <th><font color="white">WIFI</font>
                                    </th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <asp:Repeater ID="repetidordecolumnar" runat="server">
                                    <ItemTemplate>
                                        <tr onclick='return alert(<%# Eval("idinventario") %>);'>
                                    <td><%# Eval("serial") %>s
                                    </td>
                                    <td><%# Eval("mac")%>s
                                    </td>
                                    <td><%# Eval("fabricante") %>s
                                    </td>
                                    <td><%# Eval("modelo") %>s
                                    </td>
                                    <td><%# Eval("tipoproducto") %>s
                                    </td>
                                    <td><%# Eval("wifi") %>s
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
         </section>
        
</asp:Content>
