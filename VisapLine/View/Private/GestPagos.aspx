<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="GestPagos.aspx.cs" Inherits="VisapLine.View.Private.GestPagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>INGRESO
        </h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">CAJA</a></li>
            <li class="breadcrumb-item active">Registro</li>
        </ol>
    </section>
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content">
        <div class="tab-pane" id="Individual">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="row" id="dividentificacion">
                                <label class="col-sm-3 col-form-label">FACTURA DE SERVICIO</label>
                                <div class="col-sm-3">
                                    <asp:TextBox type="text" class="form-control" ID="factservicio" runat="server" />
                                </div>
                                <div class="col-6 row">
                                    <button class="btn btn-success col-4" runat="server" onserverclick="btnConsultar">BUSCAR FACTURA</button>
                                    <a class="btn btn-success col-4" href="facturacion.aspx">BUSCAR EN FACTURACIÓN</a>
                                    <a class="btn btn-success col-4" href="gestcliente.aspx">AVANZADO</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modal-primary">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="box box-primary bg-transparent">
                            <div class="form-element">
                                <div class="box-body">
                                    <div class="form-group row">
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="textretencion" value="0" runat="server" placeholder="Telefono o celular">
                                        </div>
                                        <div class="col-sm-4">
                                            <button type="button" class="btn btn-warning float-right" data-dismiss="modal">Guardar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <div class="row">
            <div class="col-8">
                <div class="tab-pane" id="panel">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">NUMERO FACTURA:</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="cod"></label>
                                        <label class="col-sm-3 col-form-label">ID DE FACTURA:</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="idfactura"></label>
                                        <label class="col-sm-3 col-form-label">ESTADO</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="estado"></label>
                                        <label class="col-sm-3 col-form-label">EMITIDA</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="emision"></label>
                                        <label class="col-sm-3 col-form-label">VENCE</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="vencimiento"></label>
                                        <label class="col-sm-3 col-form-label">CORTE</label>
                                        <hr />
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="corte"></label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="valor"></label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="saldo"></label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="iva"></label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="total"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="tab-pane" id="panel4">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-12 ">
                                            <h2 class="text-center">
                                                <label class="col-form-label text-bold" runat="server" id="estado2"></label>
                                            </h2>
                                        </div>
                                        <div class="col-12">
                                            <div class="input-group">
                                                <a href="#" data-toggle="modal" data-target="#modal-primary" class="input-group-addon"><i class="fa fa-exchange"></i></a>
                                                <asp:TextBox CssClass="form-control text-center text-bold" runat="server" ID="textpagado" />
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <br>
                                           <label class="col-form-label text-bold">Tipo de Pago: </label>
                                            <asp:DropDownList ID="DropDownListtipopago" runat="server"  AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListtipopago_SelectedIndexChanged" Height="32px" Width="163px">
                                                <asp:ListItem>Seleccione</asp:ListItem>
                                            </asp:DropDownList>                                         
                                            <br><br>
                                              <label class="col-form-label text-bold" id="entidad" runat="server" visible="false">Entidad: </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:DropDownList ID="DropDownListbanco" Visible="false" runat="server"  AppendDataBoundItems="true"  AutoPostBack="true" OnSelectedIndexChanged="DropDownListtipopago_SelectedIndexChanged" Height="32px" Width="177px">
                                                <asp:ListItem>Seleccione</asp:ListItem>
                                            </asp:DropDownList><br><br>
                                           
                                            <label class="col-form-label text-bold" id="referencia" visible="false" runat="server">Referencia: </label>&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="TextBoxnumreferencia" runat="server" Visible="false"></asp:TextBox><br>
                                            <br>
                                            <button class="btn btn-success form-control btn-lg" id="btnpago" runat="server" onserverclick="btnRegistrarpago">PAGAR</button>
                                            <button class="btn btn-secondary form-control btn-lg" id="btnimprimir" runat="server" onserverclick="btnimprimir_ServerClick">IMPRIMIR</button>
                                            <label runat="server" id="idpago" visible="false"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="tab-pane" id="panel2">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">CLIENTE:</label>
                                        <label class="col-sm-10 col-form-label text-bold" runat="server" id="nombre"></label>
                                        <label class="col-sm-2 col-form-label">CC/NIT:</label>
                                        <label class="col-sm-4 col-form-label text-bold" runat="server" id="identif"></label>
                                        <label class="col-sm-2 col-form-label">ESTADO:</label>
                                        <label class="col-sm-4 col-form-label text-bold" runat="server" id="estadocliente"></label>
                                        <label class="col-sm-2 col-form-label">DIRECCION:</label>
                                        <label class="col-sm-10 col-form-label text-bold" runat="server" id="dirrecion"></label>
                                        <label class="col-sm-2 col-form-label">CORREO:</label>
                                        <label class="col-sm-10 col-form-label text-bold" runat="server" id="correo"></label>
                                        <label class="col-sm-2 col-form-label">TELEFONO:</label>
                                        <label class="col-sm-10 col-form-label text-bold" runat="server" id="telefono"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="tab-pane" id="panel3">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">FECHA CONTRATO</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="fechacontrato"></label>
                                        <label class="col-sm-3 col-form-label">ACTIVACION</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="fechaactivacion"></label>
                                        <label class="col-sm-3 col-form-label">ESTADO</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="estadoc"></label>
                                        <label class="col-sm-3 col-form-label">CODIGO</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="codigo"></label>
                                        <label class="col-sm-3 col-form-label">FINALIZACION</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="fechafinalizacion"></label>
                                        <label class="col-sm-3 col-form-label">ADICIONAL</label>
                                        <label class="col-sm-3 col-form-label text-bold" runat="server" id="descuento"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
