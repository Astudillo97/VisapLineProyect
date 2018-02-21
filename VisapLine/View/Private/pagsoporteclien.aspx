﻿<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="pagsoporteclien.aspx.cs" Inherits="VisapLine.View.Private.pagsoporteclien" %>

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
        <h1>Soporte Clientes</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Soporte</li>
        </ol>
    </section>
    <section class="content">
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Contratos</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-12">
                        <asp:Label ID="Label2" runat="server" Text="Label">Existen  
                            <asp:Label ID="contarcontratosopor" runat="server"></asp:Label>
                            Contratos por subir soportes.</asp:Label>
                        <div class="row" id="divtablagestcontr" runat="server">
                            <div class="box box-primary">
                                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="false" class="table table-bordered table-striped table-responsive" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" AllowPaging="True">
                                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="true" SelectText="" ControlStyle-CssClass="glyphicon glyphicon-edit">
                                            <ControlStyle CssClass="glyphicon glyphicon-edit"></ControlStyle>
                                        </asp:CommandField>
                                        <asp:BoundField HeaderText="Contrato" DataField="idcontrato"  ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Codg" DataField="codigo" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Identificacion" DataField="identificacion" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Nombre" DataField="nombre" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Apellido" DataField="apellido" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Estado" DataField="estadoc" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Direcccion" DataField="direnviofactura" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Justify"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Plan" DataField="detalle" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Justify"></ItemStyle>
                                        </asp:BoundField>

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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>     
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Soportes</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-6">
                        <div class="box box-default">
                            <div class="box-header with-border">
                                <h3 class="box-title">Datos del Cliente  N°: <asp:Label ID="Label5" runat="server" Text=""></asp:Label></h3>
                                <asp:Label ID="Label6" runat="server" Visible="false" Text=""></asp:Label>
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
                                                <asp:Label ID="Label3" runat="server" CssClass="form-control bg-gray" Text=""></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">Apellido:</label>
                                            <div class="col-sm-8">
                                                <asp:Label ID="Label4" CssClass="form-control bg-gray" runat="server" Text=""></asp:Label>
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
                                            <label for="example-text-input" class="col-sm-2 col-form-label">Cedula</label>
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
                                            <label for="example-text-input" class="col-sm-2 col-form-label">Contrato</label>
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
                                            <label for="example-text-input" class="col-sm-2 col-form-label">Recibo</label>
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
