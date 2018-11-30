using QuanLyPhongKham.Infrastructure;
using QuanLyPhongKham.Model.DTO;
using QuanLyPhongKham.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyPhongKham.Winform
{
    public partial class MainFormCuocDT : Form
    {
        private TaiKhoan nhanVien;
        private LibraryService libraryService;
        private static List<Model.DTO.KhachHang> listKH;
        //private static List<PhieuKhamGUI> listPhieuKham;
        public static Model.DTO.KhachHang khachHangStatic;

        /// <summary>
        /// constructor
        /// </summary>
        public MainFormCuocDT()
        {
            InitializeComponent();
            libraryService = ServiceFactory.GetLibraryService(LibraryParameter.persistancestrategy);
            //benhNhanStatic = new BenhNhan();
        }

        public MainFormCuocDT(TaiKhoan nhanVien)
        {
            InitializeComponent();
            libraryService = ServiceFactory.GetLibraryService(LibraryParameter.persistancestrategy);
            //benhNhanStatic = new BenhNhan();
            this.nhanVien = nhanVien;
        }

        /// <summary>
        /// hàm load khi chạy form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void MainFormCuocDT_Load(object sender, EventArgs e)
        {
            //load danh sách bệnh nhân cho datagridview
            LoadDanhSachKH();

            //load danh sach phieu kham cho dgvDanhSachPhieuKham
            DateTime date = DateTime.Now;
            //listPhieuKham = libraryService.DanhSachPhieuKhamGUI(date);
            //LoadPhieuKham(listPhieuKham);

            //set thuộc tính đầu tiên cho combobox tim kiem
            cbxTimKiem.SelectedIndex = 1;
            cbbTimKiemThanhToan.SelectedIndex = 1;
        }

       

        #region Method

        /// <summary>
        /// load danh sách khach hang cho datagridview khach hang
        /// </summary>
        private void LoadDanhSachKH()
        {
            listKH = libraryService.DanhSachKH();
            dgvDanhSachKH.Rows.Clear();
            dgvDanhSachKH.Refresh();
            foreach (Model.DTO.KhachHang item in listKH)
            {
                dgvDanhSachKH.Rows.Add(item.MaKH, item.TenKH, item.NgheNghiep,item.CMND, item.DiaChi, item.Status);
            }
        }

        #endregion Method

        #region MenuStrip Events


        #endregion MenuStrip Events

        /// <summary>
        /// Thêm khach hang
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnThemKH_Click(object sender, EventArgs e)
        {
            MainDKKhachHang f = new MainDKKhachHang("Thêm khách hàng", "Thêm");
            f.ShowDialog();
            if (f.DialogResult != DialogResult.Cancel)
            {
                LoadDanhSachKH();
                khachHangStatic = listKH[listKH.Count - 1];
            }
        }

        private void btnCapNhatKH_Click(object sender, EventArgs e)
        {
            if (dgvDanhSachKH.SelectedRows.Count > 0)
            {
                DataGridViewRow row = this.dgvDanhSachKH.SelectedRows[0];
                KhachHang khachHang = listKH.Single(p => p.MaKH == (int)row.Cells[0].Value);

                MainDKKhachHang f = new MainDKKhachHang("Cập nhật thông tin khách hàng", "Cập nhật", khachHang);
                f.ShowDialog();

                if (f.DialogResult != DialogResult.Cancel)
                {
                    LoadDanhSachKH();
                }
            }
        }

        private void btnThongTinThanhToan_Click(object sender, EventArgs e)
        {


        }

        private void bttThemSim_Click(object sender, EventArgs e)
        {
            MainLuuSim f = new MainLuuSim("Thêm sim", "Thêm");
            f.ShowDialog();
            if (f.DialogResult != DialogResult.Cancel)
            {
                LoadDanhSachKH();
                khachHangStatic = listKH[listKH.Count - 1];
            }
        }

        /// <summary>
        /// tìm kiếm khách hàng
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnTimKiemBenhNhan_Click_1(object sender, EventArgs e)
        {
            string cot = "";
            switch (cbxTimKiem.SelectedIndex)
            {
                case 0:
                    cot = "*";
                    break;

                case 1:
                    cot = "MaKH";
                    break;

                case 2:
                    cot = "TenKH";
                    break;

                case 3:
                    cot = "CMND";
                    break;
            }
            if (txtTimKiem.Text == "" && cbxTimKiem.SelectedIndex != 0)
            {
                MessageBox.Show("Vui lòng nhập thông tin cần tìm!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                if (libraryService.TimKiemKH(cot, txtTimKiem.Text).Count == 0)
                {
                    MessageBox.Show("Không tìm thấy dữ liệu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    dgvDanhSachKH.Rows.Clear();
                    dgvDanhSachKH.Refresh();
                    foreach (Model.DTO.KhachHang item in libraryService.TimKiemKH(cot, txtTimKiem.Text))
                    {
                        dgvDanhSachKH.Rows.Add(item.MaKH, item.TenKH, item.NgheNghiep, item.CMND, item.DiaChi, item.Status);
                    }
                }
            }
        }

        /// <summary>
        /// tìm kiếm thanh toán
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnTimKiemThanhToan_Click(object sender, EventArgs e)
        {
            string cot = "";
            switch (cbbTimKiemThanhToan.SelectedIndex)
            {
                case 0:
                    cot = "*";
                    break;

                case 1:
                    cot = "MaHD";
                    break;

                case 2:
                    cot = "IDSim";
                    break;

                case 3:
                    cot = "TenKH";
                    break;

                case 4:
                    cot = "CMND";
                break;
        }
            if (txtTimKiemThanhToan.Text == "" && cbbTimKiemThanhToan.SelectedIndex != 0)
            {
                MessageBox.Show("Vui lòng nhập thông tin cần tìm!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                if (libraryService.TimKiemHDTT(cot, txtTimKiemThanhToan.Text).Count == 0)
                {
                    MessageBox.Show("Không tìm thấy dữ liệu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    dgvDanhSachKH.Rows.Clear();
                    dgvDanhSachKH.Refresh();
                    foreach (HoaDonThanhToan item in libraryService.TimKiemHDTT(cot, txtTimKiem.Text))
                    {
                        dgvDanhSachHoaDonThanhToan.Rows.Add(item.MaKH, item.MaHD, item.MaSim, item.TG_TaoHoaDon);
                    }
                }
            }
        }

        /// <summary>
        /// tìm kiếm sim
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void bttTimKiemSim_Click(object sender, EventArgs e)
        {
            string cot = "";
            switch (cbbTimKiemSim.SelectedIndex)
            {
                case 0:
                    cot = "*";
                    break;

                case 1:
                    cot = "MaHD";
                    break;

                case 2:
                    cot = "IDSim";
                    break;

                case 3:
                    cot = "TenKH";
                    break;

                case 4:
                    cot = "CMND";
                    break;
            }
            if (txtTimKiemSim.Text == "" && cbbTimKiemSim.SelectedIndex != 0)
            {
                MessageBox.Show("Vui lòng nhập thông tin cần tìm!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                if (libraryService.TimKiemSim(cot, txtTimKiemSim.Text).Count == 0)
                {
                    MessageBox.Show("Không tìm thấy dữ liệu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    dgvDanhSachKH.Rows.Clear();
                    dgvDanhSachKH.Refresh();
                    foreach (Sim item in libraryService.TimKiemSim(cot, txtTimKiem.Text))
                    {
                        dgvDanhSachHoaDonThanhToan.Rows.Add(item.MaSim, item.SoSim, item.Status);
                    }
                }
            }
        }


    }
}