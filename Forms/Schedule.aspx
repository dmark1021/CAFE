<%@ Page Language="C#" MasterPageFile="~/master/AfterLogin.master" AutoEventWireup="true" CodeFile="Schedule.aspx.cs" Inherits="Forms_Schedule" Title="CAFE - Faculty Schedule" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" Runat="Server">
  
    <style type="text/css">
        .modalBackground 
        {
            background-color:Gray;
	        filter:alpha(opacity=70);
	        opacity:0.7;
        }
        
        .collapsePanel      
        {                   
           margin-right: 0px;      
        }
     
        .label   
        {   
            white-space: nowrap;   
        }   
    
    </style>
   
   
  
    <%--Changed Width from 695px and added style property so that schedule not "cut off".  Dec. 2009 TAN--%>
 <table>
   
   <table>
 <tr>
        <td align ="left">
      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
         <ContentTemplate>
         <asp:Label ID="lblTerm" runat="server" Text="" >Term:</asp:Label>
         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                DataSourceID="DsTerm" DataTextField="Semyear" DataValueField="TermID" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged" ondatabound="DropDownList1_DataBound" >
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
   
   <td align="left">
       <asp:UpdatePanel ID="UpdatePanelsubmitlink" runat="server">
       <ContentTemplate>
          
           <asp:Button ID="ButtonApprove" runat="server" Text="Approve" SkinID="AspButton" 
               oncommand="ButtonApprove_Command"/>&nbsp;
           <asp:Button ID="ButtonDecline" runat="server" Text="Decline" SkinID="AspButton" 
               oncommand="ButtonDecline_Command" />&nbsp;
           <asp:Button ID="ButtonSubmitChair" runat="server" Text="Submit Schedule to Chair" 
               SkinID="AspButton" onclick="ButtonSubmitChair_Click"/>
           <asp:Button ID="ButtonSave" runat="server" Text="Save Comments" 
               oncommand="ButtonSave_Command" SkinID="AspButton"/>&nbsp;
           <asp:Button ID="ButtonPrintSchedule" runat="server" Text="Print Schedule" 
               SkinID="AspButton" oncommand="ButtonPrintSchedule_Command" Width="93px" />&nbsp;
           <asp:Button ID="ButtonPrintDoorSchedule" runat="server" Text="Print Door Schedule" 
                SkinID ="AspButton" OnCommand="ButtonPrintDoorSchedule_Command" />&nbsp;
           <asp:Button ID="ButtonExitInbox" runat="server" Text="Back to Inbox" 
               oncommand="ButtonExitInbox_Command" SkinID="AspButton" />
            </ContentTemplate>
            </asp:UpdatePanel>
         
        <br />    
      
           <asp:Panel ID="titlePanel" runat="server" CssClass="collapsePanelHeader">
               <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/expand_blue.jpg" />&nbsp;&nbsp;
               <asp:Label ID="Label2" runat="server" Text="Summary"></asp:Label></asp:Panel>
               <asp:Panel ID="panelsummary" runat="server" CssClass="collapsePanel" 
               Width="100%" Wrap="False">
               <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                   <ContentTemplate>
                       <%--Changed Width from 695px and added style property so that schedule not "cut off".  Dec. 2009 TAN--%>
                       <asp:DetailsView ID="DetailsViewMainSchedule" runat="server" 
                           AutoGenerateRows="False" DataKeyNames="MSId" DataSourceID="DsMainSchedule" 
                           Height="50px" onitemcommand="DetailsViewMainSchedule_ItemCommand" 
                           SkinID="DetailsView" Width="80%" style="margin-right: 0px">
                           <RowStyle Wrap="False" />
                           <EmptyDataTemplate>
                               <div style="color: #800000; font-family: Arial, Helvetica, sans-serif">
                                   <table width="100%">
                                       <tr>
                                           <td align="center">
                                               <b>Schedule has not yet created</b>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td align="center">
                                               <asp:LinkButton ID="LinkButtonNew" runat="server" CommandArgument="new" 
                                                   CommandName="select"><em>Click here</em></asp:LinkButton>,&nbsp;<b><asp:Label ID="Label7" runat="server" Text="Label">to create new schedule</asp:Label></b></td></tr></table></div></EmptyDataTemplate><Fields>
                               <asp:TemplateField HeaderText="Status:" SortExpression="FormattedStatus" 
                                InsertVisible="False" HeaderStyle-HorizontalAlign="Left">
                                   <ItemTemplate>
                                       <asp:Label ID="Label4" runat="server" Text='<%# Bind("FormattedStatus") %>' ></asp:Label></ItemTemplate><EditItemTemplate>
                                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("FormattedStatus") %>' ></asp:Label></EditItemTemplate><HeaderStyle HorizontalAlign="Left" />
                             
                             
                             
                             
                             
                             
                             
                                   <ItemStyle Wrap="False" />
                               </asp:TemplateField>
                               
                               
                               
                               
                               
                               <asp:TemplateField ShowHeader="False">
                                   <ItemTemplate>
                                       <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="False" 
                                           CommandName="Edit" Text="Edit" Visible="<%# GetEditStatus() %>"></asp:LinkButton></ItemTemplate><EditItemTemplate>
                                       <asp:LinkButton ID="LinkButtonSave" runat="server" CausesValidation="True" 
                                           CommandName="Update" Text="Save"></asp:LinkButton>&nbsp;<asp:LinkButton ID="LinkButtonCancel" runat="server" CausesValidation="False" 
                                           CommandName="Cancel" Text="Cancel"></asp:LinkButton></EditItemTemplate><InsertItemTemplate>
                                       <asp:LinkButton ID="LinkButtonInsert" runat="server" CausesValidation="True" 
                                           CommandName="Insert" Text="Insert" onclick="LinkButtonInsert_Click"></asp:LinkButton>&nbsp;<asp:LinkButton ID="LinkButtoncancel" runat="server" CausesValidation="False" 
                                           CommandName="Cancel" Text="Cancel"></asp:LinkButton></InsertItemTemplate></asp:TemplateField>
                               
                               
                               
                               
                               
                              <asp:TemplateField HeaderText="Total Overload Credits Hours:" 
                                   SortExpression="OverloadCredits" HeaderStyle-HorizontalAlign="Left">
                                   <EditItemTemplate>     
                                   <asp:Label ID="LabelOC" runat="server" Text='<%# Bind("OverloadCredits") %>' Visible="false"></asp:Label><asp:TextBox ID="TextBoxOC" runat="server" Text='<%# Bind("OverloadCredits") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                       <asp:TextBox ID="TextBoxOverloadI" runat="server" Text='<%# Bind("OverloadCredits") %>'></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                       <asp:Label ID="Label5" runat="server" Text='<%# Bind("OverloadCredits") %>'></asp:Label></ItemTemplate><HeaderStyle HorizontalAlign="Left" />
                               </asp:TemplateField>
                              <asp:TemplateField HeaderText="Total Release Time Hours:" 
                                   SortExpression="ReleaseTime" HeaderStyle-HorizontalAlign="Left">
                                   <EditItemTemplate>
                                   <asp:Label ID="LabelRT" runat="server" Text='<%# Bind("ReleaseTime") %>' Visible="false"></asp:Label><asp:TextBox ID="TextBoxRT" runat="server" Text='<%# Bind("ReleaseTime") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                       <asp:TextBox ID="TextBoxRelTim" runat="server" Text='<%# Bind("ReleaseTime") %>'></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                       <asp:Label ID="Label6" runat="server" Text='<%# Bind("ReleaseTime") %>'></asp:Label></ItemTemplate><HeaderStyle HorizontalAlign="Left" />
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Credits of Extra Compensation:" SortExpression="Compensation" 
                                HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="150px">
                                   <EditItemTemplate>
                                    <asp:Label ID="LabelCom" runat="server" Text='<%# Bind("Compensation") %>' Visible="false"></asp:Label><asp:TextBox ID="TextBoxCom" runat="server" Text='<%# Bind("Compensation") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                       <asp:TextBox ID="TextBoxC" runat="server" Text='<%# Bind("Compensation") %>'></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                       <asp:Label ID="Label7" runat="server" Text='<%# Bind("Compensation")%>'></asp:Label></ItemTemplate><HeaderStyle HorizontalAlign="Left" />
                                  
                                   <ItemStyle Width="150px" />
                                  
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Faculty Comments:" 
                                   SortExpression="FacultyComments" HeaderStyle-HorizontalAlign="Left">
                                   <ItemTemplate>
                                       <asp:TextBox ID="TextBoxFCItem" runat="server" ReadOnly='True' 
                                           Text='<%# Bind("FacultyComments") %>' Rows="4" TextMode="MultiLine" Columns="60"></asp:TextBox></ItemTemplate><EditItemTemplate>
                                       <asp:TextBox ID="TextBoxFC" runat="server" ReadOnly='<%# Session["FC"] %>' 
                                           Text='<%# Bind("FacultyComments") %>' Rows="4" TextMode="MultiLine" Columns="60"></asp:TextBox></EditItemTemplate><InsertItemTemplate>                                   
                                       <asp:TextBox ID="TextBoxFCI" runat="server" Text='<%# Bind("FacultyComments") %>' ReadOnly='<%# Session["FC"] %>'></asp:TextBox></InsertItemTemplate><HeaderStyle HorizontalAlign="Left" />
                               </asp:TemplateField>
                              <asp:TemplateField HeaderText="Chair Comments:" SortExpression="ChairComments" HeaderStyle-HorizontalAlign="Left">
                                   <ItemTemplate>
                                        <asp:TextBox ID="TextBoxCCItem" runat="server" ReadOnly='true' 
                                           Text='<%# Bind("ChairComments") %>' Rows="4" TextMode="MultiLine" Columns="60"></asp:TextBox></ItemTemplate><EditItemTemplate>
                                       <asp:TextBox ID="TextBoxCC" runat="server" ReadOnly='<%# Session["CC"] %>' 
                                           Text='<%# Bind("ChairComments") %>' Rows="4" TextMode="MultiLine" Columns="60"></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                      <asp:TextBox ID="TextBoxCCI" runat="server" Text='<%# Bind("ChairComments") %>' ReadOnly='<%# Session["CC"] %>' 
                                      Rows="3" TextMode="MultiLine" Width="300px"></asp:TextBox></InsertItemTemplate><HeaderStyle HorizontalAlign="Left" />
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Dean Comments:" SortExpression="DeanComments" HeaderStyle-HorizontalAlign="Left">
                                   <ItemTemplate>
                                       <asp:TextBox ID="TextBoxDCItem" runat="server" ReadOnly='True' 
                                           Text='<%# Bind("DeanComments") %>' Rows="4" TextMode="MultiLine" Columns="60"></asp:TextBox></ItemTemplate><EditItemTemplate>
                                       <asp:TextBox ID="TextBoxDC" runat="server" ReadOnly='<%# Session["DC"] %>' 
                                           Text='<%# Bind("DeanComments") %>' Rows="4" TextMode="MultiLine" Columns="60"></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                   
                                       <asp:TextBox ID="TextBoxDCI" runat="server" Text='<%# Bind("DeanComments") %>' ReadOnly='<%# Session["DC"] %>'></asp:TextBox></InsertItemTemplate><HeaderStyle HorizontalAlign="Left" />
                               </asp:TemplateField>
                               </Fields></asp:DetailsView></ContentTemplate></asp:UpdatePanel></asp:Panel>
                               <asp:ObjectDataSource ID="DsMainSchedule" runat="server" OldValuesParameterFormatString="original_{0}"
               SelectMethod="GetMainSchedByFac" TypeName="MainScheduleBll" 
               UpdateMethod="UpdateMainSchedule">
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
                   <asp:SessionParameter DefaultValue="" Name="TermID" SessionField="TermId" 
                       Type="Int32" />
                   <asp:SessionParameter DefaultValue="" Name="FacultyID" SessionField="FacId" 
                       Type="Int32" />
               </SelectParameters>
           </asp:ObjectDataSource>
      
        <br />
         
        </td>
        
   </tr>
   <tr>
       <td> 
           <asp:Panel ID="panTeachingTitle" runat="server" CssClass="collapsePanelHeaderinbox">
               <asp:Image ID="teachingImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" />
               &nbsp;&nbsp;
               <asp:Label ID="Label4" runat="server" Text="Teaching Schedule"></asp:Label></asp:Panel>
               <asp:Panel ID="PanTeaching" runat="server" CssClass="collapsePanelinbox" Width="100%">
         <asp:UpdatePanel ID="UpdatePanelTeaching" runat="server" UpdateMode="Conditional">
                 <ContentTemplate> 
                        
        <asp:GridView ID="GvTeachingSchedule" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="ScheduleID" DataSourceID="DsSchedule" 
                   SkinID="GridView" ShowFooter="true"
                         onselectedindexchanged="GvTeachingSchedule_SelectedIndexChanged" 
                         Width="80%" 
                         AlternatingRowStyle-BackColor="#8C0000">
                   <Columns>
                       <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />       
                <asp:BoundField DataField="CourseCode" HeaderText="Code" 
                    SortExpression="CourseCode" />
                <asp:BoundField DataField="CourseTitle" FooterText="Total:" HeaderText="Title" 
                    SortExpression="CourseTitle" />
                       <%--<asp:BoundField DataField="TeachingCredits" HeaderText="T Credits" 
                           SortExpression="TeachingCredits" />--%>
                           <asp:TemplateField HeaderText="T Credits" FooterStyle-Font-Bold="True">
                                <ItemTemplate>
                                        <%# GetTeachingCredits(decimal.Parse(Eval("TeachingCredits").ToString())).ToString("N2")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server" 
                                      Text='<%#Bind("TeachingCredits") %>'></asp:TextBox></EditItemTemplate>     
                                      
                                <FooterTemplate>
                                        <%# GetTotalTeachingCredits().ToString("N2") %>
                                </FooterTemplate>
                        </asp:TemplateField>
                      <%-- <asp:BoundField DataField="StudentCredits" HeaderText="S Credits" 
                           SortExpression="StudentCredits" />--%>
                           <asp:TemplateField HeaderText="S Credits" FooterStyle-Font-Bold="True">
                                <ItemTemplate>
                                        <%# GetStudentCredits(decimal.Parse(Eval("StudentCredits").ToString())).ToString("N2")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                  <asp:TextBox ID="TextBox3" runat="server" 
                                      Text='<%#Bind("StudentCredits") %>'></asp:TextBox></EditItemTemplate>     
                                <FooterTemplate>
                                        <%# GetTotalStudentCredits().ToString("N2") %>
                                </FooterTemplate>
                        </asp:TemplateField>
                       <asp:BoundField DataField="Location" HeaderText="Location" 
                           SortExpression="Location" />
                <asp:CheckBoxField DataField="TeamTaught" HeaderText="Team Taught" 
                    SortExpression="TeamTaught" />
                <asp:BoundField DataField="MeetingDays" HeaderText="Meeting Days" 
                    SortExpression="MeetingDays" />
                <asp:BoundField DataField="StartTime" HeaderText="Start" 
                    SortExpression="StartTime" />
                <asp:BoundField DataField="EndTime" HeaderText="End" 
                    SortExpression="EndTime" />
                
            </Columns>
         <EmptyDataTemplate>
                               <div style="color: #800000; font-family: Arial, Helvetica, sans-serif">
                                   <table width="90%">
                                       <tr>
                                           <td align="center">
                                               <b>Schedule has not yet created</b>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td align="center">
                                               <asp:LinkButton ID="LinkButtonTeachingNew" runat="server" CommandArgument="new" 
                                                   onclick="LinkButtonTeachingNew_Click"><em>Click here</em></asp:LinkButton>,&nbsp;<b><asp:Label ID="Label7" runat="server" Text="Label">to create new schedule</asp:Label></b></td></tr></table></div></EmptyDataTemplate><AlternatingRowStyle BackColor="#FFFF5B" />
                   </asp:GridView>                          
                     
         
                         <asp:LinkButton ID="LinkButtonTeaching" runat="server" 
                         onclick="LinkButtonTeachingNew_Click" >Add New Teaching Schedule</asp:LinkButton>
                         
                         
                         
                        <div align="right" 
                         style="width: 757px; top: 970px; left: 476px; height: 26px">
                             <asp:Label ID="lblMsg" runat="server" Font-Bold="True" EnableViewState="False" ForeColor="#FF0066"></asp:Label>
                     <%-- %><asp:Button ID="btnCopyTeachingHours" runat="server" 
                         style="top: 951px; left: 194px; height: 26px; width: 159px; margin-bottom: 0px;" 
                                 Text="Copy to Current Semester" Height="17px" SkinID="AspButton" 
                                 Width="154px" onclick="btnCopyTeachingSchedule" />/>--%>
                         </div>
                 
                         
                         
                         </ContentTemplate></asp:UpdatePanel></asp:Panel>
                         <asp:ObjectDataSource ID="DsSchedule" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetScheduleByTerm" 
            TypeName="ScheduleBll" DeleteMethod="DeleteSchedule" 
           InsertMethod="InsertSchedule" UpdateMethod="UpdateSchedule">
            <DeleteParameters>
                <asp:Parameter Name="Original_ScheduleID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="coursecode" Type="String" />
                <asp:Parameter Name="coursetitle" Type="String" />
                <asp:Parameter Name="teachingcredits" Type="Decimal" />
                <asp:Parameter Name="studentcredits" Type="Int16" />
                <asp:Parameter Name="location" Type="String" />
                <asp:Parameter Name="teamtaught" Type="Boolean" />
                <asp:Parameter Name="meetingdays" Type="String" />
                <asp:Parameter Name="starttime" Type="String" />
                <asp:Parameter Name="endtime" Type="String" />
                <asp:Parameter Name="Original_ScheduleID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="TermID" SessionField="TermId" 
                    Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="FacultyID" SessionField="FacId" 
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="facultyid" Type="Int32" />
                <asp:Parameter Name="termid" Type="Int32" />
                <asp:Parameter Name="coursecode" Type="String" />
                <asp:Parameter Name="coursetitle" Type="String" />
                <asp:Parameter Name="stc" Type="String" />
                <asp:Parameter Name="ssc" Type="String" />
                <asp:Parameter Name="location" Type="String" />
                <asp:Parameter Name="tt" Type="Boolean" />
                <asp:Parameter Name="meetingdays" Type="String" />
                <asp:Parameter Name="starttime" Type="String" />
                <asp:Parameter Name="endtime" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
           
           
           
           
           <asp:Panel ID="panResearchTitle" runat="server" CssClass="collapsePanelHeaderinbox">
               <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/expand_blue.jpg" />
               &nbsp;&nbsp;
               <asp:Label ID="Label9" runat="server" Text="Research/Special Appointment Schedule"></asp:Label></asp:Panel>
               <asp:Panel ID="PanResearch" runat="server" CssClass="collapsePanelinbox" Width="100%">
         <asp:UpdatePanel ID="UpdatePanelResearch" runat="server" UpdateMode="Conditional">
                 <ContentTemplate> 
                          
         
                 <%--Changed the width from 95% and removed the HorizontalAlign property so that schedule not "cut off". Dec 2009 TAN--%>            
        <asp:GridView ID="GvResearchSchedule" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="ScheduleID" DataSourceID="DsResearchSchedule" 
                   SkinID="GridView" ShowFooter="true"
                         onselectedindexchanged="GvResearchSchedule_SelectedIndexChanged" 
                         Width="80%" 
                         AlternatingRowStyle-BackColor="#8C0000">
                   <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />       
                <asp:BoundField DataField="CourseCode" HeaderText="Code" 
                    SortExpression="CourseCode" />
                <asp:BoundField DataField="CourseTitle" FooterText="Total:" HeaderText="Title" 
                    SortExpression="CourseTitle" />
                       <%--<asp:BoundField DataField="TeachingCredits" HeaderText="T Credits" 
                           SortExpression="TeachingCredits" />--%>
                           <asp:TemplateField HeaderText="T Credits" FooterStyle-Font-Bold="True">
                                <ItemTemplate>
                                        <%# GetResearchTeachingCredits(decimal.Parse(Eval("TeachingCredits").ToString())).ToString("N2")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                  <asp:TextBox ID="ResearchTextBox" runat="server" 
                                      Text='<%#Bind("TeachingCredits") %>'></asp:TextBox></EditItemTemplate>     
                                      
                                <FooterTemplate>
                                        <%# GetTotalResearchTeachingCredits().ToString("N2")%>
                                </FooterTemplate>
                        </asp:TemplateField>
                       <%--<asp:BoundField DataField="StudentCredits" HeaderText="S Credits" 
                           SortExpression="StudentCredits" />--%>
                           <asp:TemplateField HeaderText="T Credits" FooterStyle-Font-Bold="True">
                                <ItemTemplate>
                                        <%# GetResearchStudentCredits(decimal.Parse(Eval("StudentCredits").ToString())).ToString("N2")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server" 
                                      Text='<%#Bind("StudentCredits") %>'></asp:TextBox></EditItemTemplate>     
                                      
                                <FooterTemplate>
                                        <%# GetTotalResearchStudentCredits().ToString("N2")%>
                                </FooterTemplate>
                        </asp:TemplateField>
                       <asp:BoundField DataField="Location" HeaderText="Location" 
                           SortExpression="Location" />
                <asp:CheckBoxField DataField="TeamTaught" HeaderText="Team Taught" 
                    SortExpression="TeamTaught" />
                <asp:BoundField DataField="MeetingDays" HeaderText="Meeting Days" 
                    SortExpression="MeetingDays" />
                <asp:BoundField DataField="StartTime" HeaderText="Start" 
                    SortExpression="StartTime" />
                <asp:BoundField DataField="EndTime" HeaderText="End" 
                    SortExpression="EndTime" />
            </Columns>
         <EmptyDataTemplate>
                               <div style="color: #800000; font-family: Arial, Helvetica, sans-serif">
                                   <table width="90%">
                                       <tr>
                                           <td align="center">
                                               <b>Schedule has not yet created</b>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td align="center">
                                               <asp:LinkButton ID="LinkButtonResearchNew" runat="server" CommandArgument="new" 
                                                   onclick="LinkButtonResearchNew_Click"><em>Click here</em></asp:LinkButton>,&nbsp;<b><asp:Label ID="Label7" runat="server" Text="Label">to create new schedule</asp:Label></b></td></tr></table></div></EmptyDataTemplate><AlternatingRowStyle BackColor="#FFFF5B" />
                   </asp:GridView>
                     
                     
                         <asp:LinkButton ID="LinkButtonResearch" runat="server" 
                         onclick="LinkButtonResearchNew_Click" >Add New Research Schedule</asp:LinkButton>
                         
                         
                       <div align="right" 
    style="width: 757px; top: 970px; left: 476px; height: 26px">
                    <asp:Label ID="lblMsg2" runat="server" Font-Bold="True" EnableViewState="false" ForeColor="#FF0066"></asp:Label>
             
                     <%-- <asp:Button ID="Button2" runat="server" 
                         style="top: 951px; left: 194px; height: 26px; width: 159px; margin-bottom: 0px;" 
                                 Text="Copy to Current Semester" Height="17px" SkinID="AspButton" 
                                 Width="154px" onclick="Button2_Click" />/>--%>
                         </div>
                         
                         
                         </ContentTemplate></asp:UpdatePanel></asp:Panel>
           <asp:ObjectDataSource ID="DsResearchSchedule" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetResearchScheduleByTerm" 
            TypeName="ScheduleBll" DeleteMethod="DeleteResearchSchedule" 
           InsertMethod="InsertResearchSchedule" UpdateMethod="UpdateResearchSchedule">
            <DeleteParameters>
                <asp:Parameter Name="Original_ScheduleID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="coursecode" Type="String" />
                <asp:Parameter Name="coursetitle" Type="String" />
                <asp:Parameter Name="teachingcredits" Type="Decimal" />
                <asp:Parameter Name="studentcredits" Type="Int16" />
                <asp:Parameter Name="location" Type="String" />
                <asp:Parameter Name="teamtaught" Type="Boolean" />
                <asp:Parameter Name="meetingdays" Type="String" />
                <asp:Parameter Name="starttime" Type="String" />
                <asp:Parameter Name="endtime" Type="String" />
                <asp:Parameter Name="Original_ScheduleID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="TermID" SessionField="TermId" 
                    Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="FacultyID" SessionField="FacId" 
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="facultyid" Type="Int32" />
                <asp:Parameter Name="termid" Type="Int32" />
                <asp:Parameter Name="coursecode" Type="String" />
                <asp:Parameter Name="coursetitle" Type="String" />
                <asp:Parameter Name="stc" Type="String" />
                <asp:Parameter Name="ssc" Type="String" />
                <asp:Parameter Name="location" Type="String" />
                <asp:Parameter Name="tt" Type="Boolean" />
                <asp:Parameter Name="meetingdays" Type="String" />
                <asp:Parameter Name="starttime" Type="String" />
                <asp:Parameter Name="endtime" Type="String" />
                <asp:Parameter Name="type" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
           
           
           
           
           
           
           
           
           
           
           <asp:Panel ID="panOfficehoursTitle" runat="server" CssClass="collapsePanelHeader">
               <asp:Image ID="officehoursImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" />
               &nbsp;&nbsp;
               <asp:Label ID="Label3" runat="server" Text="Office Hours"></asp:Label></asp:Panel>
           <asp:Panel ID="panOfficehours" runat="server" CssClass="collapsePanel">
               <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                 <ContentTemplate>
                 <div style="overflow: auto;">  
                     <asp:GridView ID="OfficeHoursGridView" runat="server" 
                         AutoGenerateColumns="False" DataKeyNames="OHId" DataSourceID="DsOfficeHours" 
                         EnableViewState="False" ShowFooter="True" SkinID="GridView" width="90%" 
                         AllowSorting="True">
                         <Columns>
                             <asp:TemplateField ShowHeader="False">
                                 <ItemTemplate>
                                     <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                         CommandName="Edit" Text="Edit" Visible="<%# GetEditStatus() %>"></asp:LinkButton>&nbsp;<asp:LinkButton ID="OfficeHoursDeleteBtn" runat="server" CausesValidation="False" 
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
                                             <asp:LinkButton ID="LinkButtonOHNew" runat="server" CommandArgument="new" Visible="<%# GetEditStatus() %>"
                                                 oncommand="LinkButtonInsertnewOH_Command"><em>Click here</em></asp:LinkButton>,&nbsp;<b><asp:Label ID="Label7" runat="server" Text="Label" Visible="<%# GetEditStatus() %>">to create new schedule</asp:Label></b></td></tr></table></div></EmptyDataTemplate></asp:GridView><asp:LinkButton ID="LinkButtonInsertnewOH" runat="server" 
                         oncommand="LinkButtonInsertnewOH_Command" Visible="<%# GetEditStatus() %>">Add New Office Hours</asp:LinkButton>
                         
                         
                         <div align="left" 
    style="width: 757px; top: 970px; left: 476px; height: 26px">
                     <asp:LinkButton ID="btnCopyOfficeHours" runat="server" 
                         style="top: 951px; left: 194px; height: 26px; width: 200px; margin-bottom: 0px;" 
                                 Text="Copy From Previous Semester" Height="17px" SkinID="AspButton" 
                                 Width="154px" OnClick="btnCopyOfficeHours_Click" />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:LinkButton ID="btnRefreshTotalHours" runat="server" 
                         style="top: 951px; left: 194px; height: 26px; width: 300px; margin-bottom: 0px;" 
                                 Text="Click To Refresh Total Hours After Delete" Height="17px" SkinID="AspButton" 
                                 Width="154px" OnClick="btnRefreshTotalHours_Click" />
                         </div>
                         
                         
                         
                         
                         </ContentTemplate></asp:UpdatePanel></asp:Panel>
           <asp:ObjectDataSource ID="DsTimePicker" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetTimePickerTimes" 
            TypeName="TimePickerBll">
        </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="DsOfficeHours" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetOfHrByfac" 
        TypeName="OfficeHoursBLL" UpdateMethod="UpdateOfficeHours" 
            InsertMethod="InsertOfficeHrs" DeleteMethod="DeleteOfficeHours">
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
           <asp:Panel ID="panOffCampusTitle" runat="server" CssClass="collapsePanelHeader">
               <asp:Image ID="OffCampusImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" />
               &nbsp;&nbsp;
               <asp:Label ID="Label5" runat="server" Text="Off Campus Activities"></asp:Label>
               /Special Appointment</asp:Panel><asp:Panel ID="panOffCampus" runat="server" CssClass="collapsePanel">
               <asp:UpdatePanel ID="UpdatePaneloffcamp" runat="server" UpdateMode="Conditional">
              <ContentTemplate>
              <div style="overflow: auto;">  
                  <%--Changed the width from 80%. Dec 2009 TAN--%>
                  <asp:GridView ID="GridViewOffCampus" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="OCId" DataSourceID="DsOffCampus" 
                      onselectedindexchanged="GridViewOffCampus_SelectedIndexChanged" 
                      ShowFooter="True" SkinID="GridView" width="90%">
                      <Columns>
                          <asp:BoundField DataField="Activity" HeaderText="Activity" 
                              SortExpression="Activity" />
                          <asp:BoundField DataField="Organization" HeaderText="Organization" 
                              SortExpression="Organization" />
                          <asp:TemplateField HeaderText="Day" SortExpression="Day">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Day") %>'></asp:TextBox></EditItemTemplate>
                                  <ItemTemplate>
                                  <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("OCId") %>' />
                                  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                      DataKeyNames="OCId" DataSourceID="DsInsideGridDay" SkinID="InsideGridView">
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
                          <asp:TemplateField FooterText="Total" HeaderText="From" 
                              SortExpression="FromTime">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server" 
                                      Text='<%# Bind("FromTime", "{0:t}") %>'></asp:TextBox></EditItemTemplate><FooterTemplate>
                                  <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="#990000" 
                                      Text="Total:"></asp:Label></FooterTemplate><ItemTemplate>
                                  <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("OCId") %>' />
                                  <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                                      DataKeyNames="OCId" DataSourceID="DsInsideGridFromTime" SkinID="InsideGridView">
                                      <Columns>
                                          <asp:TemplateField HeaderText="From" SortExpression="FromTime">
                                              <EditItemTemplate>
                                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FromTime") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                                                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("FromTime", "{0:t}") %>'></asp:Label></ItemTemplate></asp:TemplateField></Columns></asp:GridView><asp:ObjectDataSource ID="DsInsideGridFromTime" runat="server" 
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
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ToTime", "{0:t}") %>'></asp:TextBox></EditItemTemplate><FooterTemplate>
                                  <%#GetOffCampusHoursTotalFormat()%></FooterTemplate><ItemTemplate>
                                  <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Eval("OCId") %>' />
                                  <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                                      DataKeyNames="OCId" DataSourceID="DsInsideGridToTime" SkinID="InsideGridView">
                                      <Columns>
                                          <asp:TemplateField HeaderText="To" SortExpression="ToTime">
                                              <EditItemTemplate>
                                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ToTime") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                                                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("ToTime", "{0:t}") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Total" SortExpression="Total" Visible="False">
                                              <ItemTemplate>
                                                  <%#GetTotalOffCampusHours(long.Parse(Convert.ToString(Eval("Total"))))%></ItemTemplate></asp:TemplateField></Columns></asp:GridView>
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
                          <asp:TemplateField>
                              <ItemTemplate>
                                    <%--Added the visible property so that user can't edit if the Dean has approved. Dec 2009 TAN--%>
                                  <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandName="Select" Visible="<%# GetEditStatus() %>">
                                          Add Hours</asp:LinkButton></ItemTemplate></asp:TemplateField></Columns><EmptyDataTemplate>
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
                                          <%--Added the visible property (twice) so that user can't edit if the Dean has approved. Dec 2009 TAN--%>
                                          <asp:LinkButton ID="LinkButtonNew" runat="server" CommandArgument="new" Visible="<%# GetEditStatus() %>"
                                              onclick="LinkButtonPopOrg_Click"><em>Click here</em></asp:LinkButton>,&nbsp;<b><asp:Label ID="Label7" runat="server" Text="Label" Visible="<%# GetEditStatus() %>">to create new schedule</asp:Label></b></td></tr></table></div></EmptyDataTemplate></asp:GridView>
                                              
                  <asp:ObjectDataSource ID="DsOffCampus" runat="server" 
                      OldValuesParameterFormatString="original_{0}" SelectMethod="GetOffcampusByTerm" 
                      TypeName="DeanDSTableAdapters.OffCampusTableAdapter">
                      <SelectParameters>
                          <asp:SessionParameter DefaultValue="" Name="FacultyID" SessionField="FacId" 
                              Type="Int32" />
                          <asp:SessionParameter DefaultValue="" Name="TermID" SessionField="TermId" 
                              Type="Int32" />
                      </SelectParameters>
                  </asp:ObjectDataSource>
                <asp:LinkButton ID="LinkButtonPopOrg" runat="server" 
        onclick="LinkButtonPopOrg_Click" Visible="<%# GetEditStatus() %>">Add/Edit/Delete Organization</asp:LinkButton></ContentTemplate></asp:UpdatePanel></asp:Panel>
    
    <asp:ObjectDataSource ID="DsOHPopup" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetOfHrByfac" 
        TypeName="OfficeHoursBLL" UpdateMethod="UpdateOfficeHours">
        <UpdateParameters>
            <asp:Parameter Name="Day" Type="String" />
            <asp:Parameter Name="FromTime" Type="String" />
            <asp:Parameter Name="ToTime" Type="String" />
            <asp:Parameter Name="Original_OHId" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter Name="FacultyID" SessionField="FacId" Type="Int32" />
            <asp:SessionParameter Name="TermID" SessionField="TermId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    
       
    <asp:ObjectDataSource ID="DsOpupTeachingHrs" runat="server" 
        DeleteMethod="DeleteTeachScheTimings" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetTeachScheTimingsByTerm" TypeName="TeachSchimingsBll" 
        UpdateMethod="UpdateTeachSchTimings">
        <DeleteParameters>
            <asp:Parameter Name="Original_TSTId" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="day" Type="String" />
            <asp:Parameter Name="fromtime" Type="DateTime" />
            <asp:Parameter Name="totime" Type="DateTime" />
            <asp:Parameter Name="Original_TSTId" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter Name="ScheduleID" SessionField="ScheduleID" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
      
    
    <asp:ObjectDataSource ID="DsPopUpteachingSche" runat="server" 
        InsertMethod="InsertSchedule" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetSchedule" TypeName="ScheduleBll">
        <InsertParameters>
            <asp:Parameter Name="facultyid" Type="Int32" />
            <asp:Parameter Name="termid" Type="Int32" />
            <asp:Parameter Name="coursecode" Type="String" />
            <asp:Parameter Name="coursetitle" Type="String" />
            <asp:Parameter Name="section" Type="String" />
            <asp:Parameter Name="tc" Type="Int16" />
            <asp:Parameter Name="sc" Type="Int16" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="tt" Type="Boolean" />
            <asp:Parameter Name="otherfaculty" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="DsPopUpResearchSche" runat="server" 
        InsertMethod="InsertResearchSchedule" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetResearchSchedule" TypeName="ScheduleBll">
        <InsertParameters>
            <asp:Parameter Name="facultyid" Type="Int32" />
            <asp:Parameter Name="termid" Type="Int32" />
            <asp:Parameter Name="coursecode" Type="String" />
            <asp:Parameter Name="coursetitle" Type="String" />
            <asp:Parameter Name="section" Type="String" />
            <asp:Parameter Name="tc" Type="Int16" />
            <asp:Parameter Name="sc" Type="Int16" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="tt" Type="Boolean" />
            <asp:Parameter Name="otherfaculty" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    
    
    <asp:ObjectDataSource ID="DsGridviewteachingupdate" runat="server" 
        DeleteMethod="DeleteSchedule" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetScheduleByTerm" TypeName="ScheduleBll" 
        UpdateMethod="UpdateSchedule1">
        <DeleteParameters>
            <asp:Parameter Name="Original_ScheduleID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="coursecode" Type="String" />
            <asp:Parameter Name="coursetitle" Type="String" />
            <asp:Parameter Name="section" Type="String" />
            <asp:Parameter Name="teachingcredits" Type="Decimal" />
            <asp:Parameter Name="studentcredits" Type="Int16" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="teamtaught" Type="Boolean" />
            <asp:Parameter Name="otherfaculty" Type="String" />
            <asp:Parameter Name="Original_ScheduleID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter Name="termid" SessionField="TermId" Type="Int32" />
            <asp:SessionParameter Name="facultyid" SessionField="FacId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="DsGridviewresearchupdate" runat="server" 
        DeleteMethod="DeleteResearchSchedule" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetResearchScheduleByTerm" TypeName="ScheduleBll" 
        UpdateMethod="UpdateSchedule1">
        <DeleteParameters>
            <asp:Parameter Name="Original_ScheduleID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="coursecode" Type="String" />
            <asp:Parameter Name="coursetitle" Type="String" />
            <asp:Parameter Name="section" Type="String" />
            <asp:Parameter Name="teachingcredits" Type="Decimal" />
            <asp:Parameter Name="studentcredits" Type="Int16" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="teamtaught" Type="Boolean" />
            <asp:Parameter Name="otherfaculty" Type="String" />
            <asp:Parameter Name="Original_ScheduleID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter Name="termid" SessionField="TermId" Type="Int32" />
            <asp:SessionParameter Name="facultyid" SessionField="FacId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
           <br />         
          
           <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" TargetControlID="panelsummary"
               CollapseControlID="titlePanel" ExpandControlID="titlePanel" Collapsed="false"
               CollapsedText="Hide" ExpandedText="Hide Details" CollapsedImage="~/Images/expand_blue.jpg"
               ExpandedImage="~/Images/collapse_blue.jpg" SuppressPostBack="true" ImageControlID="Image1" />
           <%--Using Eval instead of Bind. Dec. 2009 TAN--%>
           </td></tr><tr>
   <td>
   <cc1:CollapsiblePanelExtender ID="ColPanExtTeaching" runat="server" TargetControlID="panTeaching"
               CollapseControlID="panTeachingTitle" ExpandControlID="panTeachingTitle" Collapsed="false"
               CollapsedText="Hide" ExpandedText="Hide Details" CollapsedImage="~/Images/expand_blue.jpg"
               ExpandedImage="~/Images/collapse_blue.jpg" SuppressPostBack="true" ImageControlID="teachingImage" />
            
           <%--Changed from TextBox to DropDownList to use the time picker.  Dec. 2009 TAN--%>
           </td></tr><tr>
   <td>
   <cc1:CollapsiblePanelExtender ID="ColPanExtResearch" runat="server" TargetControlID="panResearch"
               CollapseControlID="panResearchTitle" ExpandControlID="panResearchTitle" Collapsed="false"
               CollapsedText="Hide" ExpandedText="Hide Details" CollapsedImage="~/Images/expand_blue.jpg"
               ExpandedImage="~/Images/collapse_blue.jpg" SuppressPostBack="true" ImageControlID="teachingImage" />
            
           <%--Changed from TextBox to DropDownList to use the time picker.  Dec. 2009 TAN--%>
           </td></tr><tr>
    <td>
    <cc1:CollapsiblePanelExtender ID="ColPanelExtOfficeHours" runat="server" TargetControlID="panOfficehours"
               CollapseControlID="panOfficehoursTitle" ExpandControlID="panOfficehoursTitle"
               CollapsedText="Hide" ExpandedText="Hide Details" CollapsedImage="~/Images/expand_blue.jpg"
               ExpandedImage="~/Images/collapse_blue.jpg" SuppressPostBack="true" 
            ImageControlID="officehoursImage" />
            
           <%--Add Validator Dec. 2009 TAN--%>
           </td>
    </tr>
    <tr>
    <td>
        <cc1:CollapsiblePanelExtender ID="ColPanExtOffCampus" runat="server" TargetControlID="panOffCampus"
               CollapseControlID="panOffCampusTitle" ExpandControlID="panOffCampusTitle" Collapsed="false"
               CollapsedText="Hide" ExpandedText="Hide Details" CollapsedImage="~/Images/expand_blue.jpg"
               ExpandedImage="~/Images/collapse_blue.jpg" SuppressPostBack="true" ImageControlID="OffCampusImage" />
           </td></tr></table><asp:Button id="btnShowPopup" runat="server" style="display:none" />
 
 <ajaxtoolkit:modalpopupextender 
			    ID="mdlPopup" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlPopup" 
			     BackgroundCssClass="modalBackground" />
      
            
