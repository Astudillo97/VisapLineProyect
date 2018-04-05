<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="VisapLine.View.Private.Facturacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function EnviarSMS(mensaje, telefono) {
            var data = JSON.stringify({
                "from": "InfoSMS",
                "to": "" + telefono,
                "text": "" + mensaje
            });

            var xhr = new XMLHttpRequest();
            xhr.withCredentials = false;

            xhr.addEventListener("readystatechange", function () {
                if (this.readyState === this.DONE) {
                    console.log(this.responseText);
                }
            });

            xhr.open("POST", "https://apisms.contactomasivo.com/sms/1/text/single");
            xhr.setRequestHeader("authorization", "Basic Q01wcnVlYmE6S2dOSmRqT0U=");
            xhr.setRequestHeader("content-type", "application/json");
            xhr.setRequestHeader("accept", "application/json");
            xhr.send(data);
        }
    </script>
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
    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>

    <section class="content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li><a  id="pan1" href="#Resultado" data-toggle="tab">FACTURACION DEL MES</a></li>
                <li><a class="active" id="pan2" href="#Individual" data-toggle="tab">BUSQUEDA</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane" id="Resultado">
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
                <div class="tab-pane active" id="Individual">
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
                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-responsive" OnPageIndexChanging="allfactura_PageIndexChanging" OnRowCommand="allfactura_RowCommand" AllowPaging="True" PageSize="10" AutoGenerateColumns="False" ID="allfactura">
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
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="btn1" runat="server" CssClass="glyphicon glyphicon-copy" CommandName="verfactura" CommandArgument='<%# Eval("idfactura") %>' Text="" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="btn2" runat="server" CssClass="glyphicon glyphicon-edit" CommandName="editarfactura" CommandArgument='<%# Eval("facturaventa") %>' Text="" />
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
        </div>
        <div class="tab-pane">
            <div class="box box-primary">
                <div class="form-group row">
                    <asp:DropDownList id="metodoimpresion" runat="server" class="btn btn-primary col-md-3">
                        <asp:ListItem Text="Seleccione" />
                        <asp:ListItem Text="CORREO" />
                        <asp:ListItem Text="DOMICILIO" />
                        <asp:ListItem Text="AMBOOS" />
                    </asp:DropDownList>
                    <asp:DropDownList ID="method" runat="server" class="btn btn-primary col-md-3">
                        <asp:ListItem Text="Seleccione" />
                        <asp:ListItem Text="CORREO" />
                        <asp:ListItem Text="DOMICILIO" />
                        <asp:ListItem Text="AMBOOS" />
                    </asp:DropDownList>
                    <asp:DropDownList runat="server" ID="estadofactura" class="btn btn-primary col-md-3">
                        <asp:ListItem Text="Seleccione" />
                        <asp:ListItem Text="Facturado" />
                        <asp:ListItem Text="Vencido" />
                    </asp:DropDownList>
                    <asp:DropDownList runat="server" class="btn btn-primary col-md-3">
                        <asp:ListItem Text="TODOS" />
                    </asp:DropDownList>
                </div>
                <div class="form-group row">
                    <button class="btn btn-primary col-md-3" runat="server" onserverclick="Imprimirallfactura"><span class="glyphicon glyphicon-print"></span>IMPRIMIR TODAS LAS FACTURAS</button>
                    <button class="btn btn-success col-md-3" runat="server" onserverclick="EnviarAllFactura"><span class="glyphicon glyphicon-inbox"></span>ENVIAR TODAS LAS FACTURAS</button>
                    <button class="btn btn-success col-md-3" runat="server" onserverclick="EnviarSMSText"><span class="glyphicon glyphicon-inbox"></span>ENVIAR SMS TEXTO</button>
                    <a href="VistadeExporte.aspx" class="btn btn-success col-md-3"><span class="glyphicon glyphicon-export">OBTENER XLS PARA SIIGO</span></a>
                </div>
            </div>
        </div>

        <div class="tab-pane">
        </div>
        <div runat="server" visible="false" id="divcorreo">
            <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>FACTURA C & C VISIÓN - VISAPLINE </title>
            </head>
            <body>

                <div style="width: 100%;" align="center">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td align="center" valign="top" style="background-color: #ffffff;" bgcolor="#53636e;">
                                <table width="583" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="center" valign="top" bgcolor="#FFFFFF" style="background-color: #ffffff;">C & C VISION -VISAPLINE</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top" bgcolor="#FFFFFF" style="background-color: #FFFFFF;">
                                            <p>
                                                <img id="img1" src="http://45.71.180.50:30000/Contenido/nuestra-empresa.jpg" width="583"/>
                                            </p>

                                            <p id="text1">C&C Visión Ltda. 
				Desarrolla efectivamente servicios en Tecnología de la Información y las Comunicaciones, permanentes y de alto impacto a través de redes Inalámbricas, Fibra óptica, Satelital, Microondas. 
				Hasta el usuario final, con responsabilidad social y sostenibilidad ambiental, buscando la eficiencia, eficacia en los procesos de comunicación de usuarios y empresas con el mundo. 
                                            </p>
                                            <p>&nbsp;</p>
                                            <table width="583" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td align="center" width="40%" valign="top" bgcolor="#FFFFFF" style="background-color: #ffffff;">
                                                        <h3>Facturación Electronica</h3>
                                                       <p id="text2"><a href="http://45.71.180.50:30000/View/Public/facturacion.aspx" type="button" style="color: #FFFFFF; background-color: #2F62BB; width: 100%; border-radius: 7px; padding: 10px; border: solid 1px black; font-size: 13px; font-family: Arial, Helvetica, sans-serif;">Ver Factura</a></p>
                                                        <p>Señor usuario, con el fin de proteger nuestro medio ambiente le recomendamos no imprimir su factura si no es necesario.</p>
                                                    </td>
                                                    <td align="center" width="60%" valign="top" bgcolor="#FFFFFF" style="background-color: #ffffff;">
                                                        <img id="img2" src="http://45.71.180.50:30000/Contenido/facturaelectronica.jpg" vspace="10"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="top" bgcolor="#3d90bd" style="background-color: #2F62BB;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="35">&nbsp;</td>
                                                    <td height="50" valign="middle" style="color: #FFFFFF; font-size: 11px; font-family: Arial, Helvetica, sans-serif;">
                                                        <br>Dirección:	
			Carrera 10 # 15-60 Barrio Centro Edificio Pioneros 2do piso Oficina 4 Florencia-Caquetá </br>
                                                        <br>Linea Nacional: 018000 952240 - Celulares:  (+57) 318 490 3427 - (+57) 321 206 5866
                                                        </br>
                                                    </td>
                                                    <td width="35">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br>
                                <br>
                            </td>
                        </tr>
                    </table>

                </div>

            </body>
            </html>
        </div>
    </section>
</asp:Content>
