using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyPhongKham.Model.DTO
{
    public class HoaDonThanhToan
    {
        public HoaDonThanhToan(int maHD, int maKH, int maSim, decimal cuocTB, DateTime tgTaoHD, bool thanhToan, decimal thanhTien, bool stt)
        {
            MaHD = maHD;
            MaKH = maKH;
            MaSim = maSim;
            CuocThueBao = cuocTB;
            TG_TaoHoaDon = tgTaoHD;
            ThanhToan = ThanhToan;
            ThanhTien = ThanhTien;
            Status = stt;

        }

        public HoaDonThanhToan(DataRow row)
        {
            MaHD = (int)row["MaHD"];
            MaKH = (int)row["MaKH"];
            MaSim = (int)row["MaSim"];
            CuocThueBao = (decimal)row["CuocThueBao"];
            TG_TaoHoaDon = (DateTime)row["TG_TaoHoaDon"];
            ThanhToan = (bool)row["ThanhToan"];
            ThanhTien = (decimal)row["ThanhTien"];
            Status = (bool)row["Status"];
        }

        public HoaDonThanhToan() { }



        public int MaHD { get; set; }
        public int MaKH { get; set; }
        public int MaSim { get; set; }
        public decimal CuocThueBao { get; set; }
        public DateTime TG_TaoHoaDon { get; set; }
        public bool ThanhToan { get; set; }
        public decimal ThanhTien { get; set; }
        public bool Status { get; set; }
    }
}
