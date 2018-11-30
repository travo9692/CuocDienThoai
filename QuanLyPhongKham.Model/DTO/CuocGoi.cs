using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyPhongKham.Model.DTO
{
    class CuocGoi
    {
        public CuocGoi(int maCG, int maSim, DateTime tgBD, DateTime tgKT, int soPhut)
        {
            MaCuocGoi = maCG;
            MaSim = maSim;
            TG_BatDau = tgBD;
            TG_KetThuc = tgKT;
            SoPhutSD = soPhut;
        }

        public CuocGoi(DataRow row)
        {
            MaCuocGoi = (int)row["MaCuocGoi"];
            MaSim = (int)row["MaSim"];
            TG_BatDau = (DateTime)row["TG_BatDau"];
            TG_KetThuc = (DateTime)row["TG_KetThuc"];
            SoPhutSD = (int)row["SoPhutSD"];
        }

        public CuocGoi() { }



        public int MaCuocGoi { get; set; }
        public int MaSim { get; set; }
        public DateTime TG_BatDau { get; set; }
        public DateTime TG_KetThuc { get; set; }
        public int SoPhutSD { get; set; }
    }
}
