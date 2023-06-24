using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace Cafe_Barcode
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        static string connectionString = @"Data Source=desktop-8hp8d45\sqlexpress;Initial Catalog=cafe;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    SqlConnection con = new SqlConnection(connectionString);
            //    SqlCommand cmd = new SqlCommand();
            //    cmd.CommandText = "sp_login";
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.AddWithValue("@UserId", txtUserId.Text.ToString());
            //    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.ToString());
            //    cmd.Connection = con;
            //    con.Open();
            //    SqlDataReader reader = cmd.ExecuteReader();
            //    if(reader.Read())
            //    {
            //        Session["UserId"] = txtUserId.Text.ToString();
            //        txtInfo.Text = "Login successful";
            //        reader.Close();
            //        con.Close();
            //    }
            //    else
            //    {
            //        txtInfo.Text = "Invalid credentials";
            //    }
            //    reader.Close();
            //    con.Close() ;

            //}
            //catch(Exception ex)
            //{

            //}
        }
    }
}