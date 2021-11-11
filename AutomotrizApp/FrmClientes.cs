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
        private string servidor = @"Data Source=V3-472P\SQLEXPRESS;Initial Catalog=db_automotriz;Integrated Security=True";

        public FrmClientes()
        {
            InitializeComponent();
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            SqlConnection cnn = new SqlConnection(servidor);
            SqlCommand cmd = new SqlCommand();
            DataTable tbl = new DataTable();

            cnn.Open();

            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_CONSULTAR_FACTURAS";

            cmd.Parameters.AddWithValue("@fecha_desde", dtpDesde.Value);
            cmd.Parameters.AddWithValue("@fecha_hasta", dtpHasta.Value);

            tbl.Load(cmd.ExecuteReader());

            cnn.Close();

            dgvClientes.Rows.Clear();

            for (int i = 0; i < tbl.Rows.Count; i++)
            {
                dgvClientes.Rows.Add(new object[]
                {
                        tbl.Rows[i]["nro_factura"],
                        tbl.Rows[i]["fecha"],
                        tbl.Rows[i]["cliente"],
                        tbl.Rows[i]["cantidad"],
                        tbl.Rows[i]["descripcion"],
                        tbl.Rows[i]["subtotal"],
                        tbl.Rows[i]["descuento"],
                        tbl.Rows[i]["total"],
                });
            }
        }
    }
}
