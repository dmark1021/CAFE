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

public class DepartmentBll
{
    private DepartmentTableAdapter _dAdapter = null;
    protected DepartmentTableAdapter Adapter
    {
        get
        {
            if (_dAdapter == null)
                _dAdapter = new DepartmentTableAdapter();

            return _dAdapter;
        }
    }


    [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.DepartmentDataTable GetDepartmentByCollege(int collegeid)
    {
        return Adapter.GetDepartmentByCollege(collegeid);
    }
  
     [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.DepartmentDataTable GetNoofDeptInbox()
    {
        return Adapter.GetNoofDeptInbox();
    }
     [System.ComponentModel.DataObjectMethodAttribute
     (System.ComponentModel.DataObjectMethodType.Select, false)]
     public DeanDS.DepartmentDataTable GetDepartment()
     {
         return Adapter.GetDepartment();
     }

    //Changed GetInbox so that it uses termId & collId.  June 2009 TAN  
    [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, false)]
     public int GetInbox(int termId, int collId)
     {
         int noof = 0;
         DataTable dt = Adapter.GetInbox(termId, collId);
         if (dt.Rows.Count > 0)
         {
             noof = Convert.ToInt32(dt.Rows[0]["inboxCount"]);
         }

         return noof;
     }
    
            public int GetNoofInboxForDeanByDept(int deptid)
    {
          int noof = 0;
        DataTable dt =  Adapter.GetNoofInboxForDeanByDept(deptid);
        if (dt.Rows.Count > 0)
            noof = Convert.ToInt32(dt.Rows[0]["countdept"]);

          return noof;
      
    }

            public string GetDeptNameByDeptID(int deptid)
    {
          string deptname = "";
          DataTable dt = Adapter.GetDeptNameByDeptID(deptid);
        if (dt.Rows.Count > 0)
            deptname =(dt.Rows[0]["DeptName"]).ToString();

        return deptname;
      
    }

    [System.ComponentModel.DataObjectMethodAttribute
     (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.DepartmentDataTable GetDepartmentByDeptIds(int deptid)
    {
        return Adapter.GetDeptInfoByDeptId(deptid);
    }

    //TAN added June 2009
    [System.ComponentModel.DataObjectMethodAttribute
     (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.DepartmentDataTable GetNoOfInboxApprovedRejectForDeanByTerm(int termId, int collId)
    {
        return Adapter.GetNoOfInboxApprovedRejectForDeanByTerm(termId, collId);
    }

}