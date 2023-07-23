using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cafe_Barcode
{
    public partial class Favourite : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                
            }
            if (Session["logout"] != null)
            {
                Response.Redirect("WebForm4.aspx");
            }
            if (Session["email"] == null)
            {
                btnLogout.Text = "LOG IN";

            }
            else
            {
                btnLogout.Text = "Log OUT";
            }
            getFavs();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Contents.RemoveAll();
            // End the current session
            Session.Abandon();

            // Redirect the user to the login page or any other appropriate page
            Response.Redirect("WebForm4.aspx");
        }

        private void getFavs()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            string em = string.Empty;
            if (Session["email"] != null)
            {
                em = Session["email"].ToString().Trim();
            }
            else
            {
                Response.Redirect("WebForm4.aspx");
                return;
            }
            cmd = new SqlCommand("Fav_crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECTFAV");
            cmd.Parameters.AddWithValue("@Email", em);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rProducts.DataSource = dt;
            rProducts.DataBind();
            con.Close();
        }

        protected void rProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                con.Open();
                //con = new SqlConnection(Connection.GetConnectionString());
                string s = e.CommandArgument.ToString();
                HiddenField hiddenProductId = (HiddenField)e.Item.FindControl("hdnProdId");
                string productId = hiddenProductId.Value;
                cmd = new SqlCommand("Fav_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@ProductId", hiddenProductId.Value);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    
                    cmd.ExecuteNonQuery();
                    //lblmsg.Visible = true;
                    //lblmsg.Text = "successfully deleted";
                    //lblmsg.CssClass = "alert alert-success";
                    //getCategories();
                }
                catch (Exception ex)
                {
                    //lblmsg.Visible = true;
                    //lblmsg.Text = "Error~" + ex.Message;
                    //lblmsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    getFavs();
                    con.Close();
                }
            }
        }
    }
}