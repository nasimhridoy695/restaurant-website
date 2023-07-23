using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cafe_Barcode.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
                
            }
            if (Session["breadCrum"] == null)
            {
                Response.Redirect("~/WebForm4.aspx");
                return;
            }
            Session["breadCrum"] = "Category";
            getCategories();
            lblmsg.Visible = false;

        }
        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int categoryId = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Category_crud", con);
            cmd.Parameters.AddWithValue("@Action", categoryId == 0 ? "INSERT " : "UPDATE");
            cmd.Parameters.AddWithValue("@CategoryId", categoryId);
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@IsActive", cbIsActive.Checked);

            if (fuCategoryImage.HasFile)
            {
                if(Utils.IsValidExtension(fuCategoryImage.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(fuCategoryImage.FileName);
                    imagePath = "../Images/Category/" + obj.ToString() + fileExtension;
                    try
                    {
                        fuCategoryImage.PostedFile.SaveAs(Server.MapPath("~/Images/Category/") + obj.ToString() + fileExtension);
                    }
                    catch(Exception ex)
                    { 
                        lblmsg.Visible = true;
                        lblmsg.Text = ex.Message;
                    }
                    
                    cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                    isValidToExecute = true;
                }
                else
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "please select .jpg, .jpeg or .png image";
                    lblmsg.CssClass = "alert alert-danger";
                    isValidToExecute = false;

                }
            }
            else
            {
                isValidToExecute = true; 
            }
            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = categoryId == 0 ? "inserted" : "updated";
                    lblmsg.Visible = true;
                    lblmsg.Text = "Category " + actionName + " successfully!";
                    lblmsg.CssClass = "alert alert-success";
                    getCategories();
                    Clear();
                }
                catch (Exception ex)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Error~ "+ ex.Message;
                    lblmsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }
        }
        private void getCategories()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Category_crud", con);
            cmd.Parameters.AddWithValue("@Action", "select");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCategory.DataSource = dt;
            rCategory.DataBind();
        }
        private void Clear()
        {
            txtName.Text = string.Empty;
            cbIsActive.Checked = false;
            hdnId.Value = "0";
            btnAddOrUpdate.Text = "Add";
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        protected void rCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblmsg.Visible = false;
            try
            {
                con = new SqlConnection(Connection.GetConnectionString());
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message.ToString();
                lblmsg.Visible=true;
            }
            if (e.CommandName == "edit")
            {
                HiddenField hiddenProductId = (HiddenField)e.Item.FindControl("hiddenProductId");
                string productId = hiddenProductId.Value;

                cmd = new SqlCommand("Category_crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@CategoryId", hiddenProductId.Value);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtName.Text = dt.Rows[0]["Name"].ToString();
                cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
                imgCategory.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString()) ? "../Images/No_image.png" : "../" + dt.Rows[0]["ImageUrl"].ToString();
                imgCategory.Height = 200;
                imgCategory.Width = 200;
                hdnId.Value = dt.Rows[0]["CategoryId"].ToString();
                btnAddOrUpdate.Text = "Update";
                LinkButton btn=e.Item.FindControl("lnkEdit") as LinkButton;
                btn.CssClass = "badge badge-warning";
            }
            else if(e.CommandName == "delete")
            {
                //con = new SqlConnection(Connection.GetConnectionString());
                HiddenField hiddenProductId = (HiddenField)e.Item.FindControl("HiddenField2");
                string productId = hiddenProductId.Value;
                cmd = new SqlCommand("Category_crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                    cmd.Parameters.AddWithValue("@CategoryId", hiddenProductId.Value);
                    cmd.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblmsg.Visible = true;
                        lblmsg.Text = "successfully deleted";
                        lblmsg.CssClass = "alert alert-success";
                        getCategories();
                    }
                    catch (Exception ex)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Error~" + ex.Message;
                        lblmsg.CssClass = "alert alert-danger";
                    }
                    finally
                    {
                        con.Close();
                    }
            }
        }
        protected void rCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl = e.Item.FindControl("lblIsActive") as Label;
                if(lbl.Text == "True")
                {
                    lbl.Text = "IN";
                    lbl.CssClass = "badge badge-success";
                }
                else
                {
                    lbl.Text = "OUT";
                    lbl.CssClass = "badge badge-danger";
                }
            }
        }
    }
}