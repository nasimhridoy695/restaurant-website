<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="Cafe_Barcode.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Login Form | CodingLab</title> 
    <link rel="stylesheet" href="login/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
</head>
<body>
    <div class="container">
      <div class="wrapper">
        <div class="title"><span>Login Form</span></div>
    <form id="form1" runat="server">
        <div class="row">
            <i class="fas fa-user"></i>
            <asp:TextBox ID="TextBox1" placeholder="enter email" runat="server"></asp:TextBox>
          </div>
          <div class="row">
            <i class="fas fa-lock"></i> 
              <asp:TextBox ID="TextBox2" placeholder="enter password" runat="server"></asp:TextBox>
          </div>
          <div class="pass"><a href="#">Forgot password?</a></div>
          <div class="row button">
              <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="login" />
          </div>
          <div class="signup-link">Not a member? <a href="WebForm3.aspx">Signup now</a></div>
    </form>
</body>
</html>