<asp:Panel ID="pnlPopup" runat="server" Width="700px" style="display:none;" BackColor="White" >
  <asp:UpdatePanel ID="UpdatePanelPopUp" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <table width="90%">
        <tr>
        <td align="center">
        <fieldset>
<legend style="color: #8A170F">Add Hours</legend><table>
<tr>
<td align="left"><asp:Label ID="lblPopupActivity" runat="server" style="color: #8A170F" Text="Activity:" Font-Bold="True" />
<asp:Label ID="lblPopupActivityName" runat="server" /></td>
</tr>
<tr>
<td align="left"><asp:Label ID="lblPopupOrganization" runat="server" style="color: #8A170F" Text="Organization:" Font-Bold="True" />
<asp:Label ID="lblPopupOrganizationName" runat="server" /></td>
</tr>
<tr>
<td align="left">Day</td><td align="left">From</td><td align="left">To</td><td></td>
</tr>
<tr>

<%--For Off Campus Activities Edit Hours Pop up -> Then Add Hours --%>
<td  align="left"><asp:DropDownList ID="DropDownListDayInside" runat="server" >
                        <asp:ListItem>Monday</asp:ListItem><asp:ListItem>Tuesday</asp:ListItem><asp:ListItem>Wednesday</asp:ListItem><asp:ListItem>Thursday</asp:ListItem><asp:ListItem>Friday</asp:ListItem><asp:ListItem>Saturday</asp:ListItem><asp:ListItem>Sunday</asp:ListItem></asp:DropDownList></td><td align="left">
    <%--Changed from TextBox to DropDownList to use the time picker.  Dec. 2009 TAN--%>
    <asp:DropDownList ID="DDLTimeFromInside" runat="server" DataSourceID="DsTimePicker" 
                      DataTextField="Time" DataValueField="Value"> 
    </asp:DropDownList>
