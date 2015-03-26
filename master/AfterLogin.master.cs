using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class master_AfterLogin : System.Web.UI.MasterPage
{
        
        protected void Page_Load(object sender, EventArgs e)
    {
      

        DateTime dateTime = DateTime.Now;
            
           // string name = "";

            dateLabel.Text = String.Format("{0:D}", dateTime);
            lblname.Text = Session["Facname"].ToString();
           

            /*
            MembershipUser currentUser = Membership.GetUser();
            FullNameBll objName = new FullNameBll();
            
            name = (objName.GetFullNameById(currentUser.UserName)).ToString();
            lblname.Text = name;
            */
         
      

            /*
            string[] rolestr = new string[4];
            rolestr = Roles.GetRolesForUser();
            string role;

            //Only Chair have two roles Chair and Faculty.For Chair role we come out of the loop
            //we dont need to display faculty role when he/she is chair.
            for (int i = 0; i < rolestr.Length; i++)
            {
                Response.Write("" + rolestr[i]);
                if (String.Equals(rolestr[i].ToLower(), "chair".ToLower()))
                {
                    role = rolestr[i];
                    break;

                }
                role = rolestr[i];
            }*/
          //if postback
     
   
    }//Method Page Load

  

    //protected void BtnSave_Click(object sender, EventArgs args)
    //{/*
    //    if (this.Page.IsValid)
    //    {
    //        //  move the data back to the data object
    //        this.dvCustomerDetail.UpdateItem(false);
    //        this.dvCustomerDetail.Visible = false;

    //        //  hide the modal popup
    //        this.mdlPopup.Hide();

    //        //  add the css class for our yellow fade
    //        ScriptManager.GetCurrent(this).RegisterDataItem(
    //            // The control I want to send data to
    //            this.gvCustomers,
    //            //  The data I want to send it (the row that was edited)
    //            this.gvCustomers.SelectedIndex.ToString()
    //        );

    //        //  refresh the grid so we can see our changed
    //        this.gvCustomers.DataBind();
    //        this.updatePanel.Update();
    //    }*/
    //}


    //protected void LinkButton1_Click(object sender, EventArgs e)
    //{

    //    //  set it to true so it will render
    //    DropDownList1.Visible = true;
    //   //DropDownList3.Visible = true;
    //    DropDownList2.Visible = true;
    //    //  force databinding
     
     

    //        //  update the contents in the detail panel
    //    this.updPnlCustomerDetail.Update();
    //    //  show the modal popup
    //    this.mdlPopup.Show();
    //}
    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DropDownList2.Enabled = true;
    //    DropDownList2.DataBind();
    //    this.updPnlCustomerDetail.Update();
    //    this.mdlPopup.Show();
    //}



     
        protected void Menu1_DataBound(object sender, EventArgs e)
        {
            MainScheduleBll objMs = new MainScheduleBll();
            DepartmentBll objD = new DepartmentBll();
            MenuItemCollection mc = Menu1.Items;


            if (Convert.ToString(Session["type"]).ToLower() == "dean")
            {
                //Changed GetInbox to pass termId & collId.  June 2009 TAN
                mc[3].Text = "View Schedules(" + objD.GetInbox(Convert.ToInt32(Session["termId"]), Convert.ToInt32(Session["collId"])) + ")";
                Menu1.Items.Remove(mc[4]);
                Menu1.Items.Remove(mc[2]);
                Menu1.Items.Remove(mc[1]);
                Menu1.Items.Remove(mc[0]);        


            }
              if(Convert.ToString(Session["type"]).ToLower()=="faculty")
              {
                  Menu1.Items.Remove(mc[5]);
                  Menu1.Items.Remove(mc[4]);
                  Menu1.Items.Remove(mc[3]);
                  Menu1.Items.Remove(mc[2]);
                  Menu1.Items.Remove(mc[1]);

              }
              if (Convert.ToString(Session["type"]).ToLower() == "chair")
              {
                  Menu1.Items.Remove(mc[5]);
                  Menu1.Items.Remove(mc[3]);

                  DataTable dt = objMs.GetInbox(Convert.ToInt32(Session["DeptID"]),Convert.ToInt32(Session["CTermId"]));
                  mc[2].Text = "Inbox(" + dt.Rows.Count + ")";

              }

        }
       
}