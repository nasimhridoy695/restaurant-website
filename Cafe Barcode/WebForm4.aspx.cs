using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Configuration;

namespace Cafe_Barcode
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        static string connectionString = @"Data Source=desktop-8hp8d45\sqlexpress;Initial Catalog=cafe;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if(!IsPostBack)
            {
                if(Session["breadCrum"] != null)
                {
                    Response.Redirect("Admin/Category.aspx");
                }
                else if (Session["email"] != null)
                {
                    Response.Redirect("index.aspx");
                }
            }
            
            

            lblErrorMessage.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            if (TextBox1.Text == null)
            {
                TextBox1.Focus();
                return;
            }
            else if (TextBox2.Text == null)
            {
                TextBox2.Focus();
             
                return;
            }
            else if(TextBox1.Text == "admin@gmail.com" && TextBox2.Text == "1200")
            {
                Session["breadCrum"] = "Category";
                Response.Redirect("Admin/Category.aspx");
                return;
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string email = TextBox1.Text;
                string password = TextBox2.Text;

                string query = "SELECT email,password FROM registration WHERE email = @Email AND password = @Password";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Password", password);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    // Login successful
                    Session["email"] = email;
                    Response.Redirect("index.aspx");
                    TextBox1.Text = string.Empty;
                    TextBox2.Text = string.Empty;
                }
                else
                {
                    // Login failed

                    lblErrorMessage.Text = "Invalid email or password!";
                    lblErrorMessage.Visible=true;

                    TextBox1.Text = string.Empty;
                    TextBox2.Text = string.Empty;

                    
                }
            }

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

    }
}