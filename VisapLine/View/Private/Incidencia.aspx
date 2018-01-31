<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Incidencia.aspx.cs" Inherits="VisapLine.View.Private.Incidencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        textarea {
            resize: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content-header">
        <h1>Incidencia</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Incidencia</li>
        </ol>
    </section>

    <section class="content">
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Incidencia</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Fecha inicio</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="Textboxfechainicio" runat="server" type="date" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Estado</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="DropDownListestadoinc" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                    <asp:ListItem>ACTIVO</asp:ListItem>
                                    <asp:ListItem>INACTIVO</asp:ListItem>
                                    <asp:ListItem>ESPERA</asp:ListItem>
                                    <asp:ListItem>SOLUCIONADO</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Detalle</label>
                            <div class="col-sm-8">
                                <textarea id="TextArea1detalle" runat="server" data-iconlibrary="fa" rows="5" resize="none" data-hidden-buttons="cmdBold" style="margin-top: 0px; margin-bottom: 0px; height: 118px;" required data-validation-required-message="This field is required"></textarea>

                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Descuento</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                    <asp:ListItem>SI</asp:ListItem>
                                    <asp:ListItem>NO</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Fecha Finalizacion</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="Textboxfechafinal" runat="server" type="date" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Costo</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="Textboxcosto" runat="server" type="number" class="form-control" placeholder="$"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Observacion</label>
                            <div class="col-sm-8">
                                <textarea id="TextAreaobservacion" runat="server" data-iconlibrary="fa" rows="5" resize="none" data-hidden-buttons="cmdBold" style="margin-top: 0px; margin-bottom: 0px; height: 118px;" required data-validation-required-message="This field is required"></textarea>

                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Tipo Incidencia</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.col -->
            </div>
            <center>
                    <asp:Button ID="ButtonGuardar" runat="server" Text="Registrar" class="btn btn-block btn-success btn-lg" Width="143px" Height="30px" OnClick="ButtonGuardar_Click"/>
              
            </center>

        </div>
    </section>
</asp:Content>