</td>
<td align="left">  
    <%--Changed from TextBox to DropDownList to use the time picker.  Dec. 2009 TAN--%>
    <asp:DropDownList ID="DDLTimeToInside" runat="server" DataSourceID="DsTimePicker" 
                      DataTextField="Time" DataValueField="Value">   
    </asp:DropDownList>
</td>

    <td>
        <%--To Add the new Hours--%>
        <asp:Button ID="ButtonADD" runat="server" onclick="ButtonADD_Click" 
                Text="+ ADD" />
    </td>
 <%--  <td>--%>
        <%--To Add the new Hours--%>
  <%--      <asp:Button ID="ButtonCancel" runat="server" onclick="ButtonCancel_Click" --%>
  <%--              Text="Cancel" CausesValidation="False" />--%>
   <%-- </td>--%>

<tr>
    <%--Add time entry validation Nov 2009 TAN --%>
    <td><asp:CompareValidator id="CompareTimeOffCamp" Display="Dynamic" Visible="false" EnableClientScript="true"
            ControlToValidate="DDLTimeFromInside" Operator="LessThan" 
            ControlToCompare="DDLTimeToInside" ErrorMessage="To time must be later than from time" 
            type="Integer" runat="server" Font-Bold="True"></asp:CompareValidator></td></tr></tr></table></fieldset>
        </td>
        </tr>
        
        <%--For EDIT Hours PopUp- Inside the popup - Edit/Delete (Update - Not the add)--%>
        <%--Note:  The Edit part is now invisible because the update function is not currently working. Dec. 2009 TAN--%>
        <tr>
        <td align="center">
            <asp:ObjectDataSource ID="DsPOpUp" runat="server" 
        DeleteMethod="DeleteOffCampHrs" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetOffCapHrsByTerm" TypeName="OffCampusBll" 
        UpdateMethod="UpdateOffCampusHours">    <%--Note: The Update option is not currently displayed because it is not working. Dec. 2009 TAN--%>
        <DeleteParameters>
            <asp:Parameter Name="Original_ochid" Type="Int32" />
        </DeleteParameters>
        <%--Modified Update Parameters to work with time picker dropdown list. Update is not currently working. Nov 2009 TAN--%>
        <UpdateParameters>
            <asp:Parameter Name="day" Type="String" />
            <asp:Parameter Name="fromtime" Type="DateTime" />
            <asp:Parameter Name="totime" Type="DateTime" />
            <asp:Parameter Name="Original_ochid" Type="Int32" />
            <asp:Parameter Name="FromTimeValue" Type="Int16" />         <%--Added Dec. 2009 TAN--%>
            <asp:Parameter Name="ToTimeValue" Type="Int16" />           <%--Added Dec. 2009 TAN--%></UpdateParameters><SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="OCId" SessionField="OCId" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>  
        </td>
        </tr>
        <tr>
        <td align="right">
        <%--Added CausesValidation so could exit out of window even if the hours input are invalid. Dec. 2009 TAN--%>
        <asp:Button ID="ButtonExit" runat="server" Text="Exit" SkinID="AspButton" 
                onclick="ButtonExit_Click" CausesValidation="false"/>
        </td>
        </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Panel>

          <asp:Button id="popuporgbutton" runat="server" style="display:none" />
 <ajaxtoolkit:modalpopupextender 
			    ID="Modalpopupextender1" runat="server" TargetControlID="popuporgbutton" PopupControlID="pnpPopupOrg" 
			     BackgroundCssClass="modalBackground" />

