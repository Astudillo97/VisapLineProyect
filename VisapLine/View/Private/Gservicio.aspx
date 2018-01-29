<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Gservicio.aspx.cs" Inherits="VisapLine.View.Private.Gservicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="respust" runat="server"></asp:ScriptManager>
          <script type="text/javascript">
           function openModal() {
               $('#mymodal').modal('show');
              }
</script>
    <section class="content">
    <h2>ORDENES DE SERVICIO</h2>
    <div class="box box-body">

        <div class="form-group container-fluid">
            <div class="row col-">
                <asp:FormView ID="formordenes" runat="server">
                    <ItemTemplate>
                        <asp:TextBox ID="idserve" runat="server" Visible="false"></asp:TextBox>
                        <table class="table table-bordered">
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

                    </ItemTemplate>
                </asp:FormView>
            </div>
        <div class="row">
            <div class="form-group">
                <asp:GridView CssClass="table table-bordered" ID="gridtelefono" runat="server"></asp:GridView>
            </div>
        </div>
    </div>
    </div>    
        <div class="box box-body">
             <button type="button" id="but" class="btn btn-primary" data-toggle="modal" data-target="#mymodal">
                +
              </button>
            <div class="modal fade" id="mymodal" data-backdrop=”static” >
				  <div class="modal-dialog" role="document">
					<div class="modal-content">
					  <div class="modal-header">
						<h4 class="modal-title">AGREGAR EQUIPO</h4>
						<button type="button" class="close"  data-dismiss="modal" aria-label="Close">
						  <span aria-hidden="true">&times;</span></button>
					  </div>
					  <div class="modal-body">
						<asp:DropDownList ID="droptiporduc" runat="server" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="droptiporduc_SelectedIndexChanged"></asp:DropDownList>
                          <asp:GridView AutoGenerateColumns="false" ID="inventariogrid" runat="server">
                              <Columns>
                                  <asp:BoundField HeaderText="CODIGO" DataField="idinventario" />
                                  <asp:BoundField HeaderText="DESCRIPCION" DataField="descripcion" />
                                  <asp:TemplateField HeaderText="CANTIDAD">
                                      <ItemTemplate>
                                          <asp:TextBox ID="txbcanti" runat="server"></asp:TextBox>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                              </Columns>
                          </asp:GridView>
                          <asp:Button ID="addinvent" runat="server" OnClick="addinvent_Click" />
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
    </section>
</asp:Content>
