<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="servicio.aspx.cs" Inherits="VisapLine.View.Private.servicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView runat="server" id="listequipo">
        <ItemTemplate>
            <div class="row">
        <!-- /.col -->
        <div class="col-md-12 col-lg-3">
          <div class="box box-default">
                      <br />
                <asp:TextBox runat="server" ID="tmodelo" CssClass="form-control" ReadOnly="true" Text='<%#Eval("modelo")%>'></asp:TextBox>
				<br />
       <asp:Label runat="server" ID="lfabri" Text="FABRICANTE"></asp:Label>
                                      <br />
                <asp:TextBox runat="server" ID="tfabri" CssClass="form-control" ReadOnly="true" Text='<%#Eval("fabricante")%>'></asp:TextBox>
				<br />
            <div class="box-body">            	
				<h4 class="card-title">Card title</h4>
				<div>
                    <asp:Label runat="server" ID="linv" Text="INVENTARIO"></asp:Label>
                    <br />
                <asp:TextBox ID="tinv" CssClass="form-control" ReadOnly="true" runat="server" Text='<%#Eval("idinventario")%>'></asp:TextBox>
				<br />
                <asp:Label runat="server" id="lserial" Text="SERIAL"></asp:Label>
                    <br />
                <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="tserial" Text='<%#Eval("serial")%>'></asp:TextBox>
				<br />
                <asp:Label runat="server" id="lmac" Text="MAC"></asp:Label>
                    <br />
                <asp:TextBox runat="server" ID="tmac" CssClass="form-control" ReadOnly="true" Text='<%#Eval("mac")%>'></asp:TextBox>
				<br />
                <asp:Label runat="server" ID="ldescrp" Text="DESCRIPCION"></asp:Label>
                    <br />
                <asp:TextBox runat="server" ID="tdescrp" CssClass="form-control" ReadOnly="true" Text='<%#Eval("descripcion")%>'></asp:TextBox>
				<br />
                <asp:Label runat="server" ID="ltpro" Text="TIPO PRODUCTO"></asp:Label>
                    <br />
                <asp:TextBox runat="server" ID="ttpro" CssClass="form-control" ReadOnly="true" Text='<%#Eval("tipoproducto")%>'></asp:TextBox>
				<br />
                <asp:Label runat="server" ID="lmodelo" Text ="MODELO"></asp:Label>
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
        </ItemTemplate>
    </asp:ListView>
    <asp:GridView runat="server" ID="Caracteristicas"></asp:GridView>
</asp:Content>
