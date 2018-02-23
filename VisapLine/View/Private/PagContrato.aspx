﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="PagContrato.aspx.cs" Inherits="VisapLine.View.Private.PagContrato" %>

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
        <h1>Listado de Contratos
        </h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Contratos</a></li>
            <li class="breadcrumb-item active">Listado de Contratos</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <%--        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Cl">Calle</asp:ListItem>
            <asp:ListItem Value="Cr">Carrera</asp:ListItem>
            <asp:ListItem Value="Trans">Transversal</asp:ListItem>
            <asp:ListItem Value="Diag">Diagonal</asp:ListItem>
            <asp:ListItem Value="Av">Avenida</asp:ListItem>
            <asp:ListItem Value="AK">Avenida carrera</asp:ListItem>
            <asp:ListItem Value="AC">Avenida calle</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="TextBox1" runat="server" Width="24px"> </asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" Width="17px" MaxLength="1"></asp:TextBox>
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>Bis</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="TextBox3" runat="server" Width="17px" MaxLength="1"></asp:TextBox>
        <asp:DropDownList ID="DropDownList3" runat="server">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="N">Norte</asp:ListItem>
            <asp:ListItem Value="S">Sur</asp:ListItem>
            <asp:ListItem Value="E">Este</asp:ListItem>
            <asp:ListItem Value="O">Oeste</asp:ListItem>
        </asp:DropDownList>


        <asp:TextBox ID="TextBox4" runat="server" Width="56px"></asp:TextBox>
        <asp:TextBox ID="TextBox5" runat="server" Width="16px" MaxLength="1"></asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server" Width="33px"></asp:TextBox>
        <asp:DropDownList ID="DropDownList4" runat="server">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="N">Norte</asp:ListItem>
            <asp:ListItem Value="S">Sur</asp:ListItem>
            <asp:ListItem Value="E">Este</asp:ListItem>
            <asp:ListItem Value="O">Oeste</asp:ListItem>
        </asp:DropDownList>--%>

        <div class="box box-default">
            <div class="box-header with-border">
                <h2 class="box-title">Contratos</h2>
            </div>
            <!-- /.box-header -->

            <div class="box-body col">
                <table class="table table-hover table-responsive" id="example">
                    <thead style="background-color: #507CD1">
                        <tr>
                            <th style="color: white">Codigo
                            </th>
                            <th style="color: white">Identificacion
                            </th>
                            <th style="color: white">Nombre y Apellido
                            </th>
                            <th style="color: white">Plan
                            </th>
                            <th style="color: white">Valor
                            </th>
                            <th style="color: white">Estado
                            </th>
                            <th style="color: white">Sucurasal
                            </th>
                            <th style="color: white">Direccion  
                            </th>
                            <th style="color: white">
                            Correo  
                                 
                            <th style="color: white">Edit
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="repeteidordeinventario" runat="server">
                            <ItemTemplate>

                                <tr>
                                    <th>
                                        <label><%#Eval("codigo") %></label>
                                    </th>
                                    <th>
                                        <label><%#Eval("identificacion") %></label>
                                    </th>
                                    <th>
                                        <label><%#Eval("nombreter") %> <%#Eval("apellido") %></label>
                                    </th>
                                    <th>
                                        <label><%#Eval("detalle") %> </label>
                                    </th>
                                    <th>
                                        <label><%#Eval("valor") %> </label>
                                    </th>
                                    <th>
                                        <label><%#Eval("estadoc") %> </label>
                                    </th>
                                    <th>
                                        <label><%#Eval("nombresucur") %> </label>
                                    </th>
                                    <th>
                                        <label><%#Eval("direnviofactura") %></label>
                                    </th>
                                    <th>
                                        <label><%#Eval("correo") %></label>
                                    </th>

                                    <th>
                                        <a href="servicio.aspx?key=<%#Eval("idcontrato")%>" class="glyphicon glyphicon-edit">Edit:Servicio</a>

                                        <a href="GestContrato.aspx?iCnt=<%#Eval("codigo")%>" class="glyphicon glyphicon-edit">Edit:Contrato</a>

                                    </th>


                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                    <tfoot style="background-color: #507CD1">
                        <tr>
                            <th style="color: white">Codigo
                            </th>
                            <th style="color: white">Identificacion
                            </th>
                            <th style="color: white">Nombre y Apellido
                            </th>
                            <th style="color: white">Plan
                            </th>
                            <th style="color: white">Valor
                            </th>
                            <th style="color: white">Estado
                            </th>
                            <th style="color: white">Sucurasal
                            </th>
                            <th style="color: white">Direccion  
                            </th>
                            <th style="color: white">
                            Correo                                  
                            <th style="color: white">Modificar
                            </th>
                        </tr>
                    </tfoot>

                </table>
            </div>
        </div>
    </section>
</asp:Content>
