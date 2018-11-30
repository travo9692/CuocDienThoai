using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyPhongKham.Model.DTO
{
    public class Sim
    {
        public Sim(int maSim, long soSim, bool status)
        {
            MaSim = maSim;
            SoSim = soSim;
            Status = status;
        }

        public Sim(DataRow row)
        {
            MaSim = (int)row["MaSim"];
            SoSim = (long)row["SoSim"];
            Status = (bool)row["Status"];
        }

        public Sim() { }



        public int MaSim { get; set; }
        public long SoSim { get; set; }
        public bool Status { get; set; }
    }
}
