<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Gestplanes.aspx.cs" Inherits="VisapLine.View.Private.Gestplanes" %>

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
            swal("SE HA ACTULIADO CON EXITO!", "La operacion se completo con exito", "success");
        }
        function alerterror() {
            swal("NO SE REGISTRO!", "No se registro el formulario", "error");
        }
        function error() {
            swal("NO Se HA REGISTRADO UN ERROR!", "Informar a soporte tecnico", "error");
        }
    </script>

    <section class="content-header">
        <h1>Plan</h1>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="box box-default ">
            <div class="box-header with-border">
                <h2 class="box-title">Plan N°<asp:Label ID="Label1" runat="server" Text=""></asp:Label></h2>
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
                                    <asp:TextBox ID="TextBox1" Enabled="false" runat="server" type="number" class="form-control" onkeypress="applyFormatCurrency(this);" required data-validation-required-message="This field is required"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="box-body form-element">
                                <div class="row">
                                    <div class="col-sm-3">

                                        <label for="example-text-input" class="col-sm-2 col-form-label">Internet:</label>
                                        <div class="col-sm-10">
                                            <asp:CheckBox ID="CheckBox1" Enabled="false" Text=" " runat="server" class="filled-in chk-col-yellow" />
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <label for="example-text-input" class="col-sm-2 col-form-label">Telefono:</label>
                                        <div class="col-sm-10">
                                            <asp:CheckBox ID="CheckBox2" Enabled="false" Text=" " runat="server" class="filled-in chk-col-yellow" />
                                        </div>

                                    </div>
                                    <div class="col-sm-5">
                                        <label for="example-text-input" class="col-sm-2 col-form-label">Television:</label>
                                        <div class="col-sm-10">
                                            <asp:CheckBox ID="CheckBox3" Enabled="false" Text=" " runat="server" class="filled-in chk-col-yellow" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">Tipo_Plan:</label>
                            <div class="col-sm-10">
                                <asp:DropDownList ID="DropDownList1" runat="server" Enabled="false" CssClass="form-control" AppendDataBoundItems="true" required data-validation-required-message="This field is required">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                    <asp:ListItem>PUBLICO</asp:ListItem>
                                    <asp:ListItem>EMPRESARIAL</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">Subida:</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="TextBox2" runat="server" Enabled="false" type="number" class="form-control" onkeypress="applyFormatCurrency(this);" required data-validation-required-message="This field is required"></asp:TextBox>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">Detalle:</label>
                            <div class="col-sm-10 ">
                                <div class="md-header btn-toolbar">
                                    <asp:TextBox ID="TextBox4"  Enabled="false" TextMode="MultiLine" Rows="5" Columns="15" runat="server" class="form-control bg-gray" Width="445px" Height="140px"></asp:TextBox>
                                
                                
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">Estado:</label>
                            <div class="col-sm-10 ">
                                <div class="md-header btn-toolbar">
                                    <asp:DropDownList ID="DropDownList2" Enabled="false" runat="server" CssClass="form-control" AppendDataBoundItems="true" required data-validation-required-message="This field is required">
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
                                    <asp:TextBox ID="TextBox3" Enabled="false"  runat="server" type="number" class="form-control" onkeypress="applyFormatCurrency(this);" data-validation-required-message="This field is required"></asp:TextBox>
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
                    <table>
                         <tr>
                        <th><asp:Button ID="Button3" runat="server" Text="Modificar" class="btn btn-block btn-info" Width="146px" OnClick="Button3_Click"></asp:Button>
                            <asp:Button runat="server" class="btn btn-block btn-success" Visible="false" ID="Button1" Text="Guardar" Width="146px" OnClick="Button1_Click" /></th>
                      <th><asp:Button runat="server" class="btn btn-block btn-danger" ID="Button2" Text="Cancelar" Width="146px" OnClick="Button2_Click" /></th>                      
             </tr>
                              </table>
         
                    </center>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
    </section>

</asp:Content>
