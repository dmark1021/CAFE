using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DeanDSTableAdapters;

[System.ComponentModel.DataObject]

public class MainScheduleBll
{
    private MainScheduleTableAdapter _msAdapter = null;
    protected MainScheduleTableAdapter Adapter
    {
        get
        {
            if (_msAdapter == null)
                _msAdapter = new MainScheduleTableAdapter();

            return _msAdapter;
        }
    }

  
    [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, false)]
    public Boolean isGetEditStatus(int facultyid,int termid)
    {
        bool flag = true;
        DataTable dt = Adapter.GetEditStatus(facultyid,termid);
        if (dt.Rows.Count == 0)
            flag = true;
        else
            flag =  Convert.ToBoolean(dt.Rows[0]["EditStatus"]);

        return flag;

    }

    [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.MainScheduleDataTable GetEditStatus(int facultyid, int termid)
    {
        //bool flag = true;
        //DataTable dt = Adapter.GetEditStatus(facultyid,termid);
        //if (dt.Rows.Count == 0)
        //    flag = true;
        //else
        //    flag =  Convert.ToBoolean(dt.Rows[0]["EditStatus"]);

        //return flag;
        return Adapter.GetEditStatus(facultyid, termid);

    }

    [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, false)]
    public Boolean GetSubmitSt(int facultyid, int termid)
    {
        bool flag = false;
        DataTable dt = Adapter.GetSubmitSt(facultyid, termid);
        if(dt.Rows.Count==0)
             flag=false;
        else
        flag = Convert.ToBoolean(dt.Rows[0]["EditStatus"]);

        return flag;

    }


         [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, true)]
    public DeanDS.MainScheduleDataTable GetMainSchedByFac(int termid,int facultyid)
    {
       return Adapter.GetMainSchedByFac(termid,facultyid);

      

    }
    
               [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, true)]
         public DeanDS.MainScheduleDataTable GetPrintScheduleByChair(int deptid,int termid, string status)
    {
        return Adapter.GetPrintScheduleByChair(deptid,termid,status);

      

    }
 
    [System.ComponentModel.DataObjectMethodAttribute
    (System.ComponentModel.DataObjectMethodType.Insert, false)]
    public void InsertMainSchedule(int facultyid,string status,decimal overloadcredits, decimal releasetime, float compensation,string FacultyComments,string ChairComments,string DeanComments,int termid)
    {
        Adapter.InsertMainSchedule(facultyid, status, overloadcredits, releasetime, compensation,FacultyComments,ChairComments,DeanComments, termid);



    }


    [System.ComponentModel.DataObjectMethodAttribute
   (System.ComponentModel.DataObjectMethodType.Update,false)]
    public void UpdateStatus( string status,int facultyid,int termid)
    {
        Adapter.UpdateStatus(status,facultyid, termid);
    }
  
    [System.ComponentModel.DataObjectMethodAttribute
   (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.MainScheduleDataTable GetInbox(int DeptId,int termid)
    {
        return Adapter.GetInbox(DeptId,termid);



    }

        [System.ComponentModel.DataObjectMethodAttribute
   (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.MainScheduleDataTable GetInboxForDean(int deptid)
    {
        return Adapter.GetInboxForDean(deptid);



    }

    //Added this method so that the termId is used to get the inbox information TAN June 2009
        [System.ComponentModel.DataObjectMethodAttribute
    (System.ComponentModel.DataObjectMethodType.Select, false)]
     public DeanDS.MainScheduleDataTable GetInboxForDeanByTerm(int deptid, int termId)
     {
         return Adapter.GetInboxForDeanByTerm(deptid, termId);



     }

       [System.ComponentModel.DataObjectMethodAttribute
   (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.MainScheduleDataTable GetAllSchedules(int DeptId,int termid)
    {
        return Adapter.GetAllSchedules(DeptId,termid);



    }
     [System.ComponentModel.DataObjectMethodAttribute
   (System.ComponentModel.DataObjectMethodType.Update, true)]
       public void UpdateMainSchedule(decimal OverloadCredits, decimal ReleaseTime,float Compensation,string FacultyComments,string ChairComments,string DeanComments,int Original_MSId )
    {

         Adapter.UpdateMainSchedule(OverloadCredits,ReleaseTime,Compensation,FacultyComments,ChairComments,DeanComments,Original_MSId);



    }

           [System.ComponentModel.DataObjectMethodAttribute
   (System.ComponentModel.DataObjectMethodType.Update, false)]
       public void UpdateDeanComments(string DeanComments,int Original_MSId )
    {

         Adapter.UpdateDeanComments(DeanComments,Original_MSId);



    }
           [System.ComponentModel.DataObjectMethodAttribute
                (System.ComponentModel.DataObjectMethodType.Update, false)]
           public void UpdateChairComments(string ChairComments, int Original_MSId)
           {

               Adapter.UpdateChairComments(ChairComments, Original_MSId);

           }


           [System.ComponentModel.DataObjectMethodAttribute
                       (System.ComponentModel.DataObjectMethodType.Update, false)]
           public int HasSchedule(int facultyid, int termid)
           {


               //return flag;
               return (int)Adapter.HasSchedule(facultyid, termid);

           }


}