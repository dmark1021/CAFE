<%@ Page Language="C#" MasterPageFile="~/master/Default.master" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Table ID="Table1" runat="server" BorderStyle="None">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell ID="errMsg" runat="server">Error Code</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server" Height="30px">
            <asp:TableCell runat="server">   </asp:TableCell>
        </asp:TableRow>
        
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">Please contact Roanna Lun at lun001@gannon.edu x7303</asp:TableCell>
        </asp:TableRow>
        
    </asp:Table>
    </asp:Content>

