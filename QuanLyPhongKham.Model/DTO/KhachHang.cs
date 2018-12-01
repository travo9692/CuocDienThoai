using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyPhongKham.Model.DTO
{
    public class KhachHang
    {
        public KhachHang(int maKH, string tenKH, string cmnd, string ngheNghiep, string diaChi, bool status)
        {
            MaKH = maKH;
            TenKH = tenKH;
            CMND = cmnd;
            NgheNghiep = ngheNghiep;
            DiaChi = diaChi;
            Status = status;
        }

        public KhachHang(DataRow row)
        {
            MaKH = (int)row["MAKH"];
            TenKH = (string)row["TENKH"];
            CMND = (string)row["CMND"];
            NgheNghiep = (string)row["NGHENGHIEP"];
            DiaChi = (string)row["DIACHI"];
            Status = (bool)row["STATUS"];        
        }

        public KhachHang() { }



        public int MaKH { get; set; }
        public string TenKH { get; set; }
        public string CMND { get; set; }
        public string NgheNghiep { get; set; }
        public string DiaChi { get; set; }
        public bool Status { get; set; }

    }
}
