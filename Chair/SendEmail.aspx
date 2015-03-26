<%@ Page Language="C#" MasterPageFile="~/master/AfterLogin.master" AutoEventWireup="true" CodeFile="SendEmail.aspx.cs" Inherits="Chair_SendEmail" Title="Untitled Page" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" Runat="Server">
    <table width="50%">
<tr>
<td align="left" colspan="2">
    <asp:Button ID="ButtonSend" runat="server" Text="Send Email" 
        oncommand="ButtonSend_Command" SkinID="AspButton"/>&nbsp;
    <asp:Button ID="ButtonDiscard"
        runat="server" Text="Discard" oncommand="ButtonDiscard_Command" SkinID="AspButton" />
</td>
</tr>
<tr>
<td align="left">
    <asp:Label ID="Label1" runat="server" Text="To:" Font-Bold="True"></asp:Label></td>
    <td>
    <asp:TextBox ID="TextBoxTo" runat="server" Width="600px"></asp:TextBox>
    </td>
</tr>
<tr>
<td align="left">
    <asp:Label ID="Label2" runat="server" Text="Subject:" Font-Bold="True"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBoxSubject"
        runat="server" Width="600px"></asp:TextBox>
</td>
</tr>
<tr>
<td colspan ="2">
   <cc1:RichTextEditor ID="Rte" runat="server" Height="200Px"/>
</td>
</tr>

</table>
</asp:Content>

