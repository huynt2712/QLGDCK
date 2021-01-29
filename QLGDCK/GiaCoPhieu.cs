using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLGDCK
{
    class GiaCoPhieu
    {
        private int maCP;
        private DateTime ngay;
        private double giatran;
        private double giasan;
        private double giathamchieu;
        private double giadongcua;
        
        public int MaCP { get => maCP; set => maCP = value; }
        public DateTime Ngay { get => ngay; set => ngay = value; }
        public double GiaTran { get => giatran; set => giatran = value; }
        public double GiaSan { get => giasan; set => giasan = value; }
        public double GiaThamChieu { get => giathamchieu; set => giathamchieu = value; }
        public double GiaDongCua { get => giadongcua; set => giadongcua = value; }

        public GiaCoPhieu()
        {
            maCP = 0;
            ngay = DateTime.Now;
            giatran = 0;
            giasan = 0;
            giathamchieu = 0;
            giadongcua = 0;
        }
    }
}
