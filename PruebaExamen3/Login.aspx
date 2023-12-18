<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PruebaExamen3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Iniciar sesión</title>
    <link rel="stylesheet" href="login-styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Iniciar Sesión</h2>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Correo electrónico" /><br />
            <asp:TextBox ID="txtContraseña" runat="server" TextMode="Password" placeholder="Contraseña" /><br />
            <asp:Button ID="btnIniciarSesion" runat="server" Text="Iniciar Sesión" OnClick="btnIniciarSesion_Click" />
        </div>
    </form>
</body>
</html>

