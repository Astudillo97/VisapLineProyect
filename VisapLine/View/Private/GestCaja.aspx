<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="GestCaja.aspx.cs" Inherits="VisapLine.View.Private.GestCaja" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content-header">
        <h1>Registro de Movimientos de la CAJA</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Caja</li>
        </ol>
    </section>

    <section class="content">        
        <div class="box box-default">
            <div class="box-header with-border">
                <h2 class="box-title">Registro de ingresos de la Caja</h2>
            </div>
            <!-- /.box-header -->

            <div class="box-body">

                <asp:GridView ID="GridView1" runat="server" class="table table-bordered table-striped table-responsive" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5">
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:CommandField ShowSelectButton="true" SelectText="" ControlStyle-CssClass="glyphicon glyphicon-edit" />
                        <asp:BoundField HeaderText="Codigo de Caja" DataField="idcaja" />
                        <asp:BoundField HeaderText="Fecha de Apertura" DataField="apertura" />
                        <asp:BoundField HeaderText="Fecha Cierre" DataField="cierre" />
                        <asp:BoundField HeaderText="Valor Inicial" DataField="valorinicial" />
                        <asp:BoundField HeaderText="Valor Cierre" DataField="valorfinal" />
                        <asp:BoundField HeaderText="Ingresos" DataField="ingresos" />
                        <asp:BoundField HeaderText="Egresos" DataField="egresos" />
                    </Columns>

                    <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerSettings Mode="NextPreviousFirstLast" />

                    <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="#EFF3FB"></RowStyle>

                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                </asp:GridView>
                <!-- /.row -->

            </div>
            <!-- /.box-body -->
        </div>

        


        <div class="box box-default">
            <div class="box-header with-border">
                <h2 class="box-title">Registro de egresos de la caja</h2>
            </div>
            <!-- /.box-header -->

            <div class="box-body">

                <asp:GridView ID="GridView2" runat="server" class="table table-bordered table-striped table-responsive" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5">
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:CommandField ShowSelectButton="true" SelectText="" ControlStyle-CssClass="glyphicon glyphicon-edit" />
                        <asp:BoundField HeaderText="Codigo de Caja" DataField="idcaja" />
                        <asp:BoundField HeaderText="Fecha de Apertura" DataField="apertura" />
                        <asp:BoundField HeaderText="Fecha Cierre" DataField="cierre" />
                        <asp:BoundField HeaderText="Valor Inicial" DataField="valorinicial" />
                        <asp:BoundField HeaderText="Valor Cierre" DataField="valorfinal" />
                        <asp:BoundField HeaderText="Ingresos" DataField="ingresos" />
                        <asp:BoundField HeaderText="Egresos" DataField="egresos" />
                    </Columns>

                    <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerSettings Mode="NextPreviousFirstLast" />

                    <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="#EFF3FB"></RowStyle>

                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                </asp:GridView>
                <!-- /.row -->

            </div>
            <!-- /.box-body -->
        </div>


    </section>

</asp:Content>
