<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="VisapLine.View.Private.Facturacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h2>Facturación
        </h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Facturación</a></li>
            <li class="breadcrumb-item active">Vistas</li>
        </ol>
    </section>
    <asp:panel id="Alerta" visible="false" runat="server" cssclass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:panel>
    <section class="content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li><a class="active" id="pan1" href="#Resultado" data-toggle="tab">FACTURACION DEL MES</a></li>
                <li><a id="pan2" href="#Individual" data-toggle="tab">BUSQUEDA</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="Resultado">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Facturas</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group row" id="divnacimiento">
                                        <label class="col-sm-1 col-form-label">Desde: </label>
                                        <div class="col-sm-3">
                                            <input type="date" class="form-control" id="fecinicio_" runat="server" placeholder="">
                                        </div>
                                        <label class="col-sm-1 col-form-label">Hasta: </label>
                                        <div class="col-sm-3">
                                            <input type="date" class="form-control" id="fecfin_" runat="server" placeholder="">
                                        </div>
                                        <div class="col-sm-4">
                                            <button class="btn btn-success btn-lg" runat="server" onserverclick="ConsultarByFecha">Buscar en rango de fechas</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="Individual">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Facturas</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group row" id="dividentificacion">
                                        <label class="col-sm-2 col-form-label">IDENTIFICACIÓN</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="identificacion_" runat="server" placeholder="Nit o Identificación">
                                        </div>
                                        <label class="col-sm-2 col-form-label">FS-CODIGO</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="codigofact_" runat="server" placeholder="Codigo de factura">
                                        </div>
                                        <div class="col-sm-2">
                                            <button class="btn btn-success btn-lg" runat="server" onserverclick="ConsultarbyCedula">BUSCAR FACTURA</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane">
            <div class="box box-primary">
                <asp:gridview runat="server" cssclass="table table-bordered table-striped table-responsive" onpageindexchanging="allfactura_PageIndexChanging" OnRowCommand="allfactura_RowCommand" allowpaging="True" pagesize="10"  autogeneratecolumns="False" id="allfactura">

                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" Wrap="true" />
                    <Columns>
                        <asp:BoundField DataField="facturaventa" HeaderText="FS"></asp:BoundField>
                        <asp:BoundField DataField="identificacion" HeaderText="NIT/IDENTIF"></asp:BoundField>
                        <asp:TemplateField HeaderText="Tercero">
                            <ItemTemplate>
                                <label runat="server"><%#Eval("nombre") %> <%#Eval("apellido") %></label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="correo" HeaderText="Correo"></asp:BoundField>
                        <asp:BoundField DataField="fechaemision" DataFormatString="{0:d}" HeaderText="Emision"></asp:BoundField>
                        <asp:BoundField DataField="estadof" HeaderText="Estado"></asp:BoundField>
                        <asp:BoundField DataField="totalfac" HeaderText="Valor"></asp:BoundField>
<%--  onrowdeleting="allfactura_RowDeleting" onselectedindexchanging="allfactura_SelectedIndexChanging" onrowediting="allfactura_RowEditing"                       
    <asp:CommandField ShowDeleteButton="True"   DeleteText="" ControlStyle-CssClass="glyphicon glyphicon-copy"></asp:CommandField>
                        <asp:CommandField ShowSelectButton="True" SelectText="" ControlStyle-CssClass="glyphicon glyphicon-usd"></asp:CommandField>
                        <asp:CommandField ShowEditButton="True" EditText="" ControlStyle-CssClass="glyphicon glyphicon-edit"></asp:CommandField>--%>
                        <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Button ID="btn1" runat="server"  CssClass="btn glyphicon glyphicon-copy "  CommandName="verfactura" CommandArgument='<%# Eval("idfactura") %>' Text="" />
                                    </ItemTemplate>
                         </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Button ID="btn2" runat="server"  CssClass="btn glyphicon glyphicon-edit " CommandName="editarfactura" CommandArgument='<%# Eval("idfactura") %>' Text="" />
                                    </ItemTemplate>
                         </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Button ID="btn3" runat="server"  CssClass="btn glyphicon glyphicon-bitcoin " CommandName="pagarfactura" CommandArgument='<%# Eval("facturaventa") %>' Text="" />
                                    </ItemTemplate>
                         </asp:TemplateField>
                    </Columns>
                </asp:gridview>
            </div>
        </div>
        <div class="tab-pane">
            <div class="box box-primary">
                <div class="form-group row">
                    <button class="btn btn-primary col-md-4" runat="server" onserverclick="Imprimirallfactura"><span class="glyphicon glyphicon-print"></span>IMPRIMIR TODAS LAS FACTURAS</button>
                    <button class="btn btn-success col-md-4" runat="server" onserverclick="EnviarAllFactura"><span class="glyphicon glyphicon-inbox"></span>ENVIAR TODAS LAS FACTURAS</button>
                    <a href="VistadeExporte.aspx" class="btn btn-success col-md-4"><span class="glyphicon glyphicon-export">OBTENER XLS PARA SIIGO</span></a>
                </div>
            </div>
        </div>

        <div class="tab-pane">
        </div>
    </section>
</asp:Content>
