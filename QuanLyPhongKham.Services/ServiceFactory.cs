using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyPhongKham.Services
{
    public class ServiceFactory
    {
        public static LibraryService GetLibraryService(string persistanceStrategry)
        {
            LibraryService libraryService = null;
            if (persistanceStrategry == "ADO")
            {
                libraryService = new LibraryService(
                    new QuanLyPhongKham.Repository.ADO.KhachHangRepository(),
                    new QuanLyPhongKham.Repository.ADO.ThanhToanRepository(),
                    new QuanLyPhongKham.Repository.ADO.SimRepository(),
                    new QuanLyPhongKham.Repository.ADO.LoaiCuocRepository(),
                    new QuanLyPhongKham.Repository.ADO.HoaDonDangKyRepository()
                   );
            }
            //else
            //{
            //    libraryService = new LibraryService(new QuanLyPhongKham.Repository.EF.TaiKhoanRepository());
            //}
            return libraryService;
        }
    }
}
