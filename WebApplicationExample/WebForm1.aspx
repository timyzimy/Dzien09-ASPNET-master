<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplicationExample.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <b>To jest moja strona w ASP.NET</b>
        </div>
        <div>
            <asp:Label ID="lblText" runat="server" Text="Tekst informacyjny aplikacji ASP.NET" 
                Font-Bold="True" BackColor="Yellow" Font-Size="XX-Large" ForeColor="#FF0066" BorderStyle="Dotted"></asp:Label>
        </div>
        <div>
            <asp:Label ID="lblInfo" Font-Size="X-Large" runat="server" Text="Napis"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="tbName" runat="server" MaxLength="30" Width="200px"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnOK" runat="server" Text="OK" Height="50px" OnClick="btnOK_Click" Width="150px" />
        </div>
    </form>
</body>
</html>
