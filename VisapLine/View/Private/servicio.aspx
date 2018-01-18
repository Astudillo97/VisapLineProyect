<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="servicio.aspx.cs" Inherits="VisapLine.View.Private.servicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="box box-default" id="divinternet" runat="server" visible="false">
        <div class="box-header with-border">
            <h3 class="box-title">INTERNET</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <div class="row">
                <div class="col-6">
                    <div class="form-group row">
                        <label for="example-text-input" class="col-sm-2 col-form-label">DIRECCION IP</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" CssClass="form-control" ID="ip"></asp:TextBox>
                        </div>
                        <div class="col-2">
                        </div>
                        <div class="col-4 align-items-center">
                            <div class="form-group row">
                                <asp:Button runat="server" ID="btnequipo" class="btn btn-block btn-success btn-lg" Text="ASIGNAR EQUIPO" OnClick="btnequipo_Click" />
                                <asp:ListView runat="server" ID="listequipo">
                                    <ItemTemplate>
                                        <div class="row">
                                            <!-- /.col -->
                                            <div class="col-4">
                                                    <div class="box-body">
                                                        <h4 class="card-title"><%#Eval("modelo")%> <%#Eval("fabricante")%></h4>
                                                        <div>
                                                            <asp:Label runat="server" ID="linv" Text="INVENTARIO"></asp:Label>
                                                            <br />
                                                            <asp:TextBox ID="tinv" CssClass="form-control" ReadOnly="true" runat="server" Text='<%#Eval("idinventario")%>'></asp:TextBox>
                                                            <br />
                                                            <asp:Label runat="server" ID="lserial" Text="SERIAL"></asp:Label>
                                                            <br />
                                                            <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="tserial" Text='<%#Eval("serial")%>'></asp:TextBox>
                                                            <br />
                                                            <asp:Label runat="server" ID="lmac" Text="MAC"></asp:Label>
                                                            <br />
                                                            <asp:TextBox runat="server" ID="tmac" CssClass="form-control" ReadOnly="true" Text='<%#Eval("mac")%>'></asp:TextBox>
                                                            <br />
                                                            <asp:Label runat="server" ID="ldescrp" Text="DESCRIPCION"></asp:Label>
                                                            <br />
                                                            <asp:TextBox runat="server" ID="tdescrp" CssClass="form-control" ReadOnly="true" Text='<%#Eval("descripcion")%>'></asp:TextBox>
                                                            <br />
                                                            <asp:Label runat="server" ID="ltpro" Text="TIPO PRODUCTO"></asp:Label>
                                                            <br />
                                                            <asp:TextBox runat="server" ID="ttpro" CssClass="form-control" ReadOnly="true" Text='<%#Eval("tipoproducto")%>'></asp:TextBox>
                                                            <br />
                                                            <asp:Label runat="server" ID="lmodelo" Text="MODELO"></asp:Label>

                                                        </div>
                                                </div>
                                            </div>

                                        </div>

                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:Button runat="server" ID="Button1" Text="CANCELAR" OnClick="Button1_Click" CssClass="btn btn-block btn-danger btn-lg" />
                                <asp:Button runat="server" ID="btninser" Text="CREAR SERVICIO" OnClick="btninser_Click" CssClass="btn btn-block btn-success btn lg" />
                            </div>
                        </div>
                    </div>

                    <div class="col-6">
                        <div class="form-group row">
                            <asp:GridView runat="server" ID="gridcaract" AutoGenerateColumns="false" CssClass="table table-hover table-responsive">
                                <Columns>
                                    <asp:BoundField HeaderText="NUMERO" DataField="idcaracteristicas" />
                                    <asp:BoundField HeaderText="CARACTERISTICAS" DataField="caracteristica" />
                                    <asp:TemplateField HeaderText="CANTIDAD" ControlStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:TextBox ID="cantida" runat="server" type="number"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="UNIDAD" DataField="unidad" />
                                </Columns>

                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.box-body -->
    </div>
    <div class="box box-default collapsed-box" id="divtv" runat="server" visible="false">
        <div class="box-header with-border">
            <h3 class="box-title">TELEVISION</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <div class="row">
                <div class="col-12">
                    <div class="form-group row">
                        <label for="example-text-input" class="col-sm-2 col-form-label">Text</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" value="Johen Doe" id="example-text-input">
                        </div>
                    </div>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.box-body -->
    </div>
    <div class="box box-default collapsed-box" id="divtelefono" runat="server" visible="false">
        <div class="box-header with-border">
            <h3 class="box-title">TELEFONO</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <div class="row">
                <div class="col-12">
                    <div class="form-group row">
                        <label for="example-text-input" class="col-sm-2 col-form-label">Text</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" value="Johen Doe" id="example-text-input">
                        </div>
                    </div>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.box-body -->
    </div>
    <asp:GridView runat="server" ID="Caracteristicas"></asp:GridView>
</asp:Content>
