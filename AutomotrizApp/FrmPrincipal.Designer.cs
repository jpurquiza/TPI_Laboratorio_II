
namespace AutomotrizApp
{
    partial class FrmPrincipal
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnClientes = new System.Windows.Forms.Button();
            this.btnAutopartes = new System.Windows.Forms.Button();
            this.btnAutomoviles = new System.Windows.Forms.Button();
            this.btnFacturas = new System.Windows.Forms.Button();
            this.btnOrdenes = new System.Windows.Forms.Button();
            this.pnlPrincipal = new System.Windows.Forms.Panel();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnOrdenes);
            this.groupBox1.Controls.Add(this.btnClientes);
            this.groupBox1.Controls.Add(this.btnAutopartes);
            this.groupBox1.Controls.Add(this.btnAutomoviles);
            this.groupBox1.Controls.Add(this.btnFacturas);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(184, 445);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "CONSULTAS";
            // 
            // btnClientes
            // 
            this.btnClientes.Location = new System.Drawing.Point(6, 143);
            this.btnClientes.Name = "btnClientes";
            this.btnClientes.Size = new System.Drawing.Size(168, 35);
            this.btnClientes.TabIndex = 3;
            this.btnClientes.Text = "CLIENTES";
            this.btnClientes.UseVisualStyleBackColor = true;
            // 
            // btnAutopartes
            // 
            this.btnAutopartes.Location = new System.Drawing.Point(6, 34);
            this.btnAutopartes.Name = "btnAutopartes";
            this.btnAutopartes.Size = new System.Drawing.Size(168, 35);
            this.btnAutopartes.TabIndex = 2;
            this.btnAutopartes.Text = "AUTOPARTES";
            this.btnAutopartes.UseVisualStyleBackColor = true;
            this.btnAutopartes.Click += new System.EventHandler(this.btnAutopartes_Click);
            // 
            // btnAutomoviles
            // 
            this.btnAutomoviles.Location = new System.Drawing.Point(6, 88);
            this.btnAutomoviles.Name = "btnAutomoviles";
            this.btnAutomoviles.Size = new System.Drawing.Size(168, 35);
            this.btnAutomoviles.TabIndex = 1;
            this.btnAutomoviles.Text = "AUTOMOVILES";
            this.btnAutomoviles.UseVisualStyleBackColor = true;
            this.btnAutomoviles.Click += new System.EventHandler(this.btnAutomoviles_Click);
            // 
            // btnFacturas
            // 
            this.btnFacturas.Location = new System.Drawing.Point(6, 195);
            this.btnFacturas.Name = "btnFacturas";
            this.btnFacturas.Size = new System.Drawing.Size(168, 35);
            this.btnFacturas.TabIndex = 0;
            this.btnFacturas.Text = "FACTURAS";
            this.btnFacturas.UseVisualStyleBackColor = true;
            this.btnFacturas.Click += new System.EventHandler(this.btnFacturas_Click);
            // 
            // btnOrdenes
            // 
            this.btnOrdenes.Location = new System.Drawing.Point(6, 247);
            this.btnOrdenes.Name = "btnOrdenes";
            this.btnOrdenes.Size = new System.Drawing.Size(168, 35);
            this.btnOrdenes.TabIndex = 4;
            this.btnOrdenes.Text = "ORDENES DE PEDIDO";
            this.btnOrdenes.UseVisualStyleBackColor = true;
            this.btnOrdenes.Click += new System.EventHandler(this.btnOrdenes_Click);
            // 
            // pnlPrincipal
            // 
            this.pnlPrincipal.Location = new System.Drawing.Point(202, 12);
            this.pnlPrincipal.Name = "pnlPrincipal";
            this.pnlPrincipal.Size = new System.Drawing.Size(850, 450);
            this.pnlPrincipal.TabIndex = 1;
            // 
            // FrmPrincipal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1061, 469);
            this.Controls.Add(this.pnlPrincipal);
            this.Controls.Add(this.groupBox1);
            this.Name = "FrmPrincipal";
            this.Text = "PRINCIPAL";
            this.groupBox1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnAutomoviles;
        private System.Windows.Forms.Button btnFacturas;
        private System.Windows.Forms.Button btnAutopartes;
        private System.Windows.Forms.Button btnClientes;
        private System.Windows.Forms.Button btnOrdenes;
        private System.Windows.Forms.Panel pnlPrincipal;
    }
}