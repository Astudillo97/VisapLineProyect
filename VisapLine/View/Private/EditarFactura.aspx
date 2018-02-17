<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="EditarFactura.aspx.cs" Inherits="VisapLine.View.Private.EditarFactura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h2>Gestion del Cliente
        </h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Registro</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="row">
            <div class="col-8">
                <div class="tab-pane" id="panel">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <div class="form-group row">
                                        <label style="display:none" class="col-sm-3 col-form-label">ID DE FACTURA:</label>
                                        <asp:TextBox Visible="false" class="col-sm-3" runat="server" ID="idfact" />

                                        <label class="col-sm-3 col-form-label">EMITIDA</label>
                                        <asp:TextBox TextMode="Date" format="dd/mm/yyyy" class="col-sm-3 col-form-label text-bold" runat="server" ID="emisio" />
                                        <label class="col-sm-3 col-form-label">VENCE</label>
                                        <asp:TextBox class="col-sm-3 col-form-label text-bold" runat="server" ID="vencimient" />
                                        <label class="col-sm-3 col-form-label">CORTE</label>
                                        <asp:TextBox class="col-sm-3 col-form-label text-bold" runat="server" id="cort"/>

                                        <label class="col-sm-3 col-form-label">ESTADO</label>
                                        <asp:TextBox class="col-sm-3 col-form-label text-bold" runat="server" ID="estad" />

                                        <label class="col-sm-3 col-form-label">CUOTAS:</label>
                                        <asp:TextBox CssClass="col-sm-3 col-form-label text-bold" runat="server" ID="cuotas" />

                                        <label class="col-sm-3 col-form-label">NUMERO FACTURA:</label>
                                        <asp:TextBox Enabled="false" CssClass="col-sm-3 col-form-label text-bold" runat="server" ID="facturaventa" />

                                        <label class="col-sm-3 col-form-label">VALOR FACTURA:</label>
                                        <asp:TextBox CssClass="col-sm-3 col-form-label text-bold" runat="server" ID="valorfac" />

                                        <label class="col-sm-3 col-form-label">SALDO FACTURA:</label>
                                        <asp:TextBox CssClass="col-sm-3 col-form-label text-bold" runat="server" ID="saldofact" />

                                        <label class="col-sm-3 col-form-label">IVA FACTURA:</label>
                                        <asp:TextBox CssClass="col-sm-3 col-form-label text-bold" runat="server" ID="ivafact" />

                                        <label class="col-sm-3 col-form-label">TOTAL FACTURA:</label>
                                        <asp:TextBox CssClass="col-sm-3 col-form-label text-bold" runat="server" ID="totalfact" />

                                        
                                    </div>
                                    <asp:Button CssClass="col-sm-3 btn-success text-bold" Text="Actualizar" OnClick="btnActualizar_Click" runat="server" ID="btnActualizar" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="tab-pane" id="panel4">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-sm-12 ">
                                            <h2 class="text-center">
                                                
                                            </h2>
                                        </div>
                                        <div class="col-sm-12 ">
                                            <asp:TextBox type="text" class="form-control text-center text-bold" runat="server" ID="textpagado" />
                                        </div>
                                        <%--<div class="col-sm-12">
                                            <button class="btn btn-success form-control btn-lg" visible="false" id="btnpago" runat="server" onserverclick="btnRegistrarpago">PAGAR</button>
                                            <button class="btn btn-secondary form-control btn-lg" visible="false" id="btnimprimir" runat="server" onserverclick="btnimprimir_ServerClick">IMPRIMIR</button>
                                            <label runat="server" id="idpago" visible="false"></label>
                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
