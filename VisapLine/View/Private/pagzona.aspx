<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="pagzona.aspx.cs" Inherits="VisapLine.View.Private.pagzona" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content-header">
        <center><h3>Zonas y Barrios</h3></center>
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Agregar barrio</h3>


                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <div class="form-element">
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Pais</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Departamento</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control select2" AppendDataBoundItems="true" AutoPostBack="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Municipio</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Barrio</label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" type="text" class="form-control" ID="TextBox1" Style="text-transform: uppercase"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-9">
                                            </div>
                                            <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button1" Text="Guardar" Width="146px" />
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.box-body -->

                </div>
            </div>
        </div>
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Agregar Zona</h3>


                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <div class="form-element">
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Pais</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Departamento</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList6" runat="server" CssClass="form-control select2" AppendDataBoundItems="true" AutoPostBack="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Municipio</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList7" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Barrio</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Zona</label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" type="text" class="form-control" ID="TextBox2" Style="text-transform: uppercase"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-9">
                                            </div>
                                            <asp:Button runat="server" class="btn btn-block btn-success btn-lg"  ID="Button2" Text="Guardar" Width="146px" />
                                        </div>
                                    </div>

                                </div>


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
