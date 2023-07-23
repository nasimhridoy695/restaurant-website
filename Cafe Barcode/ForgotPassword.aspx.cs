using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.IO;

namespace Cafe_Barcode
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        static string connectionString = @"Data Source=desktop-8hp8d45\sqlexpress;Initial Catalog=cafe;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //using (SqlConnection connection = new SqlConnection(connectionString))
            //{
            //    SqlCommand cmd = new SqlCommand("select * from usertemp where Email='"+ TextBox1.Text, connection);
            //    connection.Open();
            //    SqlDataAdapter sda = new SqlDataAdapter(cmd);
            //    DataTable dt = new DataTable();
            //    sda.Fill(dt);
            //    if(dt.Rows.Count != 0)
            //    {
            //        String myGUID = Guid.NewGuid().ToString();
            //        int Uid = Convert.ToInt32(dt.Rows[0][0]);
            //        SqlCommand cmd1 = new SqlCommand("insert into resetpass values('" + myGUID + "','" + Uid + "',getdate())", connection);
            //        cmd1.ExecuteNonQuery();
            //        try
            //        {
            //            String ToEmailAddress = dt.Rows[0][4].ToString();
            //            String Username = dt.Rows[0][1].ToString();
            //            String EmailBody = "Hi" + Username + ",<br><br/> Click the link below to reset password<br><br/>http://localhost:52850/ResetPass.aspx?Uid=" + myGUID;
            //            MailMessage PassRecMail = new MailMessage("smtp-mail.outlook.com", ToEmailAddress);
            //            PassRecMail.Body = Email

            //        }
            //    }
            //}
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("select * from usernew where Email = @EmailAddress"))
                    {
                        cmd.Parameters.AddWithValue("@EmailAddress", TextBox1.Text);
                        cmd.Connection = conn;
                        cmd.Connection.Open();
                        using (SqlDataReader sqlRdr = cmd.ExecuteReader())
                        {
                            if (sqlRdr.HasRows)
                            {
                                while (sqlRdr.Read())
                                {
                                    var userId = sqlRdr.GetInt32(0);
                                    string fullName = sqlRdr.GetString(1);
                                    string emailId = sqlRdr.GetString(2);
                                    var guid = Guid.NewGuid();

                                    using (SqlCommand cmd1 = new SqlCommand("insert into resetnew values(@UniqueId, @UserId, @DateRequest)"))
                                    {
                                        cmd1.Parameters.AddWithValue("@UniqueId", guid);
                                        cmd1.Parameters.AddWithValue("@UserId", userId);
                                        cmd1.Parameters.AddWithValue("@DateRequest", DateTime.Now);
                                        cmd1.Connection = conn;
                                        cmd1.ExecuteNonQuery();
                                        Response.Write("<script>alert('Password reset link has been mailed to you');</script>");

                                        string emailSubject = "Reset Password";
                                        string emailBody = "Hi, " + fullName + "</h1>";
                                        emailBody += "<a href='http://localhost/ResetPass.aspx?Guid=" + guid.ToString() + "'>Reset Password</a>";
                                        string msg = SendMail(emailSubject, emailBody, emailId);
                                    }
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('This Email Address does not exists in our database.');</script>");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            //    string msg = ex.Message;
            //    lblErrorMessage.Text = msg;
            //    lblErrorMessage.Visible=true;


            //    string logFilePath = "D:\\Log\\ErrorLog.txt";
            //    using (StreamWriter writer = new StreamWriter(logFilePath, true))
            //    {
            //        writer.WriteLine(DateTime.Now.ToString() + " - Error: " + ex.Message);
            //        writer.WriteLine(DateTime.Now.ToString() + " - Error: " + ex.Source);
            //    }
            //    //Response.Write("<script>alert(msg);</script>");


            string errorMessage = ex.Message;
            string stackTrace = ex.StackTrace;

            // Find the line number causing the exception
            int lineNumber = 0;
            if (!string.IsNullOrEmpty(stackTrace))
            {
                string[] stackTraceLines = stackTrace.Split(new[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);
                if (stackTraceLines.Length > 0)
                {
                    string lineInfo = stackTraceLines[0].Trim();
                    int lineNumberIndex = lineInfo.LastIndexOf(":line ");
                    if (lineNumberIndex != -1)
                    {
                        string lineNumberString = lineInfo.Substring(lineNumberIndex + 6);
                        int.TryParse(lineNumberString, out lineNumber);
                    }
                }
            }

            lblErrorMessage.Text = errorMessage;
            lblErrorMessage.Visible = true;

            // Display the line number causing the exception
            //lblLineNumber.Text = "Line Number: " + lineNumber.ToString();
            //lblLineNumber.Visible = true;

                string logFilePath = "D:\\Log\\ErrorLog.txt";
                using (StreamWriter writer = new StreamWriter(logFilePath, true))
                {
                    writer.WriteLine(DateTime.Now.ToString() + " - Error: " + errorMessage);
                    writer.WriteLine("Stack Trace: " + stackTrace);
                }
            }

        }







        public static string SendMail(string emailSubject, string emailBody, string toEmail)
        {
            try
            {
                MailMessage PassRecMail = new MailMessage("smtp-mail.outlook.com", toEmail);
                PassRecMail.Body = emailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = emailSubject;
                PassRecMail.Priority = MailPriority.High;
                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
                SMTP.UseDefaultCredentials = false;
                SMTP.UseDefaultCredentials = true;
                SMTP.Credentials = new NetworkCredential()
                {
                    UserName = "",
                    Password = ""
                };
                SMTP.EnableSsl = true;
                SMTP.Send(PassRecMail);
                return "Mail Send Successfully";
            }
            catch (Exception ex)
            {
                
                return "error";
            }

        }
    }
}
