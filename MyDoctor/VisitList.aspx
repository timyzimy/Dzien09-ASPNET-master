<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VisitList.aspx.cs" Inherits="MyDoctor.VisitList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Lista wizyt</h3>
    <asp:GridView ID="gridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" CellSpacing="15" DataKeyNames="id" DataSourceID="sqlDataSource" Font-Size="Small" ForeColor="#333333" OnRowDataBound="gridView_RowDataBound" Width="100%" OnRowCommand="gridView_RowCommand">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id">
            <ItemStyle HorizontalAlign="Right" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="fname" HeaderText="IMIĘ" SortExpression="fname" />
            <asp:BoundField DataField="lname" HeaderText="NAZWISKO" SortExpression="lname" />
            <asp:BoundField DataField="pesel" HeaderText="PESEL" SortExpression="pesel" />
            <asp:TemplateField HeaderText="EMAIL" SortExpression="email">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("email", "mailto:{0}") %>' Text='<%# Eval("email") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="LEKARZ" SortExpression="doctor">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# GetDoctor( Convert.ToInt32(Eval("doctor")) ) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="visit_date" HeaderText="DATA WIZYTY" SortExpression="visit_date" />
            <asp:BoundField DataField="card" HeaderText="NR KARTY" SortExpression="card" />
            <asp:BoundField DataField="status" HeaderText="STATUS" SortExpression="status" />
            <asp:BoundField DataField="descr" HeaderText="OPIS" SortExpression="descr" />
            
            <asp:ImageField 
                DataImageUrlField="image" 
                DataImageUrlFormatString="{0}" 
                NullDisplayText="Brak obrazu"
                HeaderText="OBRAZ">
                <ControlStyle Width="200px" />
            </asp:ImageField>
        
            <asp:HyperLinkField 
                DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="EditVisit.aspx?id={0}" Text="Edytuj" />
        
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="Button1" 
                        CommandArgument='<%# Eval("id") %>'
                        OnClientClick="return confirm('Czy na pewno usunąć rekord?');"
                        runat="server" Text="Usuń" CommandName="DeleteRow" />
                </ItemTemplate>
            </asp:TemplateField>
        
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="sqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:edoctorCS %>" ProviderName="<%$ ConnectionStrings:edoctorCS.ProviderName %>" SelectCommand="SELECT * FROM visits ORDER BY ID"></asp:SqlDataSource>
</asp:Content>
