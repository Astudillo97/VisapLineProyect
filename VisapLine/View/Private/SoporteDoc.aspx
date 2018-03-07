<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="SoporteDoc.aspx.cs" Inherits="VisapLine.View.Private.SoporteDoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            swal("EL SOPORTE FUE CARGADO CON EXITO!", "", "success");
        }
        function guardo() {
            swal("SE REGISTRO CON EXITO!", "La operacion se realizo con exito", "success");
        }
        function alerterror() {
            swal("EL REGISTRO NO SE PUDO COMPLETAR EL CARGUE!", "Verifique la informacion ingresada y vuelva intentar", "error");
        }
        function alrt() {
            swal("ESTA OPCION AUN NO ESTA DISPONIBLE!", "Los super ingnieros estan en proceso de implocion espere", "error");
        }
        function botonmodalgesti() {
            document.getElementById("botonmodalcontr").click();
        }
    </script>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content-header">
        <h1>Carga de Documentos del Cliente</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Gestion de Archivos</li>
        </ol>
    </section>
    <section class="content">

        <div class="box box-default" id="soporteformulario" runat="server">
            <div class="box-header with-border">
                <h3 class="box-title">Cargar Archivos</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-6">
                        <div class="box box-default">
                            <div class="box-header with-border">
                                <h3 class="box-title">Datos del Cliente  N° CC:
                                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label></h3>
                                <asp:Label ID="Label6" runat="server" Visible="false" Text=""></asp:Label>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-5">
                                        <img src="../../Contenido/images/user2-160x160.jpg" height="135px" width="135px" />
                                    </div>
                                    <div class="col-7">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">Nombre:</label>
                                            <div class="col-sm-10">
                                                <asp:Label ID="Label3" runat="server" CssClass="form-control bg-gray" Text=""></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">Apellido:</label>
                                            <div class="col-sm-10">
                                                <asp:Label ID="Label4" CssClass="form-control bg-gray" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">Direccion:</label>
                                            <div class="col-sm-10">
                                                <asp:TextBox ID="TextBox1" TextMode="MultiLine" Enabled="false" Rows="5" Columns="15" runat="server" class="form-control bg-gray" Width="200px" Height="90px"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="box box-default">
                            <div class="box-header with-border">
                                <h3 class="box-title">Carga Soportes</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                                <div class="row" id="div1" runat="server">
                                    <div class="box box-primary">
                                        <div class="form-group row">
                                            <label for="example-text-input" class="col-sm-2 col-form-label">CONTRATO</label>
                                            <div class="col-sm-10">
                                                <asp:FileUpload ID="FileUploadControl" runat="server" />
                                                <%--     <asp:Button runat="server" ID="UploadButton" Text="Upload" OnClick="UploadButton_Click" />
                                                --%>
                                                <br />
                                                <br />
                                                <%--   <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />--%>
                                            </div>
                                        </div>
                                          <div class="form-group row">
                                            <label for="example-text-input" class="col-sm-2 col-form-label">CEDULA</label>
                                            <div class="col-sm-10">
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                                <%--      <asp:Button runat="server" ID="Button1" Text="Upload" OnClick="UploadButton_Click" />
                                                --%>
                                                <br />
                                                <br />
                                                <%--                         <asp:Label runat="server" ID="Label3" Text="Upload status: " />--%>
                                            </div>
                                        </div>
                                      
                                        <div class="form-group row">
                                            <label for="example-text-input" class="col-sm-2 col-form-label">RECIBO</label>
                                            <div class="col-sm-10">
                                                <asp:FileUpload ID="FileUpload2" runat="server" />
                                                <%--     <asp:Button runat="server" ID="Button2" Text="Upload" OnClick="UploadButton_Click" />
                                                --%>
                                                <br />
                                                <br />
                                                <%--       <asp:Label runat="server" ID="Label4" Text="Upload status: " />--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <center>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-block btn-success btn-lg" OnClick="Button1_Click" Width="143px" Height="30px"  Text="Guardar" />
                </center>
            </div>
        </div>
    </section>
</asp:Content>
