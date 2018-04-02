<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="solicitudes.aspx.cs" Inherits="VisapLine.View.Private.solicitudes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../Contenido/assets/vendor_components/jquery/dist/jquery.js"></script>
    <script src="../../Contenido/assets/vendor_components/glyphicons/glyphicon.css"></script>
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <asp:ScriptManager ID="scripservicc" runat="server"></asp:ScriptManager>
    <script type="text/javascript">
        function openmodal() {
            $('#mymodal').modal('show');
        }
        function deletealert() {
            swal("LA SOLICITUD FUE CREADA CON EXITO!", "", "success");
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
    <section class="content-header">
        <h1>Crear Solicitudes</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Servicios</li>
        </ol>
    </section>
    <div class="modal fade" id="mymodal" data-backdrop="”static”">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">ASIGNAR TECNICO <span class="glyphicon glyphicon-user"></span></h4>
                </div>
                <div class="modal-body">
                    <asp:GridView CssClass="table no-border" OnSelectedIndexChanging="gridtecnicos_SelectedIndexChanging" AutoGenerateColumns="false" ID="gridtecnicos" runat="server">
                        <Columns>
                            <asp:CommandField ShowSelectButton="true" SelectText="ASIGNAR" ControlStyle-CssClass="btn btn-success" />
                            <asp:BoundField HeaderText="IDENTIFICACION" DataField="idterceroscol" />
                            <asp:BoundField HeaderText="NOMBRE" DataField="nombrecol" />
                            <asp:BoundField HeaderText="APELLIDO" DataField="apellidocol" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">CERRAR</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <section class="content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li><a href="#ContentPlaceHolder1_Creacion" runat="server" id="pan1" data-toggle="tab">Crear Solicitud</a></li>
                <li><a href="#ContentPlaceHolder1_Solicitudes" runat="server" id="pan2" data-toggle="tab">Ver Solicitudes</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane" id="Creacion" runat="server">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Solucitud</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-element">
                                        <div class="form-group row">
                                            <asp:Label CssClass="col-sm-3 col-form-label" ID="lbl1CSolicitud" runat="server" Text="Servicio :"></asp:Label>
                                            <asp:Label CssClass="form-control col-sm-9" ID="servicio" runat="server" Text="all text put here"></asp:Label>
                                        </div>
                                        <div class="form-group row">
                                            <asp:Label CssClass="col-sm-3 col-form-label" ID="lbl2CSolicitud" runat="server" Text="Tipo Solicitud:"></asp:Label>
                                            <asp:DropDownList ID="dropdownTSoli" runat="server" CssClass="custom-select form-control col-sm-9">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group row">
                                            <asp:Label CssClass="col-sm-3 col-form-label" ID="lbl3CSolicitud" runat="server" Text="Medio Solicitud :"></asp:Label>
                                            <asp:DropDownList ID="dropdownMSoli" runat="server" CssClass="custom-select form-control col-sm-9">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group row">
                                            <asp:Label CssClass="col-sm-3 col-form-label" ID="lbl4CSolicitud" runat="server" Text="Atiende :"></asp:Label>
                                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#mymodal">
                                                <span class="glyphicon glyphicon-search"></span>
                                            </button>
                                            <asp:Label CssClass="form-control col-sm-8" ID="lblatendio" runat="server"></asp:Label>
                                        </div>
                                        <div class="form-group row">
                                            <asp:Label CssClass="col-sm-3 col-form-label" ID="Label5" runat="server" Text="Fecha Inicio"></asp:Label>
                                            <div class="col-sm-9">
                                                <input type="date" class="form-control" id="fechIni_" runat="server" placeholder="Serial">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <asp:Label CssClass="col-sm-3 col-form-label" ID="Label6" runat="server" Text="Fecha Fin"></asp:Label>
                                            <div class="col-sm-9">
                                                <input type="date" class="form-control" id="fechFin_" runat="server" placeholder="Serial">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Solicitante</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group row">
                                        <asp:Label CssClass="col-sm-3 col-form-label" ID="Label4" runat="server" Text="Solicitante"></asp:Label>
                                        <asp:DropDownList AutoPostBack="true" ID="dropsolicitante" OnSelectedIndexChanged="dropsolicitante_TextChanged" runat="server" CssClass="custom-select form-control col-sm-9">
                                            <asp:ListItem>
                                                SELECIONAR
                                            </asp:ListItem>
                                            <asp:ListItem>
                                                TITULAR
                                            </asp:ListItem>
                                            <asp:ListItem>
                                                OTRO
                                            </asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label CssClass="col-sm-3 col-form-label" ID="Label1" runat="server" Text="Identificacion del Solicitante"></asp:Label>
                                        <asp:TextBox ID="Solicitanteidenti" runat="server" CssClass="form-control col-sm-9 border-right-0 border-top-0 border-left-0"></asp:TextBox>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label CssClass="col-sm-3 col-form-label" ID="Label2" runat="server" Text="Nombre del Solicitante"></asp:Label>
                                        <asp:TextBox ID="Solicitantenombre" runat="server" CssClass="form-control col-sm-9 border-right-0 border-top-0 border-left-0"></asp:TextBox>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label CssClass="col-sm-3 col-form-label" ID="Label3" runat="server" Text="Apellido del Solicitante"></asp:Label>
                                        <asp:TextBox ID="Solicitanteapellido" runat="server" CssClass="form-control col-sm-9 border-right-0 border-top-0 border-left-0"></asp:TextBox>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label CssClass="col-sm-3 col-form-label" ID="Label7" runat="server" Text="Detalle:"></asp:Label>
                                        <asp:TextBox TextMode="MultiLine" Rows="5" Columns="50" ID="TextBox1" runat="server" CssClass="form-control col-sm-9 border-right-0 border-top-0 border-left-0"></asp:TextBox>
                                    </div>
                                    <asp:Button ID="btnguardar" CssClass="btn btn-success" runat="server" OnClick="btnguardar_Click" Text="CREAR" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="Solicitudes" runat="server">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Solucitud</h3>
                                </div>
                                <div class="box-body">
                                    <table class="table table-hover table-responsive" id="example1">
                                        <thead style="background-color: #507CD1">
                                            <tr>
                                                <th style="color: white">CLIENTE
                                                </th>
                                                <th style="color: white">TIPO SOLICITUD
                                                </th>
                                                <th style="color: white">SOLICITANTE
                                                </th>
                                                <th style="color: white">MEDIO DE SOLICITUD
                                                </th>
                                                <th style="color: white">SOLICITUD
                                                </th>
                                                <th style="color: white">FECHA INICIO
                                                </th>
                                                <th style="color: white">FECHA FINALIZACION
                                                </th>
                                                <th style="color: white">FECHA INSCRIPCION
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater runat="server" ID="repetidorsolicitudes">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%#Eval("titularcol") %>
                                                        </td>
                                                        <td><%#Eval("tiposolicitudcol") %>
                                                        </td>
                                                        <td><%#Eval("solicitocol") %>
                                                        </td>
                                                        <td><%#Eval("mediodesolicitud") %>
                                                        </td>
                                                        <td><%#Eval("detalle") %>
                                                        </td>
                                                        <td><%#Eval("fechainicio") %>
                                                        </td>
                                                        <td><%#Eval("fechafin") %>
                                                        </td>
                                                        <td><%#Eval("fechadesolicitud") %>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                        <tfoot style="background-color: #507CD1">
                                            <tr>
                                                <td style="color: white">CLIENTE
                                                </td>
                                                <td style="color: white">TIPO SOLICITUD
                                                </td>
                                                <td style="color: white">SOLICITANTE
                                                </td>
                                                <td style="color: white">MEDIO DE SOLICITUD
                                                </td>
                                                <td style="color: white">FECHA DE REGISTRO
                                                </td>
                                                <td style="color: white">FECHA INICIO
                                                </td>
                                                <td style="color: white">FECHA FINALIZACION
                                                </td>
                                                <td style="color: white">FECHA INSCRIPCION
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
