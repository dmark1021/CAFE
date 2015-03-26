<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DoorSchedulePrint.aspx.cs" Inherits="Reports_PrintForm" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DeanConnectionString %>" 
            SelectCommand="SelectFacultyScheduleHours" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="facid" SessionField="FacId" Type="Int32" />
                <asp:SessionParameter Name="termid" SessionField="TermId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="8.5in" Width="11in"
        ShowFindControls="False" 
        ShowRefreshButton="False" ShowParameterPrompts="False" 
        ShowBackButton="True" ShowPageNavigationControls="False">
        <LocalReport ReportPath="Reports\DoorSchedule.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" 
                    Name="CAFEDataSet_SelectFacultyScheduleHours" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    </form>
</body>
</html>
