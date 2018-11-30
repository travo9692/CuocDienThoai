using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLyPhongKham.Model.DTO;

namespace QuanLyPhongKham.Model.Interfaces
{
    public interface IThanhToanRepository
    {
        List<HoaDonThanhToan> DanhSachHDTT();
        List<HoaDonThanhToan> TimKiemHDTT(string col, string info);
        bool ThemHDTT(HoaDonThanhToan hoaDonThanhToan);
        bool UpdateHDTT(HoaDonThanhToan hoaDonThanhToan);
    }
}
