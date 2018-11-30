using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLyPhongKham.Model.DTO;

namespace QuanLyPhongKham.Model.Interfaces
{
    public interface IHoaDonDangKyRepository
    {
        List<HoaDonDK> DanhSachHoaDonDK();
        List<HoaDonDK> TimKiemHoaDonDK(string col, string info);
        bool ThemHoaDonDK(HoaDonDK hoaDonDK);
        bool UpdateHoaDonDK(HoaDonDK hoaDonDK);
    }
}
