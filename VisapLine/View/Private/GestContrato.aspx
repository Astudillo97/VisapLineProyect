<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="GestContrato.aspx.cs" Inherits="VisapLine.View.Private.GestContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content-header">
        <h1>Gestionar Contratos</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Gestinar Contratos</li>
        </ol>
    </section>
    <section class="content">
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Buscar Contrato</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-3 col-form-label">CC o Nit:</label>
                            <div class="col-sm-9">
                                <asp:TextBox runat="server" type="number" class="form-control" ID="texboxdni" Style="text-transform: uppercase"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button1" Text="Consultar" OnClick="Button1_Click" Width="146px" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.col -->
            </div>
        </div>
        <!-- /.row -->

        <!-- /.box-header -->
        <div class="row" id="divtablagestcontr" runat="server" visible="false">
            <div class="box box-primary">
                <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="false" class="table table-bordered table-striped table-responsive" OnRowDataBound="GridView1_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:CommandField ShowSelectButton="true" />
                        <asp:BoundField HeaderText="Codg" DataField="codigo" />
                        <asp:BoundField HeaderText="Nombre" DataField="nombreter" />
                        <asp:BoundField HeaderText="Fecha" DataFormatString="{0:d}" DataField="fechacontrato" />
                        <asp:BoundField HeaderText="Estado" DataField="estadoc" />
                        <asp:BoundField HeaderText="Direccion" DataField="direnviofactura" />
                        <asp:BoundField HeaderText="Envio Factura" DataField="enviofactura" />
                        <asp:BoundField HeaderText="Observacion" DataField="observacion" />
                        <asp:BoundField HeaderText="Valor" DataField="valor" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="#EFF3FB"></RowStyle>

                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </div>
        </div>

        <div class="box box-default " id="ideditarcontrat" runat="server" visible="false">
            <div class="box-header with-border">
                <h2 class="box-title">Contrato</h2>
                <div class="box-tools pull-right">
                </div>
            </div>

            <!-- /.box-header -->
            <div class="box-body" style="">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Nombre:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:TextBox ID="TextBox1identificacion" Enabled="false" class="form-control" Style="text-transform: uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Estado:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownListestadocontrato" Enabled="false" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Plan:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownListplancontrato" Enabled="false" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Tipo Contrato:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownListtipocontrato" Enabled="false" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Direccion de Envio:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:TextBox ID="TextBoxdirreccionenvio" Enabled="false" class="form-control" Style="text-transform: uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Envio Factura:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownListenviofactura" Enabled="false" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Factura:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownList1facuracuni" Enabled="false" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Sucursal:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="Sucursal" runat="server" Enabled="false" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">barrio:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownList1" runat="server" Enabled="false" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Iva:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:TextBox ID="TextBoxivacontrato" class="form-control" Enabled="false" Style="text-transform: uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>

        <center>
            <table>
                <tr>
                    <th>
                        <asp:Button ID="Buttoneditar" runat="server" Visible="false" Text="Editar" class="btn btn-block btn-info btn-lg" Width="143px" Height="30px" /></th>
                    <th>
                        <asp:Button ID="ButtonGuardar" runat="server" Visible="false" Enabled="false" Text="Guardar" class="btn btn-block btn-success btn-lg" Width="143px" Height="30px" /></th>
                    <th>
                        <asp:Button ID="Buttoncancelar" runat="server" Visible="false" Enabled="false" Text="Cancelar" class="btn btn-block btn-danger btn-lg" Width="143px" Height="30px" /></th>
                </tr>

            </table>
 
</center>

    </section>

</asp:Content>
