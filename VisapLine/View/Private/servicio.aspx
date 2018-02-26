<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="servicio.aspx.cs" Inherits="VisapLine.View.Private.servicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../Contenido/assets/vendor_components/jquery/dist/jquery.js"></script>
    <script src="../../Contenido/assets/vendor_components/glyphicons/glyphicon.css"></script>
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <asp:ScriptManager ID="scripservicc" runat="server"></asp:ScriptManager>
    <script type="text/javascript">
        function redireciona(cosa) {
            window.location = 'solicitudes.aspx?key=' + cosa;
        }
        function openmodal() {
            $('#mymodal').modal('show');
        }
        function successasignation() {
            swal("EXITO AL CREAR EL SERVICIO", "La operacion se realizo con exito", "success");
        }
        function errorasignation() {
            swal("ERROR AL CREAR EL SERVICIO", "La operacion no se pudo realizar con exito", "error");
        }
        function alertnoproduc() {
            swal("ERROR AL ASIGNAR EQUIPO", "No hay ningun equipo que se pueda asignar", "error");
        }
    </script>
    <section class="content-header">
        <h1>Servicios</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Servicios</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="row">
            <div class="box box-body">
                <asp:GridView OnSelectedIndexChanged="gridservicios_SelectedIndexChanged" OnRowDataBound="gridservicios_RowDataBound" AllowPaging="True" PageSize="6"
                    OnPageIndexChanging="gridservicios_PageIndexChanging" AutoGenerateColumns="False" runat="server"
                    ID="gridservicios" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-responsive col-md-4">
                    <AlternatingRowStyle BackColor="white" />
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
                    <Columns>
                        <asp:BoundField HeaderText="REFEERENCIA" DataField="id" />
                        <asp:BoundField HeaderText="FECHA DE INICIO" DataField="fechainiciocol" />
                        <asp:BoundField HeaderText="MEGAS" DataField="cantidadmegascol" />
                        <asp:BoundField HeaderText="ESTADO" DataField="estadocol" />
                        <asp:BoundField HeaderText="SERVICIO" DataField="referenciascol" />
                        <asp:BoundField HeaderText="EQUIPO" DataField="referenciaequipocol" />
                        <asp:TemplateField ItemStyle-CssClass="btn btn-success btn-lg">
                            <ItemTemplate>
                                <a onclick='redireciona(<%# Eval("id") %>)'>Solicitud</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" ItemStyle-CssClass="btn btn-success btn-lg" ControlStyle-ForeColor="White" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                <div class="box box-default">
                    <div class="box-body">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Pais</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="DropDownListpais" runat="server" CssClass="form-control" AppendDataBoundItems="true" OnSelectedIndexChanged="DropDownListpais_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Departamento</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="DropDownListdepartamento" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListdepartamento_SelectedIndexChanged">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Municipio</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="DropDownListmunicipio" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListmunicipio_SelectedIndexChanged">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Barrio</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="DropDownListbarrio" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Direccion</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="TextBoxdireccion" Style="text-transform: uppercase" class="form-control" placeholder="Dirección" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group row" id="divcoordenada">
                            <label class="col-sm-1 col-form-label">Lat.</label>
                            <div class="col-sm-5">
                                <asp:TextBox CssClass="form-control" runat="server" ID="latitud" />
                            </div>
                            <label class="col-sm-1 col-form-label">Lon.</label>
                            <div class="col-sm-5">
                                <asp:TextBox CssClass="form-control" runat="server" ID="longitud" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Tipo</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="tipo_" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem>Seleccione</asp:ListItem>
                                    <asp:ListItem>Fibra</asp:ListItem>
                                    <asp:ListItem>Radio</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                <div class="box box-primary">
                    <div class="box-body">
                        <div style="width: 100%; height: 330px;" id="map"></div>
                    </div>
                </div>
            </div>

        </div>

        <div class="box box-default" id="divinternet" runat="server" visible="false">
            <div class="box-header with-border">
                <h3 class="box-title">INTERNET</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col- col-6">
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#mymodal">ASIGNAR SERVICIO +</button>
                        <asp:Button runat="server" ID="Button1" Text="CANCELAR" OnClick="Button1_Click" CssClass="btn  btn-danger btn-lg" />
                        <%-- <asp:Button runat="server" ID="btninser" Text="CREAR SERVICIO" OnClick="btninser_Click" CssClass="btn btn-success btn-lg" Visible="false" />--%>
                    </div>
                    <div class="modal fade" id="mymodal" data-backdrop="”static”">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">AGREGAR EQUIPO</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group row col">
                                        <asp:Label ID="lvlserialasignar" runat="server" Text="SERIAL"></asp:Label>
                                        <asp:TextBox ID="txtseralasignar" CssClass="form-control" runat="server" OnTextChanged="txtseralasignar_TextChanged"></asp:TextBox>
                                        <br />
                                    </div>
                                    <div class="form-group row col">
                                        <asp:Label type="text" ID="Label1" runat="server" Text="MAC" />
                                        <asp:Label type="text" ID="identificacion" CssClass="form-control" runat="server" />
                                        <br />
                                    </div>
                                    <div class="form-group row col">
                                        <asp:Label ID="lvlmegasasignar" runat="server" Text="MEGAS"></asp:Label>
                                        <asp:TextBox ID="txtmegasasignar" CssClass="form-control" runat="server"></asp:TextBox>
                                        <br />
                                    </div>
                                    <div class="form-group row col">

                                        <asp:Button ID="btncrearinternet" runat="server" OnClientClick="return alert('ESTA SEGRUO DE REALIZAR ESTA ACCION');" OnClick="asignarequipo" Text="CREAR SERVICIO" CssClass="btn btn-success" />
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
                    <div class="col-6">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">DIRECCION IP</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" CssClass="form-control" ID="ip"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group row">
                            <asp:ListView runat="server" ID="listequipo" Visible="false">
                                <ItemTemplate>
                                    <div class="box-body">
                                        <h4 class="card-title"><%#Eval("tipoproducto")%>: <%#Eval("modelo")%> <%#Eval("fabricante")%></h4>
                                        <div>
                                            <asp:Label runat="server" ID="linv" Text="INVENTARIO"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="tinv" CssClass="form-control" ReadOnly="true" runat="server" Text='<%#Eval("idinventario")%>'></asp:TextBox>
                                            <br />
                                            <asp:Label runat="server" ID="lserial" Text="SERIAL"></asp:Label>
                                            <br />
                                            <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="tserial" Text='<%#Eval("serial")%>'></asp:TextBox>
                                            <br />
                                            <asp:Label runat="server" ID="lmac" Text="MAC"></asp:Label>
                                            <br />
                                            <asp:TextBox runat="server" ID="tmac" CssClass="form-control" ReadOnly="true" Text='<%#Eval("mac")%>'></asp:TextBox>
                                            <br />
                                            <asp:Label runat="server" ID="ldescrp" Text="DESCRIPCION"></asp:Label>
                                            <br />
                                            <asp:TextBox runat="server" ID="tdescrp" CssClass="form-control" ReadOnly="true" Text='<%#Eval("descripcion")%>'></asp:TextBox>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="box box-primary">
                            <asp:GridView Visible="false" runat="server" ID="gridcaract" AutoGenerateColumns="false" CssClass="table table-bordered table-responsive">
                                <Columns>
                                    <asp:BoundField HeaderText="NUMERO" DataField="idcaracteristicas" />
                                    <asp:BoundField HeaderText="CARACTERISTICAS" DataField="caracteristica" />
                                    <asp:TemplateField HeaderText="CANTIDAD" ControlStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:TextBox ID="cantida" runat="server" CssClass="form-control" type="number"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="UNIDAD" DataField="unidad" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.box-body -->
        <div class="box box-default collapsed-box" id="divtv" runat="server" visible="false">
            <div class="box-header with-border">
                <h3 class="box-title">TELEVISION</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-6">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">DIIRECCION IP</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txbdiptv" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">PUERTOS</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txbptv"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <asp:Button runat="server" ID="creartev" Text="CREAR SERVICIO" OnClick="creartev_Click" CssClass="btn btn-success btn-lg" />
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.box-body -->
        </div>
        <div class="box box-default collapsed-box" id="divtelefono" runat="server" visible="false">
            <div class="box-header with-border">
                <h3 class="box-title">TELEFONO</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-6">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">DIIRECCION IP</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">PUERTOS</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" CssClass="form-control" ID="TextBox2"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <asp:Button runat="server" ID="ceartl" Text="CREAR SERVICIO" OnClick="ceartl_Click" CssClass="btn btn-success btn-lg" />
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.box-body -->
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
