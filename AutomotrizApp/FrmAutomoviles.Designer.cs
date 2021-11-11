
namespace AutomotrizApp
{
    partial class FrmAutomoviles
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.dgvProductos = new System.Windows.Forms.DataGridView();
            this.descripcion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.modelo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.segmento = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.combustible = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.transmision = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.precio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.stock = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.nudHasta = new System.Windows.Forms.NumericUpDown();
            this.lblHasta = new System.Windows.Forms.Label();
            this.lblDesde = new System.Windows.Forms.Label();
            this.nudDesde = new System.Windows.Forms.NumericUpDown();
            this.Limpiar = new System.Windows.Forms.Button();
            this.btnConsultar = new System.Windows.Forms.Button();
            this.lblDescripcion = new System.Windows.Forms.Label();
            this.txtDescripcion = new System.Windows.Forms.TextBox();
            this.lblTransmision = new System.Windows.Forms.Label();
            this.cboTransmision = new System.Windows.Forms.ComboBox();
            this.lblCombustible = new System.Windows.Forms.Label();
            this.cboCombustible = new System.Windows.Forms.ComboBox();
            this.lblSegmento = new System.Windows.Forms.Label();
            this.cboSegmento = new System.Windows.Forms.ComboBox();
            this.lblModelo = new System.Windows.Forms.Label();
            this.cboModelo = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvProductos)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudHasta)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudDesde)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvProductos
            // 
            this.dgvProductos.AllowUserToAddRows = false;
            this.dgvProductos.AllowUserToDeleteRows = false;
            this.dgvProductos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvProductos.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.descripcion,
            this.modelo,
            this.segmento,
            this.combustible,
            this.transmision,
            this.precio,
            this.stock});
            this.dgvProductos.Location = new System.Drawing.Point(12, 169);
            this.dgvProductos.Name = "dgvProductos";
            this.dgvProductos.ReadOnly = true;
            this.dgvProductos.Size = new System.Drawing.Size(810, 230);
            this.dgvProductos.TabIndex = 0;
            // 
            // descripcion
            // 
            this.descripcion.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.descripcion.HeaderText = "DESCRIPCION";
            this.descripcion.Name = "descripcion";
            this.descripcion.ReadOnly = true;
            // 
            // modelo
            // 
            this.modelo.HeaderText = "MODELO";
            this.modelo.Name = "modelo";
            this.modelo.ReadOnly = true;
            this.modelo.Width = 110;
            // 
            // segmento
            // 
            this.segmento.HeaderText = "SEGMENTO";
            this.segmento.Name = "segmento";
            this.segmento.ReadOnly = true;
            this.segmento.Width = 110;
            // 
            // combustible
            // 
            this.combustible.HeaderText = "COMBUSTIBLE";
            this.combustible.Name = "combustible";
            this.combustible.ReadOnly = true;
            this.combustible.Width = 110;
            // 
            // transmision
            // 
            this.transmision.HeaderText = "TRANSMISION";
            this.transmision.Name = "transmision";
            this.transmision.ReadOnly = true;
            this.transmision.Width = 110;
            // 
            // precio
            // 
            this.precio.HeaderText = "PRECIO $";
            this.precio.Name = "precio";
            this.precio.ReadOnly = true;
            this.precio.Width = 80;
            // 
            // stock
            // 
            this.stock.HeaderText = "STOCK";
            this.stock.Name = "stock";
            this.stock.ReadOnly = true;
            this.stock.Width = 70;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.nudHasta);
            this.groupBox1.Controls.Add(this.lblHasta);
            this.groupBox1.Controls.Add(this.lblDesde);
            this.groupBox1.Controls.Add(this.nudDesde);
            this.groupBox1.Controls.Add(this.Limpiar);
            this.groupBox1.Controls.Add(this.btnConsultar);
            this.groupBox1.Controls.Add(this.lblDescripcion);
            this.groupBox1.Controls.Add(this.txtDescripcion);
            this.groupBox1.Controls.Add(this.lblTransmision);
            this.groupBox1.Controls.Add(this.cboTransmision);
            this.groupBox1.Controls.Add(this.lblCombustible);
            this.groupBox1.Controls.Add(this.cboCombustible);
            this.groupBox1.Controls.Add(this.lblSegmento);
            this.groupBox1.Controls.Add(this.cboSegmento);
            this.groupBox1.Controls.Add(this.lblModelo);
            this.groupBox1.Controls.Add(this.cboModelo);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(810, 151);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "CRITERIOS DE BUSQUEDA";
            this.groupBox1.Enter += new System.EventHandler(this.groupBox1_Enter);
            // 
            // nudHasta
            // 
            this.nudHasta.Increment = new decimal(new int[] {
            100000,
            0,
            0,
            0});
            this.nudHasta.Location = new System.Drawing.Point(708, 23);
            this.nudHasta.Maximum = new decimal(new int[] {
            7000000,
            0,
            0,
            0});
            this.nudHasta.Minimum = new decimal(new int[] {
            1000000,
            0,
            0,
            0});
            this.nudHasta.Name = "nudHasta";
            this.nudHasta.Size = new System.Drawing.Size(85, 20);
            this.nudHasta.TabIndex = 20;
            this.nudHasta.Value = new decimal(new int[] {
            7000000,
            0,
            0,
            0});
            // 
            // lblHasta
            // 
            this.lblHasta.AutoSize = true;
            this.lblHasta.Location = new System.Drawing.Point(607, 26);
            this.lblHasta.Name = "lblHasta";
            this.lblHasta.Size = new System.Drawing.Size(95, 13);
            this.lblHasta.TabIndex = 19;
            this.lblHasta.Text = "PRECIO HASTA $";
            // 
            // lblDesde
            // 
            this.lblDesde.AutoSize = true;
            this.lblDesde.Location = new System.Drawing.Point(404, 25);
            this.lblDesde.Name = "lblDesde";
            this.lblDesde.Size = new System.Drawing.Size(96, 13);
            this.lblDesde.TabIndex = 17;
            this.lblDesde.Text = "PRECIO DESDE $";
            // 
            // nudDesde
            // 
            this.nudDesde.Increment = new decimal(new int[] {
            100000,
            0,
            0,
            0});
            this.nudDesde.Location = new System.Drawing.Point(505, 23);
            this.nudDesde.Maximum = new decimal(new int[] {
            7000000,
            0,
            0,
            0});
            this.nudDesde.Minimum = new decimal(new int[] {
            1000000,
            0,
            0,
            0});
            this.nudDesde.Name = "nudDesde";
            this.nudDesde.Size = new System.Drawing.Size(85, 20);
            this.nudDesde.TabIndex = 16;
            this.nudDesde.Value = new decimal(new int[] {
            1000000,
            0,
            0,
            0});
            // 
            // Limpiar
            // 
            this.Limpiar.Location = new System.Drawing.Point(708, 105);
            this.Limpiar.Name = "Limpiar";
            this.Limpiar.Size = new System.Drawing.Size(85, 25);
            this.Limpiar.TabIndex = 15;
            this.Limpiar.Text = "LIMPIAR";
            this.Limpiar.UseVisualStyleBackColor = true;
            this.Limpiar.Click += new System.EventHandler(this.Limpiar_Click);
            // 
            // btnConsultar
            // 
            this.btnConsultar.Location = new System.Drawing.Point(610, 105);
            this.btnConsultar.Name = "btnConsultar";
            this.btnConsultar.Size = new System.Drawing.Size(85, 25);
            this.btnConsultar.TabIndex = 14;
            this.btnConsultar.Text = "CONSULTAR";
            this.btnConsultar.UseVisualStyleBackColor = true;
            this.btnConsultar.Click += new System.EventHandler(this.btnConsultar_Click);
            // 
            // lblDescripcion
            // 
            this.lblDescripcion.AutoSize = true;
            this.lblDescripcion.Location = new System.Drawing.Point(13, 30);
            this.lblDescripcion.Name = "lblDescripcion";
            this.lblDescripcion.Size = new System.Drawing.Size(80, 13);
            this.lblDescripcion.TabIndex = 13;
            this.lblDescripcion.Text = "DESCRIPCION";
            // 
            // txtDescripcion
            // 
            this.txtDescripcion.Location = new System.Drawing.Point(99, 27);
            this.txtDescripcion.Name = "txtDescripcion";
            this.txtDescripcion.Size = new System.Drawing.Size(233, 20);
            this.txtDescripcion.TabIndex = 12;
            // 
            // lblTransmision
            // 
            this.lblTransmision.AutoSize = true;
            this.lblTransmision.Location = new System.Drawing.Point(250, 111);
            this.lblTransmision.Name = "lblTransmision";
            this.lblTransmision.Size = new System.Drawing.Size(82, 13);
            this.lblTransmision.TabIndex = 11;
            this.lblTransmision.Text = "TRANSMISION";
            // 
            // cboTransmision
            // 
            this.cboTransmision.FormattingEnabled = true;
            this.cboTransmision.Location = new System.Drawing.Point(338, 108);
            this.cboTransmision.Name = "cboTransmision";
            this.cboTransmision.Size = new System.Drawing.Size(121, 21);
            this.cboTransmision.TabIndex = 10;
            // 
            // lblCombustible
            // 
            this.lblCombustible.AutoSize = true;
            this.lblCombustible.Location = new System.Drawing.Point(10, 109);
            this.lblCombustible.Name = "lblCombustible";
            this.lblCombustible.Size = new System.Drawing.Size(83, 13);
            this.lblCombustible.TabIndex = 9;
            this.lblCombustible.Text = "COMBUSTIBLE";
            // 
            // cboCombustible
            // 
            this.cboCombustible.FormattingEnabled = true;
            this.cboCombustible.Location = new System.Drawing.Point(99, 106);
            this.cboCombustible.Name = "cboCombustible";
            this.cboCombustible.Size = new System.Drawing.Size(121, 21);
            this.cboCombustible.TabIndex = 8;
            // 
            // lblSegmento
            // 
            this.lblSegmento.AutoSize = true;
            this.lblSegmento.Location = new System.Drawing.Point(264, 65);
            this.lblSegmento.Name = "lblSegmento";
            this.lblSegmento.Size = new System.Drawing.Size(68, 13);
            this.lblSegmento.TabIndex = 7;
            this.lblSegmento.Text = "SEGMENTO";
            // 
            // cboSegmento
            // 
            this.cboSegmento.FormattingEnabled = true;
            this.cboSegmento.Location = new System.Drawing.Point(338, 60);
            this.cboSegmento.Name = "cboSegmento";
            this.cboSegmento.Size = new System.Drawing.Size(121, 21);
            this.cboSegmento.TabIndex = 6;
            // 
            // lblModelo
            // 
            this.lblModelo.AutoSize = true;
            this.lblModelo.Location = new System.Drawing.Point(40, 66);
            this.lblModelo.Name = "lblModelo";
            this.lblModelo.Size = new System.Drawing.Size(53, 13);
            this.lblModelo.TabIndex = 5;
            this.lblModelo.Text = "MODELO";
            // 
            // cboModelo
            // 
            this.cboModelo.FormattingEnabled = true;
            this.cboModelo.Location = new System.Drawing.Point(99, 62);
            this.cboModelo.Name = "cboModelo";
            this.cboModelo.Size = new System.Drawing.Size(121, 21);
            this.cboModelo.TabIndex = 4;
            // 
            // FrmAutomoviles
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(834, 411);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dgvProductos);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "FrmAutomoviles";
            this.Text = "CONSULTAR AUTOMOVILES";
            ((System.ComponentModel.ISupportInitialize)(this.dgvProductos)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudHasta)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudDesde)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvProductos;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label lblDescripcion;
        private System.Windows.Forms.TextBox txtDescripcion;
        private System.Windows.Forms.Label lblTransmision;
        private System.Windows.Forms.ComboBox cboTransmision;
        private System.Windows.Forms.Label lblCombustible;
        private System.Windows.Forms.ComboBox cboCombustible;
        private System.Windows.Forms.Label lblSegmento;
        private System.Windows.Forms.ComboBox cboSegmento;
        private System.Windows.Forms.Label lblModelo;
        private System.Windows.Forms.ComboBox cboModelo;
        private System.Windows.Forms.Button Limpiar;
        private System.Windows.Forms.Button btnConsultar;
        private System.Windows.Forms.Label lblHasta;
        private System.Windows.Forms.Label lblDesde;
        private System.Windows.Forms.NumericUpDown nudDesde;
        private System.Windows.Forms.NumericUpDown nudHasta;
        private System.Windows.Forms.DataGridViewTextBoxColumn descripcion;
        private System.Windows.Forms.DataGridViewTextBoxColumn modelo;
        private System.Windows.Forms.DataGridViewTextBoxColumn segmento;
        private System.Windows.Forms.DataGridViewTextBoxColumn combustible;
        private System.Windows.Forms.DataGridViewTextBoxColumn transmision;
        private System.Windows.Forms.DataGridViewTextBoxColumn precio;
        private System.Windows.Forms.DataGridViewTextBoxColumn stock;
    }
}

