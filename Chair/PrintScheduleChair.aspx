<%@ Page Title="" Language="C#" MasterPageFile="~/master/AfterLogin.master" AutoEventWireup="true" CodeFile="PrintScheduleChair.aspx.cs" Inherits="Chair_PrintScheduleChair" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" Runat="Server">
<table>
 <tr>
        <td colspan="2">
        
            <asp:UpdatePanel ID="UpdatePanelddl" runat="server">
             <ContentTemplate>
            <asp:Label ID="lblTerm" runat="server" Text="" BackColor="#FFCC00">Term:</asp:Label>
            <asp:DropDownList ID="DropDownListTerm" runat="server" AutoPostBack="True" 
                DataSourceID="DsTerm" DataTextField="SemYear" DataValueField="TermID" onselectedindexchanged="DropDownListTerm_SelectedIndexChanged" ondatabound="DropDownListTerm_DataBound"  
                >
            </asp:DropDownList>
            <asp:ObjectDataSource ID="DsTerm" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetSemYear" 
                TypeName="TermBll">
              
            </asp:ObjectDataSource>  
            </ContentTemplate>
       
            </asp:UpdatePanel>    
        </td> 
        
         
   </tr>  
   <tr>
   <td colspan="2">
   <br /><br />
    <asp:UpdatePanel ID="UpdatePanelActions" runat="server" >
             <ContentTemplate>
      <asp:Label ID="Label1" runat="server" Text="Show:" Font-Bold="true"></asp:Label>  
       <asp:DropDownList ID="DropDownListActions" runat="server" AutoPostBack="True" 
                     onselectedindexchanged="DropDownListActions_SelectedIndexChanged">
           <asp:ListItem Selected="True" Value="All">All Schedules</asp:ListItem>
           <asp:ListItem Value="AC">Schedules that are approved by Chair</asp:ListItem>
           <asp:ListItem Value="RC">Schedules that are rejected by Chair</asp:ListItem>
           <asp:ListItem Value="S">Schedules that are not submitted to the Chair yet</asp:ListItem>
           <asp:ListItem Value="SC">Schedules that are submitted to the Chair</asp:ListItem>
       </asp:DropDownList>
       </ContentTemplate>
       </asp:UpdatePanel>
   </td>
   </tr>
   <tr>
   <td>
 <br /><br />
       <asp:UpdatePanel ID="UpdatePanelCheckbox" runat="server">
<ContentTemplate>
       <asp:CheckBox ID="CheckBoxAll" runat="server" 
           oncheckedchanged="CheckBoxAll_CheckedChanged" AutoPostBack="True"/><asp:Label ID="Label2" runat="server"
           Text="Select All"></asp:Label>
         
           
           </ContentTemplate>
                  </asp:UpdatePanel>
       </td>
       <td align="right">
<br /><br />
    <asp:Button ID="ButtonPrint" runat="server" Text="Print Selected Schedule" 
               SkinID="AspButton" onclick="ButtonPrint_Click"/>
   </td>

   </tr>
   <tr>
   <td colspan="2">
      <asp:UpdatePanel ID="UpdatePanelGridAllSch" runat="server" UpdateMode="Conditional">
       <ContentTemplate>
           <asp:GridView ID="GridViewSchedule" runat="server" AutoGenerateColumns="False" 
               DataKeyNames="MSId" DataSourceID="DsAllSch" SkinID="GridView1">
               <Columns>
                   <asp:TemplateField>
                       <ItemTemplate>
                           <asp:HiddenField ID="HiddenFieldFac" runat="server" Value='<%# Eval("FacultyID")%>' />
                           <asp:CheckBox ID="CheckBox1" runat="server"/>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Faculty Name" SortExpression="Name">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                       <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl='<%# GetURL(Eval("FacultyID"),Eval("TermID")) %>' Text='<%# Eval("Name") %>'></asp:HyperLink>                       
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:BoundField DataField="FormattedStatus" HeaderText="Status" 
                       SortExpression="FormattedStatus" />
               </Columns>
           </asp:GridView>
           <asp:ObjectDataSource ID="DsAllSch" runat="server" 
               OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllSchedules" 
               TypeName="MainScheduleBll">
               <SelectParameters>
                   <asp:SessionParameter Name="DeptId" SessionField="DeptID" Type="Int32" />
                   <asp:ControlParameter ControlID="DropDownListTerm" Name="termid" 
                       PropertyName="SelectedValue" Type="Int32" />
               </SelectParameters>
           </asp:ObjectDataSource>
           
           <asp:GridView ID="GridViewSchByStatus" runat="server" 
               AutoGenerateColumns="False" DataKeyNames="MSId" 
               DataSourceID="DsScheduleByStatus" Visible="false" SkinID="GridView1">
               <Columns>
                   <asp:TemplateField>
                    <ItemTemplate>
                    <asp:HiddenField ID="HiddenFieldFac" runat="server" Value='<%# Eval("FacultyID")%>' />
                   <asp:CheckBox ID="CheckBox2" runat="server" />
                   </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Faculty Name" SortExpression="Faculty Name">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl='<%# GetURL(Eval("FacultyID"),Eval("TermID")) %>' Text='<%# Eval("Name") %>'></asp:HyperLink>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:BoundField DataField="FormattedStatus" HeaderText="Status" 
                       SortExpression="FormattedStatus" />
               </Columns>
           </asp:GridView>
           <asp:ObjectDataSource ID="DsScheduleByStatus" runat="server" 
               OldValuesParameterFormatString="original_{0}" 
               SelectMethod="GetPrintScheduleByChair" TypeName="MainScheduleBll">
               <SelectParameters>
                   <asp:SessionParameter Name="deptid" SessionField="DeptID" Type="Int32" />
                   <asp:ControlParameter ControlID="DropDownListTerm" Name="termid" 
                       PropertyName="SelectedValue" Type="Int32" />
                   <asp:ControlParameter ControlID="DropDownListActions" Name="status" 
                       PropertyName="SelectedValue" Type="String" />
               </SelectParameters>
           </asp:ObjectDataSource>
       </ContentTemplate>
       </asp:UpdatePanel>
       
   </td>
   </tr>
   </table>
</asp:Content>

