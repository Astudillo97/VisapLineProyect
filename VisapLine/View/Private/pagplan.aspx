<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="pagplan.aspx.cs" Inherits="VisapLine.View.Private.pagplan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function applyFormatCurrency(sender) {
            $(sender).formatCurrency({
                region: 'es-CL'
                , roundToDecimalPlace: -1
            });
        }
    </script>
    <style>
        textarea {
            resize: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="respust" runat="server"></asp:ScriptManager>
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript">
        function deletealert() {
            swal("SE REGISTRO CON EXITO!", "Se ha registrado con exito ", "success");
        }
        function alerterror() {
            swal("NO SE REGISTRO!", "No se registro el formulario", "error");
        }
    </script>

    <section class="content-header">
        <h1>Planes</h1>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>

    <section class="content">
        <div class="box box-default ">
            <div class="box-header with-border">
                <h2 class="box-title">Crear Plan</h2>
                <div class="box-tools pull-right">
                </div>
            </div>

            <!-- /.box-header -->
            <div class="box-body" style="">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">Valor:</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                    <asp:TextBox ID="TextBox1" runat="server" type="number" class="form-control" onkeypress="applyFormatCurrency(this);" required data-validation-required-message="This field is required"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="box-body form-element">
                                <div class="row">
                                    <div class="col-sm-3">

                                        <label for="example-text-input" class="col-sm-2 col-form-label">Internet:</label>
                                        <div class="col-sm-10">
                                            <asp:CheckBox ID="CheckBox1" Text=" " runat="server" class="filled-in chk-col-yellow" />
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <label for="example-text-input" class="col-sm-2 col-form-label">Telefono:</label>
                                        <div class="col-sm-10">
                                            <asp:CheckBox ID="CheckBox2" Text=" " runat="server" class="filled-in chk-col-yellow" />
                                        </div>

                                    </div>
                                    <div class="col-sm-5">
                                        <label for="example-text-input" class="col-sm-2 col-form-label">Television:</label>
                                        <div class="col-sm-10">
                                            <asp:CheckBox ID="CheckBox3" Text=" " runat="server" class="filled-in chk-col-yellow" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">Tipo_Plan:</label>
                            <div class="col-sm-10">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AppendDataBoundItems="true" required data-validation-required-message="This field is required">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                    <asp:ListItem>PUBLICO</asp:ListItem>
                                    <asp:ListItem>EMPRESARIAL</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">Subida:</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="TextBox2" runat="server" type="number" class="form-control" onkeypress="applyFormatCurrency(this);" required data-validation-required-message="This field is required"></asp:TextBox>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">Detalle:</label>
                            <div class="col-sm-10 ">
                                <div class="md-header btn-toolbar">
                                    <textarea data-provide="markdown" id="texareadetalle" runat="server" data-iconlibrary="fa"  class="form-control" rows="5" resize="none" data-hidden-buttons="cmdBold" style="text-transform: uppercase; margin-top: 0px; margin-bottom: 0px; height: 144px;" required data-validation-required-message="This field is required"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">Estado:</label>
                            <div class="col-sm-10 ">
                                <div class="md-header btn-toolbar">
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" AppendDataBoundItems="true"  required data-validation-required-message="This field is required">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                        <asp:ListItem>ACTIVO</asp:ListItem>
                                        <asp:ListItem>INACTIVO</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">Bajada:</label>
                            <div class="col-sm-10 ">
                                <div class="md-header btn-toolbar">
                                    <asp:TextBox ID="TextBox3" runat="server" type="number" class="form-control" onkeypress="applyFormatCurrency(this);" data-validation-required-message="This field is required"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label"></label>
                            <div class="col-sm-10 ">
                                <div class="md-header btn-toolbar">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <center>
              <asp:Button runat="server" class="btn btn-block btn-success" ID="Button1" Text="Guardar" Width="146px" OnClick="Button1_Click" /></>
               </center>
                <!-- /.col -->
            </div>
            <!-- /.row -->

        </div>


        <div class="box box-default">
            <div class="box-header with-border">
                <h2 class="box-title">Planes</h2>
            </div>
            <!-- /.box-header -->

            <div class="box-body" style="">
                <div class="row">
                    <asp:GridView ID="GridView1" runat="server" class="table table-bordered table-striped table-responsive" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="10">
                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                        <Columns>
                            <asp:BoundField HeaderText="Codigo de Plan" DataField="idplan" />
                            <asp:BoundField HeaderText="Valor" DataField="valor" />
                            <asp:BoundField HeaderText="Detalle" DataField="detalle" />
                            <asp:CheckBoxField HeaderText="Telefonia" DataField="telefonia" Text=" " ItemStyle-CssClass="filled-in chk-col-green">
                                <ItemStyle CssClass="filled-in chk-col-green"></ItemStyle>
                            </asp:CheckBoxField>
                            <asp:CheckBoxField HeaderText="Television" DataField="television" Text=" " />
                            <asp:CheckBoxField HeaderText="Internet" DataField="internet" Text=" " />
                            <asp:BoundField HeaderText="Estado" DataField="estado" />
                            <asp:BoundField HeaderText="Tipo de Plan" DataField="tipoplan" />
                            <asp:BoundField HeaderText="Subida" DataField="subida" />
                            <asp:BoundField HeaderText="Bajada" DataField="bajada" />


                        </Columns>

                        <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerSettings Mode="NextPreviousFirstLast" />

                        <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                        <RowStyle BackColor="#EFF3FB"></RowStyle>

                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                    <!-- /.row -->

                </div>
                <!-- /.box-body -->

            </div>

        </div>

    </section>

</asp:Content>
