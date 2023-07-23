<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="Cafe_Barcode.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Tasty Bites</title>
    <link rel="stylesheet" href="login/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />

    <script>
        window.onload = function () {
            var s = 5;
            setTimeout(function () {
                document.getElementById('#<%=lblErrorMessage.ClientID %>').style.display = "none";
        }, s * 1000);
        };
    </script>
</head>
<body style="background-image: url('fresh/reg-bg.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center center;">
    <div class="container">
        <div class="wrapper">
            <div class="title"><span>Login Form</span></div>
            <form id="form1" runat="server">
                <div class="row">
                    <i class="fas fa-user"></i>
                    <asp:TextBox TextMode="email" ID="TextBox1" placeholder="enter email" runat="server" required="true" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                </div>
                <div class="row">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" placeholder="Enter password" required="true"></asp:TextBox>

                </div>
                <%--<div class="pass"><a href="ForgotPassword.aspx">Forgot password?</a></div>--%>
                <div class="row button">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="login" />
                </div>
                <div class="signup-link">Not a member? <a href="WebForm3.aspx">Signup now</a></div>
                <div class="signup-link">Without Login <a href="index.aspx">proceed</a></div>
                <asp:Label ID="lblErrorMessage" runat="server" class="error-message" Visible="false"></asp:Label>

            </form>
</body>
</html>


<%--<script>

    // Wait for the page to load
    window.addEventListener('DOMContentLoaded', function () {
        // Get the textbox element
        var textBox = document.getElementById('TextBox1');

        // Check if there is a saved value in session storage
        var savedValue = sessionStorage.getItem('textboxValue');
        if (savedValue !== null) {
            // Assign the saved value to the textbox
            TextBox1.value = null;

            // Clear the saved value from session storage
            sessionStorage.removeItem('textboxValue');
        }

        // Listen for the beforeunload event (page refresh or close)
        window.addEventListener('beforeunload', function () {
            // Save the textbox value to session storage
            sessionStorage.setItem('textboxValue', TextBox1.value);
        });
    });

</script>--%>