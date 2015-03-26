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

public class FacultyBll
{
    private FacultyTableAdapter _facAdapter = null;
    protected FacultyTableAdapter Adapter
    {
        get
        {
            if (_facAdapter == null)
                _facAdapter = new FacultyTableAdapter();

            return _facAdapter;
        }
    }


    [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.FacultyDataTable GetFaculty()
    {
        return Adapter.GetFaculty();

   
        
    }

    [System.ComponentModel.DataObjectMethodAttribute
   (System.ComponentModel.DataObjectMethodType.Select, true)]
    public DeanDS.FacultyDataTable GetUserDetails(int facultyid)
    {
        return Adapter.GetUserDetails(facultyid);



    }
    [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Select, true)]
    public DeanDS.FacultyDataTable GetFacultyByDept(int deptid)
    {
        return Adapter.GetFacultyByDept(deptid);



    }
       [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Select, true)]
    public DeanDS.FacultyDataTable GetChairBydept(int deptid)
    {
        return Adapter.GetChairBydept(deptid);



    }
 [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Select,false)]
       public DeanDS.FacultyDataTable GetChairEmail(int deptid)
    {
        return Adapter.GetChairEmail(deptid);

    }
 [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Select,false)]
 public DeanDS.FacultyDataTable GetFacultyEmailId(int facid)
    {
        return Adapter.GetFacultyEmailId(facid);

    }

 [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Select, false)]
 public DeanDS.FacultyDataTable GetFacultyRankName(int facid)
 {
     return Adapter.GetRankByID(facid);

 }
 [System.ComponentModel.DataObjectMethodAttribute
 (System.ComponentModel.DataObjectMethodType.Select, false)]
 public DeanDS.FacultyDataTable GetFacIdByNetworkId(string Networkid)
 {
     return Adapter.GetFacIdByNetworkId(Networkid);
     
 }
 public DeanDS.FacultyDataTable GetDeptNameByFacID(int facid)
 {
     return Adapter.GetDeptNameByFacID(facid);
   
 }

   
}