<asp:Panel ID="pnpPopupOrg" runat="server" Width="900px" style="display:none;" BackColor="White" >
  <asp:UpdatePanel ID="UpdatePanelOrg" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <table width="90%">
        <tr>
        <td align="center">
        <fieldset style="text-align: left;">

<%-- Radio Button to select appointment --%>


<legend style="color: #8A170F"><asp:Label ID="LbladdActivity" runat="server" Text="Add New Activity/Special Appointment" /></legend>

<table cellspacing="10">
<tr><td>

<asp:RadioButtonList ID="RadioButtonListSpecAp"
            runat="server" AutoPostBack="True"
            onselectedindexchanged="RadioButtonListSpecAp_SelectedIndexChanged" RepeatDirection="Horizontal" CellSpacing="15">
            
            <asp:ListItem Selected="True">Activity</asp:ListItem>
            <asp:ListItem>Special Appointment</asp:ListItem>
            
        </asp:RadioButtonList>
    <%--Radio button finish--%>    
    </td></tr>
</table>
<table>
<tr>
<td align="left"><asp:Label ID="lblActivity" runat="server" Text="Activity" /> </td><td align="left">Organization</td><td></td>
</tr>
<tr>
<td align="left">
    <asp:TextBox ID="TextBoxAct" runat="server"></asp:TextBox></td><td>  <asp:TextBox ID="TextBoxOrg" runat="server"></asp:TextBox></td><td  align="left">
    <asp:Button ID="ButtonAddOrg" runat="server" Text="+ ADD" onclick="ButtonAddOrg_Click" 
         /></td>
