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
        private bool isNew = true;
        private LibraryService libraryService;
        private Model.DTO.Sim sim;
        public MainLuuSim()
        {
            InitializeComponent();
            sim = new Model.DTO.Sim();
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
            isNew = false;

            #region Code đổ dữ liệu vào các textbox
            txtSim.Text = sim.SoSim.ToString();
            #endregion
        }

        public MainLuuSim(string title, string btnText)
        {
            InitializeComponent();
            this.Text = title;
            bttAddEdit.Text = btnText;
            sim = new Model.DTO.Sim();
        }

        private void MainDKKhachHang_Load(object sender, EventArgs e)
        {
            libraryService = ServiceFactory.GetLibraryService(LibraryParameter.persistancestrategy);
            txtSim.Focus();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
