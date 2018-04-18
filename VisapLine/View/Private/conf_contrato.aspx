<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="conf_contrato.aspx.cs" Inherits="VisapLine.View.Private.conf_contrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function ErrorPunto(princiapal, data, accion) {
            swal(princiapal, data, accion);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:ScriptManager ID="respust" runat="server"></asp:ScriptManager>
    <script type="text/javascript">
        function ErrorPunto(princiapal, data, accion) {
            swal(princiapal, data, accion);
        }
    </script>
    <section class="content-header">
        <h2>Configuracion de Contrato
        </h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Configuracion</a></li>
            <li class="breadcrumb-item active">Contrato</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <div class="tab-pane" runat="server" id="paneldatos">
        <div class="row">
            <div class="col-lg-12">
                <div class="box box-primary" style="overflow-x: auto">
                    <h5>Contrato</h5>
                    <asp:GridView runat="server" ID="consultacontrato" OnSelectedIndexChanged="consultacontrato_SelectedIndexChanged" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                        <Columns>
                            <asp:BoundField DataField="idcontrato" HeaderText="#ID"></asp:BoundField>
                            <asp:BoundField DataField="fechacontrato" HeaderText="INICIO" DataFormatString="{0:d}"></asp:BoundField>
                            <asp:BoundField DataField="fechaactivacion" HeaderText="ACTIVACION" DataFormatString="{0:d}"></asp:BoundField>
                            <asp:BoundField DataField="fechafinalizacion" HeaderText="FINALIZACION" DataFormatString="{0:d}"></asp:BoundField>
                            <asp:BoundField DataField="valor" HeaderText="VALOR"></asp:BoundField>
                            <asp:BoundField DataField="estadoc" HeaderText="ESTADO"></asp:BoundField>
                            <asp:BoundField DataField="detalle" HeaderText="PLAN"></asp:BoundField>
                            <asp:BoundField DataField="codigo" HeaderText="CODIGO"></asp:BoundField>
                            <asp:BoundField DataField="direnviofactura" HeaderText="ENVIO"></asp:BoundField>
                            <asp:BoundField DataField="observacion" HeaderText="OBSERVACION"></asp:BoundField>
                            <asp:CommandField ShowSelectButton="true" SelectText="" ControlStyle-CssClass="glyphicon glyphicon-search">
                                <ControlStyle CssClass="glyphicon glyphicon-search"></ControlStyle>
                            </asp:CommandField>

                            <asp:TemplateField HeaderText="EDITAR">
                                <ItemTemplate>
                                    <a href="gestcontrato.aspx?iCnt=<%# Eval("codigo") %>" class="btn btn-success fa fa-edit"></a>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Justify"></ItemStyle>
                            </asp:TemplateField>
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
        </div>
    </div>
    <div class="tab-pane" runat="server" id="divoperaciones">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li><a class="active" id="pan1" href="#prorateo" data-toggle="tab">PRORATEO</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="prorateo">

                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="form-element">
                                        <div class="form-group row" id="numerocontrato">
                                            <label class="col-sm-4 col-form-label">Contrato No.</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="contrato_" runat="server" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group row" id="dividentificacion">
                                            <label class="col-sm-4 col-form-label">Dia Facturacion</label>
                                            <div class="col-sm-8">
                                                <input type="date" class="form-control" id="fechaactivacionfac" runat="server">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">Meses Gratis</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList runat="server" ID="caso" CssClass="form-control" AppendDataBoundItems="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                    <asp:ListItem Value="0">Ninguno</asp:ListItem>
                                                    <asp:ListItem Value="1">1 Mes Gratis</asp:ListItem>
                                                    <asp:ListItem Value="2">2 Meses Gratis</asp:ListItem>
                                                    <asp:ListItem Value="3">3 Meses Gratis</asp:ListItem>
                                                    <asp:ListItem Value="4">4 Meses Gratis</asp:ListItem>
                                                    <asp:ListItem Value="5">5 Meses Gratis</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <button class="btn btn-primary col-md-2 float-right" runat="server" onserverclick="Guardar">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
