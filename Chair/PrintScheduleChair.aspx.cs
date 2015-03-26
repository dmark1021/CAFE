using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;


public partial class Chair_PrintScheduleChair : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
          // DropDownListTerm.SelectedValue = Session["TermId"].ToString();
    }
  
    public string GetURL(object facid, object termid)
    {
        return String.Format("../Forms/Schedule.aspx?s=other&id={0}&tid={1}", facid, termid);

    }
    protected void CheckBoxAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk;
        if (DropDownListActions.SelectedValue == "All")
        {
        
            foreach (GridViewRow gr in GridViewSchedule.Rows)
            {
                chk = (CheckBox)gr.FindControl("CheckBox1");
                if (CheckBoxAll.Checked)              
                    chk.Checked = true;            
                else  
                    chk.Checked = false;               
            }
            
        }
        else
        {
           
            foreach (GridViewRow gr in GridViewSchByStatus.Rows)
            {
                
                chk = (CheckBox)gr.FindControl("CheckBox2");
                if (CheckBoxAll.Checked)             
                    chk.Checked = true;              
                else             
                    chk.Checked = false;
                
            }
        }
        UpdatePanelGridAllSch.Update();
    }
    protected void DropDownListActions_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownListActions.SelectedValue == "All")
        {
            GridViewSchedule.DataBind();
            GridViewSchedule.Visible = true;
            GridViewSchByStatus.Visible = false;
            UpdatePanelGridAllSch.Update();
        }
        else
        {
            GridViewSchByStatus.DataBind();
            GridViewSchedule.Visible = false;
            GridViewSchByStatus.Visible = true;
            UpdatePanelGridAllSch.Update();
        }
    }
    protected void ButtonPrint_Click(object sender, EventArgs e)
    {
        CheckBox chk;
        ArrayList al = null;
        if (DropDownListActions.SelectedValue == "All")
        {
            al = new ArrayList();
            foreach (GridViewRow gr in GridViewSchedule.Rows)
            {
                chk = (CheckBox)gr.FindControl("CheckBox1");
                if (chk.Checked)
                    al.Add(((HiddenField)(gr.FindControl("HiddenFieldFac"))).Value);
            }
        }
        else
        {
            al = new ArrayList();
            foreach (GridViewRow gr in GridViewSchByStatus.Rows)
            {
                chk = (CheckBox)gr.FindControl("CheckBox2");
                if (chk.Checked)
                    al.Add(((HiddenField)(gr.FindControl("HiddenFieldFac"))).Value);
            }
        }
        Session["FacArray"] = al;
        if(al.Count>0)
        Response.Redirect("~/Forms/SchedulePrint.aspx");

    }
    protected void DropDownListTerm_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["TermId"] = DropDownListTerm.SelectedValue;
        try
        {
            Session["TermName"] = DropDownListTerm.SelectedItem.Text;
        }
        catch { }
        DropDownListActions.SelectedIndex = 0;
        UpdatePanelGridAllSch.Update();
    }
    protected void DropDownListTerm_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        DropDownListTerm.SelectedValue = Session["TermId"].ToString();
    }
}
