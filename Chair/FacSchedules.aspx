<%@ Page Language="C#" MasterPageFile="~/master/AfterLogin.master" AutoEventWireup="true" CodeFile="FacSchedules.aspx.cs" Inherits="Chair_FacSchedules" Title="Untitled Page" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" Runat="Server">
    <table>
 <tr>
        <td>
        
            <asp:UpdatePanel ID="UpdatePanelddl" runat="server">
             <ContentTemplate>
            <asp:Label ID="lblTerm" runat="server" Text="" BackColor="#FFCC00">Term:</asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                DataSourceID="DsTerm" DataTextField="SemYear" DataValueField="TermID"
                 onselectedindexchanged="DropDownList1_SelectedIndexChanged" ondatabound="DropDownList1_DataBound" 
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
   <td><br /><br /> 
       <DIV style="width:559px; height:590px; overflow:auto;"><asp:UpdatePanel ID="UpdatePanelGridAllSch" runat="server" UpdateMode="Conditional">
       <ContentTemplate>
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
               DataKeyNames="MSId" DataSourceID="DsAllSch" SkinID="GridView1" 
               Width="460px" Height="890px">
               <Columns>
                   <asp:TemplateField HeaderText="Faculty Name" SortExpression="Name">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                       <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl='<%# GetURL(Eval("FacultyID"),Eval("TermID")) %>' Text='<%# Eval("Name") %>'></asp:HyperLink>                       
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
                        <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl='<%# GetURL1(Eval("Email")) %>' Text='<%# Eval("Email") %>'></asp:HyperLink>                       
                           
                       </ItemTemplate>
                   </asp:TemplateField>
               </Columns>
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
   </td>
   
   </tr>
   </table>
</asp:Content>

