<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="GestCliente.aspx.cs" Inherits="VisapLine.View.Private.GestCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        window.onload = function cerrar() {
            setTimeout(function () {
                document.getElementById("<%=Alerta.ClientID%>").style.display = 'none';
            }, 5000);
        }
        function panelbutton() {
            document.getElementById('idbusqueda').click();
        }
        function cargarIdfactura(vari) {
            document.getElementById('<%=numero.ClientID%>').value = vari;
            document.getElementById('edicion').click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h2>Gestion del Cliente
        </h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Registro</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="tab-pane">
            <div class="form-group row">
                <label for="exampleInputPassword1" class="col-md-2">Busqueda</label>
                <input type="text" class="form-control col-md-6" runat="server" id="identif_" placeholder="Nit, Identificación, nombre, apellido, abonado">
                <button class="btn btn-primary col-md-2" runat="server" onserverclick="ConsultarIdentif">Consultar</button>
            </div>
        </div>
        <div class="tab-pane" runat="server" id="paneldatos">
            <div class="row">
                <div class="col-lg-5">
                    <div class="box box-primary" id="paneldedatosterceros" runat="server" visible="false">
                        <div class="box-header with-border">
                            <h3 class="box-title">Informacion del cliente</h3>
                            <div class="box-tools pull-right">
                                <a href="gesttercero.aspx?codigo=<%=ident%>" class="btn btn-box-tool btn-pinterest glyphicon glyphicon-edit">
                                    <i class="glyphicon glyphicon-user"></i>
                                </a>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="form-group row" id="tipocliente">
                                <label id="Label4" runat="server" class="col-sm-3 col-form-label">PERSONA</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" readonly id="_tipocliente" runat="server" placeholder="PERSONA">
                                </div>
                            </div>
                            <div class="form-group row" id="dividentificacion">
                                <label class="col-sm-3 col-form-label">CC/NIT</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" readonly id="identificacion_" runat="server" placeholder="Nit o Identificación">
                                </div>
                            </div>
                            <div class="form-group row" id="divnombre">
                                <label id="_nombr" runat="server" class="col-sm-3 col-form-label">CLIENTE</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" readonly id="_nombre_" runat="server" placeholder="Nombre">
                                </div>
                            </div>
                            <div class="form-group row" id="divemail">
                                <label id="_email_" runat="server" class="col-sm-3 col-form-label">CORREO</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" readonly id="_correo_" runat="server" placeholder="Correo">
                                </div>
                            </div>
                            <div class="form-group row" id="divestado">
                                <label id="Label2" runat="server" class="col-sm-3 col-form-label">ESTADO</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" readonly id="_estado_" runat="server" placeholder="Estado">
                                </div>
                            </div>
                            <div class="form-group row" id="divtelefono">
                                <label id="Label3" runat="server" class="col-sm-3 col-form-label">TELEFONO</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" readonly id="_telefono_" runat="server" placeholder="TELEFONO">
                                </div>
                            </div>
                            <div class="form-group row" id="divdireccion">
                                <label id="Label1" runat="server" class="col-sm-3 col-form-label">DIRECCION</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" readonly id="_direccion_" runat="server" placeholder="DIRECCION">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="box box-primary" style="overflow-x: auto">
                        <h5>Contrato</h5>
                        <asp:GridView runat="server" ID="consultacontrato" CssClass="table table-bordered table-striped table-responsive" OnSelectedIndexChanging="consultacontrato_SelectedIndexChanging" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="idcontrato" HeaderText="#ID"></asp:BoundField>
                                <asp:BoundField DataField="fechacontrato" HeaderText="FECHA" DataFormatString="{0:d}"></asp:BoundField>
                                <asp:BoundField DataField="valor" HeaderText="VALOR"></asp:BoundField>
                                <asp:BoundField DataField="estadoc" HeaderText="ESTADO"></asp:BoundField>
                                <asp:BoundField DataField="detalle" HeaderText="PLAN"></asp:BoundField>
                                <asp:BoundField DataField="codigo" HeaderText="CODIGO"></asp:BoundField>
                                <asp:CommandField HeaderText="BUSCAR" SelectText="" ControlStyle-CssClass="glyphicon glyphicon-search" ShowSelectButton="True"></asp:CommandField>

                                <asp:TemplateField HeaderText="EDITAR">
                                    <ItemTemplate>
                                        <a href="gestcontrato.aspx?iCnt=<%# Eval("codigo") %>" class="btn btn-success fa fa-edit"></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="box box-primary" style="overflow-x: auto">
                        <h5>Servicio</h5>
                        <asp:GridView runat="server" ID="GridView1" OnRowCommand="GridView1_RowCommand" CssClass="table table-bordered table-striped table-responsive" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="idservicios" HeaderText="#ID"></asp:BoundField>
                                <asp:BoundField DataField="fechainicio" DataFormatString="{0:d}" HeaderText="FECHA"></asp:BoundField>
                                <asp:BoundField DataField="estado" HeaderText="ESTADO"></asp:BoundField>
                                <asp:BoundField DataField="tipo" HeaderText="TIPO"></asp:BoundField>
                                <asp:TemplateField HeaderText="BUSCAR">
                                    <ItemTemplate>
                                        <asp:LinkButton CommandArgument='<%# Eval("idservicios") %>' CommandName="buscar" CssClass="btn btn-success fa fa-search" ID="idbottonxxx" Text="" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EDITAR">
                                    <ItemTemplate>
                                        <asp:LinkButton CommandArgument='<%# Eval("idservicios") %>' CommandName="getservicio" CssClass="btn btn-success fa fa-edit" ID="idbottonxx" Text="" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane" runat="server" id="divoperaciones">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li><a class="active" id="pan1" href="#facturas" data-toggle="tab">FACTURAS</a></li>
                    <li><a id="pan7" href="#recargos" data-toggle="tab">RECARGOS</a></li>
                    <li><a id="pan2" href="#insidencias" data-toggle="tab">INCIDENCIAS</a></li>
                    <li><a href="#ordenes" id="pan3" data-toggle="tab">ORDENES</a></li>
                    <li><a href="#aprovisionamiento" id="pan4" data-toggle="tab">APROVISIONAMIENTO</a></li>
                    <li><a href="#elementos" id="pan5" data-toggle="tab">ELEMENTOS</a></li>
                    <li><a href="#mapa" id="pan6" data-toggle="tab">VISTA EN MAPA</a></li>
                </ul>
                <div class="tab-content">
                    <div class="active tab-pane" id="facturas">
                        <asp:GridView runat="server" CssClass="table table-bordered table-striped table-responsive" OnRowCommand="allfactura_RowCommand" AutoGenerateColumns="False" ID="allfactura">

                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" Wrap="true" />
                            <Columns>
                                <asp:TemplateField HeaderText="FS">
                                    <ItemTemplate>
                                        <label runat="server"><%#Eval("facturaventa") %></label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="fechaemision" DataFormatString="{0:d}" HeaderText="Emision"></asp:BoundField>
                                <asp:BoundField DataField="valorfac" HeaderText="Correo"></asp:BoundField>
                                <asp:BoundField DataField="estadof" HeaderText="Estado"></asp:BoundField>
                                <asp:BoundField DataField="totalfac" HeaderText="Valor"></asp:BoundField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btn1" runat="server" CssClass="glyphicon glyphicon-list-alt" class="btn btn-link" CommandName="verfactura" CommandArgument='<%# Eval("idfactura") %>' Text="" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btn" Text="" CommandName="editarfactura" CommandArgument='<%# Eval("facturaventa") %>' CssClass="glyphicon glyphicon-edit" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btn2" runat="server" CssClass="glyphicon glyphicon-cog" CommandName="correccion" CommandArgument='<%# Eval("idfactura") %>' Text="" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btn3" runat="server" CssClass="glyphicon glyphicon-usd" CommandName="pagarfactura" CommandArgument='<%# Eval("facturaventa") %>' Text="" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="tab-pane" id="recargos">
                        <asp:GridView runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-striped table-responsive" ID="cargosadicionales">
                            <Columns>
                                <asp:BoundField DataField="idcargoadicional" HeaderText="#"></asp:BoundField>
                                <asp:BoundField DataField="descripcion" HeaderText="DESCRIPCION"></asp:BoundField>
                                <asp:BoundField DataField="valor" HeaderText="VALOR"></asp:BoundField>
                                <asp:BoundField DataField="fecha" DataFormatString="{0:d}" HeaderText="FECHA"></asp:BoundField>
                                <asp:BoundField DataField="inventario_idinventario" HeaderText="#INV"></asp:BoundField>
                                <asp:BoundField DataField="estadoca" HeaderText="ESTADO"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="tab-pane" id="insidencias">
                        <a href="#Div1" class="btn btn-block btn-success btn-lg col-md-2" id="idincidencia" data-target=".bs-example-modal-xl" data-toggle="modal">Crear Incidencia +</a>
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" class="table table-bordered table-striped" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                            <Columns>
                                <asp:BoundField HeaderText="Codg" DataField="idincidensia" ItemStyle-HorizontalAlign="Center">
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
                                <asp:BoundField HeaderText="Observacion" DataField="obervacion" ItemStyle-HorizontalAlign="Center">
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
                    <div class="tab-pane" id="ordenes"></div>
                    <div class="tab-pane" id="aprovisionamiento"></div>
                    <div class="tab-pane" id="elementos"></div>
                    <div class="tab-pane" id="mapa">
                        <div style="width: 100%; height: 330px;" id="map"></div>
                        <asp:Label ID="latitud" runat="server"></asp:Label>
                        <asp:Label ID="longitud" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <a data-toggle="modal" style="display: none" id="edicion" class="glyphicon glyphicon-cog" href="#" data-target="#modal-primary">content</a>
        <div class="modal fade" id="modal-primary">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Registro observacion</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="box box-primary bg-transparent">
                            <div class="form-element">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">#</label>
                                        <asp:TextBox ID="numero" runat="server" Enabled="false" CssClass="form-control-label"></asp:TextBox>
                                        <asp:TextBox TextMode="MultiLine" class="form-control" runat="server" Rows="5" ID="observacion_" placeholder="Observacion" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary float-right" runat="server" onserverclick="Unnamed_ServerClick">Guardar Cambios</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <a href="#panelbusqueda" id="idbusqueda" class="row" data-target=".bs-example-modal-lg" data-toggle="modal"></a>
        <div class="modal fade bs-example-modal-lg" runat="server" id="panelbusqueda" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myLargeModalLabel">Resultados</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="tab-pane" runat="server" id="panelconsulta">
                            <div class="box box-primary" style="overflow-x: auto">
                                <asp:GridView runat="server" ID="consultacliente" CssClass="table table-bordered table-striped table-responsive" OnSelectedIndexChanging="consultacliente_SelectedIndexChanging" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="identificacion" HeaderText="CC/NIT"></asp:BoundField>
                                        <asp:TemplateField HeaderText="USUARIO">
                                            <ItemTemplate>
                                                <label runat="server"><%#Eval("nombre") %> <%#Eval("apellido") %></label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="estado" HeaderText="ESTADO"></asp:BoundField>
                                        <asp:BoundField DataField="direccion" HeaderText="DIRECCION"></asp:BoundField>
                                        <asp:BoundField DataField="tipoterceros" HeaderText="PERSONA"></asp:BoundField>
                                        <asp:CommandField SelectText="" ControlStyle-CssClass="glyphicon glyphicon-search" ShowSelectButton="True"></asp:CommandField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>


        <div class="modal fade bs-example-modal-xl" runat="server" id="Div1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="tab-pane" runat="server" id="Div3">
                            <div class="box box-primary" style="overflow-x: auto">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <script>
            var markers;
            var map;
            var zomm = 8;
            var myLatLng = { lat: 1.620249416453961, lng: -75.61037882799843 };

            function addMarker(location) {

                zomm = map.getZoom();
                myLatLng = location;
                initMap();
                markers = new google.maps.Marker({
                    position: location,
                    draggable: true,
                    map: map
                });
                document.getElementById('<%=latitud.ClientID%>').value = markers.getPosition().lat();
                document.getElementById('<%=longitud.ClientID%>').value = markers.getPosition().lng();

                markers.addListener('dragend', function () {
                    document.getElementById('<%=latitud.ClientID%>').value = markers.getPosition().lat();
                    document.getElementById('<%=longitud.ClientID%>').value = markers.getPosition().lng();
                });
            }

            function initMap() {
                var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
                map = new google.maps.Map(document.getElementById('map'), {
                    zoom: zomm,
                    mapTypeId: 'satellite',
                    center: myLatLng
                });
                var icons = {
                    Radio: {
                        icon: 'http://191.102.85.252:30000/Contenido/radio.png'
                    },
                    Fibra: {
                        icon: 'http://191.102.85.252:30000/Contenido/fibra.png'
                    },
                    Indefinido: {
                        icon: 'http://191.102.85.252:30000/Contenido/indefinido.png'
                    }
                };


                map.addListener('click', function (event) {
                    addMarker(event.latLng);
                });

                var marker = [
                <%if (punt != null)
            {
                int cont = punt.Rows.Count;
                int cot = 0;
                foreach (System.Data.DataRow item in punt.Rows)
                {
                %>
                    new google.maps.Marker({
                        position: { lat: <%=item["coordenaday"].ToString().Replace(',','.')%>, lng: <%=item["coordenadax"].ToString().Replace(',','.')%> },
                        map: map,
                        icon: icons['<%=item["tipo"].ToString()%>'].icon,
                        title: '<%=item["nombre"].ToString()%>'<%cot++;%>
                    }).addListener('click', function () {
                        map.setZoom(15);
                        map.setCenter({ lat: <%=item["coordenaday"].ToString().Replace(',','.')%>, lng: <%=item["coordenadax"].ToString().Replace(',','.')%> });
                        }) <%if (cot == cont) { Response.Write(""); } else { Response.Write(","); }%>               
                <%
                }
            }
                  %>
                ];
            }
        </script>
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcz4b9tiKDFIuSFnaGlU7YpsBpfzPu7to&callback=initMap">
        </script>
    </section>
</asp:Content>
