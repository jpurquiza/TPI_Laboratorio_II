using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AutomotrizApp
{
    public partial class FrmPrincipal : Form
    {
        public FrmPrincipal()
        {
            InitializeComponent();
        }

        private void btnAutomoviles_Click(object sender, EventArgs e)
        {
            pnlPrincipal.Controls.Clear();
            FrmAutomoviles frm = new FrmAutomoviles();
            frm.TopLevel = false;
            pnlPrincipal.Controls.Add(frm);
            frm.Show();
        }

        private void btnFacturas_Click(object sender, EventArgs e)
        {
            pnlPrincipal.Controls.Clear();
            FrmFacturas frm = new FrmFacturas();
            frm.TopLevel = false;
            pnlPrincipal.Controls.Add(frm);
            frm.Show();
        }

        private void btnOrdenes_Click(object sender, EventArgs e)
        {
            pnlPrincipal.Controls.Clear();
            FrmOrdenesPedido frm = new FrmOrdenesPedido();
            frm.TopLevel = false;
            pnlPrincipal.Controls.Add(frm);
            frm.Show();
        }

        private void btnAutopartes_Click(object sender, EventArgs e)
        {
            pnlPrincipal.Controls.Clear();
            FrmAutopartes frm = new FrmAutopartes();
            frm.TopLevel = false;
            pnlPrincipal.Controls.Add(frm);
            frm.Show();
        }

        private void btnClientes_Click(object sender, EventArgs e)
        {
            pnlPrincipal.Controls.Clear();
            FrmClientes frm = new FrmClientes();
            frm.TopLevel = false;
            pnlPrincipal.Controls.Add(frm);
            frm.Show();
        }
    }
}
