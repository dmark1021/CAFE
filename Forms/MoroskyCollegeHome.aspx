<%-- This form is the home page for the Morosky College of Health Professions and Sciences.--%>
<%-- June 2009 TAN --%>

<%@ Page Language="C#" MasterPageFile="~/master/Colleges.master" AutoEventWireup="true" CodeFile="MoroskyCollegeHome.aspx.cs" Inherits="MoroskyCollegeHome" Title="Morosky College Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>


<asp:Content ID="WelcomeBanner" ContentPlaceHolderID="CollegeName" Runat="Server">
    <img src="../App_Themes/brown/image/MoroskyCollege.jpg" class="collegeNameBanner" alt="Morosky College" /> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="DeansInfo" Runat="Server">
    <h2>Dean's Office</h2> 
    <address>Robert H. Morosky Academic Center, Room 139 <br />
    (814) 871-7618 (Phone)<br />
    (814) 871-7382 (Fax)</address>
    <br />
    
    <h2>Dean</h2>
    <address>
    <span id = "DeansName">Carolynn Masters, Ph.D, RN, CARN </span><br />
    Morosky Room 139 <br />
    (814) 871-7605 (Phone) <br />
    <a href="mailto:masters004@gannon.edu">masters004@gannon.edu </a></address>
    
    <h2>Administrative Assistant</h2>
    <address>
    <span id = "DeansName">Kathleen DeSante</span><br />
    Morosky Room 134 <br />
    (814) 871-7618 (phone)<br />
    <a href="mailto:desante001@gannon.edu">desante001@gannon.edu</a></address>
    
    <h2>Assistant for Student Records</h2>
    <address>
    <span id = "DeansName">Stacie Burket</span><br />
    Morosky Room 133 <br />
    (814) 871-5600 (phone)<br />
    <a href="mailto:burket003@gannon.edu">burket003@gannon.edu</a></address>
    
</asp:Content>

