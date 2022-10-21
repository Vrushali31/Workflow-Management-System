using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Workflow_Management
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnSubmit(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            try
            {
                using (con)
                {
                    string query;
                    DataSet ds = new DataSet();
                    query = "Select * from Employee where name = '" + name.Text + "'and password = '" + password.Text + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    int c = 0;
                    while (rdr.Read())
                    {
                        Session["id"] = rdr["id"];
                        Session["category"] = rdr["role"];
                        c++;
                        Response.Write(Session["id"]);
                        break;
                    }
                    rdr.Close();
                    if (c == 0)
                    {
                        Response.Write("Username or password is invalid") ;
                    }
                    con.Close();
                    if (c != 0)
                    {
                        Response.Redirect("/home.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
            }
        }
    }
}