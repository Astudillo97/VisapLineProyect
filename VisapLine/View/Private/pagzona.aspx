<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="pagzona.aspx.cs" Inherits="VisapLine.View.Private.pagzona" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function panel2() {
            document.getElementById("reg").click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="respust" runat="server"></asp:ScriptManager>
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript">
        function deletealert() {
            swal({
                title: "SE REGISTRO CON EXITO!",
                text: "Se ha registrado con exito ",
                type: "success"
            }, function () {
                window.location.href = "pagzona.aspx";
            });

        }
        function alerterror() {
            swal("NO SE REGISTRO!", "No se registro el formulario", "error");
        }
        function elimalert() {
            swal("EL REGISTRO SE ELIMINO CON EXITO!", "Se ha realizado la operacion con exito ", "success");
        }
    </script>
    <section class="content-header">
        <h2>Zonas y Barrios</h2>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">

        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li><a class="active" id="inf" href="#informacion" data-toggle="tab">Agregar Zona</a></li>
                <li><a href="#barrios" id="reg" data-toggle="tab">Agregar Barrio</a></li>

            </ul>

            <div class="tab-content">
                <div class="active tab-pane" id="informacion">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Agregar zona</h3>
                                </div>
                                <div class="form-element">

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
                                                                        <asp:DropDownList ID="paiszona" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="paiszona_SelectedIndexChanged">
                                                                            <asp:ListItem>Seleccione</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-sm-3 col-form-label">Departamento</label>
                                                                    <div class="col-sm-9">
                                                                        <asp:DropDownList ID="departamentozona" runat="server" CssClass="form-control select2" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="departamentozona_SelectedIndexChanged">
                                                                            <asp:ListItem>Seleccione</asp:ListItem>
                                                                            <asp:ListItem>PUBLICO</asp:ListItem>
                                                                            <asp:ListItem>EMPRESARIAL</asp:ListItem>
                                                                            <asp:ListItem>ESPECIAL</asp:ListItem>
                                                                        </asp:DropDownList>

                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-sm-3 col-form-label">Municipio</label>
                                                                    <div class="col-sm-9">
                                                                        <asp:DropDownList ID="municipiozona" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="municipiozona_SelectedIndexChanged">
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
                                                                    <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button2" Text="Guardar" Width="146px" OnClick="Button2_Click" />
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
                            </div>
                        </div>

                    </div>

                    <div class="box-body">
                        <div class="box-header with-border">
                            <h3 class="box-title">Zonas</h3>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:GridView ID="GridView1" runat="server" class="table table-bordered table-striped table-responsive" AutoGenerateColumns="False" AllowPaging="True" OnRowCommand="GridView1_RowCommand" OnPageIndexChanging="GridView1_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None" PagerSettings-Mode="NextPreviousFirstLast">
                                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                    <Columns>
                                        <asp:BoundField HeaderText="Id zonas" DataField="idzonas" />
                                        <asp:BoundField HeaderText="Tipo Factura" DataField="zonas" />
                                        <asp:TemplateField HeaderText="Borrar">
                                            <ItemTemplate>
                                                <asp:Button ID="hola" runat="server" class="btn btn-danger btn-flat" CommandName="borrar" CommandArgument='<%# Eval("idzonas") %>' Text="Borrar" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                    <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                    <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                                    <RowStyle BackColor="#EFF3FB"></RowStyle>

                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                    <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                                    <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                                    <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                                    <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                                </asp:GridView>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                </div>



                <div class="tab-pane" id="barrios">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Agregar Barrios</h3>
                                </div>
                                <div class="form-element">
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
                                                                        <asp:DropDownList ID="paisbarrio" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="paisbarrio_SelectedIndexChanged">
                                                                            <asp:ListItem>Seleccione</asp:ListItem>
                                                                        </asp:DropDownList>

                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-sm-3 col-form-label">Departamento</label>
                                                                    <div class="col-sm-9">
                                                                        <asp:DropDownList ID="departamentobarrio" runat="server" CssClass="form-control select2" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="departamentobarrio_SelectedIndexChanged">
                                                                            <asp:ListItem>Seleccione</asp:ListItem>
                                                                        </asp:DropDownList>

                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-sm-3 col-form-label">Municipio</label>
                                                                    <div class="col-sm-9">
                                                                        <asp:DropDownList ID="municipiobarrio" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="municipiobarrio_SelectedIndexChanged">
                                                                            <asp:ListItem>Seleccione</asp:ListItem>
                                                                        </asp:DropDownList>

                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-sm-3 col-form-label">Zona</label>
                                                                    <div class="col-sm-9">
                                                                        <asp:DropDownList ID="zonabarrio" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="zonabarrio_SelectedIndexChanged">
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
                                                                    <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button1" Text="Guardar" Width="146px" OnClick="BtnGuardarbarrio_Click" />
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
                            </div>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="box-header with-border">
                            <h3 class="box-title">Barrios</h3>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:GridView ID="GridView2" runat="server" class="table table-bordered table-striped table-responsive" AutoGenerateColumns="False" AllowPaging="True" OnRowCommand="GridView2_RowCommand" OnPageIndexChanging="GridView2_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None" PagerSettings-Mode="NextPreviousFirstLast">
                                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                    <Columns>
                                        <asp:BoundField HeaderText="Id Tipo Factura" DataField="idbarrios" />
                                        <asp:BoundField HeaderText="Tipo Factura" DataField="barrios" />
                                        <asp:TemplateField HeaderText="Borrar">
                                            <ItemTemplate>
                                                <asp:Button ID="hola" runat="server" class="btn btn-danger btn-flat" CommandName="borrar" CommandArgument='<%# Eval("idbarrios") %>' Text="Borrar" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                    <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                    <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                                    <RowStyle BackColor="#EFF3FB"></RowStyle>

                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                    <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                                    <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                                    <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                                    <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                                </asp:GridView>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                </div>
            </div>
        </div>

    </section>



</asp:Content>
