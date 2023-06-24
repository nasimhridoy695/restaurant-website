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
            SqlCommand cmd = new SqlCommand("insert into registration" + "(username,email,password) values (@username,@email,@password)", conn);
            cmd.Parameters.AddWithValue("@username", TextBox1.Text);
            cmd.Parameters.AddWithValue("@email", TextBox2.Text);
            cmd.Parameters.AddWithValue("@password", TextBox3.Text);
            if((TextBox4.Text == TextBox3.Text) && (TextBox1.Text != null) && (TextBox2.Text != null) && (TextBox3.Text != null))
            {
                cmd.ExecuteNonQuery();
                conn.Close();

            }
            else
            {

            }

            
        }
    }
}