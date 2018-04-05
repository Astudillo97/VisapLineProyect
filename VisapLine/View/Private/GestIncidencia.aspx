<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="GestIncidencia.aspx.cs" Inherits="VisapLine.View.Private.GestIncidencia" %>

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
            swal("LA INCIDENCIA FUE SOLUCIONADA CON EXITO!", "", "success");
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
        function openmodalimpresion() {
            $('#modalimpri').modal('show');
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
            <li class="breadcrumb-item active">Gesstion de Incidencias</li>
        </ol>
    </section>

    <section class="content">

        <div class="row">
            <div class="box box-default">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Incidencias</h3>
                    </div>
                    <asp:GridView ID="GridView2" runat="server" AutoPostBack="true" OnRowCommand="GridView2_RowCommand" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" class="table table-bordered table-striped" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging">
                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                        <Columns>
                            <asp:CommandField ShowSelectButton="true" SelectText="" ControlStyle-CssClass="glyphicon glyphicon-edit" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton CommandArgument='<%# Eval("idincidensia") %>' runat="server" ID="btnprint" CommandName="imprimir" Text="" CssClass="glyphicon glyphicon-print" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Codg" DataField="idincidensia" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Nombre" DataField="nombre" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Apellido" DataField="apellido" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Fecha Registro" DataField="fechainicio" DataFormatString="{0:f}" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Estado" DataField="estado" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Detalle" DataField="detalle" ItemStyle-HorizontalAlign="Center">
                                <ControlStyle CssClass="filled-in" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Tipo de Incidencia" DataField="tipoincidencia" ItemStyle-HorizontalAlign="Center">
                                <ControlStyle CssClass="filled-in" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
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


        <div class="row" id="iddatosterceros" runat="server" visible="false">
            <div class="col-6">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Datos del Cliente</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-4">
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
                                        <asp:TextBox ID="TextBox1" TextMode="MultiLine" Enabled="false" Rows="5" Columns="15" runat="server" class="form-control bg-gray" Width="165px" Height="90px"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="box box-default" id="divincidencia" runat="server">
                    <div class="box-header with-border">
                        <h3 class="box-title">Solucion de incidencia N°
                            <asp:Label ID="Labelidincidencia" runat="server"></asp:Label></h3>
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
                                            <asp:ListItem>CERRADO</asp:ListItem>
                                            <asp:ListItem>ESPERA</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Detalle</label>
                                    <div class="col-sm-8">
                                        <textarea id="TextArea1detalle" class="form-control" runat="server" data-iconlibrary="fa" data-hidden-buttons="cmdBold" style="text-transform: uppercase; margin-top: 0px; margin-bottom: 0px; height: 120px;" required data-validation-required-message="This field is required"></textarea>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6 col-6">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Descuento</label>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="true">
                                            <asp:ListItem>NO</asp:ListItem>
                                            <asp:ListItem>SI</asp:ListItem>

                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group row" id="costodescuento" runat="server" visible="false">
                                    <label class="col-sm-4 col-form-label">Costo</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" type="number" placeholder="$"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <center>
                 <asp:Button ID="Button1" runat="server" class="btn btn-block btn-success btn-lg" Width="143" Height="30" Visible="false" Text="Guardar" OnClick="Button1_Click" />
        </center>
        

    </section>

</asp:Content>
