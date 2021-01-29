using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLGDCK
{
    class PhiGiaoDich
    {
        private string maLGD;
        private string maCTCK;
        private DateTime ngaygio;
        private Double phiGD;
        
        public string MaLGD { get => maLGD; set => maLGD = value; }
        public string MaCTCK { get => maCTCK; set => maCTCK = value; }
        public DateTime NgayGio { get => ngaygio; set => ngaygio = value; }
        public double GiaPhi { get => phiGD; set => phiGD = value; }

        public PhiGiaoDich()
        {
            maLGD = "";
            maCTCK = "";
            ngaygio = DateTime.Now;
            phiGD = 0;
        }
    }
}
