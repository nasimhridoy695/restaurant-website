using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cafe_Barcode
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=desktop-8hp8d45\\sqlexpress;Initial Catalog=cafe;Integrated Security=True");
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into registration" + "(username,email,password) values (@username,@email,@password)", conn);
            cmd.Parameters.AddWithValue("@username", Rtbusername.Text);
            cmd.Parameters.AddWithValue("@email", Rtbemail.Text);
            cmd.Parameters.AddWithValue("@password", Rtbpassword.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}