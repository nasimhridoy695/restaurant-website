﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Cafe_Barcode.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up | Tasty Bites</title>
    <link rel="stylesheet" href="fresh/style.css">
</head>
<body style="background-image: url('fresh/reg-bg.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center center;">
    <div class="wrapper">
    <h2>Registration</h2>
    <form id="form1" action="#" runat="server">
        <div class="input-box">
            <asp:TextBox ID="TextBox1" placeholder="enter username" runat="server" required="true"></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
   ControlToValidate="TextBox1" ErrorMessage="Please enter a value for the Name field"></asp:RequiredFieldValidator>--%>

      </div>
      <div class="input-box">
             <asp:TextBox ID="TextBox2" placeholder="enter email" TextMode="Email" runat="server" required="true"></asp:TextBox>
                
      </div>
      <div class="input-box">
          <asp:TextBox ID="TextBox3" placeholder="enter password" TextMode="Password" runat="server" required="true"></asp:TextBox>
      </div>
      <div class="input-box">
          <asp:TextBox ID="TextBox4" placeholder="confirm password" TextMode="Password" runat="server" required="true"></asp:TextBox>
      </div>
      
      <div class="input-box button">
          <asp:Button ID="Button1" runat="server" Text="REGISTER" OnClick="Button1_Click1" />
      </div>
      <div class="text">
        <h3>Already have Account? <a href="WebForm4.aspx">Login now</a></h3>
      </div>
    </form>
</body>
</html>
