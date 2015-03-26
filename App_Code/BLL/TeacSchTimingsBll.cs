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

public class TeachSchimingsBll
{
    private TeachingScheTimingsTableAdapter _ttAdapter = null;
    protected TeachingScheTimingsTableAdapter Adapter
    {
        get
        {
            if (_ttAdapter == null)
                _ttAdapter = new TeachingScheTimingsTableAdapter();

            return _ttAdapter;
        }
    }
    [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.TeachingScheTimingsDataTable GetTeachScheTimingsByTerm(int ScheduleID)
    {
        return Adapter.GetTeachScheTimingsByTerm(ScheduleID);
    }
    [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Select, true)]
    public DeanDS.TeachingScheTimingsDataTable GetTeachScheTimings()
    {
        return Adapter.GetTeachScheTimings();
    }
    [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Insert, true)]
    public void InsertTeahScheTimings(int ScheduleID,string day,DateTime fromtime,DateTime totime)
    {
        Adapter.InsertTeahScheTimings(ScheduleID, day, fromtime, totime);
    }
    [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Update, true)]
    public void UpdateTeachSchTimings(string day, DateTime fromtime, DateTime totime,int Original_TSTId)
    {
        Adapter.UpdateTeachSchTimings(day, fromtime, totime, Original_TSTId);
    }
    [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Delete, true)]
    public void DeleteTeachScheTimings(int Original_TSTId)
    {
        Adapter.DeleteTeachScheTimings(Original_TSTId);
    }

}