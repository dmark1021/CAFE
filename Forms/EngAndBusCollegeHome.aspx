<%-- This form is the home page for the College of Engineering & Business.--%>
<%-- June 2009 TAN --%>

<%@ Page Language="C#" MasterPageFile="~/master/Colleges.master" AutoEventWireup="true" CodeFile="EngAndBusCollegeHome.aspx.cs" Inherits="EngAndBusCollegeHome" Title="College of Engineering & Business Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>


<asp:Content ID="WelcomeBanner" ContentPlaceHolderID="CollegeName" Runat="Server">
    <img src="../App_Themes/brown/image/EandBCollege.jpg" class="collegeNameBanner" alt="College of Engineering & Business" /> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="DeansInfo" Runat="Server">
    <h2>Dean's Office</h2> 
    <address>Zurn Science Center, Room 321 <br />
    (814) 871-7717 (Phone)<br />
    (814) 871-7673 (Fax)</address>
    <br />
    
    <h2>Dean</h2>
    <address>
    <span id = "DeansName"> Melanie L. Hatch, Ph.D<br /></span>
    (814) 871-7582 (Phone)<br />
    <a href="mailto:hatch004@gannon.edu">hatch004@gannon.edu </a></address>
    
    <h2>Administrative Assistant</h2>
    <address>
    <span id = "DeansName">Victoria (Vic) Delaney<br /></span>
    (814) 871-7912 (phone)<br />
    <a href="mailto:delaney002@gannon.edu">delaney002@gannon.edu</a></address>
    
    <h2>Assistant for Student Records</h2>
    <address>
    <span id = "DeansName">Theresa Howell<br /></span>
    (814) 871-7717 (phone)<br />
    <a href="mailto:howell004@gannon.edu">howell004@gannon.edu</a></address>
    
</asp:Content>

