<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SchedulePrint.aspx.cs" Inherits="Forms_SchedulePrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style26
        {
            font-family: "Times New Roman", Times, serif;
            font-weight: bold;
            font-size: large;
            width: 846px;
        }
        .style27
        {
            width: 846px;
        }
    
    hr{ 
            page-break-after: always;
        }
        

.rule {
border-top: 1px solid #999;
border-bottom:1px solid #999;
} 

/* Added June 2009 TAN */
.commentLineTop 
{
    border-top: 1px solid #999;
}

/* Added June 2009 TAN */
.commentLineBottom
{
    border-bottom: 1px solid #999;
}

        </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #FFFFFF">

    <asp:Panel ID="Panel1" runat="server">
        <asp:Repeater ID="Repeater2" runat="server" 
            onitemdatabound="Repeater2_ItemDataBound">
            <ItemTemplate> 
                 <table style="width:100%;">
            <tr>
                <td class="style1">
                    <p style="width: 800px"><asp:Label ID="dateLabel" runat="server" Text="Label"></asp:Label>
                  <br />  <asp:Label ID="termLabel" runat="server" Text="Term" Font-Bold="true"></asp:Label>
                    </p>    
                    </td>
            </tr>
            <tr>
                <td style="text-align: center; font-family: 'Times New Roman'; font-size: x-large;" 
                    class="style27">
                    Faculty Schedule Form</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="font-family: Arial; font-weight: normal;" 
                    class="style27">
                    <table style="padding: inherit;  width: 100%;">
                        <tr>
                            <td class="style12" style="font-weight: normal; color: #000000">
                                Name:</td>
                           <td class="style24">
                                <asp:Label ID="lblName" runat="server" Text="Name" Font-Names="Arial" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style12" style="font-weight: normal; color: #000000">
                                Release Time:</td>
                            <td class="style25">
                                <asp:Label ID="lblReleaseTime" runat="server" Text="ReleaseTime" 
                                    Font-Names="Arial" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <td class="style12" style="font-weight: normal; color: #000000">
                                Overloaded Teaching Credits:</td>
                            <td class="style25">
                                <asp:Label ID="lblOLCredits" runat="server" Text="OverloadCredits" 
                                    Font-Names="Arial" ForeColor="Black"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="style12" style="font-weight: normal; color: #000000">
                                Extra Compensation Requested:</td>
                            <td class="style25">
                                <asp:Label ID="lblCompensation" runat="server" Text="Compensation" 
                                    Font-Names="Arial" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>                       
                        <tr>
                        
                            <td class="style12" style="font-weight: normal; color: #000000" valign="top">
                                Faculty Comments:</td>
                            <td class="style25">
                            <div class="commentLineBottom">      <!-- Changed from class="rule" June 2009 TAN -->
                                <asp:Label ID="txtFacultyComment" runat="server" Text="Label" Width="600px"  Font-Names="Arial" ForeColor="Black"></asp:Label>
                                </div>
                                </td>
                            
                        </tr>
                        <tr>
                            <td class="style12" style="font-weight: normal; color: #000000" valign="top">
                                Chair Comments:</td>
                            <td class="style25">
                            <div class="commentLineBottom">     <!-- Changed from class="rule" June 2009 TAN -->
                                <asp:Label ID="txtChairComment" runat="server" Text="Label" Width="600px"  Font-Names="Arial" ForeColor="Black"></asp:Label>
                                </div>
                               </td>
                        </tr>
                        <tr>
                            <td class="style12" style="font-weight: normal; color: #000000" valign="top">
                                Dean Comments:</td>
                            <td class="style25" >
                            <div class="commentLineBottom">     <!-- Changed from class="rule" June 2009 TAN -->
                                <asp:Label ID="txtDeanComment" runat="server" Text="Label" Width="600px"  Font-Names="Arial" ForeColor="Black"></asp:Label>
                                </div>
                                </td>
                            </tr>
                        
                       
                    </table>
                </td>
            </tr>
     
            <tr>
                <td class="style27">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style26">
                    Teaching Schedule</td>
            </tr>
            <tr>
                <td class="style27">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" DataKeyNames="ScheduleID" 
                        DataSourceID="oDSSchedule" Font-Names="Arial" ForeColor="Black">
                        <Columns>
                            <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" 
                                SortExpression="CourseCode" />
                            <asp:BoundField DataField="CourseTitle" HeaderText="CourseTitle" 
                                SortExpression="CourseTitle" />
                            <asp:BoundField DataField="TeachingCredits" HeaderText="TeachingCredits" 
                                SortExpression="TeachingCredits" />
                            <asp:BoundField DataField="StudentCredits" HeaderText="StudentCredits" 
                                SortExpression="StudentCredits" />
                            <asp:BoundField DataField="TeamTaught" HeaderText="TeamTaught" 
                                SortExpression="TeamTaught" />
                            <asp:BoundField DataField="MeetingDays" HeaderText="MeetingDays" 
                                SortExpression="MeetingDays" />
                            <asp:BoundField DataField="Location" HeaderText="Location" 
                                SortExpression="Location" />
                            <asp:BoundField DataField="StartTime" HeaderText="StartTime" 
                                SortExpression="StartTime" />
                            <asp:BoundField DataField="EndTime" HeaderText="EndTime" 
                                SortExpression="EndTime" />
                            <asp:BoundField DataField="Enrollment" HeaderText="Enrollment" 
                                SortExpression="Enrollment" />
                        </Columns>
                        <EmptyDataTemplate>
                        <div>No Records Found</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
       <tr>
                <td class="style27">
                    <asp:ObjectDataSource ID="oDSSchedule" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetScheduleByTerm" 
                        TypeName="ScheduleBll">
                        <SelectParameters>
                            <asp:Parameter Name="termid"/>
                            <asp:Parameter Name="facultyid"/>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    Office Hours</td>
            </tr>
            <tr>
                <td class="style27">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="OHId" DataSourceID="oDSOfficeHour" ForeColor="Black">
                        <Columns>
                            <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" 
                                ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="FromTime" HeaderText="From Time" 
                                SortExpression="FromTime" DataFormatString="{0:t}" 
                                ItemStyle-Width="150px" >
