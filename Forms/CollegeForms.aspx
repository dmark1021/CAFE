<%-- This form is the College Forms Page.--%>
<%-- June 2009 TAN --%>

<%@ Page Language="C#" MasterPageFile="~/master/Colleges.master" AutoEventWireup="true" CodeFile="CollegeForms.aspx.cs" Inherits="CollegeForms" Title="College Forms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>


<asp:Content ID="WelcomeBanner" ContentPlaceHolderID="CollegeName" Runat="Server">
    <img src="../App_Themes/brown/image/CollegeForms.jpg" class="collegeNameBanner" alt="College Forms Page" /> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="DeansInfo" Runat="Server">
    <div class ="formList">
        <h2>Chair/Program Director Forms</h2> 
        <ul>
            <li><asp:HyperLink ID="PerfApprForm" runat="server" NavigateUrl="" Text=""></asp:HyperLink></li>
            <li><asp:HyperLink ID="AdjuntPayForm" runat="server" NavigateUrl="" Text=""></asp:HyperLink></li>
        </ul>
        
        <h2>Faculty Forms</h2>
        <ul>
            <li><asp:HyperLink ID="AccidentForm" runat="server" NavigateUrl="" Text="Accident Report Form" CssClass="formListLink"></asp:HyperLink></li>
            <li><asp:HyperLink ID="RefusalForm" runat="server" NavigateUrl="../Documents/Refusal of Treatment.doc" Text="Refusal of Treatment Form" CssClass="formListLink"></asp:HyperLink></li>
            <li><asp:HyperLink ID="DivPlanningForm" runat="server" NavigateUrl="../Documents/Divisional Planning Form.doc" Text="Divisional Planning Form" CssClass="formListLink"></asp:HyperLink></li>
            <li><asp:HyperLink ID="ReleaseTimeForm" runat="server" NavigateUrl="" Text="Release Time Form" CssClass="formListLink"></asp:HyperLink></li>
            <li><asp:HyperLink ID="SelfEvalForm" runat="server" NavigateUrl="../Documents/Faculty_eval_2010.doc" Text="Faculty Self Evaluation Form" CssClass="formListLink"></asp:HyperLink></li>
            
        </ul>
        
        <h2>Faculty/Staff Miscellaneous Information</h2>
        <ul>
            <li><asp:HyperLink ID="CommitteeReport" runat="server" NavigateUrl="" Text="College Committees" CssClass="formListLink"></asp:HyperLink></li>
        </ul>
        
    </div>
</asp:Content>

