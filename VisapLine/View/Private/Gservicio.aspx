<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Gservicio.aspx.cs" Inherits="VisapLine.View.Private.Gservicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <asp:ScriptManager ID="respust" runat="server"></asp:ScriptManager>
    <script type="text/javascript">
        function openModal() {
            $('#mymodal').modal('show');
        }
        function openModal2() {
            $('#mymodal2').modal('show');
        }
        function deletealert(x) {
            swal("ORDEN CREADA CON EXITO!", "Su orden ser creo con el numero "+x, "success");              
        }
        function alerterror() {
            swal("ORDEN FALLIDA!", "La orden no se pudo crear por favor verifique o contactese con el soporte", "error");
        }
    </script>
    <section class="content-header">
        <h2>ORDENES DE SERVICIO</h2>
    </section>
    <section class="content">
        <div class="form-group container-fluid box box-body">
            <div class="row col">
                <asp:Label ID="lbl12" Text="CODIGO DE SERVICIO" runat="server"></asp:Label>
                <asp:TextBox ID="Borden2" CssClass="form-control col-3 border-left-0 border-top-0 border-right-0 "  runat="server"></asp:TextBox>
                <asp:Button ID="btnconsultar" CssClass="btn btn-success" runat="server" Text="CONSULTAR" OnClick="btnconsultar_Click" />
                <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="CREAR ORDEN" OnClick="Button1_Click"/>
            </div>
        </div>
        <div id="divcreator" runat="server" class="box box-body">
            <div class="form-group container-fluid">
                <div class="row col-">
                    <asp:Label ID="lbldetalle" runat="server" Text="DETALLE"></asp:Label>
                    <asp:TextBox ID="txtdetalle" style="resize:none;" TextMode="MultiLine" Rows="5" Columns="15" CssClass="form-control col-3 border-left-0 border-top-0 border-right-0" runat="server"></asp:TextBox>
                    <asp:Label ID="lblobservacion" runat="server" Text="OBSERVACION"></asp:Label>
                    <asp:TextBox ID="txtobservacion" style="resize:none;" TextMode="MultiLine" Rows="5" Columns="15" CssClass="form-control col-3 border-left-0 border-top-0 border-right-0" runat="server"></asp:TextBox>
                    <asp:Label ID="lbltipoorden" runat="server" CssClass="col-1" Text="TIPO ORDEN"></asp:Label>
                    <asp:DropDownList ID="ddltipoorden" CssClass="form-control col-2" runat="server">
                        <asp:ListItem>----------</asp:ListItem>
                        <asp:ListItem>VIABILIDAD</asp:ListItem>
                        <asp:ListItem>TRABAJO</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnsuccessorde" CssClass="btn btn-success" Height="34" Width="60" runat="server" Text="CREAR" OnClick="btnsuccessorde_Click" />
                </div> 
            </div>
        </div>
        <div id="divconten" runat="server" class="box box-body">
            <div class="form-group container-fluid">
                <table class="table table-responsive no-border" border="0">
                    <tr>
                        <td colspan="10">
                    <div class="row col-">
                        <asp:FormView ID="formordenes" runat="server">
                            <ItemTemplate>
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
                                    </tr>
                                </table>

                            </ItemTemplate>
                        </asp:FormView>
                        <asp:FormView ID="Formtrabajos" runat="server">
                            <ItemTemplate>
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
                                           
                                            <asp:TextBox ID="txbbrrserv" TextMode="MultiLine" Rows="5" Columns="50" runat="server" style="resize:none;" CssClass="form-control no-border " Text='<%#Eval("detalleval") %>' ReadOnly="true"></asp:TextBox>
                                        </td>                                      
                                    </tr>
                                    <tr>
                                        <td> 
                                            <asp:Label ID="lblmnpserv" CssClass="form-control border-left-0 border-top-0 border-right-0" runat="server" Text="OBSERVACIONES"></asp:Label>
                                        </td>
                                        <td colspan="12">
                                             <asp:TextBox ID="txbmnpserv" TextMode="MultiLine" Rows="5" Columns="50" runat="server" style="resize:none;" CssClass="form-control no-border" ov Text='<%#Eval("observacionval") %>' ReadOnly="true" ></asp:TextBox>
                           
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
                            <asp:GridView CssClass="table no-border" BorderColor="White" ID="gridtelefono" runat="server"></asp:GridView>
                        </div>
                    </div>
                            </td>
                        </tr>
                </table>
            </div>

        
        <div class="box box-body">
            <button type="button" id="but" class="btn btn-primary" data-toggle="modal" data-target="#mymodal">
               AGREGAR PRODUCTO +</button>
            <div class="modal fade" id="mymodal" data-backdrop="”static”">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">AGREGAR EQUIPO</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <asp:DropDownList CssClass="form-control dropdown-toggle" ID="droptiporduc" runat="server" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="droptiporduc_SelectedIndexChanged"></asp:DropDownList>
                            <asp:GridView CssClass="table no-border" AutoGenerateColumns="false" ID="inventariogrid" runat="server">
                                <Columns>
                                    <asp:BoundField HeaderText="CODIGO" DataField="idinventario" />
                                    <asp:BoundField HeaderText="DESCRIPCION" DataField="descripcion" />
                                    <asp:TemplateField HeaderText="CANTIDAD">
                                        <ItemTemplate>
                                            <asp:TextBox TextMode="Number" CssClass="form-control border-left-0 border-top-0 border-right-0" ID="txbcanti" runat="server"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                           </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">CERRAR</button>
                             <asp:Button ID="addinvent" runat="server" class="btn btn-primary float-right" OnClick="addinvent_Click" Text="AGREGAR" />
                        
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <asp:GridView ID="GridViewdeta" CssClass="table table-responsive table-bordered" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="DESCRIPCION" DataField="descripcioncol" />
                    <asp:BoundField HeaderText="CANTIDAD" DataField="cantidadcol" />
                    <asp:BoundField HeaderText="ESTADO" DataField="estadocol" />
                </Columns>
            </asp:GridView>
        </div>
</div>
          <div class="modal fade" id="mymodal2" data-backdrop="”static”">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">COMPLETADO</h4>
                            <div></div>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">                       
                          </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">COMPLETAR</button>
                        
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
    </section>

</asp:Content>