<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="ToTime" HeaderText="To Time" 
                                SortExpression="ToTime" DataFormatString="{0:t}" ItemStyle-Width="150px" >
<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" Visible="False" />
                        </Columns>
                          <EmptyDataTemplate>
                        <div>No Records Found</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="oDSOfficeHour" runat="server" 
                       OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetOfHrByfac" TypeName="OfficeHoursBLL" 
                      >
                   
                           <SelectParameters>
                            <asp:Parameter Name="termid"/>
                            <asp:Parameter Name="facultyid"/>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    Off Campus Activities</td>
            </tr>
            <tr>
                <td class="style27">
                    
                    <asp:GridView ID="GridViewOffCampus" runat="server" AutoGenerateColumns="False" 
                   DataKeyNames="OCId" DataSourceID="DsOffCampus" ShowFooter="True" Font-Names="Arial" ForeColor="Black">
                   <Columns>
                       
                       <asp:BoundField DataField="Activity" HeaderText="Activity" 
                           SortExpression="Activity" />
                       <asp:BoundField DataField="Organization" HeaderText="Organization" 
                           SortExpression="Organization" />
                       <asp:TemplateField HeaderText="Day" SortExpression="Day">
                           <ItemTemplate>
                           <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("OCId") %>' />
                               <asp:GridView ID="GridView2" runat="server" DataSourceID="DsInsideGridDay" 
                                   AutoGenerateColumns="False" DataKeyNames="OCId" Font-Names="Arial" ForeColor="Black" GridLines="None" ShowHeader="False">
                                   <Columns>
                                       <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                                   </Columns>
                               </asp:GridView>
                               <asp:ObjectDataSource ID="DsInsideGridDay" runat="server" 
                                   OldValuesParameterFormatString="original_{0}" SelectMethod="GetOffCapHrsByTerm" 
                                   TypeName="OffCampusBll">
                                   <SelectParameters>
                                       <asp:ControlParameter ControlID="HiddenField1" Name="OcId" PropertyName="Value" 
                                           Type="Int32" />
                                   </SelectParameters>
                               </asp:ObjectDataSource>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="From" SortExpression="FromTime" 
                           FooterText="Total">
      
                           <FooterTemplate>
                               <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Black" 
                                   Text="Total:"></asp:Label>
                           </FooterTemplate>
                           <ItemTemplate>
                           <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("OCId") %>' />
                               <asp:GridView ID="GridView3" runat="server" DataSourceID="DsInsideGridFromTime" 
                                   AutoGenerateColumns="False" DataKeyNames="OCId" Font-Names="Arial" ForeColor="Black" ShowHeader="False" GridLines="None">
                                   <Columns>
                                       <asp:TemplateField HeaderText="From" SortExpression="FromTime">                                    
                                           <ItemTemplate>
                                               <asp:Label ID="Label1" runat="server" Text='<%# Bind("FromTime", "{0:t}") %>'></asp:Label>
                                           </ItemTemplate>
                                       </asp:TemplateField>
                                   </Columns>
                               </asp:GridView>
                               <asp:ObjectDataSource ID="DsInsideGridFromTime" runat="server" 
                                   OldValuesParameterFormatString="original_{0}" SelectMethod="GetOffCapHrsByTerm" 
                                   TypeName="OffCampusBll">
                                   <SelectParameters>
                                       <asp:ControlParameter ControlID="HiddenField2" Name="OcId" PropertyName="Value" 
                                           Type="Int32" />
                                   </SelectParameters>
                               </asp:ObjectDataSource>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="To" SortExpression="ToTime">                     
                           <FooterTemplate><%#GetOffCampusHoursTotalFormat()%></FooterTemplate>
                           <ItemTemplate>
                           <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Eval("OCId") %>' />
                               <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                                   DataKeyNames="OCId" DataSourceID="DsInsideGridToTime" ShowHeader="false" GridLines="None" Font-Names="Arial" ForeColor="Black" >
                                   <Columns>
                                       <asp:TemplateField HeaderText="To" SortExpression="ToTime">

                                           <ItemTemplate>
                                               <asp:Label ID="Label1" runat="server" Text='<%# Bind("ToTime", "{0:t}") %>'></asp:Label>
                                           </ItemTemplate>
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Total" SortExpression="Total" Visible="False">
                                     
                                           <ItemTemplate>
                                                <%#GetTotalOffCampusHours(long.Parse(Convert.ToString(Eval("Total"))))%>
                                           </ItemTemplate>
                                       </asp:TemplateField>
                                   </Columns>
                               </asp:GridView>
                               <asp:ObjectDataSource ID="DsInsideGridToTime" runat="server" 
                                   OldValuesParameterFormatString="original_{0}" SelectMethod="GetOffCapHrsByTerm" 
                                   TypeName="OffCampusBll">
                                   <SelectParameters>
                                       <asp:ControlParameter ControlID="HiddenField3" Name="OcId" PropertyName="Value" 
                                           Type="Int32" />
                                   </SelectParameters>
                               </asp:ObjectDataSource>
                           </ItemTemplate>
                       </asp:TemplateField>
                       
                   </Columns>
                    <EmptyDataTemplate>
                               <div>
                                   No Records Found
                               </div>
                           </EmptyDataTemplate>
               </asp:GridView>
               <asp:ObjectDataSource ID="DsOffCampus" runat="server" 
                   OldValuesParameterFormatString="original_{0}" SelectMethod="GetOffcampusByTerm" 
                   TypeName="DeanDSTableAdapters.OffCampusTableAdapter">
                     <SelectParameters>
                            <asp:Parameter Name="termid"/>
                            <asp:Parameter Name="facultyid"/>
                        </SelectParameters>
               </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td class="style27">
                    &nbsp;</td>
            </tr> 
        </table>
        <hr />
            </ItemTemplate>
        </asp:Repeater>
                     
    </asp:Panel>
 
    </form>
    
</body>
</html>
