using QuanLyPhongKham.Infrastructure;
using QuanLyPhongKham.Model.DTO;
using QuanLyPhongKham.Services;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyPhongKham.Winform
{
    public partial class MainThongTinThanhToan : Form
    {
        private LibraryService libraryService;

        public MainThongTinThanhToan()
        {
            InitializeComponent();
        }
        /// <summary>
        /// constructor cho việc update khách hàng
        /// </summary>
        /// <param name="title"></param>
        /// <param name="btnText"></param>
        /// <param name=""></param>

        public MainThongTinThanhToan(string title, string maKH)
        {
            InitializeComponent();
            libraryService = ServiceFactory.GetLibraryService(LibraryParameter.persistancestrategy);
            //load data cho các textbox
            LoadData(title, maKH);
        }

        private void LoadData(string title, string maKH)
        {
            //set title cho form
            Text = title;
            // load data cho các textbox
            foreach (HoaDonThanhToan item in libraryService.TimKiemByMaKHHDTT(maKH))
            {
                txtMaKH.Text = item.MaKH.ToString();
                txtMaSim.Text = item.MaSim.ToString();
                txtChiPhi.Text = item.ThanhToan.ToString();
                txtTGDangKy.Text = item.TG_TaoHoaDon.ToString();
                txtCuocThueBao.Text = item.CuocThueBao.ToString();
                txtThanhTien.Text = item.ThanhTien.ToString();
            }
            
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
