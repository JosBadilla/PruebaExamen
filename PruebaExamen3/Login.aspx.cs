using System;

namespace PruebaExamen3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            string correo = txtEmail.Text;
            string contraseña = txtContraseña.Text;

            if (correo == "joseph2013@gmail.com" && contraseña == "JOS963852")
            {
                Response.Redirect("AdminPage.aspx");
            }
            else
            {
                Response.Write("<script>alert('Credenciales incorrectas. Por favor, inténtalo de nuevo.');</script>");
            }
        }
    }
}
