//Created to use a time picker for the office hours dropdown lists. Nov 2009 TAN
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
public class TimePickerBll
{
    private TimePickerTableAdapter _tpadapter = null;
    protected TimePickerTableAdapter Adapter
    {
        get
        {
            if (_tpadapter == null)
                _tpadapter = new TimePickerTableAdapter();
            return _tpadapter;
        }
    }

    [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.TimePickerDataTable GetTimePickerTimes()
    {
        return Adapter.GetTimePickerTimes();
    } 
}