</tr>
</table>
</fieldset>   
<%-- Add Hours Panel directly adding in the Special Appointment list--%>
  
                
                <tr>
                    <td align="center">
                        <asp:GridView ID="GridViewPopOrg" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="OCId" DataSourceID="DsPopOrg" 
                            onselectedindexchanged="GridViewPopOrg_SelectedIndexChanged" SkinID="GridView">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:TemplateField>
                              <ItemTemplate>
                                    <%--Added the visible property so that user can't edit if the Dean has approved. Dec 2009 TAN--%>
                                  <asp:LinkButton ID="LinkButtonEditSpecAp" runat="server" CommandName="Select" Visible="<%# GetEditStatus() %>" onclick="LinkButtonEditHoursSpecAp_Click">
                                          Add Hours</asp:LinkButton></ItemTemplate></asp:TemplateField>
                                <asp:BoundField DataField="Activity" HeaderText="Activity" 
                                    SortExpression="Activity" />
                                <asp:BoundField DataField="Organization" HeaderText="Organization" 
                                    SortExpression="Organization" />
                               
                    <%--  Start to change  --%>         
                                <asp:TemplateField HeaderText="Day" SortExpression="Day">
                              <EditItemTemplate>
                                  <asp:Label ID="Label1" runat="server"></asp:Label></EditItemTemplate>
                                  <ItemTemplate>
                                  <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("OCId") %>' />
                                  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                      DataKeyNames="OCId" DataSourceID="DsInsideGridDay" SkinID="InsideGridView">
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
                           <asp:TemplateField FooterText="Total" HeaderText="From" 
                              SortExpression="FromTime">
                              <EditItemTemplate>
                                  <asp:Label ID="Label2" runat="server"></asp:Label></EditItemTemplate>
                                  <ItemTemplate>
                                  <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("OCId") %>' />
                                  <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                                      DataKeyNames="OCId" DataSourceID="DsInsideGridFromTime" SkinID="InsideGridView">
                                      <Columns>
                                          <asp:TemplateField HeaderText="From" SortExpression="FromTime">
                                              <EditItemTemplate>
                                                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("FromTime") %>'></asp:Label></EditItemTemplate><ItemTemplate>
                                                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("FromTime", "{0:t}") %>'></asp:Label></ItemTemplate></asp:TemplateField></Columns></asp:GridView><asp:ObjectDataSource ID="DsInsideGridFromTime" runat="server" 
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
                              <EditItemTemplate>
                                  <asp:Label ID="Label3" runat="server"></asp:Label></EditItemTemplate><FooterTemplate>
                                  <%#GetOffCampusHoursTotalFormat()%></FooterTemplate><ItemTemplate>
                                  <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Eval("OCId") %>' />
                                  <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                                      DataKeyNames="OCId" DataSourceID="DsInsideGridToTime" SkinID="InsideGridView">
                                      <Columns>
                                          <asp:TemplateField HeaderText="To" SortExpression="ToTime">
                                              <EditItemTemplate>
                                                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("ToTime") %>'></asp:Label></EditItemTemplate><ItemTemplate>
                                                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("ToTime", "{0:t}") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Total" SortExpression="Total" Visible="False">
                                              <ItemTemplate>
                                                  <%#GetTotalOffCampusHours(long.Parse(Convert.ToString(Eval("Total"))))%></ItemTemplate></asp:TemplateField></Columns></asp:GridView>
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
                        </asp:GridView>
                        <asp:ObjectDataSource ID="DsPopOrg" runat="server" 
                            DeleteMethod="DeleteOffCampus" InsertMethod="InsertOffCampus" 
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetOffcampusByTerm" 
                            TypeName="OffCampusBll" UpdateMethod="UpdateOffCampus">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_OCId" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="activity" Type="String" />
                                <asp:Parameter Name="organization" Type="String" />
                                <asp:Parameter Name="Original_OCId" Type="Int32" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="facultyid" SessionField="FacId" Type="Int32" />
                                <asp:SessionParameter Name="termid" SessionField="TermId" Type="Int32" />
                               
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="facultyid" Type="Int32" />
                                <asp:Parameter Name="activity" Type="String" />
                                <asp:Parameter Name="organization" Type="String" />
                                <asp:Parameter Name="termid" Type="Int32" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
       
