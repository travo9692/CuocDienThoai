using QuanLyPhongKham.Infrastructure;
using QuanLyPhongKham.Model.DTO;
using QuanLyPhongKham.Services;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyPhongKham.Winform
{
    public partial class MainLuuSim : Form
    {
        public static string so;
        private LibraryService libraryService;
        private Sim sim;
        public MainLuuSim()
        {
            InitializeComponent();
            sim = new Sim();
        }

        /// <summary>
        /// constructor cho việc update khách hàng
        /// </summary>
        /// <param name="title"></param>
        /// <param name="btnText"></param>
        /// <param name="benhNhan"></param>
        public MainLuuSim(string title, string btnText, Sim sim)
        {
            InitializeComponent();
            this.Text = title;
            bttAddEdit.Text = btnText;
            this.sim = sim;

        }

        public MainLuuSim(string title, string btnText)
        {
            InitializeComponent();
            this.Text = title;
            bttAddEdit.Text = btnText;
            sim = new Sim();
        }

        private void MainLuuSim_Load(object sender, EventArgs e)
        {
            libraryService = ServiceFactory.GetLibraryService(LibraryParameter.persistancestrategy);
            txtSim.Focus();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void bttAddEdit_Click(object sender, EventArgs e)
        {
            sim.SoSim = long.Parse(txtSim.Text);
            sim.Status = true;
            long simso = long.Parse(txtSim.Text);
            bool result = libraryService.ThemSim(sim);

            if (result)
            {
                so = txtSim.Text;
                if (DialogResult.OK == MessageBox.Show("Thêm thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information))
                {
                    DialogResult = DialogResult.OK;
                }
            }
            else
            {
                MessageBox.Show("Lỗi không thêm được");
            }
        }
    }
}
