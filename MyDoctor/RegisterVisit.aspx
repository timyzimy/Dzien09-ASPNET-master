<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="RegisterVisit.aspx.cs" Inherits="MyDoctor.RegisterVisit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.js" >
    </script>

    <script type="text/javascript" >
        $(function () {
            //ustawiam maske dla PESEL
            $('#<%= tbPESEL.ClientID %>').mask("99999999999");
        });

        function checkPESEL(sender, args) {
            args.IsValid = (args.Value.length == 11);
        }
    </script>
    <h3>Nowa wizyta</h3>
    <table border="0" class="table">
        <tr>
            <td>
                Imię
            </td>
            <td>
                <asp:TextBox ID="tbFName" Width="200" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Podaj imię" ControlToValidate="tbFName" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Nazwisko
            </td>
            <td>
                <asp:TextBox ID="tbLName" Width="200" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                     runat="server" ErrorMessage="Podaj nazwisko" 
                     ControlToValidate="tbLName" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>
                PESEL
            </td>
            <td>
                <asp:TextBox ID="tbPESEL" Width="200" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" runat="server"
                    Display="Dynamic" ControlToValidate="tbPESEL" ForeColor="Red"
                    ErrorMessage="Podaj PESEL" ClientValidationFunction="checkPESEL" ValidateEmptyText="True">*</asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                Email
            </td>
            <td>
                <asp:TextBox ID="tbEmail" Width="200" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    Display="Dynamic"
                    runat="server" ErrorMessage="Podaj email" ControlToValidate="tbEmail" 
                    ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                     runat="server" ErrorMessage="Podaj e-mail" Display="Dynamic"
                     ControlToValidate="tbEmail" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Lekarz</td>
            <td>
                <asp:DropDownList ID="ddDoctor" runat="server">
                    <asp:ListItem Value="-1">-----------</asp:ListItem>
                    <asp:ListItem Value="1">Jan Kowalski - Pediatra</asp:ListItem>
                    <asp:ListItem Value="2">Janina Zientek - Dermatolog</asp:ListItem>
                    <asp:ListItem Value="3">Mirosław Baka - Kardiolog</asp:ListItem>
                </asp:DropDownList>
                
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Wybierz lekarza" 
                    ControlToValidate="ddDoctor"  Display="Dynamic"
                    ForeColor="Red" MaximumValue="999999" MinimumValue="1" Type="Integer">*</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>Data</td>
            <td>
                <asp:Calendar ID="calVisitDate" runat="server" Height="200px" ShowGridLines="True" Width="300px"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>Klient VIP</td>
            <td>
                <asp:CheckBox ID="cbVIP" runat="server" OnCheckedChanged="cbVIP_CheckedChanged" AutoPostBack="True" />
                <br />
                <asp:TextBox ID="tbVIPNumber" runat="server" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnOK" runat="server" Text="Zapisz na wizytę" OnClick="btnOK_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
