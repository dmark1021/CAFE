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

public class CollegeBll
{
    private CollegeTableAdapter _cAdapter = null;
    protected CollegeTableAdapter Adapter
    {
        get
        {
            if (_cAdapter == null)
                _cAdapter = new CollegeTableAdapter();

            return _cAdapter;
        }
    }
    

    [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.CollegeDataTable GetCollege()
    {
        return Adapter.GetCollege();
    }

    [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, false)]
    public string GetColNamebyId(int collegeid)
    {
        DataTable dt =  Adapter.GetColNamebyId(collegeid);
        return dt.Rows[0]["CollegeName"].ToString();
    }

    
}