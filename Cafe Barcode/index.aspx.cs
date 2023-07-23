using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cafe_Barcode.Admin;
using System.Xml.Linq;

namespace Cafe_Barcode
{
    public partial class WebForm5 : System.Web.UI.Page
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
            else
            {

            }
            if (Session["email"] == null)
            {
                btnLogout.Text = "LOG IN";

            }
            else
            {
                btnLogout.Text = "Log OUT";
            }
            getCategories();
            getProducts();
        }

        private void getCategories()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Category_crud", con);
            cmd.Parameters.AddWithValue("@Action", "ACTIVECAT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCategory.DataSource = dt;
            rCategory.DataBind();
        }

        private void getProducts()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Product_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "ACTIVEPROD");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rProducts.DataSource = dt;
            rProducts.DataBind();
        }
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                Session.Contents.RemoveAll();
                // End the current session
                Session.Abandon();
                Session["logout"] = "true";
                Response.Redirect("WebForm4.aspx");
            }
            else
            {
                Response.Redirect("WebForm4.aspx");
            }
            

            // Redirect the user to the login page or any other appropriate page
            
        }

        protected void rProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Session["email"] != null)
            {

                try
                {
                    con = new SqlConnection(Connection.GetConnectionString());
                    con.Open();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                if (e.CommandName == "addToFav")
                {

                    HiddenField hiddenProductId = (HiddenField)e.Item.FindControl("hdnProdId");
                    string productId = hiddenProductId.Value;
                    SqlCommand query = new SqlCommand("Select * from fav where email = @Email and ProductId = @ProductId", con);
                    query.Parameters.AddWithValue("@email", Session["email"]);
                    query.Parameters.AddWithValue("@ProductId", hiddenProductId.Value);
                    SqlDataReader reader = query.ExecuteReader();
                    if (reader.HasRows)
                    {

                    }
                    else
                    {

                        SqlCommand cmd = new SqlCommand("insert into Fav" + "(email,productid) values (@email,@ProductId)", con);
                        cmd.Parameters.AddWithValue("@email", Session["email"]);
                        cmd.Parameters.AddWithValue("@ProductId", hiddenProductId.Value);
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                    string script = @"<script type='text/javascript'>
                        window.location.hash = 'menu';
                     </script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "scrollToSection", script);
                }
            }
            else
            {
                Response.Redirect("WebForm4.aspx");
            }
        }

        protected void fav_Click(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                Response.Redirect("Favourite.aspx");
            }
            else
            {
                Response.Redirect("WebForm4.aspx");
            }
        }

        

        //int isItemExistInCart(int productId)
        //{
        //    con = new SqlConnection(Connection.GetConnectionString());
        //    cmd = new SqlCommand("Favourite_Crud", con);
        //    cmd.Parameters.AddWithValue("@Action", "ACTIVEPROD");
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    sda = new SqlDataAdapter(cmd);
        //    dt = new DataTable();
        //    sda.Fill(dt);
        //}
        //int isItemExistInCart(int productId)
        //{
        //    con = new SqlConnection(Connection.GetConnectionString());
        //    cmd = new SqlCommand("Fav_Crud", con);
        //    cmd.Parameters.AddWithValue("@Action", "ACTIVEPROD");
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    sda = new SqlDataAdapter(cmd);
        //    dt = new DataTable();
        //    sda.Fill(dt);
        //}
    }
}