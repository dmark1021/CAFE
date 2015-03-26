using System;
using System.Collections;
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

public class ScheduleBll
{
    private ScheduleTableAdapter _sAdapter = null;
       protected ScheduleTableAdapter Adapter
    {
        get
        {
            if (_sAdapter == null)
                _sAdapter = new ScheduleTableAdapter();

            return _sAdapter;
        }
    }


    [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Select, false)]
    
    public DeanDS.ScheduleDataTable GetScheduleByTerm(int termid, int facultyid)
    {
        return Adapter.GetScheduleByTerm(termid,facultyid);
    }
    
    [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Select, true)]
    public DeanDS.ScheduleDataTable GetSchedule()
    {
        return Adapter.GetSchedule();
    }

    [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.ScheduleDataTable GetResearchScheduleByTerm(int termid, int facultyid)
    {
        return Adapter.GetResearchScheduleByTerm(termid,facultyid);
    }

    [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Select, true)]
    public DeanDS.ScheduleDataTable GetResearchSchedule()
    {
        return Adapter.GetResearchSchedule();
    }


    [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Insert, true)]
    public void InsertSchedule(int facultyid, int termid, string coursecode, string coursetitle, decimal stc, Int16 ssc, string location, Boolean tt, string meetingdays, string starttime, string endtime)
    {
        //RZL changed teaching credits type to be decimal 5/11/2009
        Adapter.InsertSchedule(facultyid, termid, coursecode, coursetitle, stc, ssc, location, tt, meetingdays, starttime, endtime);
    }

    [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Insert, true)]
    public void InsertResearchSchedule(int facultyid, int termid, string coursecode, string coursetitle, decimal stc, Int16 ssc, string location, Boolean tt, string meetingdays, string starttime, string endtime,string type)
    {
        //RZL changed teaching credits type to be decimal 5/11/2009
        Adapter.InsertResearchSchedule(facultyid, termid, coursecode, coursetitle, stc, ssc, location, tt, meetingdays, starttime, endtime,type);
    }

    [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Update, true)]
   
    public void UpdateSchedule(string coursecode, string coursetitle, decimal teachingcredits, Int16 studentcredits, string location, Boolean teamtaught, string meetingdays,string starttime,string endtime,int Original_ScheduleID)
    {
        Adapter.UpdateSchedule(coursecode, coursetitle,teachingcredits, studentcredits, location, teamtaught,meetingdays,starttime,endtime,Original_ScheduleID);
    }
    [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Delete, true)]
    public void DeleteSchedule(int Original_ScheduleID)
    {
        Adapter.DeleteSchedule(Original_ScheduleID);
    }

    [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Update, true)]

    public void UpdateResearchSchedule(string coursecode, string coursetitle, decimal teachingcredits, Int16 studentcredits, string location, Boolean teamtaught, string meetingdays, string starttime, string endtime, int Original_ScheduleID)
    {
        Adapter.UpdateResearchSchedule(coursecode, coursetitle, teachingcredits, studentcredits, location, teamtaught, meetingdays, starttime, endtime, Original_ScheduleID);
       // Adapter.UpdateSchedule(coursecode, coursetitle, teachingcredits, studentcredits, location, teamtaught, meetingdays, starttime, endtime, Original_ScheduleID);
    }
    [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Delete, true)]
    public void DeleteResearchSchedule(int Original_ScheduleID)
    {
        Adapter.DeleteResearchSchedule(Original_ScheduleID);
    }



    public bool CopyScheduleToCurrentSemister(int termid, int currenttermid, int facid)
    {
        string cmdText = "CopyScheduleToCurrentSemister";
        var htParams = new Hashtable { { "@TermID", termid }, { "@CurrentTermID", currenttermid }, { "@FacultyID", facid } };

        return Common.ExecuteNonQuery(cmdText, CommandType.StoredProcedure, htParams) > 0;

    }


    public bool CopyResearchScheduleToCurrentSemister(int termid, int currenttermid, int facid)
    {
        string cmdText = "CopyResearchScheduleToCurrentSemister";
        var htParams = new Hashtable { { "@TermID", termid }, { "@CurrentTermID", currenttermid }, { "@FacultyID", facid } };

        return Common.ExecuteNonQuery(cmdText, CommandType.StoredProcedure, htParams) > 0;

    }

    public bool CopyOfficeHoursToCurrentSemister(int termid, int currenttermid, int facid)
    {
        string cmdText = "CopyOfficeHoursToCurrentSemister";
        var htParams = new Hashtable { { "@TermID", termid }, { "@CurrentTermID", currenttermid }, { "@FacultyID", facid } };

        return Common.ExecuteNonQuery(cmdText, CommandType.StoredProcedure, htParams) > 0;

    }
}