<tr>
    <td>         
 <fieldset id="fieldsetpopupaddhours" runat="server" visible="false">
   
   <legend style="color: #8A170F">Add Hours</legend><table>
<tr>
<td align="left"><asp:Label ID="lblActivityOCH" runat="server" style="color: #8A170F" Text="Activity:" Font-Bold="True" />
<asp:Label ID="lblActivityNameOCH" runat="server" /></td>
</tr>
<tr>
<td align="left"><asp:Label ID="lblOrganizationOCH" runat="server" style="color: #8A170F" Text="Organization:" Font-Bold="True" />
<asp:Label ID="lblOrganizationNameOCH" runat="server" /></td>
</tr>
<tr>
<td align="left">Day</td><td align="left">From</td><td align="left">To</td><td></td>
</tr>
<tr>

<%--For Off Campus Activities Edit Hours Pop up -> Then Add Hours --%>
<td  align="left"><asp:DropDownList ID="DropDownListDayInsideSpecAp" runat="server" >
                        <asp:ListItem>Monday</asp:ListItem><asp:ListItem>Tuesday</asp:ListItem><asp:ListItem>Wednesday</asp:ListItem><asp:ListItem>Thursday</asp:ListItem><asp:ListItem>Friday</asp:ListItem><asp:ListItem>Saturday</asp:ListItem><asp:ListItem>Sunday</asp:ListItem></asp:DropDownList></td><td align="left">
    <%--Changed from TextBox to DropDownList to use the time picker.  Dec. 2009 TAN--%>
    <asp:DropDownList ID="DDLTimeFromInsideSpecAp" runat="server" DataSourceID="DsTimePicker" 
                      DataTextField="Time" DataValueField="Value"> 
    </asp:DropDownList>
