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
    public partial class FrmAutopartes : Form
    {
        private string servidor = @"Data Source=V3-472P\SQLEXPRESS;Initial Catalog=db_automotriz;Integrated Security=True";

        public FrmAutopartes()
        {
            InitializeComponent();
            CargarComboModelo();
        }

        private void CargarComboModelo()
        {
            SqlConnection cnn = new SqlConnection(servidor);
            SqlCommand cmd = new SqlCommand();
            DataTable tbl = new DataTable();

            cnn.Open();

            cmd.Connection = cnn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM MODELOS";

            tbl.Load(cmd.ExecuteReader());

            cboModelo.DataSource = tbl;
            cboModelo.ValueMember = tbl.Columns[1].ColumnName;
            cboModelo.SelectedIndex = -1;

            cnn.Close();
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            SqlConnection cnn = new SqlConnection(servidor);
            SqlCommand cmd = new SqlCommand();
            DataTable tbl = new DataTable();

            cnn.Open();

            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_CONSULTAR_AUTOPARTES";

            cmd.Parameters.AddWithValue("@descripcion", txtDescripcion.Text);
            cmd.Parameters.AddWithValue("@id_modelo", cboModelo.SelectedIndex +1);

            tbl.Load(cmd.ExecuteReader());

            cnn.Close();

            dgvAutopartes.Rows.Clear();

            for (int i = 0; i < tbl.Rows.Count; i++)
            {
                dgvAutopartes.Rows.Add(new object[]
                {
                        tbl.Rows[i]["id_producto"],
                        tbl.Rows[i]["descripcion"],
                        tbl.Rows[i]["modelo"],
                        tbl.Rows[i]["precio_unitario"],
                        tbl.Rows[i]["stock"],
                        tbl.Rows[i]["stock_minimo"],

                });
            }
        }

        private void Limpiar_Click(object sender, EventArgs e)
        {
            dgvAutopartes.Rows.Clear();
            cboModelo.SelectedIndex = -1;
        }
    }
}
