using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLGDCK
{
    class LenhDat
    {
        private int maLD;
        private int soluongdat;
        private Double giadat;
        private DateTime ngaygio;
        private string maLL;
        private string maTKNH;
        private string maLGD;
        private string maTT;
        private string maCTCK;
        private int maCP;
        public int MaLD { get => maLD; set => maLD = value; }
        public int SoLuongDat { get => soluongdat; set => soluongdat = value; }
        public Double GiaDat { get => giadat; set => giadat = value; }
        public DateTime NgayGio { get => ngaygio; set => ngaygio = value; }
        public string MaLL { get => maLL; set => maLL = value; }
        public string MaTKNH { get => maTKNH; set => maTKNH = value; }
        public string MaLGD { get => maLGD; set => maLGD = value; }
        public string MaTT { get => maTT; set => maTT = value; }
        public string MaCTCK { get => maCTCK; set => maCTCK = value; }
        public int MaCP { get => maCP; set => maCP = value; }
        public LenhDat()
        {
            maLD = 0;
            soluongdat = 0;
            giadat = 0;
            NgayGio = DateTime.Now;
            maLL = "";
            maTKNH = "";
            maLGD = "";
            maTT = "";
            maCTCK = "";
            maCP = 0;
        }
    }
}
