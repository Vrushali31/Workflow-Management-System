using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Workflow_Management
{
    public partial class AddProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
        }

        protected void addProject(object sender, EventArgs e)
        {
            //string id = pId.ID;
            //if (pId.Text == "")
            //    Response.Write("Please enter project id\n");
             if (pName.Text == "")
                Response.Write("Please enter Project Name\n");
            else if (pName.Text == "")
                Response.Write("Please enter manager name \n");


            else
            {



                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
                string query = "INSERT INTO Project (Project_Name, Project_Desc,mId, Deadline) VALUES (@pName, @pDesc, @mId, @deadline)";
                try
                {
                    using (con)
                    {
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            //cmd.Parameters.AddWithValue("@pId", pId.Text);
                            cmd.Parameters.AddWithValue("@pName", pName.Text);
                            cmd.Parameters.AddWithValue("@pDesc", pDesc.Text);
                            cmd.Parameters.AddWithValue("@mId", Session["id"]);
                            //cmd.Parameters.AddWithValue("@mName", mName.Text);
                            cmd.Parameters.AddWithValue("@deadline", pDeadline.Text);
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            Response.Write("Your data has been submitted\n");
                            //Response.Redirect("");
                            viewProjectDetails(sender, e);
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Errors: " + ex.Message);
                }

            }
        }

        protected void viewProjectDetails(object sender, EventArgs e)
        {
            Response.Redirect("/ProjectDetails.aspx");
        }
    }
}