<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="PagEgresos.aspx.cs" Inherits="VisapLine.View.Private.PagEgresos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        textarea {
            resize: none;
        }
    </style>
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
        function nocontro() {
            swal("NO SE ENCOTRO NINGUN REGISTRO!", "Debe registrar el cliente", "error");
        }
        function errorsoft() {
            swal("NO SE COMPLETO TODO EL FORMULARIO!", "Verficar los campos", "error");
        }
        function alerterror() {
            swal("SE HA DETECTADO UN ERROR!", "Informe ha soporte tecnico del error", "error");
        }
        function activarcajalert() {
            swal("LA CAJA SE HA ACTIVADO CON EXITO!", "La activacion se ha realizado con exito", "success");
        }
        function elimalert() {
            swal("SE HA CERRADO LA CAJA CON EXITO!", "Se ha realizado la operacion con exito ", "success");
        }
        function elimalertCAJA() {
            swal("LA CAJA YA ESTA ABIERTA!", "Se ha realizado la operacion con exito ", "error");
        }
        function elimalertcerrado() {
            swal("LA CAJA YA ESTA CERRADA!", "Se ha realizado la operacion con exito ", "error");
        }
    </script>
    <section class="content-header">
        <h1>Egresos</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Egresos</li>
        </ol>
    </section>
    <section class="content">
        <div class="box box-default">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-3 col-form-label">CC o Nit:</label>
                            <div class="col-sm-9">
                                <asp:TextBox runat="server" type="number" CssClass="form-control" ID="texboxdni" Style="text-transform: uppercase"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button1" Text="Consultar" OnClick="Button1_Click" Width="146px" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box-body" id="tipopersona" runat="server" visible="false">
                <div class="row">
                    <div class="col">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-6" runat="server" visible="false" id="Proveedors">
                    <div>
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Registro Tercero</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Tipo Tercero</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Nit o CC Proveedor</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="nit_" runat="server" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Razón Social</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="razonsocail_" runat="server" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Telefono</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="telefono_" runat="server" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Correo</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="correo_" runat="server" placeholder="">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6" runat="server" visible="false" id="datosterceros">
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title">Datos del Tercero</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-4">
                                    <img src="../../Contenido/images/user2-160x160.jpg" height="120px" width="130px" />
                                </div>
                                <div class="col-7">
                                    <div class="form-group row">
                                        <asp:Label ID="Labelidtercero" runat="server" Text="" Visible="false"></asp:Label>
                                        <label class="col-sm-4 col-form-label">Nombre:</label>
                                        <div class="col-sm-8">
                                            <asp:Label ID="Label1" runat="server" CssClass="form-control bg-gray" Width="200px" Text=""></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label id="idapellidolabel" runat="server" class="col-sm-4 col-form-label">Apellido:</label>
                                        <div class="col-sm-8">
                                            <asp:Label ID="Label2" CssClass="form-control bg-gray" Width="200px" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Direccion:</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="TextBox1" TextMode="MultiLine" Rows="5" Columns="15" runat="server" class="form-control bg-gray" Width="200px" Height="100px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6" runat="server" visible="false" id="Div1">
                    <div>
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Egreso</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Motivo</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList2" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Valor Egreso</label>
                                            <div class="col-sm-9">
                                                <asp:TextBox ID="TextBox3" runat="server" type="number" CssClass="form-control" Style="text-transform: uppercase"></asp:TextBox>                                     
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Observacion</label>
                                            <div class="col-sm-9">
                                                <asp:TextBox ID="TextBox2" TextMode="MultiLine" Style="text-transform: uppercase"  Rows="5" Columns="15" runat="server" class="form-control" Height="100px"></asp:TextBox>
                                            </div>
                                        </div>
                                        <center>
                                             <asp:Button ID="Buttonguarimpri" class="btn btn-block btn-success btn-lg" Width="143" Height="30" runat="server" OnClick="Buttonguarimpri_Click" Text="Guardar" />
                                        </center>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</asp:Content>
