using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLGDCK
{
    class TaiKhoanNganHang
    {
        private string maTKNH;
        private string maNH;
        private string maNDT;
        private double soduTKNH;

        public string MaTKNH { get => maTKNH; set => maTKNH = value; }
        public string MaNH { get => maNH; set => maNH = value; }
        public string MaTK { get => maNDT; set => maNDT = value; }
        public double SoduTKNH { get => soduTKNH; set => soduTKNH = value; }

        public TaiKhoanNganHang()
        {
            maTKNH = "";
            maNH = "";
            maNDT = "";
            SoduTKNH = 0;
        }
    }
}
