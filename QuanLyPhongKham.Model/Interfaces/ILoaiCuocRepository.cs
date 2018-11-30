using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLyPhongKham.Model.DTO;

namespace QuanLyPhongKham.Model.Interfaces
{
    public interface ILoaiCuocRepository
    {
        List<LoaiCuoc> DanhSachLoaiCuoc();
        List<LoaiCuoc> TimKiemLoaiCuoc(string col, string info);
        bool ThemLoaiCuoc(LoaiCuoc loaiCuoc);
        bool UpdateLoaiCuoc(LoaiCuoc loaiCuoc);
    }
}
