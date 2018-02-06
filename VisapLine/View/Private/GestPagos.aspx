<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="GestPagos.aspx.cs" Inherits="VisapLine.View.Private.GestPagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>CAJA
        </h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">CAJA</a></li>
            <li class="breadcrumb-item active">Registro</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="tab-pane" id="Individual">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="form-group row" id="dividentificacion">
                                <label class="col-sm-2 col-form-label">FACTURA DE SERVICIO</label>
                                <div class="col-sm-3">
                                    <asp:TextBox type="text"  class="form-control" ID="factservicio" runat="server" />
                                </div>
                                <div class="col-sm-2">
                                    <button class="btn btn-success btn-lg"  runat="server" onserverclick="btnConsultar">BUSCAR FACTURA</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="panel">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">FACTURA DE SERVICIO</label>
                                <label class="col-sm-4 col-form-label" runat="server" id="cod">-</label><label class="col-sm-1 col-form-label" runat="server" id="idfactura"></label>
                                <label class="col-sm-2 col-form-label">ESTADO</label>
                                <label class="col-sm-4 col-form-label">ACTIVO</label>
                                <label class="col-sm-2 col-form-label">FECHA</label>
                                <label class="col-sm-4 col-form-label">2018-12-12</label>
                                <asp:TextBox type="text"  runat="server" id="textpagado"/>
                                <div class="col-sm-2">
                                    <button class="btn btn-success btn-lg" runat="server" onserverclick="btnRegistrarpago">PAGAR</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
