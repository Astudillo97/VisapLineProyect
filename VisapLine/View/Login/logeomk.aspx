<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logeomk.aspx.cs" Inherits="VisapLine.View.Login.logeomk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ip
            <asp:TextBox ID="ip" runat="server"></asp:TextBox>
            user
            <asp:TextBox ID="user" runat="server"></asp:TextBox>
            pas
            <asp:TextBox ID="pass" runat="server" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btn" runat="server" OnClick="btn_Click" Text="conectar" />
        </div>
    </form>
</body>
</html>
