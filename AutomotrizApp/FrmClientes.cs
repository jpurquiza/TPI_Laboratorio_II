using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AutomotrizApp
{
    public partial class FrmClientes : Form
    {
        private string servidor = @"Data Source=DESKTOP-VO7FRO7\SQLEXPRESS;Initial Catalog=db_automotriz;Integrated Security=True";
        public FrmClientes()
        {
            InitializeComponent();


        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            int check;
            if (rbtConCompra.Checked)
                check = 0;
            else
                check = 1; 


            SqlConnection cnn = new SqlConnection(servidor);
            SqlCommand cmd = new SqlCommand();
            DataTable tbl = new DataTable();

            cnn.Open();

            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_CONSULTAR_CLIENTES";

            cmd.Parameters.AddWithValue("@fecha_desde", dtpDesde.Value);
            cmd.Parameters.AddWithValue("@fechas_hasta", dtpHasta.Value);
            cmd.Parameters.AddWithValue("@check_aux", check);

            tbl.Load(cmd.ExecuteReader());

            cnn.Close();

            dgvClientes.Rows.Clear();

            for (int i = 0; i < tbl.Rows.Count; i++)
            {
                dgvClientes.Rows.Add(new object[]
                {
                        tbl.Rows[i]["id_cliente"],
                        tbl.Rows[i]["Cliente"],
                        tbl.Rows[i]["tipo_cliente"],
                        tbl.Rows[i]["cuil_cuit"],
                        tbl.Rows[i]["telefono"],
                        tbl.Rows[i]["email"]
                });
            }
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            dgvClientes.Rows.Clear();
        }
    }
}
