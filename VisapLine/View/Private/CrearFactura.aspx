<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="CrearFactura.aspx.cs" Inherits="VisapLine.View.Private.CrearFactura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>Crear Factura</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Finanzas</a></li>
            <li class="breadcrumb-item active">Crear Factura</li>
        </ol>
    </section>
    <section class="content-header">
        <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <label class="text-center" runat="server" id="textError"></label>
        </asp:Panel>
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
                            <div class="col-sm-5">
                                <asp:TextBox runat="server" type="Text" CssClass="form-control" ID="TextBoxdni" Style="text-transform: uppercase"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <asp:Button runat="server" ID="Button2" CssClass="btn btn-block btn-success btn-lg" Text="Buscar" OnClick="Button2_Click" Width="100px" />
                            </div>
                        </div>
                    </div>           
                </div>
                <!-- /.col -->
            </div>
        </div>
         <div class="row">
            <div class="col-6">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Datos del Cliente</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-4">
                                <img src="../../Contenido/images/user2-160x160.jpg" height="125px" width="125px" />
                            </div>
                            <div class="col-7">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Nombre:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="Label1" runat="server" CssClass="form-control bg-gray" height="45px" Width="200px" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Apellido:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="Label2" CssClass="form-control bg-gray" runat="server" height="45px" Width="200px" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Direccion:</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="TextBox1" TextMode="MultiLine" Enabled="false" Rows="5" Columns="15" runat="server" class="form-control bg-gray" Width="200px" Height="100px"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>           
    </section>
</asp:Content>
