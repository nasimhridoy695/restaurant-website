using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Cafe_Barcode
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void reg_button(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source = DESKTOP - 8HP8D45\\SQLEXPRESS; Initial Catalog = cafe; Integrated Security = True");
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into register" + "(username,email,password) values (@username,@email,@password)", conn);
            cmd.Parameters.AddWithValue("@username", Rtbusername.Text);
            cmd.Parameters.AddWithValue("@email", Rtbemail.Text);
            cmd.Parameters.AddWithValue("@password", Rtbpassword.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}