<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Incidencia.aspx.cs" Inherits="VisapLine.View.Private.Incidencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        textarea {
            resize: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <asp:ScriptManager ID="respust" runat="server"></asp:ScriptManager>
    <script type="text/javascript">
        function deletealert() {
            swal("ORDEN CREADA CON EXITO!", "Su orden ser creo con el numero ", "success");
        }
        function alerterror() {
            swal("ORDEN FALLIDA!", "La orden no se pudo crear por favor verifique o contactese con el soporte", "error");
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
                    <div class="col-md-6 col-15">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-3 col-form-label">Codigo:</label>
                            <div class="col-sm-5">
                                <asp:TextBox runat="server" type="number" CssClass="form-control" ID="TextBox1" Style="text-transform: uppercase"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <asp:Button runat="server" ID="Buttonbuscarcodg" CssClass="btn btn-block btn-success btn-lg" Text="Buscar" OnClick="Buttonbuscarcodg_Click" Width="100px" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.col -->
            </div>
        </div>
        <asp:Label ID="idservicio" runat="server" Visible="false"></asp:Label>

        <div class="row" id="divtablagestcontr" runat="server" visible="false">
            <div class="box box-primary">
                <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="false" class="table table-bordered table-striped table-responsive" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:CommandField ShowSelectButton="true" />
                        <asp:BoundField HeaderText="Codg" DataField="id" />
                        <asp:BoundField HeaderText="Fecha" DataFormatString="{0:d}" DataField="fechainiciocol" />
                        <asp:BoundField HeaderText="Megas" DataField="cantidadmegascol" />
                        <asp:BoundField HeaderText="Estrato" DataField="estratocol" />
                        <asp:BoundField HeaderText="Estado" DataField="estadocol" />
                        <asp:BoundField HeaderText="Direccion" DataField="direccioncol" />
                        <asp:BoundField HeaderText="Barrio" DataField="barriocol" />
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

        <div class="box box-default" id="divincidencia" visible="false" runat="server">
            <div class="box-header with-border">
                <h3 class="box-title">Incidencia</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6 col-6">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Fecha inicio</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="Textboxfechainicio" runat="server" type="date" class="form-control"></asp:TextBox>
                            </div>
                        </div>
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
                                <textarea id="TextArea1detalle" runat="server" data-iconlibrary="fa" rows="5" resize="none" data-hidden-buttons="cmdBold" style="margin-top: 0px; margin-bottom: 0px; height: 118px;" required data-validation-required-message="This field is required"></textarea>

                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Descuento</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                    <asp:ListItem>SI</asp:ListItem>
                                    <asp:ListItem>NO</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Caracteristica</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem>Seleccione</asp:ListItem>                                  
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-6">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Fecha Finalizacion</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="Textboxfechafinal" runat="server" type="date" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Costo</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="Textboxcosto" runat="server" type="number" class="form-control" placeholder="$"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Observacion</label>
                            <div class="col-sm-8">
                                <textarea id="TextAreaobservacion" runat="server" data-iconlibrary="fa" rows="5" resize="none" data-hidden-buttons="cmdBold" style="margin-top: 0px; margin-bottom: 0px; height: 118px;" required data-validation-required-message="This field is required"></textarea>

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
                            <div class="col-sm-8">
                                <asp:Button ID="ButtonGuardar" runat="server" Text="Registrar" class="btn btn-block btn-success btn-lg" Width="143px" Height="30px" OnClick="ButtonGuardar_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.col -->
            </div>
        </div>
    </section>



</asp:Content>
