<%@ Page Language="C#" MasterPageFile="~/master/default.master" AutoEventWireup="true" CodeFile="LoginSelection.aspx.cs" Inherits="Trial_LoginSelection" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" Runat="Server">
 <asp:Label ForeColor="Maroon" Font-Bold="true" ID="Label5" runat="server" Text="This is the trial page.The actual webpage will have login control instead of this"></asp:Label><br /><br /><br /><br />
    <asp:Label ID="LabelCollname" runat="server" Text="Label" ForeColor="Maroon" Font-Bold="true"></asp:Label><br /><br /><br />
    <asp:Label ID="Label1" runat="server" Text="Select Department" ForeColor="Maroon"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="DsDept" DataTextField="DeptName" DataValueField="DeptID" 
        AppendDataBoundItems="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Value="0">Select One</asp:ListItem>
    </asp:DropDownList>
    <asp:ObjectDataSource ID="DsDept" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDepartmentByCollege" TypeName="DepartmentBll">
        <SelectParameters>
            <%-- The college id has to be retrieved from a Session instead of a Query String. June 2009 TAN --%>
            <%--<asp:QueryStringParameter Name="collegeid" QueryStringField="collid" Type="Int32" /> --%>
            <asp:SessionParameter Name="collegeid" SessionField="collid" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource><br /><br />
    <asp:Label ID="Label3" runat="server" Text="Login as Dean" ForeColor="Maroon"></asp:Label>
    &nbsp;&nbsp;
    

    <asp:HyperLink ID="HyperLinkDean" NavigateUrl="~/LoginRedirect.aspx?type=d" Text="Dean" runat="server"></asp:HyperLink>
    
    <br /><br />
    <asp:Label ID="Label2" runat="server" Text="Login as Faculty" ForeColor="Maroon"></asp:Label>
    &nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Dsfaculty" 
        DataTextField="NetworkID" DataValueField="FacultyID" 
        onselectedindexchanged="DropDownList2_SelectedIndexChanged" 
        AutoPostBack="True" AppendDataBoundItems="True">
        <asp:ListItem Value="0">Select One</asp:ListItem>
    </asp:DropDownList><br /><br />
    
    <asp:ObjectDataSource ID="Dsfaculty" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetFacultyByDept" 
        TypeName="FacultyBll">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="deptid" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource><br />
    <asp:Label ID="Label4" runat="server" Text="Login as Chair" ForeColor="Maroon"></asp:Label>
    &nbsp;&nbsp;
    <asp:HyperLink ID="HyperLinkchair" Text="Chair" runat="server"></asp:HyperLink>
    
</asp:Content>

