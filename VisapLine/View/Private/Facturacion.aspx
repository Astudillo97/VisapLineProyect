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
                            <button class="btn btn-primary float-right" runat="server" onserverclick="GenerarFactura">Consultar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Datos del Tercero</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool">
                                <i class="fa fa-times"></i>
                            </button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="form-element">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Identificación</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" disabled runat="server" placeholder="Nit o Identificación">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label id="_nombre_" runat="server" class="col-sm-3 col-form-label">Nombre</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" disabled runat="server" placeholder="Nombre">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label id="_apellido_" runat="server" class="col-sm-3 col-form-label">Direccíón</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" disabled runat="server" placeholder="Direccion">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Correo</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" disabled runat="server" placeholder="Correo">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Contrato</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool">
                                <i class="fa fa-times"></i>
                            </button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="form-element">
                            <div class="form-group row" id="divtipodoc">
                                <label class="col-sm-4 col-form-label">Contrato</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList runat="server" ID="idcontrato" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="tipodoc__SelectedIndexChanged" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label id="Label1" runat="server" class="col-sm-3 col-form-label">Nombre</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" disabled runat="server" placeholder="Nombre">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label id="Label2" runat="server" class="col-sm-3 col-form-label">Direccíón</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" disabled runat="server" placeholder="Direccion">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Correo</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" disabled runat="server" placeholder="Correo">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </section>
</asp:Content>
