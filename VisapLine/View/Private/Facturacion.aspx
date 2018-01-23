<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="VisapLine.View.Private.Facturacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h2>Facturación Individual
        </h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Facturación</a></li>
            <li class="breadcrumb-item active">Individual</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="row">
            <div class="col-12">
                <div class="form-element">
                    <div class="form-group row" id="dividentificacion">
                        <label class="col-sm-2 col-form-label">Identificación</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="identificacion_" runat="server" placeholder="Nit o Identificación">
                        </div>
                        <div class="col-sm-2">
                            <button class="btn btn-primary float-right" runat="server" onserverclick="ConsultarbyCedula">Consultar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box-body">
            <asp:GridView runat="server" CssClass="table table-bordered table-striped table-responsive" OnRowCommand="listContrato_RowCommand" AutoGenerateColumns="false" ID="listContrato">
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
        <div class="box-body">
            <asp:GridView runat="server" CssClass="table table-bordered table-striped table-responsive" ID="listFacturas" OnRowCommand="listFacturas_RowCommand" AutoGenerateColumns="False">
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
                        <a href="#" class="btn btn-primary" runat="server" onserverclick="CrearFactura_">Crear Factura</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
