using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;
using DAL;

namespace WebApplication4
{
    public partial class UpdateDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["QuesID"] != null) 
            {
                if (!IsPostBack)
                {
                    QuesDAL r = new QuesDAL();
                    int k = Convert.ToInt32(Session["QuesID"]);
                    List<QuesBO> t = r.viewDetail11(k);
                    foreach (QuesBO i in t)
                    {
                        Label7.Text = i.Model.Module_Name;
                        Label8.Text = i.Description;
                        t_chA.Text = i.Choice_A;
                        t_chB.Text = i.Choice_B;
                        t_chC.Text = i.Choice_C;
                        t_ans.Text = i.Answer;

                    }
                }
                 
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(t_ans.Text=="A"|| t_ans.Text=="B"||t_ans.Text=="C")
            {               
                QuesDAL w = new QuesDAL();
                int id = Convert.ToInt32(Session["QuesID"]);
                string ca = t_chA.Text;
                string cb = t_chB.Text;
                string cc = t_chC.Text;
                string ans = t_ans.Text;
                int p = w.UpdateDetail(id, ca, cb, cc, ans);
                if(p>0)
                {
                    Response.Write("<script> alert('Success') ; </script>");


                }
                else
                {
                    Response.Write("<script> alert('Not success') ; </script>");

                }
            }

            else
            {
                Response.Write("<script> alert('Please enter A/B/C only') ; </script>");

            }
        }
    }
}
