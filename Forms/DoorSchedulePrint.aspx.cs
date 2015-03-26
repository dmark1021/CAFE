using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Data;


public partial class Reports_PrintForm : System.Web.UI.Page
{

    TermBll objTerm = new TermBll();
    String semester;
    String year;
    String text;

    protected void Page_Load(object sender, EventArgs e)
    {

        DataTable dt = objTerm.GetTermName(Convert.ToInt32(Session["TermID"]));

        semester = dt.Rows[0]["Semester"].ToString();
        year = dt.Rows[0]["year"].ToString();

        text = semester + " Semester " + year;

        ReportParameter rptSemester = new ReportParameter("rptSemester", text );
        ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { rptSemester }); 
    }
}
