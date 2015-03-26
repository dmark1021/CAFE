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

public class OffCampusBll
{
    private OffCampusTableAdapter _ocAdapter = null;
    protected OffCampusTableAdapter Adapter
    {
        get
        {
            if (_ocAdapter == null)
                _ocAdapter = new OffCampusTableAdapter();

            return _ocAdapter;
        }
    }
    [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.OffCampusDataTable GetOffcampusByTerm(int facultyid,int termid)
    {
        return Adapter.GetOffcampusByTerm(facultyid, termid);
    }
    [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.OffCampusDataTable GetOffCampByOCId(int ocid)
    {
        return Adapter.GetOffCampByOCId(ocid);
    }
    [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Select, true)]
    public DeanDS.OffCampusDataTable GetOffCapHrsByTerm(int ocid)
    {
        return Adapter.GetOffCapHrsByTerm(ocid);
    }
        [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Update, true)]
    //Changed Stored Procedure so that it will work with changes required for time picker. Nov. 2009 TAN
    //public void UpdateOffCampusHours(string day, DateTime fromtime, DateTime totime, int Original_OCHId) Original TAN
    public void UpdateOffCampusHours(string day, DateTime fromtime, DateTime totime, int Original_OCHId, int FromTimeValue, int ToTimeValue)
    {
       //Adapter.UpdateOffCampusHours(day, fromtime, totime, Original_OCHId);    Original TAN
       Adapter.UpdateOffCampusHours(day, fromtime, totime, Original_OCHId, FromTimeValue, ToTimeValue);
    }


    [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Delete, true)]
        public void DeleteOffCampHrs(int Original_ochid)
    {
           
                Adapter.DeleteOffCampHrs(Original_ochid);
    }
           [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Insert, true)]
    public void InsertOffCampHrs(string day, DateTime fromtime, DateTime totime, Int64 ocid)
    {
       if(day!=" "&& fromtime!=null && totime!=null)
        Adapter.InsertOffCampHrs(day, fromtime, totime, ocid);
    }

               [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Insert, false)]
    public void InsertOffCampus(int facultyid,string activity,string organization,int termid)
    {
         Adapter.InsertOffCampus(facultyid,activity,organization,termid);
    }
               [System.ComponentModel.DataObjectMethodAttribute
            (System.ComponentModel.DataObjectMethodType.Update, false)]
               public void UpdateOffCampus(string activity,string organization,int Original_OCId)
               {

                   Adapter.UpdateOffCampus(activity,organization,Original_OCId);
               }
               [System.ComponentModel.DataObjectMethodAttribute
            (System.ComponentModel.DataObjectMethodType.Delete, false)]
               public void DeleteOffCampus(int Original_OCId)
               {

                   Adapter.DeleteOffCampus(Original_OCId);
               }
}