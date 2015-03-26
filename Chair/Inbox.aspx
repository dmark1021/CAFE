<%@ Page Language="C#" MasterPageFile="~/master/AfterLogin.master" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="Chair_Inbox" Title="Untitled Page" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" Runat="Server">
<br /><br />
 <asp:UpdatePanel ID="UpdatePanelddl" runat="server">
             <ContentTemplate>
            <asp:Label ID="lblTerm" runat="server" Text="" BackColor="#FFCC00">Term:</asp:Label>
            <asp:DropDownList ID="DropDownListTerm" runat="server" AutoPostBack="True" 
                DataSourceID="DsTerm" DataTextField="SemYear" DataValueField="TermID" 
                     onselectedindexchanged="DropDownListTerm_SelectedIndexChanged" ondatabound="DropDownListTerm_DataBound" 
                >
            </asp:DropDownList>
            <asp:ObjectDataSource ID="DsTerm" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetSemYear" 
                TypeName="TermBll">
               
            </asp:ObjectDataSource>  
            </ContentTemplate>
       
            </asp:UpdatePanel>  
            <br /><br />
    <asp:UpdatePanel ID="UpdatePanelInbox" runat="server" UpdateMode="Conditional">
          <ContentTemplate>  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MSId" DataSourceID="DsInbox" SkinID="GridView1">
        <Columns>
            <asp:TemplateField HeaderText="Faculty Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl='<%# GetURL(Eval("FacultyID"),Eval("TermID")) %>' Text='<%# Eval("Name") %>'></asp:HyperLink>
                  
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Faculty Comments" 
                SortExpression="FacultyComments">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FacultyComments") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FacultyComments") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    
    </asp:GridView>
    <asp:ObjectDataSource ID="DsInbox" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetInbox" 
        TypeName="MainScheduleBll">
        <SelectParameters>
            <asp:SessionParameter Name="DeptId" SessionField="DeptID" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListTerm" Name="termid" 
                       PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
          </ContentTemplate>
        </asp:UpdatePanel> 
</asp:Content>

