<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="VisapLine.View.Private.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>General Form Elements
        </h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="breadcrumb-item"><a href="#">Forms</a></li>
            <li class="breadcrumb-item active">General Elements</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xl-6 col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Quick Example</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div class="form-element">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <div class="form-group row">
                                <label for="example-text-input" class="col-sm-2 col-form-label">Text</label>
                                <div class="col-sm-10">
                                    <input class="form-control" type="text" value="" id="_1" runat="server">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="example-search-input" class="col-sm-2 col-form-label">Search</label>
                                <div class="col-sm-10">
                                    <input class="form-control" type="text" value="" id="_2" runat="server">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="example-email-input" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <input class="form-control" type="text" value="" id="_3" runat="server">
                                </div>
                            </div>
                        </div>
                        <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <label class="text-center" runat="server" id="textError"></label>
                        </asp:Panel>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button type="submit" runat="server" onserverclick="Unnamed_ServerClick" class="btn btn-primary">Submit1</button>
                            <button type="submit" runat="server" onserverclick="Unnamed_ServerClick1" class="btn btn-primary">Submit2</button>
                            <button type="submit" runat="server" onserverclick="Unnamed_ServerClick2" class="btn btn-primary">Submit3</button>
                            <button type="submit" runat="server" onserverclick="Unnamed_ServerClick3" class="btn btn-primary">Submit4</button>
                            <button type="submit" runat="server" onserverclick="Unnamed_ServerClick4" class="btn btn-primary">Submit5</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
