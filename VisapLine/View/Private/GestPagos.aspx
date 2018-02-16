<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="GestPagos.aspx.cs" Inherits="VisapLine.View.Private.GestPagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>INGRESO
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
                                <label class="col-sm-3 col-form-label">FACTURA DE SERVICIO</label>
                                <div class="col-sm-3">
                                    <asp:TextBox type="text" class="form-control" ID="factservicio" runat="server" />
                                </div>
                                <div class="col-sm-2">
                                    <button class="btn btn-success btn-lg" runat="server" onserverclick="btnConsultar">BUSCAR FACTURA</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-8">
                <div class="tab-pane" id="panel">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">NUMERO FACTURA:</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="cod"></label>
                                        <label class="col-sm-3 col-form-label">ID DE FACTURA:</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="idfactura"></label>
                                        <label class="col-sm-3 col-form-label">ESTADO</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="estado"></label>
                                        <label class="col-sm-3 col-form-label">EMITIDA</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="emision"></label>
                                        <label class="col-sm-3 col-form-label">VENCE</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="vencimiento"></label>
                                        <label class="col-sm-3 col-form-label">CORTE</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="corte"></label>
                                    </div>
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
                                            <h2 class="text-center"><label class="col-form-label text-bold"  runat="server" id="estado2"></label></h2>
                                        </div>
                                        <div class="col-sm-12 ">
                                            <asp:TextBox type="text" class="form-control text-center text-bold" runat="server" ID="textpagado" />
                                        </div>
                                        <div class="col-sm-12">
                                            <button class="btn btn-success form-control btn-lg" visible="false" id="btnpago" runat="server" onserverclick="btnRegistrarpago">PAGAR</button>
                                            <button class="btn btn-secondary form-control btn-lg" visible="false" id="btnimprimir" runat="server" onserverclick="btnimprimir_ServerClick">IMPRIMIR</button>
                                            <label runat="server" id="idpago" visible="false"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="tab-pane" id="panel2">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">CLIENTE:</label>
                                        <label class="col-sm-10 col-form-label text-bold" runat="server" id="nombre"></label>
                                        <label class="col-sm-2 col-form-label">CC/NIT:</label>
                                        <label class="col-sm-4 col-form-label text-bold" runat="server" id="identif"></label>
                                        <label class="col-sm-2 col-form-label">ESTADO:</label>
                                        <label class="col-sm-4 col-form-label text-bold" runat="server" id="estadocliente"></label>
                                        <label class="col-sm-2 col-form-label">DIRECCION:</label>
                                        <label class="col-sm-10 col-form-label text-bold" runat="server" id="dirrecion"></label>
                                        <label class="col-sm-2 col-form-label">CORREO:</label>
                                        <label class="col-sm-10 col-form-label text-bold" runat="server" id="correo"></label>
                                        <label class="col-sm-2 col-form-label">TELEFONO:</label>
                                        <label class="col-sm-10 col-form-label text-bold" runat="server" id="telefono"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="tab-pane" id="panel3">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">FECHA CONTRATO</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="fechacontrato"></label>
                                        <label class="col-sm-3 col-form-label">ACTIVACION</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="fechaactivacion"></label>
                                        <label class="col-sm-3 col-form-label">ESTADO</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="estadoc"></label>
                                        <label class="col-sm-3 col-form-label">CODIGO</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="codigo"></label>
                                        <label class="col-sm-3 col-form-label">FINALIZACION</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="fechafinalizacion"></label>
                                        <label class="col-sm-3 col-form-label">ADICIONAL</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="descuento"></label>
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
