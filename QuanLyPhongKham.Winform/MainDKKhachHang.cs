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
    public partial class MainDKKhachHang : Form
    {
        private bool isNew = true;
        private LibraryService libraryService;
        private Model.DTO.KhachHang khachHang;
        public MainDKKhachHang()
        {
            InitializeComponent();
            khachHang = new Model.DTO.KhachHang();
        }

        /// <summary>
        /// constructor cho việc update khách hàng
        /// </summary>
        /// <param name="title"></param>
        /// <param name="btnText"></param>
        /// <param name="benhNhan"></param>
        public MainDKKhachHang(string title, string btnText, Model.DTO.KhachHang khachHang)
        {
            InitializeComponent();
            this.Text = title;
            btnAddEdit.Text = btnText;
            this.khachHang = khachHang;
            isNew = false;

            #region Code đổ dữ liệu vào các textbox
            txtHoTen.Text = khachHang.TenKH;
            txtNgheNghiep.Text = khachHang.NgheNghiep;
            txtDiaChi.Text = khachHang.DiaChi;
            txtCMND.Text = khachHang.CMND;
            #endregion
        }

        public MainDKKhachHang(string title, string btnText)
        {
            InitializeComponent();
            this.Text = title;
            btnAddEdit.Text = btnText;
            khachHang = new Model.DTO.KhachHang();
        }

        private void MainDKKhachHang_Load(object sender, EventArgs e)
        {
            libraryService = ServiceFactory.GetLibraryService(LibraryParameter.persistancestrategy);
            txtHoTen.Focus();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        /// <summary>
        /// events cập nhật / thêm khách hàng mới
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnAddEdit_Click(object sender, EventArgs e)
        {

            khachHang.TenKH = txtHoTen.Text;
            khachHang.DiaChi = txtDiaChi.Text;
            khachHang.NgheNghiep = txtNgheNghiep.Text;
            khachHang.CMND = txtCMND.Text;


            //code cho phần thêm mới khách hàng
            if (isNew)
            {
                //BenhNhan benhNhan = new BenhNhan();
               

                bool result = libraryService.ThemKH(khachHang);

                if (result)
                {
                    if (DialogResult.OK == MessageBox.Show("Thêm khách hàng thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information))
                    {
                        DialogResult = DialogResult.OK;
                    }
                }
                else
                {
                    MessageBox.Show("Lỗi không thêm được khách hàng");
                }
            }
            else
            {
                if (libraryService.UpdateKH(khachHang))
                {
                    if (DialogResult.OK == MessageBox.Show("Cập nhật thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information))
                    {
                        DialogResult = DialogResult.OK;
                    }
                    
                }
                
               
            }
        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }
    }
}
