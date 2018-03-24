<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="GordenesSalida.aspx.cs" Inherits="VisapLine.View.Private.GordenesSalida" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../Contenido/assets/vendor_components/jquery/dist/jquery.js"></script>
    <script src="../../Contenido/assets/vendor_components/glyphicons/glyphicon.css"></script>
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <asp:ScriptManager ID="respust" runat="server"></asp:ScriptManager>
    <script type="text/javascript">
        function dialog(ctl, event) {
            event.preventDefault();
            swal({
                title: "¡CERRAR ORDEN!",
                text: "Desea cerrar esta orden?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Aceptar",
                cancelButtonText: "Cancel",
                closeOnConfirm: true,
                closeOnCancel: true
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "GordenesSalida.aspx/cerrarord_Click",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                    }
                }
                )
                    .done(function (data) {
                        swal({ title: "ORDEN CERRADA!", text: "Se cerro la orden con exito", type: "success" },
                            function () {
                                location.reload();
                            });

                    }).error(function (data) {
                        swal("ASIGNACION FALLIDA!", "No se pudo realizar la operacion contactese con el soporte", "error");
                    });
            })
                ;
        }
        function openModal() {
            $('#mymodal').modal('show');
        }
        function deletealert(x) {
            swal("ORDEN CREADA CON EXITO!", "Su orden ser creo con el numero " + x, "success", function () { location.reload() });
        }
        function alerterror() {
            swal("ORDEN FALLIDA!", "La orden no se pudo crear por favor verifique o contactese con el soporte", "error");
        }
    </script>

    <section class="content-header">
        <h2>ORDENES DE SERVICIO</h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Servicios</li>
        </ol>
    </section>
    <section class="content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li><a href="#COrdenes" id="pan1" data-toggle="tab" class="active">CONSULTAR ORDENES</a></li>
                <li><a href="#VOrdenes" id="pan2" data-toggle="tab">ORDENES DEL DIA</a></li>
                <li><a href="#VOC" id="pan3" data-toggle="tab">ORDENES CERRADAS</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="COrdenes">
                    <div class="form-group container-fluid box box-body">
                        <div id="principaldiv" runat="server" class="row col">
                            <asp:Label ID="lbl12" Text="CODIGO DE SERVICIO" runat="server"></asp:Label>
                            <asp:TextBox ID="Borden2" CssClass="form-control col-3 border-left-0 border-top-0 border-right-0 " runat="server">          
                            </asp:TextBox>
                            <button id="btntconsultar" class="btn btn-success" runat="server" onserverclick="btnconsultar_Click">CONSULTAR  <span class=" glyphicon glyphicon-search"></span></></button>
                            <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="CREAR ORDEN" OnClick="Button1_Click" />
                            <button id="divs" class="btn btn-success" runat="server" onserverclick="divs_ServerClick">
                                BUSQUEDA AVANSADA <span class=" glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                        <div class="row col" visible="false" runat="server" id="busquedaavansada">
                            <asp:Label ID="Label4" Text="FECHA DE INICIO" runat="server"></asp:Label>
                            <asp:TextBox ID="TextBox4" TextMode="Date" CssClass="calendar form-control col-3 border-left-0 border-top-0 border-right-0 " runat="server"></asp:TextBox>
                            <asp:Label ID="Label5" Text=" HASTA " runat="server"></asp:Label>
                            <asp:TextBox ID="TextBox5" TextMode="Date" CssClass="calendar form-control col-3 border-left-0 border-top-0 border-right-0 " runat="server"></asp:TextBox>
                            <asp:CheckBox CssClass="checkbox-inline" ID="estaadoorden" runat="server" Text=" FINALIZADA " />
                            <asp:Button ID="Button2" CssClass="btn btn-success" runat="server" Text="CONSULTAR" OnClick="Button2_Click" />
                            <asp:Button ID="Button3" CssClass="btn btn-danger" runat="server" Text="VOLVER ATRAS" OnClick="btncancelar_Click" />
                        </div>
                    </div>
                    <div id="divcreator" runat="server" class="box box-body">
                        <div class="form-group container-fluid">
                            <div class="row col-">
                                <asp:Label ID="lbldetalle" runat="server" Text="DETALLE"></asp:Label>
                                <asp:TextBox ID="txtdetalle" Style="resize: none;" TextMode="MultiLine" Rows="5" Columns="15" CssClass="form-control col-3 border-left-0 border-top-0 border-right-0" runat="server"></asp:TextBox>
                                <asp:Label ID="lblobservacion" runat="server" Text="OBSERVACION"></asp:Label>
                                <asp:TextBox ID="txtobservacion" Style="resize: none;" TextMode="MultiLine" Rows="5" Columns="15" CssClass="form-control col-3 border-left-0 border-top-0 border-right-0" runat="server"></asp:TextBox>
                                <asp:Label ID="lbltipoorden" runat="server" CssClass="col-1" Text="TIPO ORDEN"></asp:Label>
                                <asp:DropDownList ID="ddltipoorden" CssClass="form-control col-2" runat="server">
                                    <asp:ListItem>----------</asp:ListItem>
                                    <asp:ListItem>VIABILIDAD</asp:ListItem>
                                    <asp:ListItem>TRABAJO</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="btnsuccessorde" CssClass="btn btn-success" Height="34" Width="60" runat="server" Text="CREAR" OnClick="btnsuccessorde_Click" />
                                <asp:Button ID="btncancelar" CssClass="btn btn-success" Height="34" Width="90" runat="server" Text="CANCELAR" OnClick="btncancelar_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="box box-body" runat="server" id="divgrid">
                        <asp:GridView AllowPaging="True" PageSize="3" OnPageIndexChanging="gridbusqueda_PageIndexChanging" ID="gridbusqueda" OnSelectedIndexChanged="gridbusqueda_SelectedIndexChanged" OnSelectedIndexChanging="gridbusqueda_SelectedIndexChanging1" CssClass="table no-border" Font-Bold="true" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:CommandField SelectText="VER" ShowSelectButton="true" />
                                <asp:BoundField HeaderText="CODIGO" DataField="codigocol" />
                                <asp:BoundField HeaderText="DETALLE" DataField="detallecol" />
                                <asp:BoundField HeaderText="TIPO" DataField="tipoordencol" />
                                <asp:BoundField HeaderText="FECHA DE REGISTRO" DataField="fecha_registrocol" />
                                <asp:TemplateField HeaderText="ESTADO">
                                    <ItemTemplate>
                                        <asp:CheckBox Text=" " CssClass="filled-in" Enabled="false" Checked='<%#Eval("estadocol") %>' ID="chbs" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="FECHA DE FINALIZACION" DataField="fecha_finalizarcol" NullDisplayText="ESPERANDO" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </div>
                    <div id="divconten" runat="server" class="box box-body">
                        <div class="form-group container-fluid">
                            <table class="table table-responsive no-border" border="0">
                                <tr>
                                    <td colspan="10">
                                        <div class="row col-">

                                            <asp:FormView ID="formordenes" runat="server">
                                                <ItemTemplate>
                                                    <h2 <%# (bool)Eval("estadoval") == true ? "style='color:darkgreen'":"style='color:red'" %>><%# (bool)Eval("estadoval") == true ? "FINALIZADA":"EN PROCESO" %></h2>
                                                    <asp:TextBox ID="idserve" runat="server" Visible="false"></asp:TextBox>
                                                    <table class="table" border="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblcodserv" runat="server" Text="CODIGO "></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txbcodserv" CssClass="form-control no-border" runat="server" Text='<%#valosal %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblfrserv" runat="server" Text="FECHA REGISTRO "></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txbfrserv" CssClass="form-control no-border" runat="server" Text='<%# DateTime.Parse(Eval("fecha_registroval").ToString()).ToShortDateString() %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label1" runat="server" Text="SOLICITANTE "></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control no-border" Text='<%#Eval("nombreval") %>' ReadOnly="true"></asp:TextBox>
                                                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control no-border" Text='<%#Eval("apellidoval") %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lbldrccserv" runat="server" Text="DIRECCION  "></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txbdrccserv" runat="server" CssClass="form-control no-border" Text='<%#Eval("direccionval") %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblbrrserv" runat="server" Text="BARRIO  "></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txbbrrserv" runat="server" CssClass="form-control no-border" Text='<%#Eval("barrioval") %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblmnpserv" runat="server" Text="MUNICIPIO  "></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txbmnpserv" runat="server" CssClass="form-control no-border" Text='<%#Eval("municipiovl") %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblcrrserv" runat="server" Text="CORREO  "></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txbcrrserv" runat="server" CssClass="form-control no-border" Text='<%#Eval("correoval") %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblatiende" runat="server" Text="ATIENDE  "></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control no-border" Text='<%#Eval("personal_idpersonal_atival") %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                </ItemTemplate>
                                            </asp:FormView>
                                            <asp:FormView ID="Formtrabajos" runat="server">
                                                <ItemTemplate>
                                                    <h2 <%# (bool)Eval("estadoval") == true ? "style='color:darkgreen'":"style='color:red'" %>><%# (bool)Eval("estadoval") == true ? "FINALIZADA":"EN PROCESO" %></h2>
                                                    <asp:TextBox ID="idserve" runat="server" Visible="false"></asp:TextBox>
                                                    <table class="table" border="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblcodserv" CssClass="form-control border-left-0 border-top-0 border-right-0" runat="server" Text="CODIGO "></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txbcodserv" CssClass="form-control no-border" runat="server" Text='<%#valosal %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblfrserv" CssClass="form-control border-left-0 border-top-0 border-right-0" runat="server" Text="FECHA REGISTRO "></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txbfrserv" CssClass="form-control no-border" runat="server" Text='<%# DateTime.Parse(Eval("fecha_registroval").ToString()).ToShortDateString() %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label1" runat="server" CssClass="form-control border-left-0 border-top-0 border-right-0" Text="REGISTRO "></asp:Label>
                                                                <asp:Label ID="Label2" runat="server" CssClass="form-control border-left-0 border-top-0 border-right-0" Text="ATIENDE "></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control border-left-0 border-top-0 border-right-0" Text='<%#Eval("terceros_idterceros_regval") %>' ReadOnly="true"></asp:TextBox>
                                                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control no-border" Text='<%#Eval("personal_idpersonal_atival") %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lbldrccserv" CssClass="form-control border-left-0 border-top-0 border-right-0" runat="server" Text="TIPO DE ORDEN"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txbdrccserv" runat="server" CssClass="form-control no-border" Text='<%#Eval("tipoordenval") %>' ReadOnly="true"></asp:TextBox>
                                                            </td>

                                                            <td>
                                                                <asp:Label ID="lblcrrserv" CssClass="form-control border-left-0 border-top-0 border-right-0" runat="server" Text="FECHA FINALIZACION"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txbcrrserv" runat="server" CssClass="form-control no-border" Text='<%#Eval("fecha_finalizarval") %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label3" CssClass="form-control border-left-0 border-top-0 border-right-0" runat="server" Text="ESTADO"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control no-border" Text='<%#Eval("estadoval") %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblbrrserv" CssClass="form-control border-left-0 border-top-0 border-right-0" runat="server" Text="DETALLE"></asp:Label>
                                                            </td>
                                                            <td colspan="12">

                                                                <asp:TextBox ID="txbbrrserv" TextMode="MultiLine" Rows="5" Columns="50" runat="server" Style="resize: none;" CssClass="form-control no-border " Text='<%#Eval("detalleval") %>' ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblmnpserv" CssClass="form-control border-left-0 border-top-0 border-right-0" runat="server" Text="OBSERVACIONES"></asp:Label>
                                                            </td>
                                                            <td colspan="12">
                                                                <asp:TextBox ID="txbmnpserv" TextMode="MultiLine" Rows="5" Columns="50" runat="server" Style="resize: none;" CssClass="form-control no-border" Text='<%#Eval("observacionval") %>' ReadOnly="true"></asp:TextBox>

                                                            </td>
                                                        </tr>
                                                    </table>

                                                </ItemTemplate>
                                            </asp:FormView>
                                        </div>

                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="form-group">
                                                <asp:GridView AutoGenerateColumns="false" CssClass="table no-border" BorderColor="White" ID="gridtelefono" runat="server">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="TELEFONO" ItemStyle-CssClass="bg-gray" DataField="telefono" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:Button runat="server" CssClass="btn btn-success" ID="btnimpresion" Text="IMPRIMIR" OnClick="btnimpresion_Click" />

                        <div class="box box-body">
                            <div class="modal fade" id="mymodal" data-backdrop="static">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">AGREGAR EQUIPO</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row col">





                                                <asp:DropDownList CssClass="form-control dropdown-toggle" ID="droptiporduc" runat="server" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="droptiporduc_SelectedIndexChanged"></asp:DropDownList>

                                                <table class="table no-border table-responsive tablaexcel">
                                                    <thead>
                                                        <tr>
                                                            <th>EQUIPO
                                                            </th>
                                                            <th>CANTIDAD
                                                            </th>
                                                            <th>ACCION
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="repetidorequipos" runat="server" OnItemCommand="repetidorequipos_ItemCommand">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label6" runat="server" Text=' <%#Eval("serial") %> '></asp:Label>
                                                                        <asp:Label ID="Label7" runat="server" Text=' <%#Eval("mac") %> '></asp:Label>
                                                                        <asp:Label ID="descripcion" runat="server" Text=' <%#Eval("descripcion") %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="cantidadequipo" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="btnasignarequipo" CssClass="btn btn-success" Text="ASIGNAR" CommandName="asigacin" CommandArgument='<%#Eval("idinventario") %>' runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <td>EQUIPO</td>
                                                            <td>CANTIDAD</td>
                                                            <td>ACCION</td>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">CERRAR</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <div class="modal fade" id="mymodal2" data-backdrop="”static”">
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
                            <asp:Button ID="cerrarord" Text="CERRAR ORDEN" runat="server" CssClass="btn btn-danger" OnClientClick='return dialog(this,event);' />
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#mymodal">
                                ASIGNAR INVENTARIO +
                            </button>
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#mymodal2">
                                ASIGNAR TECNICO +
                            </button>
                            <asp:GridView ID="GridViewdeta" CssClass="table table-responsive no-border" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField HeaderText="DESCRIPCION" DataField="descripcioncol" />
                                    <asp:BoundField HeaderText="CANTIDAD" DataField="cantidadcol" />
                                    <asp:BoundField HeaderText="ESTADO" DataField="estadocol" />
                                    
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="VOrdenes">

                    <div class="box box-default collapsed-box">
                        <div class="box-header with-border">
                            <h3 class="box-title">ORDENES DE INSTALACION</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <table class="table table-bordered table-striped table-responsive no-border tablaexcel">
                                    <thead style="background-color: #507CD1">
                                        <tr>
                                            <th style="color: white">ESTADO
                                            </th>
                                            <th style="color: white">CODIGO DE ORDEN
                                            </th>
                                            <th style="color: white">DIRECCION
                                            </th>
                                            <th style="color: white">CLIENTE
                                            </th>
                                            <th style="color: white">FECHA DE REGISTRO
                                            </th>
                                            <th style="color: white">OBSERVACION
                                            </th>
                                            <th style="color: white">PLANES
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="repetidorinstalaciones" runat="server" OnItemCommand="repetidorinstalaciones_ItemCommand">
                                            <ItemTemplate>
                                                <tr>
                                                    <td <%# DateTime.Compare(Convert.ToDateTime(Eval("fecha_registroval")).AddDays(8.9),DateTime.Now)<0?  "style='color: red'" : Convert.ToDateTime(Eval("fecha_registroval")).AddDays(8).ToString("dd-MM-yyyy").Equals(DateTime.Now.ToString("dd-MM-yyyy"))? "style='color: orange'": "style='color: blue'" %>>
                                                        <%# DateTime.Compare(Convert.ToDateTime(Eval("fecha_registroval")).AddDays(8.9),DateTime.Now)<0? "Atrasada" :"En Proceso " %>                        
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="codigovalue" CssClass="btn btn-success" runat="server" CommandName="buscar" CommandArgument='<%#Eval("codigovaal") %>' Text='<%#Eval("codigovaal") %>' />
                                                    </td>
                                                    <td><%#Eval("detalleval") %>
                                                    </td>
                                                    <td><%#Eval("clienteval") %>
                                                    </td>
                                                    <td><%# Convert.ToDateTime(Eval("fecha_registroval")).ToString("dd-MM-yyyy") %>
                                                    </td>
                                                    <td><%#Eval("observacionval") %>
                                                    </td>
                                                    <td><%#Eval("planesval") %>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                    <tfoot style="background-color: #507CD1">
                                        <tr>
                                            <td style="color: white">ESTADO
                                            </td>
                                            <td style="color: white">CODIGO DE ORDEN
                                            </td>
                                            <td style="color: white">DIRECCION
                                            </td>
                                            <td style="color: white">CLIENTE
                                            </td>
                                            <td style="color: white">FECHA DE REGISTRO
                                            </td>
                                            <td style="color: white">OBSERVACION
                                            </td>
                                            <td style="color: white">PLANES
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="box box-default collapsed-box">
                        <div class="box-header with-border">
                            <h3 class="box-title">ORDENES DE VIABILIDAD</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <table class="col-md-12 table table-bordered table-striped table-responsive no-border tablaexcel">
                                    <thead style="background-color: #507CD1">
                                        <tr>
                                            <th style="color: white">CODIGO DE ORDEN
                                            </th>
                                            <th style="color: white">DIRECCION
                                            </th>
                                            <th style="color: white">OBSERVACION
                                            </th>
                                            <th style="color: white">PLANES
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#Eval("codigovaal") %>
                                                    </td>
                                                    <td><%#Eval("detalleval") %>
                                                    </td>
                                                    <td><%#Eval("observacionval") %>
                                                    </td>
                                                    <td><%#Eval("planesval") %>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                    <tfoot style="background-color: #507CD1">
                                        <tr>
                                            <td style="color: white">CODIGO DE ORDEN
                                            </td>
                                            <td style="color: white">DIRECCION
                                            </td>
                                            <td style="color: white">OBSERVACION
                                            </td>
                                            <td style="color: white">PLANES
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="box box-default collapsed-box">
                        <div class="box-header with-border">
                            <h3 class="box-title">ORDENES DE TRABAJO</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <table class="table table-bordered table-striped table-responsive no-border tablaexcel">
                                    <thead style="background-color: #507CD1">
                                        <tr>
                                            <th style="color: white">CODIGO DE ORDEN
                                            </th>
                                            <th style="color: white">DIRECCION
                                            </th>
                                            <th style="color: white">OBSERVACION
                                            </th>
                                            <th style="color: white">PLANES
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater2" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#Eval("codigovaal") %>
                                                    </td>
                                                    <td><%#Eval("detalleval") %>
                                                    </td>
                                                    <td><%#Eval("observacionval") %>
                                                    </td>
                                                    <td><%#Eval("planesval") %>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                    <tfoot style="background-color: #507CD1">
                                        <tr>
                                            <td style="color: white">CODIGO DE ORDEN
                                            </td>
                                            <td style="color: white">DIRECCION
                                            </td>
                                            <td style="color: white">OBSERVACION
                                            </td>
                                            <td style="color: white">PLANES
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="box box-default collapsed-box">
                        <div class="box-header with-border">
                            <h3 class="box-title">ORDENES EN CURSO</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <table class="table table-bordered table-striped table-responsive no-border tablaexcel">
                                    <thead style="background-color: #507CD1">
                                        <tr>
                                            <td style="color: white">ESTADO
                                            </td>
                                            <td style="color: white">CODIGO DE ORDEN
                                            </td>
                                            <td style="color: white">DIRECCION
                                            </td>
                                            <td style="color: white">CLIENTE
                                            </td>
                                            <td style="color: white">FECHA DE REGISTRO
                                            </td>
                                            <td style="color: white">OBSERVACION
                                            </td>
                                            <td style="color: white">PLANES
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater3" runat="server" OnItemCommand="repetidorinstalaciones_ItemCommand">
                                            <ItemTemplate>
                                                <tr>
                                                    <td <%# DateTime.Compare(Convert.ToDateTime(Eval("fecha_registroval")).AddDays(8.9),DateTime.Now)<0?  "style='color: red'" : Convert.ToDateTime(Eval("fecha_registroval")).AddDays(8).ToString("dd-MM-yyyy").Equals(DateTime.Now.ToString("dd-MM-yyyy"))? "style='color: orange'": "style='color: blue'" %>>
                                                        <%# DateTime.Compare(Convert.ToDateTime(Eval("fecha_registroval")).AddDays(8.9),DateTime.Now)<0? "Atrasada" :"En Proceso " %>                        
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="codigovalue" CssClass="btn btn-success" runat="server" CommandName="buscar" CommandArgument='<%#Eval("codigovaal") %>' Text='<%#Eval("codigovaal") %>' />
                                                    </td>
                                                    <td><%#Eval("detalleval") %>
                                                    </td>
                                                    <td><%#Eval("clienteval") %>
                                                    </td>
                                                    <td><%# Convert.ToDateTime(Eval("fecha_registroval")).ToString("dd-MM-yyyy") %>
                                                    </td>
                                                    <td><%#Eval("observacionval") %>
                                                    </td>
                                                    <td><%#Eval("planesval") %>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                    <tfoot style="background-color: #507CD1">
                                        <tr>
                                            <td style="color: white">ESTADO
                                            </td>
                                            <td style="color: white">CODIGO DE ORDEN
                                            </td>
                                            <td style="color: white">DIRECCION
                                            </td>
                                            <td style="color: white">CLIENTE
                                            </td>
                                            <td style="color: white">FECHA DE REGISTRO
                                            </td>
                                            <td style="color: white">OBSERVACION
                                            </td>
                                            <td style="color: white">PLANES
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="VOC">
                    <div class="box box-default collapsed-box">
                        <div class="box-header with-border">
                            <h3 class="box-title">ORDENES CERRADAS</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <table class="table table-bordered table-striped table-responsive no-border tablaexcel">
                                    <thead style="background-color: #507CD1">
                                        <tr>
                                            <th style="color: white">ESTADO
                                            </th>
                                            <th style="color: white">CODIGO DE ORDEN
                                            </th>
                                            <th style="color: white">DIRECCION
                                            </th>
                                            <th style="color: white">CLIENTE
                                            </th>
                                            <th style="color: white">FECHA DE REGISTRO
                                            </th>
                                            <th style="color: white">OBSERVACION
                                            </th>
                                            <th style="color: white">PLANES
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater4" runat="server" OnItemCommand="repetidorinstalaciones_ItemCommand">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>FINALIZADA                       
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="codigovalue" CssClass="btn btn-success" runat="server" CommandName="buscar" CommandArgument='<%#Eval("codigovaal") %>' Text='<%#Eval("codigovaal") %>' />
                                                    </td>
                                                    <td><%#Eval("detalleval") %>
                                                    </td>
                                                    <td><%#Eval("clienteval") %>
                                                    </td>
                                                    <td><%# Convert.ToDateTime(Eval("fecha_registroval")).ToString("dd-MM-yyyy") %>
                                                    </td>
                                                    <td><%#Eval("observacionval") %>
                                                    </td>
                                                    <td><%#Eval("planesval") %>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                    <tfoot style="background-color: #507CD1">
                                        <tr>
                                            <td style="color: white">ESTADO
                                            </td>
                                            <td style="color: white">CODIGO DE ORDEN
                                            </td>
                                            <td style="color: white">DIRECCION
                                            </td>
                                            <td style="color: white">CLIENTE
                                            </td>
                                            <td style="color: white">FECHA DE REGISTRO
                                            </td>
                                            <td style="color: white">OBSERVACION
                                            </td>
                                            <td style="color: white">PLANES
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
    </section>

</asp:Content>
