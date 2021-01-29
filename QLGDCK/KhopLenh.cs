using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLGDCK
{
    class KhopLenh
    {
        private int maKL;
        private DateTime ngaygio;
        private int soluongkhop;
        private Double phiGD;
        private Double giakhop;
        private int maLD;
        public int MaKL { get => maKL; set => maKL = value; }
        public DateTime NgayGio { get => ngaygio; set => ngaygio = value; }
        public int SoLuongKhop { get => soluongkhop; set => soluongkhop = value; }
        public Double PhiGiaoDich { get => phiGD; set => phiGD = value; }
        public Double GiaKhop { get => giakhop; set => giakhop = value; }
        public int MaLD { get => maLD; set => maLD = value; }

        public KhopLenh()
        {
            maKL = 0;
            ngaygio = DateTime.Now;
            soluongkhop = 0;
            phiGD = 0;
            giakhop = 0;
            maLD = 0;
        }

    }
}
