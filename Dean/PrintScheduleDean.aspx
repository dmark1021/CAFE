<%@ Page Title="" Language="C#" MasterPageFile="~/master/AfterLogin.master" AutoEventWireup="true" CodeFile="PrintScheduleDean.aspx.cs" Inherits="Dean_PrintScheduleDean" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" Runat="Server">
<table>
 <tr>
        <td colspan="2">
        
            <asp:UpdatePanel ID="UpdatePanelddl" runat="server">
             <ContentTemplate>
            <asp:Label ID="lblTerm" runat="server" Text="" BackColor="#FFCC00">Term:</asp:Label>
            <asp:DropDownList ID="DropDownListTerm" runat="server" AutoPostBack="True" 
                DataSourceID="DsTerm" DataTextField="SemYear" DataValueField="TermID"
                 onselectedindexchanged="DropDownListTerm_SelectedIndexChanged"
                  ondatabound="DropDownListTerm_DataBound"  
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
       <asp:Label ID="Label1" runat="server" Text="Print:" Font-Bold="True"></asp:Label>
   <asp:UpdatePanel ID="UpdatePanelActions" runat="server">
             <ContentTemplate>
       <asp:DropDownList ID="DropDownListPrint" runat="server" 
                     onselectedindexchanged="DropDownListPrint_SelectedIndexChanged">
       <asp:ListItem Selected="True" Value="All">All Schedules</asp:ListItem>
           <asp:ListItem Value="AD">Schedules that are approved by Dean</asp:ListItem>
           <asp:ListItem Value="RD">Schedules that are rejected by Dean</asp:ListItem>
       </asp:DropDownList> 
       </ContentTemplate>
       </asp:UpdatePanel>     
   </td>
   </tr>  
   <tr>
   <td style="width: 574px">
 <br /><br />
       <asp:UpdatePanel ID="UpdatePanelCheckbox" runat="server">
<ContentTemplate>
       <asp:CheckBox ID="CheckBoxAll" runat="server" 
           oncheckedchanged="CheckBoxAll_CheckedChanged" AutoPostBack="True"/><asp:Label ID="Label2" runat="server"
           Text="Select All"></asp:Label>
         
           
           </ContentTemplate>
                  </asp:UpdatePanel>
       </td>
       <td align="Center">
<br /><br />
    <asp:Button ID="ButtonPrint" runat="server" Text="Print Selected Schedule" 
               SkinID="AspButton" onclick="ButtonPrint_Click"/>
   </td>

   </tr>
   <tr>
   <td colspan="2">
       <asp:UpdatePanel ID="UpdatePanelGridView" runat="server" UpdateMode="Conditional">
       <ContentTemplate>
       
<asp:GridView ID="GridViewDepartment" runat="server" 
        AutoGenerateColumns="False" DataKeyNames="DeptID" DataSourceID="DsDepartment" SkinID="GridViewdept">
        <Columns>
            <asp:TemplateField>
            <ItemTemplate>
                           <asp:CheckBox ID="CheckBox1" runat="server" />
                       </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField SortExpression="DeptName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DeptName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLinkDept" runat="server" NavigateUrl='<%# GetURL(Eval("DeptID")) %>' Text='<%# GetLinkText(Eval("DeptName"),Eval("DeptID")) %>'></asp:HyperLink>
                    
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
 <asp:ObjectDataSource ID="DsDepartment" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDepartmentByCollege" 
        TypeName="DepartmentBll">
        <SelectParameters>
            <asp:SessionParameter Name="collegeid" SessionField="collid" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>       
       </ContentTemplate>
   
       </asp:UpdatePanel>
   </td>
   </tr>
</table>
</asp:Content>

