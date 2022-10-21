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
    public partial class Registeration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Name_Changed(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            try
            {
                using (con)
                {
                    string query;
                    DataSet ds = new DataSet();
                    query = ("Select * from Employee where name = '" + name.Text + "'");
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Response.Write("Username is aleady taken");
                    }
                    rdr.Close();
                    con.Close();
                }
            }
            catch(Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
            }
            
        }

        protected void checkUserAvailability(object source, ServerValidateEventArgs args)
        {

        }

        protected void btnSubmit(object sender, EventArgs e)
        {
            if(password.Text != cpassword.Text)
            {
                Response.Write("Password and confirm password must be same");
            }
            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
                try
                {
                    using (con)
                    {
                        string query;
                        query = "INSERT INTO Employee (name,password,email,role) VALUES (@Name,@Password,@Email,@Role)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Name", name.Text);
                        cmd.Parameters.AddWithValue("@Password", password.Text);
                        cmd.Parameters.AddWithValue("@Email", email.Text);
                        cmd.Parameters.AddWithValue("@Role", category.SelectedIndex);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Redirect("LogIn.aspx");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Errors: " + ex.Message);
                }
            }
            
        }
    }
}