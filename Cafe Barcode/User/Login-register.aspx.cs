using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics.Eventing.Reader;

namespace Cafe_Barcode.User
{
    public partial class Login_register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login_click(object sender, EventArgs e)
        {

        }
        protected void Register_click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=desktop-8hp8d45\\sqlexpress;Initial Catalog=cafe;Integrated Security=True");
            conn.Open();
           
               

                SqlCommand cmd = new SqlCommand("insert into registration" + "(username,email,password) values (@username,@email,@password)", conn);
                cmd.Parameters.AddWithValue("@username", Rtbusername.Text);
                cmd.Parameters.AddWithValue("@email", Rtbemail.Text);
                

              
               
                cmd.Parameters.AddWithValue("@password", Rtbpass.Text);
                

                cmd.ExecuteNonQuery();
                conn.Close();
            
           
   
                lblMessage.Text = "Registration failed. Error: ";
            
        }
        
        

    }
}