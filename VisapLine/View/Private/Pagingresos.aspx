<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Pagingresos.aspx.cs" Inherits="VisapLine.View.Private.Pagingresos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        textarea {
            resize: none;
        }
    </style>
    <asp:scriptmanager id="respust" runat="server"></asp:scriptmanager>
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
        function guardo() {
            swal("SE REGISTRO CON EXITO!", "La operacion se realizo con exito", "success");
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
        <h1>Ingresos</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Finanzas</a></li>
            <li class="breadcrumb-item active">Egresos</li>
        </ol>
    </section>
    <asp:panel id="Alerta" visible="false" runat="server" cssclass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:panel>
    <section class="content">
        <div class="box box-default">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-3 col-form-label">CC o Nit:</label>
                            <div class="col-sm-9">
                                <asp:textbox runat="server" type="number" cssclass="form-control" id="texboxdni" style="text-transform: uppercase"></asp:textbox>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <asp:button runat="server" class="btn btn-block btn-success btn-lg" id="Button1" text="Consultar" onclick="Button1_Click" width="146px" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box-body" id="tipopersona" runat="server">
                <div class="row">
                    <div class="col">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-6" runat="server" id="Proveedors">
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
                                                <asp:dropdownlist id="DropDownList1" appenddatabounditems="true" cssclass="form-control" runat="server">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:dropdownlist>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Tipo Documento</label>
                                            <div class="col-sm-9">
                                                <asp:dropdownlist id="DropDownListtipodocu" cssclass="form-control" appenddatabounditems="true" runat="server">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:dropdownlist>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Razón Social</label>
                                            <div class="col-sm-9">
                                                <asp:textbox id="TextBox5" class="form-control" style="text-transform: uppercase" runat="server"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Telefono</label>
                                            <div class="col-sm-9">
                                                <asp:textbox id="TextBox6" style="text-transform: uppercase" class="form-control" runat="server"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Correo</label>
                                            <div class="col-sm-9">
                                                <asp:textbox id="TextBox7" runat="server" class="form-control"></asp:textbox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6" runat="server"  visible="false" id="datosterceros">
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
                                        <asp:label id="Labelidtercero" runat="server" text="" visible="false"></asp:label>
                                        <label class="col-sm-4 col-form-label">Nombre:</label>
                                        <div class="col-sm-8">
                                            <asp:label id="Label1" runat="server" cssclass="form-control bg-gray" width="200px" text=""></asp:label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label id="idapellidolabel" runat="server" class="col-sm-4 col-form-label">Apellido:</label>
                                        <div class="col-sm-8">
                                            <asp:label id="Label2" cssclass="form-control bg-gray" width="200px" runat="server" text=""></asp:label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Direccion:</label>
                                        <div class="col-sm-8">
                                            <asp:textbox id="TextBox1" textmode="MultiLine" rows="5" columns="15" runat="server" class="form-control bg-gray" width="200px" height="100px"></asp:textbox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6" runat="server"  id="Div1">
                    <div>
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Ingresos</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Motivo</label>
                                            <div class="col-sm-9">
                                                <asp:dropdownlist id="DropDownList2" appenddatabounditems="true" cssclass="form-control" runat="server">
                                                    <asp:ListItem>Seleccione</asp:ListItem>
                                                </asp:dropdownlist>
                                           </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Valor Egreso</label>
                                            <div class="col-sm-9">
                                                <asp:textbox id="TextBox3" runat="server" type="number" cssclass="form-control" style="text-transform: uppercase"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Observacion</label>
                                            <div class="col-sm-9">
                                                <asp:textbox id="TextBox2" textmode="MultiLine" style="text-transform: uppercase" rows="5" columns="15" runat="server" class="form-control" height="100px"></asp:textbox>
                                            </div>
                                        </div>
                                        <center>
                                             <asp:Button ID="Buttonguarimpri" class="btn btn-block btn-success btn-lg" Width="143" Height="30" runat="server" Visible="false" OnClick="Buttonguarimpri_Click1" Text="Guardar" />
                                             <asp:Button ID="Buttonguar2" class="btn btn-block btn-success btn-lg" Width="143" Height="30" OnClick="Buttonguar2_Click" Visible="false" runat="server" Text="Guardar"></asp:Button>
                                        </center>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
