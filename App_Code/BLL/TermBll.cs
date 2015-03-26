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

public class TermBll
{
    private TermTableAdapter _termAdapter = null;
    protected TermTableAdapter Adapter
    {
        get
        {
            if (_termAdapter == null)
                _termAdapter = new TermTableAdapter();

            return _termAdapter;
        }
    }


    [System.ComponentModel.DataObjectMethodAttribute
        (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.TermDataTable GetTerm()
    {
       return Adapter.GetTerm();
    
    }

    [System.ComponentModel.DataObjectMethodAttribute
       (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.TermDataTable GetSemYear()
    {
        return Adapter.GetSemYear();

    }
    [System.ComponentModel.DataObjectMethodAttribute
    (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.TermDataTable GetTermByYear(string year)
    {
        return Adapter.GetTermByYear(year);

    }

   [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Select, false)]
    public DeanDS.TermDataTable GetPresentNextTerm(int termid)
   {
       return Adapter.GetPresentNextTerm(termid);

    }
//    [System.ComponentModel.DataObjectMethodAttribute
//(System.ComponentModel.DataObjectMethodType.Select, false)]
//    public SMSDataSet.TermDataTable GetDistinctYear()
//    {
//        return Adapter.GetDistinctYear();

//    }
   [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Select, false)]
   public int SelectNoOfCurrentSemester(int termid)
   {
       return (int)Adapter.GetCurrentSemesterNo(2);
       //return int.Parse(Adapter.SelectNoOfCurrentSemester().ToString());

   }

   [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Select, false)]
   public DeanDS.TermDataTable SelectCurrentSemester()
   {
       return Adapter.SelectCurrentSemester();

   }


   [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Select, false)]
   public DeanDS.TermDataTable GetTermName(int termid)
   {
       return Adapter.GetSemesterName(termid);

   }
}




