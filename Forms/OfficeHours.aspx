<%@ Page Title="" Language="C#" MasterPageFile="~/master/AfterLogin.master" AutoEventWireup="true" CodeFile="OfficeHours.aspx.cs" Inherits="Forms_OfficeHours" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" Runat="Server">
<table>
 <tr>
        <td align ="left">
         <asp:Label ID="lblTerm" runat="server" Text="" >Term:</asp:Label>
         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                DataSourceID="DsTerm" DataTextField="SemYear" DataValueField="TermID" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged" ondatabound="DropDownList1_DataBound" >
            </asp:DropDownList>
            <asp:ObjectDataSource ID="DsTerm" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetSemYear" 
                TypeName="TermBll">
               
            </asp:ObjectDataSource> 
          
        </td> 
        
         
   </tr>  
   
        
   
         
         
         <tr>
          <asp:Panel ID="panOfficehoursTitle" runat="server" CssClass="collapsePanelHeader">
               <asp:Image ID="officehoursImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" />
               &nbsp;&nbsp;
               <asp:Label ID="Label3" runat="server" Text="Office Hours"></asp:Label></asp:Panel>
           <asp:Panel ID="panOfficehours" runat="server" CssClass="collapsePanel">
                <div style="overflow: auto;">  
                     <asp:GridView ID="OfficeHoursGridView" runat="server" 
                         AutoGenerateColumns="False" DataKeyNames="OHId" DataSourceID="DsOfficeHours" 
                         EnableViewState="False" ShowFooter="True" SkinID="GridView" width="90%">
                         <Columns>
                             <asp:TemplateField ShowHeader="False">
                                 <ItemTemplate>
                                     <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                         CommandName="Edit" Text="Edit" Visible="<%# GetEditStatus() %>"></asp:LinkButton>&nbsp<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                         CommandName="Delete" Text="Delete" Visible="<%# GetEditStatus() %>"></asp:LinkButton></ItemTemplate><EditItemTemplate>
                                     <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                         CommandName="Update" Text="Update"></asp:LinkButton>&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                         CommandName="Cancel" Text="Cancel"></asp:LinkButton></EditItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Day" SortExpression="Day">
                                 <ItemTemplate>
                                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("Day") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                                     <%--Drop down list for Office Hours Edit Delete Box --%>
                                     <asp:DropDownList ID="DropDownListDay" runat="server" 
                                         SelectedValue='<%# Bind("Day") %>'>
                                         <asp:ListItem>Monday</asp:ListItem><asp:ListItem>Tuesday</asp:ListItem><asp:ListItem>Wednesday</asp:ListItem><asp:ListItem>Thursday</asp:ListItem><asp:ListItem>Friday</asp:ListItem><asp:ListItem>Saturday</asp:ListItem><asp:ListItem>Sunday</asp:ListItem></asp:DropDownList></EditItemTemplate></asp:TemplateField><asp:TemplateField FooterText="Total" HeaderText="From" 
                                 SortExpression="FromTime">
                                 <ItemTemplate>
                                     <asp:Label ID="fromtimelabel" runat="server" 
                                         Text='<%# Eval("FromTime", "{0:t}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                                     <%--Replaced time textbox with timepicker dropdown list from data base Nov. 2009 TAN--%>
                                     <asp:DropDownList ID="DDOHFromTime" runat="server" DataSourceID="DsTimePicker" 
                                            DataTextField="Time" DataValueField="Value" SelectedValue='<%# Bind("FromTimeValue") %>'>
                                    </asp:DropDownList>
                                 </EditItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="To" SortExpression="ToTime">
                                 <ItemTemplate>
                                     <asp:Label ID="totimeLabel" runat="server" 
                                         Text='<%# Eval("ToTime", "{0:t}") %>'></asp:Label></ItemTemplate><FooterTemplate>
                                     <%#GetOfficeHoursTotalFormat()%></FooterTemplate><EditItemTemplate>
                                     <%--Replaced time text box with timepicker dropdown list from data base Nov. 2009 TAN--%>
                                     <asp:DropDownList ID="DDOHToTime" runat="server" DataSourceID="DsTimePicker"
                                        DataTextField="Time" DataValueField="Value" SelectedValue='<%# Bind("ToTimeValue")  %>'>
                                     </asp:DropDownList>
                                     <%--Add time entry validation 11/10/09 TAN --%>
                                     <asp:CompareValidator id="compTime" Display="Dynamic" EnableClientScript="true" 
                                        ControlToValidate="DDOHFromTime" Operator="LessThan" 
                                        ControlToCompare="DDOHToTime" ErrorMessage="To time must be later than from time" 
                                        type="Integer" runat="server" Font-Bold="True" ForeColor="Red">
                                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </asp:CompareValidator>   
                                 </EditItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Total" SortExpression="Total" Visible="False">
                                 <ItemTemplate>
                                     <%#GetTotalOfficeHours(long.Parse(Convert.ToString(Eval("Total"))))%></ItemTemplate><EditItemTemplate>
                                     <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Total") %>'></asp:TextBox></EditItemTemplate></asp:TemplateField></Columns><EmptyDataTemplate>
                             <div style="color: #800000; font-family: Arial, Helvetica, sans-serif">
                                 <table width="90%">
                                     <tr>
                                         <td align="center">
                                            <%--TAN Dec. 2009 Replaced the word "yet" with "been"--%>
                                             <b>Schedule has not been created</b>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td align="center">
                                            <%--Added Visible property(twice) so that user can't edit if dean has approved. Dec 2009 TAN--%>
                                             
                                             ,&nbsp;<b></b></td></tr></table></div></EmptyDataTemplate></asp:GridView>
                                             
                                                  <div align="right" 
    style="width: 757px; top: 970px; left: 476px; height: 26px">
     <asp:Label ID="lblMsg2" runat="server" Font-Bold="True" EnableViewState="false" ForeColor="#FF0066"></asp:Label>
             
                   <asp:Button ID="btnCopyOfficeHours" runat="server" 
                         style="top: 951px; left: 194px; height: 26px; width: 159px; margin-bottom: 0px;" 
                                 Text="Copy to Current Semester" Height="17px" SkinID="AspButton" 
                                 Width="154px"  onclick="btnCopyOfficeHours_Click"/>
                                 <asp:Button ID="Button1" runat="server" 
                         style="top: 951px; left: 194px; height: 26px; width: 159px; margin-bottom: 0px;" 
                                 Text="Cancel" Height="17px" SkinID="AspButton" 
                                 Width="154px"  onclick="Button1_Click"/>
                         </div>
                 
                        </asp:Panel>
           <asp:ObjectDataSource ID="DsTimePicker" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetTimePickerTimes" 
            TypeName="TimePickerBll">
        </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="DsOfficeHours" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetOfHrByfac" 
        TypeName="OfficeHoursBLL" UpdateMethod="UpdateOfficeHours" 
            InsertMethod="InsertOfficeHrs" DeleteMethod="DeleteOfficeHours"   >
        <DeleteParameters>
            <asp:Parameter Name="Original_OHId" Type="Int32" />
        </DeleteParameters>
        
        <%--Changed UpdateParameters because of timepicker dropdown list. Nov 2009 TAN--%>
        <%--Parameters have to match @parameters in stored procedure. Nov 2009 TAN--%>
        <UpdateParameters>
            <asp:Parameter Name="Original_OHId" Type="Int32" />
            <asp:Parameter Name="Day" Type="String" />
            <asp:Parameter Name="FromTime" Type="String" />
            <asp:Parameter Name="ToTime" Type="String" />
            <asp:Parameter Name="FromTimeValue" Type="Int32" />     <%--Nov. 2009 TAN--%>
            <asp:Parameter Name="ToTimeValue" Type="Int32" />       <%--Nov. 2009 TAN--%></UpdateParameters><SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="FacultyID" SessionField="FacId" 
                Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="TermID" SessionField="TermId" 
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="facid" Type="Int32" />
            <asp:Parameter Name="Day" Type="String" />
            <asp:Parameter Name="FromTime" Type="DateTime" />
            <asp:Parameter Name="ToTime" Type="DateTime" />
            <asp:Parameter Name="termid" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
            
         
            </tr>
            </table>

</asp:Content>

