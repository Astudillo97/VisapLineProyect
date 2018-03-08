<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Soportescargado.aspx.cs" Inherits="VisapLine.View.Private.Soportescargado" %>

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
        <h1>Contratos Cargados</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Gestion de Archivos</li>
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
                        <div class="row" id="divtablagestcontr" runat="server">
                            <div class="box box-primary">
                                <div class="box-body col">
                                    <table class="table table-hover table-responsive" id="example">
                                        <thead style="background-color: #507CD1">
                                            <tr>
                                                <th style="color: white">Contrato
                                                </th>
                                                <th style="color: white">Codg
                                                </th>
                                                <th style="color: white">Identificacion
                                                </th>
                                                <th style="color: white">Nombre y apellido
                                                </th>
                                                <th style="color: white">Estado
                                                </th>
                                                <th style="color: white">Direcccion
                                                </th>
                                                <th style="color: white">Sucurasal
                                                </th>
                                                <th style="color: white">Subir
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="repeteidordeinventario" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <th>
                                                            <label><%#Eval("idcontrato") %></label>
                                                        </th>
                                                        <th>
                                                            <label><%#Eval("codigo") %></label>
                                                        </th>
                                                        <th>
                                                            <label><%#Eval("identificacion") %> </label>
                                                        </th>
                                                        <th>
                                                            <label><%#Eval("nombre") %> <%#Eval("apellido") %></label>
                                                        </th>
                                                        <th>
                                                            <label><%#Eval("estado") %> </label>
                                                        </th>
                                                        <th>
                                                            <label><%#Eval("direnviofactura") %> </label>
                                                        </th>
                                                        <th>
                                                            <label><%#Eval("detalle") %> </label>
                                                        </th>
                                                        <th>
                                                            <a href="gestsoportecliente.aspx?key=<%#Eval("idcontrato")%>" class="glyphicon glyphicon-edit">__VER</a>
                                                        </th>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                        <tfoot style="background-color: #507CD1">
                                            <tr>
                                                <th style="color: white">Contrato
                                                </th>
                                                <th style="color: white">Codg
                                                </th>
                                                <th style="color: white">Identificacion
                                                </th>
                                                <th style="color: white">Nombre y apellido
                                                </th>
                                                <th style="color: white">Estado
                                                </th>
                                                <th style="color: white">Direcccion
                                                </th>
                                                <th style="color: white">Sucurasal
                                                </th>
                                                <th style="color: white">Plan
                                                </th>
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
