using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLyPhongKham.Model.DTO;

namespace QuanLyPhongKham.Model.Interfaces
{
    public interface ISimRepository
    {
        List<Sim> DanhSachSim();
        List<Sim> TimKiemMaSimMax();
        List<Sim> TimKiemSim(string col, string info);
        List<Sim> TimKiemSimSo(string info);
        bool ThemSim(Sim sim);
        bool UpdateSim(Sim sim);
    }
}
