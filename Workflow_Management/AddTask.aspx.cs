using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Workflow_Management
{
    public partial class AddTask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
        }

        protected void onSubmit(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            try
            {
                using (con)
                {
                    string query;
                    //DataSet ds = new DataSet();
                    query = ("Select * from Employee where id = '" + eId.Text + "'");
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    int c = 0;
                    bool flag=true;
                    while (rdr.Read())
                    {
                        c++;
                        if ((int)(rdr["role"]) == 0)
                        {
                            flag = false;
                            Response.Write("Selected id is a Id of some manager and you can't assign task to manager.");
                        }
                    }
                    rdr.Close();
                    query = ("Select * from Project where pId = '" + pId.Text + "'");
                    cmd = new SqlCommand(query, con);
                    rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        c++;
                        break;
                    }
                    rdr.Close();
                    if (c == 2 && flag)
                    {
                        query = "INSERT INTO Task (eId,Task,Status,Deadline,pId) VALUES (@eId,@Task,@Status,@Deadline,@pId)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@eId", eId.Text);
                        cmd.Parameters.AddWithValue("@Task", task.Text);
                        cmd.Parameters.AddWithValue("@Status", status.SelectedValue);
                        cmd.Parameters.AddWithValue("@Deadline", deadline.Text);
                        cmd.Parameters.AddWithValue("@pId", pId.Text);
                        cmd.ExecuteNonQuery();
                        Response.Write("Task Added");
                    }
                    else
                    {
                        Response.Write("Please enter valid data");
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
            }
        }
    }
}