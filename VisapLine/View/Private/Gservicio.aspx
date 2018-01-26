<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Gservicio.aspx.cs" Inherits="VisapLine.View.Private.Gservicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2>ORDENES DE SERVICIO</h2>

    <asp:FormView ID="formordenes" runat="server">
        <ItemTemplate>
            <asp:TextBox ID="idserve" runat="server" Visible="false"></asp:TextBox>
            <div class="box box-body">
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <table class="table table-bordered table-responsive">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblcodserv" runat="server" Text="CODIGO: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txbcodserv" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblfrserv" runat="server" Text="FECHA REGISTRO: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txbfrserv" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbldrccserv" runat="server" Text="DIRECCION : "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txbdrccserv" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblbrrserv" runat="server" Text="BARRIO : "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txbbrrserv" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblmnpserv" runat="server" Text="MUNICIPIO : "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txbmnpserv" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblcrrserv" runat="server" Text="CORREO : "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txbcrrserv" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
    <div class="box box-body">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <asp:GridView CssClass="table table-bordered" ID="gridtelefono" runat="server"></asp:GridView>
                </div>
            </div>
        </div>
    </div>
        <div class="box box-body">
             <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default">
                +
              </button>
            <div class="modal fade" id="modal-default">
				  <div class="modal-dialog" role="document">
					<div class="modal-content">
					  <div class="modal-header">
						<h4 class="modal-title">AGREGAR EQUIPO</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						  <span aria-hidden="true">&times;</span></button>
					  </div>
					  <div class="modal-body">
						<asp:DropDownList ID="droptiporduc" runat="server"></asp:DropDownList>
					  </div>
					  <div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">CERRAR</button>
						<button type="button" class="btn btn-primary float-right">AGREGAR</button>
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

</asp:Content>
