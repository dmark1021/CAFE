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

public class OfficeHoursBLL
{
    private OfficeHoursTableAdapter _employeeAdapter = null;
    protected OfficeHoursTableAdapter Adapter
    {
        get
        {
            if (_employeeAdapter == null)
                _employeeAdapter = new OfficeHoursTableAdapter();

            return _employeeAdapter;
        }
    }


    [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.OfficeHoursDataTable GetOfficeHours()
    {
        return Adapter.GetOfficeHours();
    }
    [System.ComponentModel.DataObjectMethodAttribute
       (System.ComponentModel.DataObjectMethodType.Select, true)]
    public DeanDS.OfficeHoursDataTable GetOfHrByfac(int FacultyID, int TermID)
    {
        return Adapter.GetOfHrByfac(FacultyID, TermID);
    }
    [System.ComponentModel.DataObjectMethodAttribute
     (System.ComponentModel.DataObjectMethodType.Update, true)]
    //Changed Stored Procedure so that it will work with changes required for time picker. Nov. 17, 2009 TAN
    public void UpdateOfficeHours(int Original_OHId, string Day, string FromTime, string ToTime, int FromTimeValue, int ToTimeValue)
    {
       // String fromtime = Convert.ToString(FromTimeValue);
       // String totime = Convert.ToString(ToTimeValue);
       // String template = "2011-08-08 09:00:00";

        int fromHour = FromTimeValue / 100;
        int fromMin = FromTimeValue - fromHour * 100;

        int toHour = ToTimeValue / 100;
        int toMin = ToTimeValue - toHour * 100;

        String fromTime = "2011-08-08 " + Convert.ToString(fromHour) + ":" + Convert.ToString(fromMin) + ":00";
        String toTime = "2011-08-08 " + Convert.ToString(toHour) + ":" + Convert.ToString(toMin) + ":00";

       // Adapter.UpdateOfficeHours(Day, Convert.ToString(FromTimeValue), Convert.ToString(ToTimeValue), Original_OHId);

        Adapter.UpdateOfficeHours(Day, fromTime, toTime, Original_OHId);
        //Adapter.UpdateOfficeHours(Original_OHId, Day, FromTime, ToTime, FromTimeValue, ToTimeValue);
    }
   
           [System.ComponentModel.DataObjectMethodAttribute
     (System.ComponentModel.DataObjectMethodType.Insert, false)]
    public void InsertOfficeHrs(int facid,string Day, DateTime FromTime, DateTime ToTime,int termid)
    {

        // Adapter.UpdateOfficeHours(Day,FromTime,ToTime,Original_OHId);
        Adapter.InsertOfficeHrs(facid,Day, FromTime, ToTime,termid);
    }
      [System.ComponentModel.DataObjectMethodAttribute
     (System.ComponentModel.DataObjectMethodType.Delete, true)]
           public void DeleteOfficeHours(int Original_OHId)
    {

        // Adapter.UpdateOfficeHours(Day,FromTime,ToTime,Original_OHId);
        Adapter.DeleteOfficeHours(Original_OHId);
    }

      [System.ComponentModel.DataObjectMethodAttribute
       (System.ComponentModel.DataObjectMethodType.Delete, true)]
      //20110711 added by Lin
      public void CopyOfficeHoursToCurrentSemester(int termid, int currenttermid, int facid)
      {
          Adapter.CopyOfficeHoursToCurrentSemester(termid, currenttermid, facid);
      }
  
}