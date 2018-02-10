<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Incidencia.aspx.cs" Inherits="VisapLine.View.Private.Incidencia" %>

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
            swal("LA INCIDENCIA FUE CREADA CON EXITO!", "", "success");
        }
        function alerterror() {
            swal("EL REGISTRO NO SE PUDO COMPLETAR!", "Verifique la informacion ingresada y vuelva intentar", "error");
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
        <h1>Incidencia</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Incidencia</li>
        </ol>
    </section>

    <section class="content">
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Buscar Contrato</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-3 col-form-label">CC o Nit:</label>
                            <div class="col-sm-5">
                                <asp:TextBox runat="server" type="Text" CssClass="form-control" ID="TextBoxdni" Style="text-transform: uppercase"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <asp:Button runat="server" ID="Button2" CssClass="btn btn-block btn-success btn-lg" Text="Buscar" OnClick="Button2_Click" Width="100px" />
                            </div>
                        </div>
                    </div>
               <%--     <div class="col-md-6 col-15">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-3 col-form-label">Codigo:</label>
                            <div class="col-sm-5">
                                <asp:TextBox runat="server" type="Text" CssClass="form-control" ID="TextBoxcodcontra" Style="text-transform: uppercase"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <asp:Button runat="server" ID="Buttonbuscarcodg" CssClass="btn btn-block btn-success" Text="Buscar" OnClick="Buttonbuscarcodg_Click" Width="100px" />
                            </div>
                        </div>
                    </div>--%>
                </div>
                <!-- /.col -->
            </div>
        </div>
        <div class="row" id="iddatosterceros" visible="false" runat="server">
            <div class="col-5">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Datos del Cliente</h3>
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
                                    <div class="col-sm-8">
                                        <asp:Label ID="Label1" runat="server" CssClass="form-control bg-gray" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Apellido:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="Label2" CssClass="form-control bg-gray" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Direccion:</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="TextBox1" TextMode="MultiLine" Enabled="false" Rows="5" Columns="15" runat="server" class="form-control bg-gray" Width="140px" Height="100px"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-7">
                <asp:Label ID="idservicio" runat="server" Visible="false"></asp:Label>
                <div class="row" id="divtablagestcontr" runat="server" visible="false">
                    <div class="box box-primary">
                        <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="false" class="table table-bordered table-striped table-responsive" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                            <Columns>
                                <asp:CommandField ShowSelectButton="true" SelectText="" ControlStyle-CssClass="glyphicon glyphicon-edit" />
                                <asp:BoundField HeaderText="Codg" HeaderStyle-HorizontalAlign="Center" DataField="id" />
                                <asp:BoundField HeaderText="Fecha" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:d}" DataField="fechainiciocol" />
                                <asp:BoundField HeaderText="Megas" HeaderStyle-HorizontalAlign="Center" DataField="cantidadmegascol" />
                                <asp:BoundField HeaderText="Estado" HeaderStyle-HorizontalAlign="Center" DataField="estadocol" />
                                <asp:BoundField HeaderText="Direccion" HeaderStyle-HorizontalAlign="Center" DataField="direccioncol" />
                                <asp:BoundField HeaderText="Barrio" HeaderStyle-HorizontalAlign="Center" DataField="barriocol" />
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
            </div>
        </div>



        <div class="box box-default" id="divincidencia" visible="false" runat="server">
            <div class="box-header with-border">
                <h3 class="box-title">Incidencia</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6 col-6">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Estado</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="DropDownListestadoinc" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                    <asp:ListItem>ACTIVO</asp:ListItem>
                                    <asp:ListItem>INACTIVO</asp:ListItem>
                                    <asp:ListItem>ESPERA</asp:ListItem>
                                    <asp:ListItem>SOLUCIONADO</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Detalle</label>
                            <div class="col-sm-8">
                                <textarea id="TextArea1detalle" class="form-control" runat="server" data-iconlibrary="fa" data-hidden-buttons="cmdBold" style="margin-top: 0px; margin-bottom: 0px; height: 139px;" required data-validation-required-message="This field is required"></textarea>

                            </div>
                        </div>

                    </div>
                    <div class="col-md-6 col-6">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Caracteristica</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Tipo Incidencia</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label"></label>
                            <div class="col-sm-8">
                                <asp:Button ID="ButtonGuardar" runat="server" Text="Registrar" class="btn btn-block btn-success btn-lg" Width="150px" Height="35px" OnClick="ButtonGuardar_Click" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- /.col -->
        </div>

        <div class="modal" id="modal-gesti">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">

                        <h6 class="modal-title">¿Esta seguro que quiere editar el contrato?</h6>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="box box-primary bg-transparent">
                            <div class="sa-icon sa-warning pulseWarning" style="display: block;">
                                <span class="sa-body pulseWarningIns"></span>
                                <span class="sa-dot pulseWarningIns"></span>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <asp:Button ID="Button1" runat="server" Text="Guardar" class="btn btn-block btn-success btn-lg" Width="100px" Height="30px" OnClick="Button1_Click" />
                                </div>
                                <div class="col-sm-6">
                                    <asp:Button ID="Button4" runat="server" Text="Cancelar" class="btn btn-block btn-danger btn-lg" Width="100px" Height="30px" data-dismiss="modal" />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
