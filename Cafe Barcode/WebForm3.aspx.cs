using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cafe_Barcode
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=desktop-8hp8d45\\sqlexpress;Initial Catalog=cafe;Integrated Security=True");
            conn.Open();
            
            if(!string.IsNullOrEmpty(TextBox1.Text) && !string.IsNullOrEmpty(TextBox2.Text) && !string.IsNullOrEmpty(TextBox3.Text) && TextBox4.Text == TextBox3.Text)
            {
                string query = "SELECT email FROM registration WHERE email = @Email";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@Email", TextBox2.Text);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    
                }
                else
                {
                    reader.Close();
                    SqlCommand cmd = new SqlCommand("insert into registration" + "(username,email,password) values (@username,@email,@password)", conn);
                    SqlCommand cmd2 = new SqlCommand("insert into login" + "(email,password) values (@email,@password)", conn);
                    cmd.Parameters.AddWithValue("@username", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@email", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@password", TextBox3.Text);
                    cmd2.Parameters.AddWithValue("@email", TextBox2.Text);
                    cmd2.Parameters.AddWithValue("@password", TextBox3.Text);
                    cmd.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Webform4.aspx");
                }
                
            }
            else
            {

            }

            
        }
    }
}