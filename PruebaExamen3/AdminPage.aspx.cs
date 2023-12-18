using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI;


namespace PruebaExamen3
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClientesDropDown();
            }
        }

        protected void CargarClientesDropDown()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT ClienteID, Email FROM Clientes";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                con.Open();
                da.Fill(dt);

                ddlClientes.DataSource = dt;
                ddlClientes.DataTextField = "Email";
                ddlClientes.DataValueField = "ClienteID";
                ddlClientes.DataBind();
            }
        }

        protected void btnAgregarCliente_Click(object sender, EventArgs e)
        {
            string nombre = txtNombreCliente.Text;
            string apellido = txtApellidoCliente.Text;
            string email = txtEmailCliente.Text;
            string contraseña = txtContrasenaCliente.Text;

            AgregarCliente(nombre, apellido, email, contraseña);
            CargarClientesDropDown();

            MostrarMensaje("Usuario agregado correctamente");
            LimpiarCamposUsuario();
        }

        protected void btnAgregarPedido_Click(object sender, EventArgs e)
        {
            int clienteID = Convert.ToInt32(ddlClientes.SelectedValue);
            string descripcionPedido = txtDescripcionPedido.Text;

            AgregarPedido(clienteID, descripcionPedido);

            MostrarMensaje("Pedido agregado correctamente");
            LimpiarCamposPedido();
        }

        protected void AgregarCliente(string nombre, string apellido, string email, string contraseña)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Clientes (Nombre, Apellido, Email, Contraseña) VALUES (@Nombre, @Apellido, @Email, @Contraseña)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Apellido", apellido);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Contraseña", contraseña);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void AgregarPedido(int clienteID, string descripcionPedido)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Pedidos (ClienteID, Descripcion, FechaPedido) VALUES (@ClienteID, @Descripcion, GETDATE())";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ClienteID", clienteID);
                cmd.Parameters.AddWithValue("@Descripcion", descripcionPedido);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void MostrarMensaje(string mensaje)
        {
            string script = $"alert('{mensaje}')";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", script, true);
        }

        private void LimpiarCamposUsuario()
        {
            txtNombreCliente.Text = string.Empty;
            txtApellidoCliente.Text = string.Empty;
            txtEmailCliente.Text = string.Empty;
            txtContrasenaCliente.Text = string.Empty;
        }

        private void LimpiarCamposPedido()
        {
            txtDescripcionPedido.Text = string.Empty;
        }
    }
}

