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
    public class LoaiCuocRepository : ILoaiCuocRepository
    {
        /// <summary>
        /// lấy danh sách LoaiCuoc trong database
        /// </summary>
        /// <returns></returns>
        public List<LoaiCuoc> DanhSachLoaiCuoc()
        {
            List<LoaiCuoc> list = new List<LoaiCuoc>();

            DataTable table = DataProvider.Instane.ExecuteReader("EXECUTE dbo.SP_DanhSachLoaiCuoc");

            foreach (DataRow row in table.Rows)
            {
                list.Add(new LoaiCuoc(row));
            }
            return list;
        }

        /// <summary>
        /// thêm LoaiCuoc vào database
        /// </summary>
        /// <param name="LoaiCuoc"></param>
        /// <returns></returns>
        public bool ThemLoaiCuoc(LoaiCuoc loaiCuoc)
        {
            int row = DataProvider.Instane.ExecuteNonQuery("EXEC dbo.SP_InsertKH @TG_BatDau , @TG_KetThuc , @GiaCuoc , @Status",
                                        new object[] { loaiCuoc.TG_BatDau, loaiCuoc.TG_KetThuc,
                          loaiCuoc.GiaCuoc, loaiCuoc.Status});
            return row > 0;
        }

        /// <summary>
        /// tìm kiếm LoaiCuoc, sử dụng SP_TimKiemLoaiCuoc
        /// </summary>
        /// <param name="col">cột trong database</param>
        /// <param name="info">thông tin cần tìm</param>
        /// <returns></returns>
        public List<LoaiCuoc> TimKiemLoaiCuoc(string col, string info)
        {
            List<LoaiCuoc> list = new List<LoaiCuoc>();
            DataTable table = DataProvider.Instane.ExecuteReader(" EXEC  dbo.SP_TimKiemLoaiCuoc  @TruongDuLieu , @ThongTin ", new object[] { col, info });

            foreach (DataRow row in table.Rows)
            {
                list.Add(new LoaiCuoc(row));
            }
            return list;
        }

        /// <summary>
        /// Cập nhật thông tin cho LoaiCuoc
        /// </summary>
        /// <param name="LoaiCuoc"></param>
        /// <returns></returns>
        public bool UpdateLoaiCuoc(LoaiCuoc loaiCuoc)
        {
            int row = DataProvider.Instane.ExecuteNonQuery("EXEC dbo.SP_UpdateLoaiCuoc @TG_BatDau , @TG_KetThuc , @GiaCuoc , @Status",
                          new object[] { loaiCuoc.TG_BatDau, loaiCuoc.TG_KetThuc,
                          loaiCuoc.GiaCuoc, loaiCuoc.Status});
            return row > 0;
        }
    }
}
