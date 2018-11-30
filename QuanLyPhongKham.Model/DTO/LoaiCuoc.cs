    using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyPhongKham.Model.DTO
{
    public class LoaiCuoc
    {
        public LoaiCuoc(DateTime tgBD, DateTime tgKT, decimal giaCuoc, int status)
        {
            TG_BatDau = tgBD;
            TG_KetThuc = tgKT;
            GiaCuoc = giaCuoc;
            Status = status;
        }

        public LoaiCuoc(DataRow row)
        {
            TG_BatDau = (DateTime)row["TG_BatDau"];
            TG_KetThuc = (DateTime)row["TG_KetThuc"];
            GiaCuoc = (decimal)row["GiaCuoc"];
            Status = (int)row["Status"];
        }

        public LoaiCuoc() { }

        public DateTime TG_BatDau { get; set; }
        public DateTime TG_KetThuc { get; set; }
        public decimal GiaCuoc { get; set; }
        public int Status { get; set; }
    }
}