</td>
<td align="left">  
    <%--Changed from TextBox to DropDownList to use the time picker.  Dec. 2009 TAN--%>
    <asp:DropDownList ID="DDLTimeToInsideSpecAp" runat="server" DataSourceID="DsTimePicker" 
                      DataTextField="Time" DataValueField="Value">   
    </asp:DropDownList>
</td>

    <td>
        <%--To Add the new Hours--%>
        <asp:Button ID="ButtonAddSpecAp" runat="server" onclick="ButtonADDSpecAp_Click" 
                Text="+ ADD" />
    </td>
    <td>
        <%--To Add the new Hours--%>
        <asp:Button ID="ButtonCancelSpecAp" runat="server" onclick="ButtonCancelSpecAp_Click" 
                Text="Cancel" CausesValidation="False" />
    </td>
</tr>
<tr>
    <%--Add time entry validation Nov 2009 TAN --%>
    <td><asp:CompareValidator id="CompareTimeOffCampSpecAp" Display="Dynamic" Visible="false" EnableClientScript="true"
            ControlToValidate="DDLTimeFromInsideSpecAp" Operator="LessThan" 
            ControlToCompare="DDLTimeToInsideSpecAp" ErrorMessage="To time must be later than from time" 
            type="Integer" runat="server" Font-Bold="True"></asp:CompareValidator></td></tr></table></fieldset>
            
     </td>      
        </tr>
                
                
                <tr>
                    <td align="right">
                        <asp:Button ID="ButtonExitOrg" runat="server" onclick="ButtonExitOrg_Click" 
                            SkinID="AspButton" Text="Exit" CausesValidation="False" />
                    </td>
                </tr>
            </caption>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Panel>

   
 <asp:Button id="Buttonofpop" runat="server" style="display:none" />
 <ajaxtoolkit:modalpopupextender 
			    ID="mdlpopOH" runat="server" TargetControlID="Buttonofpop" PopupControlID="PanelOhPop" 
			     BackgroundCssClass="modalBackground" />

<asp:Panel ID="PanelOhPop" runat="server" Width="700px" style="display:none;" BackColor="White" >
  <asp:UpdatePanel ID="UpdatePanelOHPopup" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
<table width="90%">
        <tr>
        <td align="center">
<fieldset>
<legend style="color: #8A170F">Add Office Hours</legend><table>
<tr>
<td align="left">Day</td><td align="left">From Time</td><%--Changed Format Oct 2009 TAN --%>
<td align="left">To Time</td><%--Changed Format Oct 2009 TAN --%>
<td></td>
</tr>
<tr>
<td align="left">
   
<%--This is for the "Add New Office Hours" popup --%>
<asp:DropDownList ID="DropDownListDayOH" runat="server" >       <%--Selection done in .cs ButtonAddOH_Click--%>
                        <asp:ListItem>Monday</asp:ListItem><asp:ListItem>Tuesday</asp:ListItem><asp:ListItem>Wednesday</asp:ListItem><asp:ListItem>Thursday</asp:ListItem><asp:ListItem>Friday</asp:ListItem><asp:ListItem>Saturday</asp:ListItem><asp:ListItem>Sunday</asp:ListItem></asp:DropDownList></td><%--From Time --%>  
<td> <%--Replaced time textbox with timepicker dropdown list from database Nov. 2009 TAN--%>
    <asp:DropDownList ID="DropDownListFromHourOH" runat="server" DataSourceID="DsTimePicker" 
        DataTextField="Time" DataValueField="Value">
    </asp:DropDownList>
</td>

<%--To Time --%>  
<td> <%--Replaced time textbox with timepicker dropdown list from data base Nov. 2009 TAN--%>
    <asp:DropDownList ID="DropDownListToHourOH" runat="server" DataSourceID="DsTimePicker"
        DataTextField="Time" DataValueField="Value">
    </asp:DropDownList>
</td>

<td  align="left">
    <%--Changed Text on button from +ADD to SAVE Nov 2009 TAN--%>
    <asp:Button ID="ButtonAddOH" runat="server" Text="SAVE" onclick="ButtonAddOH_Click" 
         /></td>
</tr>

<tr>  <%--Add time entry validation Nov 2009 TAN --%>
    <td><asp:CompareValidator id="compTimePopUp" Display="Dynamic" 
            ControlToValidate="DropDownListFromHourOH" Operator="LessThan" 
            ControlToCompare="DropDownListToHourOH" ErrorMessage="To time must be later than from time" 
            type="Integer" runat="server" Visible="False" Font-Bold="True"></asp:CompareValidator></td></tr></table></fieldset>
        </td>
        </tr>
        <tr>
        <td align="center">
            <asp:GridView ID="GridViewPopupOH" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="OHId" DataSourceID="DsOHPopup" SkinID="GridView">
        <Columns>
            <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
            <asp:TemplateField HeaderText="From Time" SortExpression="FromTime">
                <%--Deleted EditItemTemplates because using timepicker dropdown lists instead of text boxes. Nov 2009 TAN --%>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FromTime", "{0:t}") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="To Time" SortExpression="ToTime">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ToTime", "{0:t}") %>'></asp:Label></ItemTemplate></asp:TemplateField></Columns></asp:GridView></td></tr><tr>
        <td align="center">
        <%--Added CausesValidation property so that could exit out of popup if the times were invalid. Nov. 2009 TAN--%>
        <asp:Button ID="ButtonExitOHPOPup" runat="server" Text="Exit" SkinID="AspButton" 
                onclick="ButtonExitOHPOPup_Click" CausesValidation="False" />                            
        </td>
        </tr>
        </table>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Panel>
    
    
       
 <asp:Button id="ButtonPopUpTeaching" runat="server" style="display:none" />
 <ajaxtoolkit:modalpopupextender 
			    ID="ModalpopupextenderPopUpTeaching" runat="server" TargetControlID="ButtonPopUpTeaching" PopupControlID="PanelPopUpTeaching" 
			     BackgroundCssClass="modalBackground" />
    <asp:Panel ID="PanelPopUpTeaching" runat="server" Width="700px" style="display:none;" BackColor="White" >
  <asp:UpdatePanel ID="UpdatePanelPopUpTeaching" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <table width="90%">
        <tr>
        <td align="center">
        <fieldset>
<legend style="color: #8A170F">Add Hours</legend><table>
<tr>
<td align="left">Day</td><td align="left">From</td><td align="left">To</td><td></td>
</tr>
<tr>

<td  align="left"><asp:DropDownList ID="DropDownListTechDay" runat="server" >
                        <asp:ListItem>Monday</asp:ListItem><asp:ListItem>Tuesday</asp:ListItem><asp:ListItem>Wednesday</asp:ListItem><asp:ListItem>Thursday</asp:ListItem><asp:ListItem>Friday</asp:ListItem><asp:ListItem>Saturday</asp:ListItem><asp:ListItem>Sunday</asp:ListItem></asp:DropDownList></td><td align="left">
    <asp:TextBox ID="TextBoxTeachFrom" runat="server"></asp:TextBox></td><td align="left">  <asp:TextBox ID="TextBoxTeachTo" runat="server"></asp:TextBox></td><td>
    <asp:Button ID="Button1" runat="server" Text="+ ADD" 
        onclick="ButtonADDTeachingHrs_Click" /></td>
</tr>
</table>
</fieldset>
        &nbsp;&nbsp;</td></tr><tr>
        <td align="center">
            <asp:GridView ID="GridViewPopUpTeachingHrs" runat="server" DataSourceID="DsOpupTeachingHrs" 
        AutoGenerateColumns="False" DataKeyNames="TSTId" SkinID="GridView">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
            <asp:TemplateField HeaderText="From" SortExpression="FromTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FromTime") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FromTime", "{0:t}") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="To" SortExpression="ToTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ToTime") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ToTime", "{0:t}") %>'></asp:Label></ItemTemplate></asp:TemplateField></Columns></asp:GridView></td></tr><tr>
        <td align="right">
        <asp:Button ID="ButtonExitTeachingHrs" runat="server" Text="Exit" SkinID="AspButton" 
                onclick="ButtonExitTeachingHrs_Click" />
        </td>
        </tr>
        </table>

    </ContentTemplate>
