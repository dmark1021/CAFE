<%@ Page Language="C#" MasterPageFile="~/master/default.master" AutoEventWireup="true" CodeFile="TrialLinks.aspx.cs" Inherits="DefaultLinks" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" Runat="Server">
    <asp:Label ForeColor="Maroon" Font-Bold="true" ID="Label1" runat="server" Text="This is the trial page.The actual look of the webpage will be different"></asp:Label><br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataKeyNames="CollegeID" DataSourceID="DsLinks">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <Columns>
            <asp:TemplateField HeaderText="College Name" SortExpression="CollegeName">
            <ItemTemplate>
            
                <%-- Added the 2 college home pages.  So the following link was commented out.  June 2009 TAN --%>
                <%-- <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#GetURL(Eval("CollegeID")) %>' Text='<%#Eval("CollegeName") %>'>HyperLink</asp:HyperLink> --%>
                
                <%--The following link was changed in the .cs file so that the correct college home page is displayed. June 2009 TAN --%>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#GetURL(Eval("CollegeID")) %>' Text='<%#Eval("CollegeName") %>'>HyperLink</asp:HyperLink>
                
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
</asp:GridView>

    <asp:ObjectDataSource ID="DsLinks" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetCollege" 
        TypeName="CollegeBll"></asp:ObjectDataSource>

</asp:Content>


