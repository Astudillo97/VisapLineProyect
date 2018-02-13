<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Caja.aspx.cs" Inherits="VisapLine.View.Private.Caja" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content-header">
        <h1>BIENVENIDO A LA CAJA</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Caja</li>
        </ol>
    </section>

    <section class="content">
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">ABRIR CAJA</h3>
            </div>
            <center>
               <table>
                <tr>
                        <th>
                          <asp:Button ID="Button1" runat="server" class="btn btn-block btn-success btn-lg" Width="146px" OnClick="Button1_Click" Text="ABRIR CAJA" />
                            </th>
                    <th>
                    
                    </tr>

            </table>
            </center>

        </div>
    </section>
</asp:Content>
