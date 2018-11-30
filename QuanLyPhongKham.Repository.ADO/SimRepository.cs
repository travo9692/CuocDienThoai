using QuanLyPhongKham.Model.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLyPhongKham.Model.DTO;
using System.Data;

namespace QuanLyPhongKham.Repository.ADO
{
    public class SimRepository : ISimRepository
    {
        /// <summary>
        /// lấy danh sách sim trong database
        /// </summary>
        /// <returns></returns>
        public List<Sim> DanhSachSim()
        {
            List<Sim> list = new List<Sim>();

            DataTable table = DataProvider.Instane.ExecuteReader("EXECUTE dbo.SP_DanhSachSim");

            foreach (DataRow row in table.Rows)
            {
                list.Add(new Sim(row));
            }
            return list;
        }

        /// <summary>
        /// thêm Sim vào database
        /// </summary>
        /// <param name="Sim"></param>
        /// <returns></returns>
        public bool ThemSim(Sim sim)
        {
            int row = DataProvider.Instane.ExecuteNonQuery("EXEC dbo.SP_InsertSim @SoSim , @Status",
                                        new object[] { sim.SoSim, sim.Status});
            return row > 0;
        }

        /// <summary>
        /// tìm kiếm Sim, sử dụng SP_TimKiemSim
        /// </summary>
        /// <param name="col">cột trong database</param>
        /// <param name="info">thông tin cần tìm</param>
        /// <returns></returns>
        public List<Sim> TimKiemSim(string col, string info)
        {
            List<Sim> list = new List<Sim>();
            DataTable table = DataProvider.Instane.ExecuteReader(" EXEC  dbo.SP_TimKiemSim  @TruongDuLieu , @ThongTin ", new object[] { col, info });

            foreach (DataRow row in table.Rows)
            {
                list.Add(new Sim(row));
            }
            return list;
        }

        /// <summary>
        /// Cập nhật thông tin cho Sim
        /// </summary>
        /// <param name="Sim"></param>
        /// <returns></returns>
        public bool UpdateSim(Sim sim)
        {
            int row = DataProvider.Instane.ExecuteNonQuery("EXEC dbo.SP_UpdateSim @MaSim , @SoSim , @Status ",
                          new object[] { sim.MaSim, sim.SoSim, sim.Status});
            return row > 0;
        }
    }
}
