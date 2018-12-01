namespace QuanLyPhongKham.Repositories.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LoaiCuoc")]
    public partial class LoaiCuoc
    {
        [Key]
        [Column(Order = 0)]
        public TimeSpan TG_BatDau { get; set; }

        [Key]
        [Column(Order = 1)]
        public TimeSpan TG_KetThuc { get; set; }

        [Key]
        [Column(Order = 2)]
        public decimal GiaCuoc { get; set; }

        [Key]
        [Column(Order = 3)]
        public bool Status { get; set; }
    }
}
