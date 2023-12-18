<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="PruebaExamen3.AdminPage" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Agregar Cliente</h2>
            <asp:TextBox ID="txtNombreCliente" runat="server" placeholder="Nombre" /><br />
            <asp:TextBox ID="txtApellidoCliente" runat="server" placeholder="Apellido" /><br />
            <asp:TextBox ID="txtEmailCliente" runat="server" placeholder="Correo electrónico" /><br />
            <asp:TextBox ID="txtContrasenaCliente" runat="server" TextMode="Password" placeholder="Contraseña" /><br />
            <asp:Button ID="btnAgregarCliente" runat="server" Text="Agregar Cliente" OnClick="btnAgregarCliente_Click" /><br /><br />

            <h2>Agregar Pedido</h2>
            <asp:DropDownList ID="ddlClientes" runat="server" DataTextField="Email" DataValueField="ClienteID" /><br />
            <asp:TextBox ID="txtDescripcionPedido" runat="server" placeholder="Descripción del pedido" /><br />
            <asp:Button ID="btnAgregarPedido" runat="server" Text="Agregar Pedido" OnClick="btnAgregarPedido_Click" /><br /><br />
        </div>
    </form>
</body>
</html>