</asp:UpdatePanel>
</asp:Panel>
    
    <asp:Button id="ButtonTeachingPopSche" runat="server" style="display:none" />
    <ajaxtoolkit:modalpopupextender 
			    ID="ModalpopupextenderTeachingPopSche" runat="server" TargetControlID="ButtonTeachingPopSche" PopupControlID="PanelTeachingPopSche" 
			     BackgroundCssClass="modalBackground" />
			  <asp:Panel ID="PanelTeachingPopSche" runat="server" Width="90%" style="display:none;" BackColor="White" >
  <asp:UpdatePanel ID="UpdatePanelTeachingPopSche" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <table width="90%">
            <tr>
                <td align="center">
                    <asp:DetailsView ID="DetailsViewPopUpTeachingSch" runat="server" 
                        AutoGenerateRows="False" DataKeyNames="ScheduleID" 
                        DataSourceID="DsPopUpteachingSche" DefaultMode="Insert" 
                        SkinID="DetailsViewPopup">
                        <Fields>
                            <asp:TemplateField HeaderText="Course Code" SortExpression="CourseCode">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CourseCode") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxCourseCode" runat="server" Text=""></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CourseCode") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Course Title" SortExpression="CourseTitle">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CourseTitle") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxCourseTitle" runat="server" Text=""></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CourseTitle") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Teaching Credits" 
                                SortExpression="TeachingCredits">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TeachingCredits") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxtc" runat="server" Text=""></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("TeachingCredits") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Student Credits" SortExpression="StudentCredits">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("StudentCredits") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxsc" runat="server" Text=""></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("StudentCredits") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Location" SortExpression="Location">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Location") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxloc" runat="server" Text=""></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Location") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Team Taught" SortExpression="TeamTaught">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" 
                                        Checked='<%# Bind("TeamTaught") %>' />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:CheckBox ID="CheckBoxtt" runat="server" Checked="false" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("TeamTaught") %>' 
                                        Enabled="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Meeting Days" SortExpression="MeetingDays">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("MeetingDays") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxMeeting" runat="server" 
                                        Text='<%# Bind("MeetingDays") %>'></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MeetingDays") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Start Time" SortExpression="StartTime">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("StartTime") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("StartTime") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxSt" runat="server" Text='<%# Bind("StartTime") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="End Time" SortExpression="EndTime">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("EndTime") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("EndTime") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxEt" runat="server" Text='<%# Bind("EndTime") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField>
                                <InsertItemTemplate>
                                    <asp:LinkButton ID="LinkButtonInsertTeaching" runat="server" 
                                        CausesValidation="True" onclick="LinkButtonInsertTeaching_Click" Text="Insert"></asp:LinkButton></InsertItemTemplate></asp:TemplateField></Fields></asp:DetailsView></td></tr><tr>
            
         <td>
            
            </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Button ID="ButtonExitTeachingSche" runat="server" 
                        onclick="ButtonExitTeachingSche_Click" SkinID="AspButton" Text="Exit" />
                </td>
            </tr>
        </table>


   
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Panel>

        
        
<asp:Button id="ButtonPopUpResearch" runat="server" style="display:none" />
 <ajaxtoolkit:modalpopupextender 
			    ID="ModalpopupextenderPopUpResearch" runat="server" TargetControlID="ButtonPopUpResearch" PopupControlID="PanelPopUpResearch" 
			     BackgroundCssClass="modalBackground" />
    <asp:Panel ID="PanelPopUpResearch" runat="server" Width="700px" style="display:none;" BackColor="White" >
  <asp:UpdatePanel ID="UpdatePanelPopUpResearch" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <table width="90%">
        <tr>
        <td align="center">
        <fieldset>
<legend style="color: #8A170F">Add Hours</legend><table>
<tr>
<td align="left">Day</td><td align="left">From</td><td align="left">To</td><td></td>
</tr>
<tr>

<td  align="left"><asp:DropDownList ID="DropDownListResearchDay" runat="server" >
                        <asp:ListItem>Monday</asp:ListItem><asp:ListItem>Tuesday</asp:ListItem><asp:ListItem>Wednesday</asp:ListItem><asp:ListItem>Thursday</asp:ListItem><asp:ListItem>Friday</asp:ListItem><asp:ListItem>Saturday</asp:ListItem><asp:ListItem>Sunday</asp:ListItem></asp:DropDownList></td><td align="left">
    <asp:TextBox ID="TextBoxResearchFrom" runat="server"></asp:TextBox></td><td align="left">  <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td><td>
    <asp:Button ID="Button4" runat="server" Text="+ ADD" 
        onclick="ButtonADDTeachingHrs_Click" /></td>
</tr>
</table>
</fieldset>
        &nbsp;&nbsp;</td></tr><tr>
        <td align="center">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="DsOpupTeachingHrs" 
        AutoGenerateColumns="False" DataKeyNames="TSTId" SkinID="GridView">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
            <asp:TemplateField HeaderText="From" SortExpression="FromTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FromTime") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FromTime", "{0:t}") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="To" SortExpression="ToTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ToTime") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ToTime", "{0:t}") %>'></asp:Label></ItemTemplate></asp:TemplateField></Columns></asp:GridView></td></tr><tr>
        <td align="right">
        <asp:Button ID="Button5" runat="server" Text="Exit" SkinID="AspButton" 
                onclick="ButtonExitTeachingHrs_Click" />
        </td>
        </tr>
        </table>

    </ContentTemplate>
</asp:UpdatePanel>
</asp:Panel>
         
         
         
         
            
            <asp:Button id="ButtonResearchPopSche" runat="server" style="display:none" />
    <ajaxtoolkit:modalpopupextender 
			    ID="ModalpopupextenderResearchPopSche" runat="server" TargetControlID="ButtonResearchPopSche" PopupControlID="PanelResearchPopSche" 
			     BackgroundCssClass="modalBackground" />
			  <asp:Panel ID="PanelResearchPopSche" runat="server" Width="90%" style="display:none;" BackColor="White" >
  <asp:UpdatePanel ID="UpdatePanelResearchPopSche" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <table width="90%">
            <tr>
                <td align="center">
                    <asp:DetailsView ID="DetailsViewPopUpResearchSch" runat="server" 
                        AutoGenerateRows="False" DataKeyNames="ScheduleID" 
                        DataSourceID="DsPopUpResearchSche" DefaultMode="Insert" 
                        SkinID="DetailsViewPopup">
                        <Fields>
                            <asp:TemplateField HeaderText="Course Code" SortExpression="CourseCode">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CourseCode") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxCourseCode" runat="server" Text=""></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CourseCode") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Course Title" SortExpression="CourseTitle">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CourseTitle") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxCourseTitle" runat="server" Text=""></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CourseTitle") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Teaching Credits" 
                                SortExpression="TeachingCredits">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TeachingCredits") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxtc" runat="server" Text=""></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("TeachingCredits") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Student Credits" SortExpression="StudentCredits">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("StudentCredits") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxsc" runat="server" Text=""></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("StudentCredits") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Location" SortExpression="Location">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Location") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxloc" runat="server" Text=""></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Location") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Team Taught" SortExpression="TeamTaught">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" 
                                        Checked='<%# Bind("TeamTaught") %>' />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:CheckBox ID="CheckBoxtt" runat="server" Checked="false" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("TeamTaught") %>' 
                                        Enabled="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Meeting Days" SortExpression="MeetingDays">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("MeetingDays") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxMeeting" runat="server" 
                                        Text='<%# Bind("MeetingDays") %>'></asp:TextBox></InsertItemTemplate><ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MeetingDays") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Start Time" SortExpression="StartTime">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("StartTime") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("StartTime") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxSt" runat="server" Text='<%# Bind("StartTime") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="End Time" SortExpression="EndTime">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("EndTime") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("EndTime") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxEt" runat="server" Text='<%# Bind("EndTime") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField>
                                <InsertItemTemplate>
                                    <asp:LinkButton ID="LinkButtonInsertResearch" runat="server" 
                                        CausesValidation="True" onclick="LinkButtonInsertResearch_Click" Text="Insert"></asp:LinkButton></InsertItemTemplate></asp:TemplateField></Fields></asp:DetailsView></td></tr><tr>
         
            
                    
            <td>
            
            </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Button ID="ButtonExitResearchSche" runat="server" 
                        onclick="ButtonExitResearchSche_Click" SkinID="AspButton" Text="Exit" />
                </td>
            </tr>
        </table>


   
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Panel> 
            
         
            
            
          </table>
    
</asp:Content>