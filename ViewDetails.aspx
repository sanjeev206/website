using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DAL;

namespace WebApplication4
{
    public partial class ViewDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
                
                elementview_dd();
            }
        }
        protected void elementview_dd() 
        {
            QuesDAL u = new QuesDAL();
            List<ModuleBO> d = u.loaddd(); 
            DropDownList1.DataSource = d;
            ModuleBO b=new ModuleBO();
            DropDownList1.DataTextField = "Module_Name";
            DropDownList1.DataValueField = "Module_Id";
          
                     DropDownList1.DataBind();
                     ListItem li = new ListItem("--Select--", "0");
                     DropDownList1.Items.Insert(0,li);
            
        }



        protected void elementview()
        {
            QuesDAL u = new QuesDAL();
            List<QuesBO> d = u.viewDetail();
           string name=   DropDownList1.SelectedItem.Text;
            List<QuesBO> e1 = u.viewPart(name);
            GridView1.DataSource = e1;
            GridView1.DataBind();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((GridView1.SelectedRow.FindControl("Label1_QID") as Label).Text);
            Session["QuesID"] = id;
            Response.Redirect("UpdateDetail.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            elementview();
           

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            


        }
    }
}
