<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="VisapLine.View.Private.Facturacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h2>Facturación
        </h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Facturación</a></li>
            <li class="breadcrumb-item active">Vistas</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li><a class="active" id="pan1" href="#Resultado" data-toggle="tab">FACTURACION DEL MES</a></li>
                <li><a id="pan2" href="#Individual" data-toggle="tab">BUSQUEDA</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="Resultado">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Facturas</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group row" id="divnacimiento">
                                        <label class="col-sm-1 col-form-label">Desde: </label>
                                        <div class="col-sm-3">
                                            <input type="date" class="form-control" id="fecinicio_" runat="server" placeholder="">
                                        </div>
                                        <label class="col-sm-1 col-form-label">Hasta: </label>
                                        <div class="col-sm-3">
                                            <input type="date" class="form-control" id="fecfin_" runat="server" placeholder="">
                                        </div>
                                        <div class="col-sm-4">
                                            <button class="btn btn-success btn-lg" runat="server" onserverclick="ConsultarByFecha">Buscar en rango de fechas</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="Individual">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Facturas</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group row" id="dividentificacion">
                                        <label class="col-sm-2 col-form-label">IDENTIFICACIÓN</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="identificacion_" runat="server" placeholder="Nit o Identificación">
                                        </div>
                                        <label class="col-sm-2 col-form-label">FS-CODIGO</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="codigofact_" runat="server" placeholder="Codigo de factura">
                                        </div>
                                        <div class="col-sm-2">
                                            <button class="btn btn-success btn-lg" runat="server" onserverclick="ConsultarbyCedula">BUSCAR FACTURA</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <div class="tab-pane">
            <div class="box box-primary">
                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-responsive" AllowPaging="True" PageSize="5" OnPageIndexChanging="allfactura_PageIndexChanging" OnRowDeleting="allfactura_RowDeleting"  AutoGenerateColumns="False" ID="allfactura">
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" Wrap="true"/>
                    <Columns>
                        <asp:BoundField DataField="codigo" HeaderText="Contrato"></asp:BoundField>
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
                        <asp:CommandField ShowDeleteButton="True" DeleteText="" ControlStyle-CssClass="glyphicon glyphicon-copy" ></asp:CommandField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div class="tab-pane">
            <div class="box box-primary">
                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="false" ID="listContrato">
                    <Columns>
                        <asp:BoundField DataField="codigo" HeaderText="Codigo"></asp:BoundField>
                        <asp:TemplateField HeaderText="Direccion">
                            <ItemTemplate>
                                <label runat="server"><%#Eval("sucur_direccion") %> <%#Eval("nombre") %></label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="detalle" HeaderText="Plan"></asp:BoundField>
                        <asp:BoundField DataField="valor" HeaderText="Valor"></asp:BoundField>
                        <asp:BoundField DataField="estadoc" HeaderText="Estado"></asp:BoundField>
                        <asp:BoundField DataField="facturaunica" HeaderText="Factruación"></asp:BoundField>
                        <asp:TemplateField HeaderText="Factura">
                            <ItemTemplate>
                                <asp:Button runat="server" class="btn btn-primary" CommandName="ver" CommandArgument='<%# Eval("idcontrato") %>' Text="Ver" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div class="box-body">
            <asp:GridView runat="server" CssClass="table table-bordered table-striped table-responsive" ID="listFacturas" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="facturaventa" HeaderText="Factura"></asp:BoundField>
                    <asp:BoundField DataField="fechaemision" HeaderText="Emisi&#243;n"></asp:BoundField>
                    <asp:BoundField DataField="fechavencimiento" HeaderText="Vencimiento"></asp:BoundField>
                    <asp:BoundField DataField="fechacorte" HeaderText="Corte"></asp:BoundField>
                    <asp:BoundField DataField="estado" HeaderText="Estado"></asp:BoundField>
                    <asp:TemplateField HeaderText="ver">
                        <ItemTemplate>
                            <asp:Button runat="server" class="btn btn-primary" CommandName="ver" CommandArgument='<%# Eval("idfactura") %>' Text="Ver" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="box-body">
            <asp:GridView runat="server" CssClass="table table-bordered table-striped table-responsive" ID="listDetalle">
            </asp:GridView>
        </div>
        <div class="row">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"></h3>
                    </div>
                    <div class="box-body">
                        <div class="form-element">
                        </div>
                    </div>
                    <div class="box-footer">
                        <a href="#" class="btn btn-primary" runat="server">Crear Factura</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
