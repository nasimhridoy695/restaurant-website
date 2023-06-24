<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Cafe_Barcode.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table align="center">
            <tr>
                <td>
                    username
                </td>
                <td>
                    <asp:TextBox ID="Rtbusername" runat="server"></asp:TextBox>
                </td>
            </tr>
           <tr>
                <td>
                    email
                </td>
                <td>
                    <asp:TextBox ID="Rtbemail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    password
                </td>
                <td>
                    <asp:TextBox ID="Rtbpassword" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                    <asp:Button ID="reg_button" runat="server" Text="register" OnClick="Button1_Click" />
                </td>
            </tr>

        </table>
    </form>
</body>
</html>
