<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Index2.aspx.cs" Inherits="VisapLine.View.Private.Index2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        img {
            height: auto;
            max-width: 100%;
        }

        #contenedor {
            width: 25%;
            height: 25%;
            top: 30%;
            left: 37.5%;
            position: absolute;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>Dashboard</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
        </ol>
    </section>
    <section class="content">
        <div id="contenedor">
            <img src="../../Archivos/imgvisap.png" />
        </div>
    </section>

</asp:Content>
