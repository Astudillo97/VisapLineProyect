<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="FactRevision.aspx.cs" Inherits="VisapLine.View.Private.FactRevision" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h2>Facturas por Correccion
        </h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Facturacion</a></li>
            <li class="breadcrumb-item active">Correccion</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="tab-pane" runat="server" id="panelconsulta">
            <div class="box box-primary" style="overflow-x: auto">
                <asp:GridView runat="server" CssClass="table table-bordered table-responsive table-primary" OnSelectedIndexChanging="listfactRevision_SelectedIndexChanging" ID="listfactRevision">
                    <Columns>
                        <asp:CommandField ControlStyle-CssClass="glyphicon glyphicon-send" SelectText="" ShowSelectButton="True"></asp:CommandField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </section>
</asp:Content>
