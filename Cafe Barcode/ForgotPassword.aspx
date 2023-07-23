<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Cafe_Barcode.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Forgot Password</title> 
    <link rel="stylesheet" href="login/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
</head>
<body>
    <div class="container">
    <div class="wrapper">
    <div class="title"><span>Forgot Password</span></div>
    <form id="form1" runat="server">
            <div class="row">
            <i class="fas fa-user"></i>
            <asp:TextBox TextMode="email" ID="TextBox1" placeholder="enter email" runat="server" required ></asp:TextBox>
              </div>
              <%--<div class="row">
                <i class="fas fa-lock"></i> 
                 <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" placeholder="Enter password" required></asp:TextBox>

             </div>--%>
          <%--<div class="pass"><a href="#">Forgot password?</a></div>--%>
          <div class="row button">
              <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Reset Password" />
          </div>
          <div class="signup-link"><a href="WebForm4.aspx">Return to Login</a></div>
            <asp:Label ID="lblErrorMessage" runat="server" class="error-message" Visible="false"></asp:Label>
            <div class="error-message">
            </div>
    </form>
</body>
</html>
