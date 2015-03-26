<%@ Page Language="C#" MasterPageFile="~/master/AfterLogin.master" AutoEventWireup="true" CodeFile="InboxByDept.aspx.cs" Inherits="Dean_InboxByDept" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" Runat="Server">
    <asp:Label ID="Label3" runat="server" Text="You are in Department: " BackColor="Yellow" Font-Bold="true"></asp:Label>   <asp:Label ID="LabelDeptName" runat="server" Text="Label"  ForeColor="Maroon" ></asp:Label><br /><br />
<fieldset>
<legend>Inbox</legend>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MSId" DataSourceID="DsInboxByDept" SkinID="GridViewDeanInbox">
        <Columns>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl='<%# GetURL(Eval("FacultyID"),Eval("TermID")) %>' Text='<%# Eval("Name") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FacultyComments" HeaderText="FacultyComments" 
                SortExpression="FacultyComments" />
            <asp:BoundField DataField="ChairComments" HeaderText="ChairComments" 
                SortExpression="ChairComments" />
        </Columns>
        <EmptyDataTemplate>
            <asp:Label ID="Label1" runat="server" ForeColor="Maroon" 
                Text="Inbox is empty for this department"></asp:Label>
        </EmptyDataTemplate>
    </asp:GridView>

</fieldset>




<fieldset>
<legend>View Faculty Schedule</legend>

<asp:UpdatePanel ID="UpdatePanelddl" runat="server">
             <ContentTemplate>
            <asp:Label ID="lblTerm" runat="server" Text="" BackColor="#FFCC00">Term:</asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                DataSourceID="DsTerm" DataTextField="SemYear" DataValueField="TermID"
                 onselectedindexchanged="DropDownList1_SelectedIndexChanged"  ondatabound="DropDownList1_DataBound"
                >
            </asp:DropDownList>
            <asp:ObjectDataSource ID="DsTerm" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetSemYear" 
                TypeName="TermBll">
             
            </asp:ObjectDataSource>  
            </ContentTemplate>
       
            </asp:UpdatePanel>
<br /><br />
<DIV style="width:559px; height:590px; overflow:auto;">
<asp:UpdatePanel ID="UpdatePanelGridAllSch" runat="server" UpdateMode="Conditional">
       <ContentTemplate>
           <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
               DataKeyNames="MSId" DataSourceID="DsAllSch" SkinID="GridViewDeanInbox" 
               Width="460px" Height="890px">
               
               <Columns>
                   <asp:TemplateField HeaderText="Faculty Name" SortExpression="Name">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                       <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl='<%# GetURLFaculty(Eval("FacultyID"),Eval("TermID")) %>' Text='<%# Eval("Name") %>'></asp:HyperLink>                       
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:BoundField DataField="FacultyComments" HeaderText="Faculty Comments" 
                       SortExpression="FacultyComments" />
                   <asp:BoundField DataField="ChairComments" HeaderText="Chair Comments" 
                       SortExpression="ChairComments" />
                   <asp:BoundField DataField="DeanComments" HeaderText="Dean Comments" 
                       SortExpression="DeanComments" />
                   <asp:BoundField DataField="FormattedStatus" HeaderText="Status" 
                       SortExpression="FormattedStatus" />
                   <asp:TemplateField HeaderText="Email" SortExpression="Email">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl='<%# GetURLEmail(Eval("Email")) %>' Text='<%# Eval("Email") %>'></asp:HyperLink>                       
                           
                       </ItemTemplate>
                   </asp:TemplateField>
               </Columns>
               <EmptyDataTemplate>
                   <asp:Label ID="Label2" runat="server" ForeColor="Maroon" 
                       Text="Faculty didn't Create the Schedule yet"></asp:Label>
               </EmptyDataTemplate>
           </asp:GridView>
           <asp:ObjectDataSource ID="DsAllSch" runat="server" 
               OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllSchedules" 
               TypeName="MainScheduleBll">
               <SelectParameters>
                   <asp:SessionParameter Name="DeptId" SessionField="DeptID" Type="Int32" />
                   <asp:ControlParameter ControlID="DropDownList1" Name="termid" 
                       PropertyName="SelectedValue" Type="Int32" />
               </SelectParameters>
           </asp:ObjectDataSource>
       </ContentTemplate>
       </asp:UpdatePanel>
       </DIV>

</fieldset>

         
    <asp:ObjectDataSource ID="DsInboxByDept" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetInboxForDeanByTerm" 
        TypeName="MainScheduleBll" UpdateMethod="UpdateMainSchedule">
        <UpdateParameters>
            <asp:Parameter Name="OverloadCredits" Type="Decimal" />
            <asp:Parameter Name="ReleaseTime" Type="Decimal" />
            <asp:Parameter Name="Compensation" Type="Single" />
            <asp:Parameter Name="FacultyComments" Type="String" />
            <asp:Parameter Name="ChairComments" Type="String" />
            <asp:Parameter Name="DeanComments" Type="String" />
            <asp:Parameter Name="Original_MSId" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter Name="deptid" SessionField="deptid" Type="Int32" />
            <asp:SessionParameter Name="termId" SessionField="termid" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
   
</asp:Content>

