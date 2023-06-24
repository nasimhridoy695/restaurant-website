<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login-register.aspx.cs" Inherits="Cafe_Barcode.User.Login_register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
    <input type="checkbox" id="flip">
    <div class="cover">
      <div class="front">
        <img src="../Tfiles/images/frontImg.jpg" alt="">
        <div class="text">
          <span class="text-1">Every new friend is a <br> new adventure</span>
          <span class="text-2">Let's get connected</span>
        </div>
      </div>
      <div class="back">
        <img class="backImg" src="../Tfiles/images/backImg.jpg" alt="">
        <div class="text">
          <span class="text-1">Complete miles of journey <br> with one step</span>
          <span class="text-2">Let's get started</span>
        </div>
      </div>
    </div>
    <div class="forms">
        <div class="form-content">
          <div class="login-form">
            <div class="title">Login</div>
          <form action="#">
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                
                  <asp:TextBox ID="Ltbemail" runat="server" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
              </div>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                  <%--<asp:TextBox ID="passtb" runat="server" ></asp:TextBox>--%>
                  <asp:TextBox ID="Ltbpass" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>

                <%--<input type="password" placeholder="Enter your password" id="tbpass">--%>
              </div>
              <div class="text"><a href="#">Forgot password?</a></div>
              <div class="button input-box">
                  <asp:Button ID="LbtnSubmit" runat="server" OnClick="Login_click" Text="Submit" />
                <%--<input type="submit" value="Sumbit">--%>
              </div>
              <div class="text sign-up-text">Don't have an account? <label for="flip">Sigup now</label></div>
                <asp:Label ID="lblMessage" runat="server" Text="This is a label"></asp:Label>

            </div>
        </form>
      </div>
        <div class="signup-form">
          <div class="title">Signup</div>
        <form action="#">
            <div class="input-boxes"></div>
              <div class="input-box">
                <i class="fas fa-user"></i>
                <asp:TextBox ID="Rtbusername" runat="server" TextMode="SingleLine" placeholder="Enter your username"></asp:TextBox>
              </div>
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <asp:TextBox ID="Rtbemail" runat="server" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
              </div>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <asp:TextBox ID="Rtbpass" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
              </div>
              <div class="button input-box">
                <asp:Button ID="RbtnSubmit" runat="server" OnClick="Register_click" Text="Submit" />
              </div>
              <div class="text sign-up-text">Already have an account? <label for="flip">Login now</label></div>
            </div>
      </form>
    </div>
    </div>
    </div>
  </div>

</asp:Content>
