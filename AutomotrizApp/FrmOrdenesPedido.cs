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
    public partial class FrmOrdenesPedido : Form
    {
        private string servidor = @"Data Source=V3-472P\SQLEXPRESS;Initial Catalog=db_automotriz;Integrated Security=True";

        public FrmOrdenesPedido()
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
            cmd.CommandText = "SP_CONSULTAR_ORDENES_TODAS";

            tbl.Load(cmd.ExecuteReader());

            cnn.Close();

            dgvOrdenes.Rows.Clear();

            for (int i = 0; i < tbl.Rows.Count; i++)
            {
                dgvOrdenes.Rows.Add(new object[]
                {
                        tbl.Rows[i]["id_orden_pedido"],
                        tbl.Rows[i]["fecha_entrega"],
                        tbl.Rows[i]["descripcion"],
                        tbl.Rows[i]["cantidad"],
                        tbl.Rows[i]["cliente"],
                        tbl.Rows[i]["telefono"],
                        tbl.Rows[i]["email"],
                });
            }
        }

        private void btnFiltrar_Click(object sender, EventArgs e)
        {
            SqlConnection cnn = new SqlConnection(servidor);
            SqlCommand cmd = new SqlCommand();
            DataTable tbl = new DataTable();

            cnn.Open();

            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_CONSULTAR_ORDENES_FILTRO";

            tbl.Load(cmd.ExecuteReader());

            cnn.Close();

            dgvOrdenes.Rows.Clear();

            for (int i = 0; i < tbl.Rows.Count; i++)
            {
                dgvOrdenes.Rows.Add(new object[]
                {
                        tbl.Rows[i]["id_orden_pedido"],
                        tbl.Rows[i]["fecha_entrega"],
                        tbl.Rows[i]["descripcion"],
                        tbl.Rows[i]["cantidad"],
                        tbl.Rows[i]["cliente"],
                        tbl.Rows[i]["telefono"],
                        tbl.Rows[i]["email"],
                });
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            dgvOrdenes.Rows.Clear();
        }
    }
}
