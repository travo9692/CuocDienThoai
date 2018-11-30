namespace QuanLyPhongKham.Winform
{
    partial class MainLuuSim
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
            this.label1 = new System.Windows.Forms.Label();
            this.txtSim = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.bttAddEdit = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(22, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(51, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Số SIM";
            // 
            // txtSim
            // 
            this.txtSim.Location = new System.Drawing.Point(83, 21);
            this.txtSim.Name = "txtSim";
            this.txtSim.Size = new System.Drawing.Size(135, 22);
            this.txtSim.TabIndex = 1;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(143, 68);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 2;
            this.button1.Text = "Hủy bỏ";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // bttAddEdit
            // 
            this.bttAddEdit.Location = new System.Drawing.Point(62, 68);
            this.bttAddEdit.Name = "bttAddEdit";
            this.bttAddEdit.Size = new System.Drawing.Size(75, 23);
            this.bttAddEdit.TabIndex = 3;
            this.bttAddEdit.Text = "Lưu";
            this.bttAddEdit.UseVisualStyleBackColor = true;
            // 
            // MainLuuSim
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(230, 102);
            this.Controls.Add(this.bttAddEdit);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.txtSim);
            this.Controls.Add(this.label1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "MainLuuSim";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Lưu sim";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtSim;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button bttAddEdit;
    }
}