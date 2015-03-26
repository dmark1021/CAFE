<%@ Page Language="C#" MasterPageFile="~/master/AfterLogin.master" AutoEventWireup="true" CodeFile="InboxAllDept.aspx.cs" Inherits="Chair_Inbox" Title="CAFE - Dean View Schedules" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" Runat="Server">

    <script src="../JS Files/jquery-1.2.6.min.js" type="text/javascript"></script>
<!-- <script src="../JS Files/jquery.quicksearch.js" type="text/javascript"></script> June 2009 TAN -->
<script src="../JS Files/jquery.tablesorter.min.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
//June 2009 Commented out so that do not have the "Search Department" box on the page TAN
/* $(document).ready(
   function () {
                 $('table#<%= GridViewDepartment.ClientID %> tbody tr').quicksearch({
	                position: 'before',
	                attached: 'table#<%= GridViewDepartment.ClientID %>',
	                stripeRowClass: ['odd', 'even'],
	                labelText: 'Search Department',
	                delay: 100});
}); */

 $(document).ready(
   function () {$("#<%= GridViewDepartment.ClientID %>").tablesorter(); });

</script>
<br /><br />
<table>
 <tr>
        <td colspan="2">
        
            <asp:UpdatePanel ID="UpdatePanelddl" runat="server">
             <ContentTemplate>
            <asp:Label ID="lblTerm" runat="server" Text="" BackColor="#FFCC00">Term:</asp:Label>
            <asp:DropDownList ID="DropDownListTerm" runat="server" AutoPostBack="True" 
                DataSourceID="DsTerm" DataTextField="SemYear" DataValueField="TermID" 
                  onselectedindexchanged="DropDownList1_SelectedIndexChanged" ondatabound="DropDownList1_DataBound"
                >
            </asp:DropDownList>
            <asp:ObjectDataSource ID="DsTerm" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetSemYear" 
                TypeName="TermBll">
                
            </asp:ObjectDataSource>  
                 <br />
                 <br />
                 <br />
                 <br />
            </ContentTemplate>
       
            </asp:UpdatePanel>    
        </td>          
 </tr>  
</table>
   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
         
    <asp:GridView ID="GridViewDepartment" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="DeptID" DataSourceID="DsInbox" SkinID="GridView1">
        <Columns>
            <asp:TemplateField HeaderText="Department" SortExpression="DeptName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DeptName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLinkDept3" runat="server" NavigateUrl='<%# GetURL(Eval("DeptID")) %>' Text='<%# Bind("DeptName") %>'></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="Inbox" HeaderText="Inbox" SortExpression="Inbox" />
            <asp:BoundField DataField="Approved" HeaderText="Approved by Dean" 
                SortExpression="Approved" />
            <asp:BoundField DataField="Rejected" HeaderText="Rejected by Dean" 
                SortExpression="Rejected" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="DsInbox" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetNoOfInboxApprovedRejectForDeanByTerm" TypeName="DepartmentBll">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListTerm" Name="termId" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:SessionParameter Name="collId" SessionField="collId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
     </ContentTemplate></asp:UpdatePanel>
    <br />
    </asp:Content>

