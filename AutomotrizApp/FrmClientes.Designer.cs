
namespace AutomotrizApp
{
    partial class FrmClientes
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
            this.label2 = new System.Windows.Forms.Label();
            this.rbtnConCompra = new System.Windows.Forms.RadioButton();
            this.rbtnSinCompra = new System.Windows.Forms.RadioButton();
            this.btnLimpiar = new System.Windows.Forms.Button();
            this.btnConsultar = new System.Windows.Forms.Button();
            this.lblFechaHasta = new System.Windows.Forms.Label();
            this.dtpHasta = new System.Windows.Forms.DateTimePicker();
            this.lblFechaDesde = new System.Windows.Forms.Label();
            this.dtpDesde = new System.Windows.Forms.DateTimePicker();
            this.dgvClientes = new System.Windows.Forms.DataGridView();
            this.id_cliente = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cliente = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tipo_cliente = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cuilcuit = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.telefono = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.email = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvClientes)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.rbtnConCompra);
            this.groupBox1.Controls.Add(this.rbtnSinCompra);
            this.groupBox1.Controls.Add(this.btnLimpiar);
            this.groupBox1.Controls.Add(this.btnConsultar);
            this.groupBox1.Controls.Add(this.lblFechaHasta);
            this.groupBox1.Controls.Add(this.dtpHasta);
            this.groupBox1.Controls.Add(this.lblFechaDesde);
            this.groupBox1.Controls.Add(this.dtpDesde);
            this.groupBox1.Location = new System.Drawing.Point(13, 13);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(775, 147);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "CRITERIOS DE BUSQUEDA";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(352, 32);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(302, 26);
            this.label2.TabIndex = 15;
            this.label2.Text = "Seleccionar según clientes que hayan realizado compras o no \r\nentre las fechas se" +
    "leccionadas";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // rbtnConCompra
            // 
            this.rbtnConCompra.AutoSize = true;
            this.rbtnConCompra.Location = new System.Drawing.Point(384, 72);
            this.rbtnConCompra.Name = "rbtnConCompra";
            this.rbtnConCompra.Size = new System.Drawing.Size(87, 17);
            this.rbtnConCompra.TabIndex = 13;
            this.rbtnConCompra.TabStop = true;
            this.rbtnConCompra.Text = "Con compras";
            this.rbtnConCompra.UseVisualStyleBackColor = true;
            // 
            // rbtnSinCompra
            // 
            this.rbtnSinCompra.AutoSize = true;
            this.rbtnSinCompra.Location = new System.Drawing.Point(520, 72);
            this.rbtnSinCompra.Name = "rbtnSinCompra";
            this.rbtnSinCompra.Size = new System.Drawing.Size(83, 17);
            this.rbtnSinCompra.TabIndex = 12;
            this.rbtnSinCompra.TabStop = true;
            this.rbtnSinCompra.Text = "Sin compras";
            this.rbtnSinCompra.UseVisualStyleBackColor = true;
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.Location = new System.Drawing.Point(688, 112);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(85, 25);
            this.btnLimpiar.TabIndex = 11;
            this.btnLimpiar.Text = "LIMPIAR";
            this.btnLimpiar.UseVisualStyleBackColor = true;
            this.btnLimpiar.Click += new System.EventHandler(this.btnLimpiar_Click);
            // 
            // btnConsultar
            // 
            this.btnConsultar.Location = new System.Drawing.Point(597, 112);
            this.btnConsultar.Name = "btnConsultar";
            this.btnConsultar.Size = new System.Drawing.Size(85, 25);
            this.btnConsultar.TabIndex = 10;
            this.btnConsultar.Text = "CONSULTAR";
            this.btnConsultar.UseVisualStyleBackColor = true;
            this.btnConsultar.Click += new System.EventHandler(this.btnConsultar_Click);
            // 
            // lblFechaHasta
            // 
            this.lblFechaHasta.AutoSize = true;
            this.lblFechaHasta.Location = new System.Drawing.Point(8, 82);
            this.lblFechaHasta.Name = "lblFechaHasta";
            this.lblFechaHasta.Size = new System.Drawing.Size(81, 13);
            this.lblFechaHasta.TabIndex = 9;
            this.lblFechaHasta.Text = "FECHA HASTA";
            // 
            // dtpHasta
            // 
            this.dtpHasta.Location = new System.Drawing.Point(96, 76);
            this.dtpHasta.Name = "dtpHasta";
            this.dtpHasta.Size = new System.Drawing.Size(200, 20);
            this.dtpHasta.TabIndex = 8;
            this.dtpHasta.Value = new System.DateTime(2021, 11, 10, 0, 0, 0, 0);
            // 
            // lblFechaDesde
            // 
            this.lblFechaDesde.AutoSize = true;
            this.lblFechaDesde.Location = new System.Drawing.Point(8, 40);
            this.lblFechaDesde.Name = "lblFechaDesde";
            this.lblFechaDesde.Size = new System.Drawing.Size(82, 13);
            this.lblFechaDesde.TabIndex = 7;
            this.lblFechaDesde.Text = "FECHA DESDE";
            // 
            // dtpDesde
            // 
            this.dtpDesde.Location = new System.Drawing.Point(96, 32);
            this.dtpDesde.Name = "dtpDesde";
            this.dtpDesde.Size = new System.Drawing.Size(200, 20);
            this.dtpDesde.TabIndex = 6;
            this.dtpDesde.Value = new System.DateTime(2020, 1, 1, 0, 0, 0, 0);
            // 
            // dgvClientes
            // 
            this.dgvClientes.AllowUserToAddRows = false;
            this.dgvClientes.AllowUserToDeleteRows = false;
            this.dgvClientes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvClientes.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.id_cliente,
            this.cliente,
            this.tipo_cliente,
            this.cuilcuit,
            this.telefono,
            this.email});
            this.dgvClientes.Location = new System.Drawing.Point(13, 168);
            this.dgvClientes.Name = "dgvClientes";
            this.dgvClientes.ReadOnly = true;
            this.dgvClientes.Size = new System.Drawing.Size(775, 270);
            this.dgvClientes.TabIndex = 1;
            // 
            // id_cliente
            // 
            this.id_cliente.HeaderText = "ID";
            this.id_cliente.Name = "id_cliente";
            this.id_cliente.ReadOnly = true;
            // 
            // cliente
            // 
            this.cliente.HeaderText = "CLIENTE";
            this.cliente.Name = "cliente";
            this.cliente.ReadOnly = true;
            // 
            // tipo_cliente
            // 
            this.tipo_cliente.HeaderText = "TIPO CLIENTE";
            this.tipo_cliente.Name = "tipo_cliente";
            this.tipo_cliente.ReadOnly = true;
            this.tipo_cliente.Width = 120;
            // 
            // cuilcuit
            // 
            this.cuilcuit.HeaderText = "CUIL/CUIT";
            this.cuilcuit.Name = "cuilcuit";
            this.cuilcuit.ReadOnly = true;
            // 
            // telefono
            // 
            this.telefono.HeaderText = "TELEFONO";
            this.telefono.Name = "telefono";
            this.telefono.ReadOnly = true;
            // 
            // email
            // 
            this.email.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.email.HeaderText = "E-MAIL";
            this.email.Name = "email";
            this.email.ReadOnly = true;
            // 
            // FrmClientes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.dgvClientes);
            this.Controls.Add(this.groupBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "FrmClientes";
            this.Text = "FrmConsultarClientes";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvClientes)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.DataGridView dgvClientes;
        private System.Windows.Forms.Button btnLimpiar;
        private System.Windows.Forms.Button btnConsultar;
        private System.Windows.Forms.Label lblFechaHasta;
        private System.Windows.Forms.DateTimePicker dtpHasta;
        private System.Windows.Forms.Label lblFechaDesde;
        private System.Windows.Forms.DateTimePicker dtpDesde;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.RadioButton rbtnConCompra;
        private System.Windows.Forms.RadioButton rbtnSinCompra;
        private System.Windows.Forms.DataGridViewTextBoxColumn id_cliente;
        private System.Windows.Forms.DataGridViewTextBoxColumn cliente;
        private System.Windows.Forms.DataGridViewTextBoxColumn tipo_cliente;
        private System.Windows.Forms.DataGridViewTextBoxColumn cuilcuit;
        private System.Windows.Forms.DataGridViewTextBoxColumn telefono;
        private System.Windows.Forms.DataGridViewTextBoxColumn email;
    }
}