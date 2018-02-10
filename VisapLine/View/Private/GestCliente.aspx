﻿<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="GestCliente.aspx.cs" Inherits="VisapLine.View.Private.GestCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        window.onload = function cerrar() {
            setTimeout(function () {
                document.getElementById("<%=Alerta.ClientID%>").style.display = 'none';
            }, 5000);
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
                <label for="exampleInputPassword1" class="col-md-2">Identificación</label>
                <input type="text" class="form-control col-md-6" runat="server" id="identif_" placeholder="Nit o Identificación">
                <button class="btn btn-primary col-md-2" runat="server" onserverclick="ConsultarIdentif">Consultar</button>
            </div>
        </div>
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

        <div class="tab-pane" runat="server" id="paneldatos">
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <div class="box box-primary" id="paneldedatosterceros" runat="server" visible="false">
                        <div class="box-header with-border">
                            <h3 class="box-title"></h3>
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
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12">
                    <div class="box box-primary" style="overflow-x: auto">
                        <asp:GridView runat="server" ID="consultacontrato" CssClass="table table-bordered table-striped table-responsive" OnSelectedIndexChanging="consultacontrato_SelectedIndexChanging" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="idcontrato" HeaderText="#ID"></asp:BoundField>
                                <asp:BoundField DataField="fechacontrato" HeaderText="FECHA" DataFormatString="{0:d}"></asp:BoundField>
                                <asp:BoundField DataField="detalle" HeaderText="PLAN"></asp:BoundField>
                                <asp:BoundField DataField="codigo" HeaderText="CODIGO"></asp:BoundField>
                                <asp:CommandField SelectText="" ControlStyle-CssClass="glyphicon glyphicon-search" ShowSelectButton="True"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="box box-primary">

                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane" runat="server" id="divoperaciones">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li><a class="active" id="pan1" href="#facturas" data-toggle="tab">FACTURAS</a></li>
                    <li><a id="pan2" href="#insidencias" data-toggle="tab">INSIDENCIAS</a></li>
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
                                        <a href="#" data-toggle="modal" data-target="#modal-primary"><i class="glyphicon glyphicon-edit"></i></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <a href="#" data-toggle="modal" runat="server" class="glyphicon glyphicon-cog" data-target="#modal-primary"></a>
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
                    <div class="active tab-pane" id="insidencias"></div>
                    <div class="active tab-pane" id="ordenes"></div>
                    <div class="active tab-pane" id="aprovisionamiento"></div>
                    <div class="active tab-pane" id="elementos"></div>
                    <div class="active tab-pane" id="mapa"></div>
                </div>
            </div>
        </div>
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
                                        <label for="exampleInputEmail1">Registro de la Observacion</label>
                                        <asp:TextBox TextMode="MultiLine" class="form-control" runat="server" Rows="5" ID="observacion_" placeholder="Observacion" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary float-right" runat="server">Gurdar Cambios</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </section>
</asp:Content>
