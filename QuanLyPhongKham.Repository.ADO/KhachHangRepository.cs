using QuanLyPhongKham.Model.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLyPhongKham.Model.DTO;
using System.Data;

namespace QuanLyPhongKham.Repository.ADO
{
    public class KhachHangRepository : IKhachHangRepository
    {
        /// <summary>
        /// lấy danh sách khach hang trong database
        /// </summary>
        /// <returns></returns>
        public List<KhachHang> DanhSachKH()
        {
            List<KhachHang> list = new List<KhachHang>();

            DataTable table = DataProvider.Instane.ExecuteReader("EXECUTE dbo.SP_DanhSachKH");

            foreach (DataRow row in table.Rows)
            {
                list.Add(new KhachHang(row));
            }
            return list;
        }

        /// <summary>
        /// thêm khach hang vào database
        /// </summary>
        /// <param name="khachhang"></param>
        /// <returns></returns>
        public bool ThemKH(KhachHang khachHang)
        {
            int row = DataProvider.Instane.ExecuteNonQuery("EXEC dbo.SP_InsertKH @TenKH , @CMND ," +
                                        " @NgheNghiep , @DiaChi , @Status",
                                        new object[] { khachHang.TenKH, khachHang.CMND,
                          khachHang.NgheNghiep, khachHang.DiaChi, khachHang.Status});
            return row > 0;
        }

        /// <summary>
        /// tìm kiếm khach hang, sử dụng SP_TimKiemKH
        /// </summary>
        /// <param name="col">cột trong database</param>
        /// <param name="info">thông tin cần tìm</param>
        /// <returns></returns>
        public List<KhachHang> TimKiemKH(string col, string info)
        {
            List<KhachHang> list = new List<KhachHang>();
            DataTable table = DataProvider.Instane.ExecuteReader(" EXEC  dbo.SP_TimKiem_MainFormCuocDT  @TruongDuLieu , @ThongTin ", new object[] { col, info });

            foreach (DataRow row in table.Rows)
            {
                list.Add(new KhachHang(row));
            }
            return list;
        }

        /// <summary>
        /// Cập nhật thông tin cho khach hang
        /// </summary>
        /// <param name="benhNhan"></param>
        /// <returns></returns>
        public bool UpdateKH(KhachHang khachhang)
        {
            int row = DataProvider.Instane.ExecuteNonQuery("EXEC dbo.SP_UpdateKH @MaKH , @TenKH , @CMND , @NgheNghiep, @DiaChi , @Status ",
                          new object[] { khachhang.MaKH, khachhang.TenKH, khachhang.CMND,
                          khachhang.NgheNghiep, khachhang.DiaChi, khachhang.Status});
            return row > 0;
        }
    }
}
