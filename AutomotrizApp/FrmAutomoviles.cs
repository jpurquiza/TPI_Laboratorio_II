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
    public partial class FrmAutomoviles : Form
    {
        private string servidor = @"Data Source=V3-472P\SQLEXPRESS;Initial Catalog=db_automotriz;Integrated Security=True";

        public FrmAutomoviles()
        {
            InitializeComponent();

            CargarComboModelo();
            CargarComboSegmento();
            CargarComboCombustible();
            CargarComboTransmision();
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

        private void CargarComboSegmento()
        {
            SqlConnection cnn = new SqlConnection(servidor);
            SqlCommand cmd = new SqlCommand();
            DataTable tbl = new DataTable();

            cnn.Open();

            cmd.Connection = cnn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM SEGMENTOS";

            tbl.Load(cmd.ExecuteReader());

            cboSegmento.DataSource = tbl;
            cboSegmento.ValueMember = tbl.Columns[1].ColumnName;
            cboSegmento.SelectedIndex = -1;

            cnn.Close();
        }

        private void CargarComboCombustible()
        {
            SqlConnection cnn = new SqlConnection(servidor);
            SqlCommand cmd = new SqlCommand();
            DataTable tbl = new DataTable();

            cnn.Open();

            cmd.Connection = cnn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TIPOS_COMBUSTIBLE";

            tbl.Load(cmd.ExecuteReader());

            cboCombustible.DataSource = tbl;
            cboCombustible.ValueMember = tbl.Columns[1].ColumnName;
            cboCombustible.SelectedIndex = -1;

            cnn.Close();
        }

        private void CargarComboTransmision()
        {
            SqlConnection cnn = new SqlConnection(servidor);
            SqlCommand cmd = new SqlCommand();
            DataTable tbl = new DataTable();

            cnn.Open();

            cmd.Connection = cnn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TIPOS_TRANSMISION";

            tbl.Load(cmd.ExecuteReader());

            cboTransmision.DataSource = tbl;
            cboTransmision.ValueMember = tbl.Columns[1].ColumnName;
            cboTransmision.SelectedIndex = -1;

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
            cmd.CommandText = "SP_CONSULTAR_PRODUCTOS";

            if (string.IsNullOrEmpty(txtDescripcion.Text))
                cmd.Parameters.AddWithValue("@descripcion", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@descripcion", txtDescripcion.Text);

            if (cboModelo.SelectedIndex == -1)
                cmd.Parameters.AddWithValue("@id_modelo", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@id_modelo", cboModelo.SelectedIndex + 1);

            if (cboSegmento.SelectedIndex == -1)
                cmd.Parameters.AddWithValue("@id_segmento", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@id_segmento", cboSegmento.SelectedIndex + 1);

            if (cboCombustible.SelectedIndex == -1)
                cmd.Parameters.AddWithValue("@id_combustible", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@id_combustible", cboCombustible.SelectedIndex +1);

            if (cboTransmision.SelectedIndex == -1)
                cmd.Parameters.AddWithValue("@id_transmision", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@id_transmision", cboTransmision.SelectedIndex +1);

            cmd.Parameters.AddWithValue("@precio_desde", nudDesde.Value);
            cmd.Parameters.AddWithValue("@precio_hasta", nudHasta.Value);

            tbl.Load(cmd.ExecuteReader());

            cnn.Close();

            dgvProductos.Rows.Clear();

            for (int i = 0; i < tbl.Rows.Count; i++)
            {
                dgvProductos.Rows.Add(new object[]
                {
                        tbl.Rows[i]["descripcion"],
                        tbl.Rows[i]["modelo"],
                        tbl.Rows[i]["segmento"],
                        tbl.Rows[i]["tipo_combustible"],
                        tbl.Rows[i]["tipo_transmision"],
                        tbl.Rows[i]["precio_unitario"],
                        tbl.Rows[i]["stock"],
                });

            }
        }

        private void Limpiar_Click(object sender, EventArgs e)
        {
            cboModelo.SelectedIndex = -1;
            cboSegmento.SelectedIndex = -1;
            cboCombustible.SelectedIndex = -1;
            cboTransmision.SelectedIndex = -1;
            txtDescripcion.Text = string.Empty;
            dgvProductos.Rows.Clear();
        }
    }
}
