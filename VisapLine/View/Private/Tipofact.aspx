<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Tipofact.aspx.cs" Inherits="VisapLine.View.Private.Tipofact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content-header">
        <center><h3>Tipo Factura</h3></center>

        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Crear Tipo Factura</h3>


                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">Nombre:</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" type="text" class="form-control" ID="texboxtipofactura" Style="text-transform: uppercase" required="true" title="Este campo esta vacio"></asp:TextBox>
                            </div>


                        </div>
                    </div>

                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button1" Text="Guardar" OnClick="Button1_Click" Width="146px" />
                            </div>
                        </div>

                    </div>

                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.box-body -->


        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Tipos de factura</h3>


                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group row">

                            <div class="col-sm-10">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand">
                                    <Columns>
                                        <asp:BoundField HeaderText="Tipo Factura" DataField="tipofactura" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="BtnEliminar" CommandArgument="<%# ((GridViewRow) Container) %>" CommandName="Eliminar" Text="Eliminar" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>


                        </div>
                    </div>


                </div>

                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>


    </section>
</asp:Content>

