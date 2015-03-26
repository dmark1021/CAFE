using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;

public partial class Dean_PrintScheduleDean : System.Web.UI.Page
{

    DepartmentBll objD = new DepartmentBll();
    MainScheduleBll objMs = new MainScheduleBll();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
          //  DropDownListTerm.SelectedValue = Session["TermId"].ToString();
    }
    public string GetURL(object deptid)
    {
        return String.Format("~/Dean/InboxByDept.aspx?deptid={0}", deptid);
    }
    public string GetLinkText(object deptname, object deptid)
    {
        int count = objD.GetNoofInboxForDeanByDept(Convert.ToInt32(deptid));
        return String.Format("{0}", deptname);

    }
    protected void DropDownListPrint_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void CheckBoxAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk;

        foreach (GridViewRow gr in GridViewDepartment.Rows)
        {
            chk = (CheckBox)gr.FindControl("CheckBox1");
            if (CheckBoxAll.Checked)
                chk.Checked = true;
            else
                chk.Checked = false;
        }
        UpdatePanelGridView.Update();
    }


    protected void ButtonPrint_Click(object sender, EventArgs e)
    {
        CheckBox chk;
        ArrayList al;
        if (DropDownListPrint.SelectedValue == "All")
        {
            al = new ArrayList();
            foreach (GridViewRow gr in GridViewDepartment.Rows)
            {
                chk = (CheckBox)gr.FindControl("CheckBox1");
                if (chk.Checked)
                {
                   
                    int deptid = (int)GridViewDepartment.DataKeys[gr.DataItemIndex].Values["DeptID"];
                    DataTable dt = objMs.GetAllSchedules(deptid, Convert.ToInt32(Session["TermId"]));
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                            al.Add(dr["FacultyId"]);
                    }
                }

            }
        }

        else
        {
            al = new ArrayList();
            foreach (GridViewRow gr in GridViewDepartment.Rows)
            {
                chk = (CheckBox)gr.FindControl("CheckBox1");
                if (chk.Checked)
                {
                    int deptid = (int)GridViewDepartment.DataKeys[gr.DataItemIndex].Values["DeptID"];
                    DataTable dt = objMs.GetPrintScheduleByChair(deptid, Convert.ToInt32(Session["TermId"]), DropDownListPrint.SelectedValue);
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                            al.Add(dr["FacultyId"]);
                    }
                }

            }
        }

        Session["FacArray"] = al;
        if (al.Count > 0)
        Response.Redirect("~/Forms/SchedulePrint.aspx");
    }
    protected void DropDownListTerm_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["TermId"] = DropDownListTerm.SelectedValue;
        DropDownListPrint.SelectedIndex = 0;
        UpdatePanelGridView.Update();
    }
    protected void DropDownListTerm_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        DropDownListTerm.SelectedValue = Session["TermId"].ToString();
    }

}
