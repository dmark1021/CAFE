using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Forms_Schedule : System.Web.UI.Page
{
    MailingClass objM = new MailingClass();
    FacultyBll objF = new FacultyBll();
    long officehourstotalduration;
    long offcampustotalduration;

    OffCampusBll objOc = new OffCampusBll();
    MainScheduleBll objMs = new MainScheduleBll();
    OfficeHoursBLL objOH = new OfficeHoursBLL();
    ScheduleBll objS = new ScheduleBll();
    TeachSchimingsBll objT = new TeachSchimingsBll();
    DepartmentBll objD = new DepartmentBll();

    string pageQueryString = "";
    string popOffCampActivity = "";
    string popOffCampOrganization = "";
    string checkStatus = "";                    //added lin
    decimal TotalTeachingCredits = 0;
    decimal TotalStudentCredits = 0;
    decimal TotalResearchTeachingCredits = 0;
    decimal TotalResearchStudentCredits = 0;
    

    //OfficeHoursBLL objOfficeHr = new OfficeHoursBLL();
    protected void Page_Load(object sender, EventArgs e)
    {

        officehourstotalduration = 0;
        offcampustotalduration = 0;

        GetSettings();
        if (!IsPostBack)
            ButtonSubmitChair.Enabled = GetSubmitButtonStatus();

        LinkButtonInsertnewOH.Visible = GetEditStatus();    //Can't edit Office Hours Schedule if Dean has approved schedule. Dec 2009 TAN
        LinkButtonTeaching.Visible = GetEditStatus();       //Can't edit Teaching Schedule if Dean has approved schedule. Dec 2009 TAN
        LinkButtonResearch.Visible = GetEditStatus();       //Can't edit Research Schedule if Dean has approved schedule. Dec 2009 TAN
        LinkButtonPopOrg.Visible = GetEditStatus();         //Can edit the off campus schedule if Dean has approved schedule. Dec 2009 TAN
        DataTable dt5 = objMs.GetEditStatus(Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"]));    //
       
        int dt4 = objMs.HasSchedule(Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"]));            // to check if there is any schedule for current semester, prevent "no result" error.        
        if (dt4==0)
        {
            this.Response.Write("<script language=javascript>alert('No schedule found for current semester.');</script>");
        } else
            checkStatus = dt5.Rows[0]["Status"].ToString();
        // checkStatus = "false";  //testing Lin

        //checkStatus = objMs.GetEditStatus(Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"])).ToString();  // added lin
        //String temp = checkStatus.ToString();
        //this.Response.Write("<script language=javascript>alert(temp)</script>"); //testing lin
        
        if (ButtonSubmitChair.Enabled == false)             //If...Else statement will disable grid view(both Teaching & Research schedule) & panels until schedule request will be approved.
        {
            GvTeachingSchedule.Enabled = false;
            GvResearchSchedule.Enabled = false;
            if (((Convert.ToString(Session["type"]).ToLower()) == "chair") || (Convert.ToString(Session["type"]).ToLower()) == "dean")
            {
                if ((Convert.ToString(Session["type"]).ToLower()) == "chair")
                {
                    if (checkStatus == "S" || checkStatus == "RC" || checkStatus == "RD" || checkStatus == "SC")
                        panelsummary.Enabled = true;
                    else
                        panelsummary.Enabled = false;
                }
                if ((Convert.ToString(Session["type"]).ToLower()) == "dean")
                {
                    if (checkStatus == "AC" || checkStatus == "RC" || checkStatus == "RD")
                        panelsummary.Enabled = true;
                    else
                        panelsummary.Enabled = false;
                }
            }
            else
            {
                panelsummary.Enabled = false;
            }

            panOfficehours.Enabled = false;


        }
        else
        {
            GvTeachingSchedule.Enabled = true;
            GvResearchSchedule.Enabled = true;
            panelsummary.Enabled = true;
            panOfficehours.Enabled = true;

        }

    }

    public long GetTotalOfficeHours(long total)
    {
        
        officehourstotalduration += total;    
        return total;
    }

    public long GetTotalOffCampusHours(long total)
    {
        offcampustotalduration += total;
        return total;
    }

    public string GetOfficeHoursTotalFormat()
    {
        string hr = (officehourstotalduration / 60).ToString();
        string min = (officehourstotalduration % 60).ToString();
        return hr + " Hr " + min + " min ";
    }

    public string GetOffCampusHoursTotalFormat()
    {
        string hr = (offcampustotalduration / 60).ToString();
        string min = (offcampustotalduration % 60).ToString();
        return hr + " Hr " + min + " min ";
    }


    public Boolean GetEditStatus()
    {
        bool st = false;

        if (Request.QueryString["s"] == "other")
            st = false;
        else
            st = objMs.isGetEditStatus(Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"]));
        return st;
    }

    public Boolean GetSubmitButtonStatus()
    {

        return objMs.GetSubmitSt(Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"]));

    }





    protected void DetailsViewMainSchedule_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandArgument.ToString() == "new")
        {

            DetailsViewMainSchedule.ChangeMode(DetailsViewMode.Insert);


        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["TermId"] = DropDownList1.SelectedValue;

        Session["CTermId"] = DropDownList1.SelectedValue;       //test lin
        try
        {
            Session["TermName"] = DropDownList1.SelectedItem.Text;
        }
        catch { }
        DetailsViewMainSchedule.DataBind();
        OfficeHoursGridView.DataBind();
        GridViewOffCampus.DataBind();
        GvTeachingSchedule.DataBind();
        GvResearchSchedule.DataBind();


        UpdatePanelTeaching.Update();
        UpdatePanelResearch.Update();
        UpdatePanel1.Update();
        UpdatePanel3.Update();
        UpdatePaneloffcamp.Update();

        Response.Redirect("~/Forms/Schedule.aspx?s=mine");       //test lin
      
    }
    protected void GridViewOffCampus_SelectedIndexChanged(object sender, EventArgs e)
    {

        Session["OCId"] = Convert.ToInt32(GridViewOffCampus.DataKeys[GridViewOffCampus.SelectedRow.RowIndex].Value);
        DataTable dt2 = objOc.GetOffCampByOCId(Convert.ToInt32(Session["OCId"]));

        if (dt2.Rows.Count > 0)
        {
            popOffCampActivity = dt2.Rows[0]["Activity"].ToString();
            popOffCampOrganization = dt2.Rows[0]["Organization"].ToString();
        }
        lblPopupActivityName.Text = popOffCampActivity;
        lblPopupOrganizationName.Text = popOffCampOrganization;
        mdlPopup.Show();
        UpdatePanelPopUp.Update();
        //Set Validation visible to correct value so that the Off Campus Hours can be validated.  Dec. 2009 TAN
        if (CompareTimeOffCamp.Visible == false)
        {
            CompareTimeOffCamp.Visible = true;
        }
    }

    protected void GridViewPopOrg_SelectedIndexChanged(object sender, EventArgs e)
    {

        Session["OCId"] = Convert.ToInt32(GridViewPopOrg.DataKeys[GridViewPopOrg.SelectedRow.RowIndex].Value);
        DataTable dt1 = objOc.GetOffCampByOCId(Convert.ToInt32(Session["OCId"]));

        if (dt1.Rows.Count > 0)
        {
            popOffCampActivity = dt1.Rows[0]["Activity"].ToString();
            popOffCampOrganization = dt1.Rows[0]["Organization"].ToString();
        }
        lblActivityNameOCH.Text = popOffCampActivity;
        lblOrganizationNameOCH.Text = popOffCampOrganization;
        //Session["OCId"] = Convert.ToInt32(GridViewOffCampus.DataKeys[GridViewOffCampus.SelectedRow.RowIndex].Value);

        //mdlPopup.Show();
        //UpdatePanelPopUp.Update();
        //Set Validation visible to correct value so that the Off Campus Hours can be validated.  Dec. 2009 TAN
        DDLTimeFromInsideSpecAp.DataBind();
        DDLTimeToInsideSpecAp.DataBind();
        fieldsetpopupaddhours.Visible = true;
        //if (CompareTimeOffCampSpecAp.Visible == false)
        //{
        //    CompareTimeOffCampSpecAp.Visible = true;
        //}
    }

    protected void GvTeachingSchedule_SelectedIndexChanged(object sender, EventArgs e)
    {

     
        Session["ScheduleID"] = Convert.ToInt32(GvTeachingSchedule.DataKeys[GvTeachingSchedule.SelectedRow.RowIndex].Value);

        ModalpopupextenderPopUpTeaching.Show();
        UpdatePanelPopUpTeaching.Update();


    }

    protected void GvResearchSchedule_SelectedIndexChanged(object sender, EventArgs e)
    {

        Session["ScheduleID"] = Convert.ToInt32(GvResearchSchedule.DataKeys[GvResearchSchedule.SelectedRow.RowIndex].Value);

        ModalpopupextenderPopUpResearch.Show();
        UpdatePanelPopUpResearch.Update();
    }

    protected void ButtonExit_Click(object sender, EventArgs e)
    {
        CompareTimeOffCamp.Visible = false;       //Nov 2009 TAN
        mdlPopup.Hide();
        GridViewOffCampus.DataBind();
        UpdatePaneloffcamp.Update();
    }
    protected void ButtonADD_Click(object sender, EventArgs e)
    {
        string day = DropDownListDayInside.SelectedValue;

        //Replace text box times with time picker drop down boxes. Nov 2009 TAN
        DateTime from = Convert.ToDateTime(DDLTimeFromInside.SelectedItem.Text);
        DateTime to = Convert.ToDateTime(DDLTimeToInside.SelectedItem.Text);

        //Update the off campus hours in the "Edit Hours" pop up only if to time is greater than from time.    //Nov 2009 TAN
        //Note: The Update function is not currently working. Dec. 2009 TAN
        if (CompareTimeOffCamp.IsValid)
        {
            objOc.InsertOffCampHrs(day, from, to, Convert.ToInt64(Session["OCId"]));
            DropDownListDayInside.SelectedIndex = 0;
        }
       
        GridViewOffCampus.DataBind();
        UpdatePaneloffcamp.Update();
        GridViewPopOrg.DataBind();
        //GridViewPopUP.DataBind();
        mdlPopup.Hide();
        
    }

    protected void ButtonADDSpecAp_Click(object sender, EventArgs e)
    {

        string day = DropDownListDayInsideSpecAp.SelectedValue;

        //Replace text box times with time picker drop down boxes. Nov 2009 TAN
        DateTime from = Convert.ToDateTime(DDLTimeFromInsideSpecAp.SelectedItem.Text);
        DateTime to = Convert.ToDateTime(DDLTimeToInsideSpecAp.SelectedItem.Text);
        
        //Update the off campus hours in the "Edit Hours" pop up only if to time is greater than from time.    //Nov 2009 TAN
        //Note: The Update function is not currently working. Dec. 2009 TAN
        if (CompareTimeOffCampSpecAp.IsValid)
        {
            objOc.InsertOffCampHrs(day, from, to, Convert.ToInt64(Session["OCId"]));
            DropDownListDayInside.SelectedIndex = 0;
        }
        //GridViewPopUP.DataBind();
        GridViewPopOrg.DataBind();
        fieldsetpopupaddhours.Visible = false;
    }

    protected void ButtonCancelSpecAp_Click(object sender, EventArgs e)
    {
        fieldsetpopupaddhours.Visible = false;
       
    }

    protected void ButtonExitOrg_Click(object sender, EventArgs e)
    {
        CompareTimeOffCamp.Visible = false;    //Dec 2009 TAN
        Modalpopupextender1.Hide();
        GridViewOffCampus.DataBind();
        UpdatePaneloffcamp.Update();
        CompareTimeOffCampSpecAp.Visible = false;
    }
    protected void ButtonAddOrg_Click(object sender, EventArgs e)
    {
        TextBoxAct.Enabled = true;
        TextBoxOrg.Enabled = true;
        string activity = TextBoxAct.Text;
        string org = TextBoxOrg.Text;
        objOc.InsertOffCampus(Convert.ToInt32(Session["FacId"]), activity, org, Convert.ToInt32(Session["TermId"]));
        TextBoxAct.Text = "";
        TextBoxOrg.Text = "";
        GridViewPopOrg.DataBind();


    }
    protected void LinkButtonPopOrg_Click(object sender, EventArgs e)
    {
        Modalpopupextender1.Show();
    }
    protected void ButtonSubmitChair_Click(object sender, EventArgs e)
    {
        objMs.UpdateStatus("SC", Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"]));
        DetailsViewMainSchedule.DataBind();
        GvTeachingSchedule.DataBind();
        GvResearchSchedule.DataBind();
        OfficeHoursGridView.DataBind();
        GridViewOffCampus.DataBind();
        UpdatePanel1.Update();
        UpdatePaneloffcamp.Update();
        UpdatePanel3.Update();
        //ButtonSubmitChair.Enabled = GetSubmitButtonStatus();
        ButtonSubmitChair.Enabled = false; //RZL added to disable button

        string facmail = "";
        string facname = "";

        DataTable dt1 = objF.GetFacultyEmailId(Convert.ToInt32(Session["FacId"]));
        if (dt1.Rows.Count > 0)
        {
            facmail = dt1.Rows[0]["Email"].ToString();
            facname = dt1.Rows[0]["name"].ToString();

        }
        DataTable dt = objF.GetChairEmail(Convert.ToInt32(Session["DeptID"]));
        string chairname = "";
        string chairmail = "";

        if (dt.Rows.Count > 0)
        {

            chairname = dt.Rows[0]["name"].ToString();
            chairmail = dt.Rows[0]["Email"].ToString();
        }
        string FacultyComments = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxFCItem"))).Text;
        string ChairComments = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxCCItem"))).Text;
        string DeanComments = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxDCItem"))).Text;
        if (FacultyComments == "")
            FacultyComments = "No Comments";
        if (ChairComments == "")
            ChairComments = "No Comments";
        if (DeanComments == "")
            DeanComments = "No Comments";

        try
        {
            objM.message(facname, chairname, FacultyComments, ChairComments, DeanComments, chairmail, facmail, "sc");
        }
        catch (Exception ex)
        {
            Response.Redirect("schedule.aspx?" + pageQueryString);
        }


    }
    protected void ButtonApprove_Command(object sender, CommandEventArgs e)
    {
        saveComments();
        string facmail = "";
        string facname = "";
        DataTable dt1 = objF.GetFacultyEmailId(Convert.ToInt32(Session["FacId"]));

        if (dt1.Rows.Count > 0)
        {
            facmail = dt1.Rows[0]["Email"].ToString();
            facname = dt1.Rows[0]["name"].ToString();
        }
        DataTable dt = objF.GetChairEmail(Convert.ToInt32(Session["DeptID"]));
        string chairname = "";
        string chairmail = "";
        if (dt.Rows.Count > 0)
        {
            chairname = dt.Rows[0]["name"].ToString();
            chairmail = dt.Rows[0]["Email"].ToString();
        }
        string FacultyComments = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxFC"))).Text;
        string ChairComments = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxCC"))).Text;
        string DeanComments = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxDC"))).Text;
        if (FacultyComments == "")
            FacultyComments = "No Comments";
        if (ChairComments == "")
            ChairComments = "No Comments";
        if (DeanComments == "")
            DeanComments = "No Comments";
        if ((Convert.ToString(Session["type"]).ToLower()) == "chair")
        {
            objMs.UpdateStatus("AC", Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"]));
            objM.message(facname, chairname, FacultyComments, ChairComments, DeanComments, chairmail, facmail, "ac");

        }
        if ((Convert.ToString(Session["type"]).ToLower()) == "dean")
        {
            objMs.UpdateStatus("AD", Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"]));
            objM.message(facname, chairname, FacultyComments, ChairComments, DeanComments, chairmail, facmail, "ad");
        }

        DetailsViewMainSchedule.DataBind();
        GetSettings();
        UpdatePanel1.Update();
        UpdatePaneloffcamp.Update();
        UpdatePanel3.Update();
        ButtonApprove.Enabled = false;
        ButtonDecline.Enabled = false;


    }
    protected void ButtonDecline_Command(object sender, CommandEventArgs e)
    {
        saveComments();
        string facmail = "";
        string facname = "";
        DataTable dt1 = objF.GetFacultyEmailId(Convert.ToInt32(Session["FacId"]));

        if (dt1.Rows.Count > 0)
        {
            facmail = dt1.Rows[0]["Email"].ToString();
            facname = dt1.Rows[0]["name"].ToString();
        }
        DataTable dt = objF.GetChairEmail(Convert.ToInt32(Session["DeptID"]));
        string chairname = "";
        string chairmail = "";
        if (dt.Rows.Count > 0)
        {
            chairname = dt.Rows[0]["name"].ToString();
            chairmail = dt.Rows[0]["Email"].ToString();
        }
        string FacultyComments = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxFC"))).Text;
        string ChairComments = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxCC"))).Text;
        string DeanComments = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxDC"))).Text;
        if (FacultyComments == "")
            FacultyComments = "No Comments";
        if (ChairComments == "")
            ChairComments = "No Comments";
        if (DeanComments == "")
            DeanComments = "No Comments";

        if ((Convert.ToString(Session["type"]).ToLower()) == "chair")
        {
            objMs.UpdateStatus("RC", Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"]));
            objM.message(facname, chairname, FacultyComments, ChairComments, DeanComments, chairmail, facmail, "rc");

        }
        if ((Convert.ToString(Session["type"]).ToLower()) == "dean")
        {
            objMs.UpdateStatus("RD", Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"]));
            objM.message(facname, chairname, FacultyComments, ChairComments, DeanComments, chairmail, facmail, "rd");

        }
        DetailsViewMainSchedule.DataBind();
        GetSettings();
        UpdatePanel1.Update();
        UpdatePaneloffcamp.Update();
        UpdatePanel3.Update();
        ButtonApprove.Enabled = false;
        ButtonDecline.Enabled = false;

    }


    public void GetSettings()
    {
        if (Request.QueryString["s"] == "mine")
        {
            pageQueryString = "s=mine";
            DropDownList1.Visible = true;
            ButtonSubmitChair.Visible = true;
            ButtonApprove.Visible = false;
            ButtonDecline.Visible = false;
            ButtonSave.Visible = false;
            ButtonExitInbox.Visible = false;
           
            Session["TermId"] = Session["CTermId"];
            Session["FacId"] = Session["CFacId"];
        }
        if (Request.QueryString["s"] == "other")
        {
            pageQueryString = "s=other";
            ButtonSave.Visible = true;
            ButtonExitInbox.Visible = true;
            DropDownList1.Visible = false;
            ButtonSubmitChair.Visible = false;
            ButtonApprove.Visible = true;
            ButtonDecline.Visible = true;
            Session["FacId"] = Request.QueryString["id"];
            Session["TermId"] = Request.QueryString["tid"];
            pageQueryString = "s=other&id=" + Session["FacId"] + "&tid = " + Session["TermId"];
            DetailsViewMainSchedule.ChangeMode(DetailsViewMode.Edit);

            /* Comment this Code just because its working with login as a chair but not with login as a dean */
            
            //if ((Session["FacId"].ToString()) == (Session["CFacId"].ToString()))
            //{

            //    Response.Redirect("~/Forms/Schedule.aspx");
            //    DetailsViewMainSchedule.ChangeMode(DetailsViewMode.Edit);
            //}
            
            if ((Convert.ToString(Session["type"]).ToLower()) == "chair")
            {
                //RZL added 01/2009; Session["CC"] set to false, so chair can edit chair comment
                Session["FC"] = true;
                Session["CC"] = false;
                Session["DC"] = true;
                ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxCC"))).Enabled = true;

                ((Label)(DetailsViewMainSchedule.FindControl("LabelOC"))).Visible = true;
                ((Label)(DetailsViewMainSchedule.FindControl("LabelRT"))).Visible = true;

                ((Label)(DetailsViewMainSchedule.FindControl("LabelCom"))).Visible = true;
                ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxOC"))).Visible = false;
                ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxRT"))).Visible = false;
                ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxCom"))).Visible = false;
                ((LinkButton)(DetailsViewMainSchedule.FindControl("LinkButtonSave"))).Visible = false;
                ((LinkButton)(DetailsViewMainSchedule.FindControl("LinkButtonCancel"))).Visible = false;

            }
            if ((Convert.ToString(Session["type"]).ToLower()) == "dean")
            {

                ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxDC"))).Enabled = true;
                ((Label)(DetailsViewMainSchedule.FindControl("LabelOC"))).Visible = true;
                ((Label)(DetailsViewMainSchedule.FindControl("LabelRT"))).Visible = true;

                ((Label)(DetailsViewMainSchedule.FindControl("LabelCom"))).Visible = true;
                ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxOC"))).Visible = false;
                ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxRT"))).Visible = false;
                ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxCom"))).Visible = false;
                ((LinkButton)(DetailsViewMainSchedule.FindControl("LinkButtonSave"))).Visible = false;
                ((LinkButton)(DetailsViewMainSchedule.FindControl("LinkButtonCancel"))).Visible = false;

            }

        }
        //DataTable dt = objF.GetChairEmail(Convert.ToInt32(Session["DeptID"]));
        //DataTable dt11 = objF.GetDeptIDByFacID(Convert.ToInt16(Session["FacID"]));
        //string chairname = "";
        //string chairmail = "";
        //if (dt.Rows.Count > 0)
        //{
        //    chairname = dt.Rows[0]["name"].ToString();
        //    chairmail = dt.Rows[0]["Email"].ToString();
        //}

    }



    protected void LinkButtonInsert_Click(object sender, EventArgs e)
    {
        decimal overload;
        decimal rt;
        float com;


        string soverload = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxOverloadI"))).Text;
        string srt = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxRelTim"))).Text;
        string co = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxC"))).Text;
        if (soverload != "")
            overload = Convert.ToDecimal(soverload);
        else
            overload = 0;
        if (srt != "")
            rt = Convert.ToDecimal(srt);
        else
            rt = 0;
        if (co != "")
            com = float.Parse(co);
        else
            com = 0;


        string FacultyComments = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxFCI"))).Text;
        string ChairComments = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxCCI"))).Text;
        string DeanComments = ((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxDCI"))).Text;
        objMs.InsertMainSchedule(Convert.ToInt32(Session["FacId"]), "S", overload, rt, com, FacultyComments, ChairComments, DeanComments, Convert.ToInt32(Session["TermId"]));
        DetailsViewMainSchedule.DataBind();
        DetailsViewMainSchedule.ChangeMode(DetailsViewMode.ReadOnly);
        ButtonSubmitChair.Enabled = true;
    }

    protected void ButtonAddOH_Click(object sender, EventArgs e)
    {
        string day = DropDownListDayOH.SelectedValue;

        //Replace text box times with time picker drop down boxes. Nov. 2009 TAN
        DateTime fromtime = Convert.ToDateTime(DropDownListFromHourOH.SelectedItem.Text);
        DateTime totime = Convert.ToDateTime(DropDownListToHourOH.SelectedItem.Text);

        //Update the office hours in the "Add Office Hours" pop up only if to time is greater than from time.    //Nov 2009 TAN
        if (compTimePopUp.IsValid)
        {
            objOH.InsertOfficeHrs(Convert.ToInt32(Session["FacId"]), day, fromtime, totime, Convert.ToInt32(Session["TermId"]));
            // DropDownListDayOH.SelectedIndex = 0;       //Don't reset the index             //Nov 2009 TAN
        }

        GridViewPopupOH.DataBind();
    }

    protected void ButtonPrintSchedule_Command(object sender, CommandEventArgs e)
    {
        ArrayList al = new ArrayList();
        al.Add(Session["FacId"]);
        Session["FacArray"] = al;
        Response.Redirect("~/Forms/SchedulePrint.aspx");

        //Session["ctrl"] = Panel1;


    }
    protected void ButtonPrintDoorSchedule_Command(object sender, CommandEventArgs e)
    {

        Response.Redirect("~/Forms/DoorSchedulePrint.aspx");

    }
    protected void ButtonExitOHPOPup_Click(object sender, EventArgs e)
    {
        compTimePopUp.Visible = false;       //Nov 2009 TAN
        mdlpopOH.Hide();
        OfficeHoursGridView.DataBind();
        UpdatePanel3.Update();
    }


    protected void ButtonExitTeachingHrs_Click(object sender, EventArgs e)
    {
        ModalpopupextenderPopUpTeaching.Hide();
        GvTeachingSchedule.DataBind();
        UpdatePanelTeaching.Update();
    }

    protected void ButtonExitResearchHrs_Click(object sender, EventArgs e)
    {
        ModalpopupextenderPopUpResearch.Hide();
        GvResearchSchedule.DataBind();
        UpdatePanelResearch.Update();
    }

    protected void ButtonExitTeachingSche_Click(object sender, EventArgs e)
    {
        ModalpopupextenderTeachingPopSche.Hide();
        GvTeachingSchedule.DataBind();
        UpdatePanelTeaching.Update();
    }

    protected void ButtonExitResearchSche_Click(object sender, EventArgs e)
    {
        ModalpopupextenderResearchPopSche.Hide();
        GvResearchSchedule.DataBind();
        UpdatePanelResearch.Update();
    }

    protected void ButtonADDTeachingHrs_Click(object sender, EventArgs e)
    {
        string day = DropDownListTechDay.SelectedValue;
        DateTime from = Convert.ToDateTime(TextBoxTeachFrom.Text);
        DateTime to = Convert.ToDateTime(TextBoxTeachTo.Text);
        TextBoxTeachFrom.Text = "";
        TextBoxTeachTo.Text = "";
        DropDownListTechDay.SelectedIndex = 0;

        objT.InsertTeahScheTimings(Convert.ToInt32(Session["ScheduleID"]), day, from, to);
        GridViewPopUpTeachingHrs.DataBind();
        GvTeachingSchedule.DataBind();

    }
    protected void LinkButtonInsertnewOH_Command(object sender, CommandEventArgs e)
    {
        Session["TermId"] = DropDownList1.SelectedValue;
        GridViewPopupOH.DataBind();
        //Set visible to correct value.   Nov 2009 TAN
        if (compTimePopUp.Visible == false)
        {
            compTimePopUp.Visible = true;
        }
        mdlpopOH.Show();
    }
    protected void LinkButtonTeachingNew_Click(object sender, EventArgs e)
    {
        ModalpopupextenderTeachingPopSche.Show();
    }

    protected void LinkButtonResearchNew_Click(object sender, EventArgs e)
    {
        ModalpopupextenderResearchPopSche.Show();
    }


    protected void ButtonSave_Command(object sender, CommandEventArgs e)
    {
        saveComments();
    }
    protected void ButtonExitInbox_Command(object sender, CommandEventArgs e)
    {
        if ((Convert.ToString(Session["type"]).ToLower()) == "chair")
        {
            Response.Redirect("~/Chair/Inbox.aspx");
        }
        if ((Convert.ToString(Session["type"]).ToLower()) == "dean")
        {
            Response.Redirect("~/Dean/InboxAllDept.aspx");
        }
    }
    /* 
      protected void LinkButtonTeaching_Command(object sender, CommandEventArgs e)
      {
          GridViewPopTeachingSche.DataBind();
          ModalpopupextenderTeachingPopSche.Show();
      }*/
    protected void LinkButtonInsertTeaching_Click(object sender, EventArgs e)
    {
        string coursecode = ((TextBox)(DetailsViewPopUpTeachingSch.FindControl("TextBoxCourseCode"))).Text;
        string coursetitle = ((TextBox)(DetailsViewPopUpTeachingSch.FindControl("TextBoxCourseTitle"))).Text;
        //string section = ((TextBox)(DetailsViewPopUpTeachingSch.FindControl("TextBoxSection"))).Text;
        string tc = ((TextBox)(DetailsViewPopUpTeachingSch.FindControl("TextBoxtc"))).Text;
        //RZL changed teaching credit to decimal instead of string 5/11/2009
        decimal teachingCredit;
        if (tc != "")
            teachingCredit = Convert.ToDecimal(tc);
        else
            teachingCredit = 0;
        //RZL changed student credit to int16 instead of string 5/11/2009
        string sc = ((TextBox)(DetailsViewPopUpTeachingSch.FindControl("TextBoxsc"))).Text;
        Int16 studentCredits;
        if (sc != "")
            studentCredits = Convert.ToInt16(sc);
        else
            studentCredits = 0;

        string loc = ((TextBox)(DetailsViewPopUpTeachingSch.FindControl("TextBoxloc"))).Text;
        Boolean tt = ((CheckBox)(DetailsViewPopUpTeachingSch.FindControl("CheckBoxtt"))).Checked;
        string meetingdays = ((TextBox)(DetailsViewPopUpTeachingSch.FindControl("TextBoxMeeting"))).Text;
        string starttime = ((TextBox)(DetailsViewPopUpTeachingSch.FindControl("TextBoxSt"))).Text;
        string endtime = ((TextBox)(DetailsViewPopUpTeachingSch.FindControl("TextBoxEt"))).Text;
        //string of = ((TextBox)(DetailsViewPopUpTeachingSch.FindControl("TextBoxof"))).Text;
        objS.InsertSchedule(Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"]), coursecode, coursetitle, teachingCredit, studentCredits, loc, tt, meetingdays, starttime, endtime);

        DetailsViewPopUpTeachingSch.DataBind();
        //GridViewPopTeachingSche.DataBind();
        UpdatePanelTeachingPopSche.Update();
    }

    protected void LinkButtonInsertResearch_Click(object sender, EventArgs e)
    {
        string coursecode = ((TextBox)(DetailsViewPopUpResearchSch.FindControl("TextBoxCourseCode"))).Text;
        string coursetitle = ((TextBox)(DetailsViewPopUpResearchSch.FindControl("TextBoxCourseTitle"))).Text;
        //string section = ((TextBox)(DetailsViewPopUpTeachingSch.FindControl("TextBoxSection"))).Text;
        string tc = ((TextBox)(DetailsViewPopUpResearchSch.FindControl("TextBoxtc"))).Text;
        //RZL changed teaching credit to decimal instead of string 5/11/2009
        decimal teachingCredit;
        if (tc != "")
            teachingCredit = Convert.ToDecimal(tc);
        else
            teachingCredit = 0;
        //RZL changed student credit to int16 instead of string 5/11/2009
        string sc = ((TextBox)(DetailsViewPopUpResearchSch.FindControl("TextBoxsc"))).Text;
        Int16 studentCredits;
        if (sc != "")
            studentCredits = Convert.ToInt16(sc);
        else
            studentCredits = 0;

        string loc = ((TextBox)(DetailsViewPopUpResearchSch.FindControl("TextBoxloc"))).Text;
        Boolean tt = ((CheckBox)(DetailsViewPopUpResearchSch.FindControl("CheckBoxtt"))).Checked;
        string meetingdays = ((TextBox)(DetailsViewPopUpResearchSch.FindControl("TextBoxMeeting"))).Text;
        string starttime = ((TextBox)(DetailsViewPopUpResearchSch.FindControl("TextBoxSt"))).Text;
        string endtime = ((TextBox)(DetailsViewPopUpResearchSch.FindControl("TextBoxEt"))).Text;
        //string type = "R";
        //string of = ((TextBox)(DetailsViewPopUpResearchSch.FindControl("TextBoxof"))).Text;
        objS.InsertResearchSchedule(Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"]), coursecode, coursetitle, teachingCredit, studentCredits, loc, tt, meetingdays, starttime, endtime, "R");
        DetailsViewPopUpResearchSch.DataBind();
        //GridViewPopTeachingSche.DataBind();
        UpdatePanelResearchPopSche.Update();
    }

    public void saveComments()
    {
        if ((Convert.ToString(Session["type"]).ToLower()) == "chair")
        {

            objMs.UpdateChairComments(((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxCC"))).Text, (int)(DetailsViewMainSchedule.DataKey.Value));
        }
        if ((Convert.ToString(Session["type"]).ToLower()) == "dean")
        {

            objMs.UpdateDeanComments(((TextBox)(DetailsViewMainSchedule.FindControl("TextBoxDC"))).Text, (int)(DetailsViewMainSchedule.DataKey.Value));
        }

    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DropDownList1.SelectedValue = Session["TermId"].ToString();
    }

    protected void RadioButtonListSpecAp_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonListSpecAp.Text == "Activity")
        {
            TextBoxAct.Enabled = true;
            TextBoxOrg.Enabled = true;
            lblActivity.Text = "Activity";
            TextBoxAct.Text = "";
            TextBoxOrg.Text = "";
            TextBoxAct.Visible = true;
            ButtonAddOrg.Visible = true;
            fieldsetpopupaddhours.Visible = false;
        }
        else
        {
            lblActivity.Text = "Special Appointment";
            TextBoxAct.Text = "Special Appointment";
            DataTable dtDeptName = objF.GetDeptNameByFacID(Convert.ToInt32(Session["FacId"]));
            TextBoxOrg.Text = dtDeptName.Rows[0]["DeptName"].ToString();
            TextBoxOrg.Enabled = false;
            TextBoxAct.Enabled = false;
            fieldsetpopupaddhours.Visible = false;
            
        }

    }

    protected void LinkButtonEditHoursSpecAp_Click(object sender, EventArgs e)
    {
        
    }

    protected void GridViewPopUP_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    public decimal GetTeachingCredits(decimal TCredit)
    {
        TotalTeachingCredits += TCredit;
        return TCredit;
    }
    public decimal GetTotalTeachingCredits()
    {
        return TotalTeachingCredits;
    }
    public decimal GetStudentCredits(decimal SCredit)
    {
        TotalStudentCredits += SCredit;
        return SCredit;
    }
    public decimal GetTotalStudentCredits()
    {
        return TotalStudentCredits;
    }
    public decimal GetResearchTeachingCredits(decimal ResearchTCredit)
    {
        TotalResearchTeachingCredits += ResearchTCredit;
        return ResearchTCredit;
    }
    public decimal GetTotalResearchTeachingCredits()
    {
        return TotalResearchTeachingCredits;
    }
    public decimal GetResearchStudentCredits(decimal ResearchSCredit)
    {
        TotalResearchStudentCredits += ResearchSCredit;
        return ResearchSCredit;
    }
    public decimal GetTotalResearchStudentCredits()
    {
        return TotalResearchStudentCredits;
    }


    /*protected void btnCopyTeachingSchedule(object sender, EventArgs e)
    {
        objS.CopyScheduleToCurrentSemister(Convert.ToInt32(Session["TermID"]), Convert.ToInt32(Session["CTermID"]), Convert.ToInt32(Session["FacId"]));
        Session["TermID"] = Session["CTermID"];
        DropDownList1.SelectedValue = Session["TermID"].ToString();
        lblMsg.Text = "Schedule copied to current semester";
        

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        objS.CopyResearchScheduleToCurrentSemister(Convert.ToInt32(Session["TermID"]), Convert.ToInt32(Session["CTermID"]), Convert.ToInt32(Session["FacId"]));
        Session["TermID"] = Session["CTermID"];
        DropDownList1.SelectedValue = Session["TermID"].ToString();
        lblMsg2.Text = "Schedule copied to current semester";

    }*/


    protected void btnCopyOfficeHours_Click(object sender, EventArgs e)
    {
        Response.Redirect("OfficeHours.aspx");

    }

    protected void btnRefreshTotalHours_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Forms/Schedule.aspx?s=mine");       //test lin
    }
}
