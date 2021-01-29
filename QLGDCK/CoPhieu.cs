using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLGDCK
{
    class CoPhieu
    {
        private int maCP;
        private string tenCP;
        private string diaChi;
        private string sdtcp;
        private string fax;
        private string website;
        private string email;
        private string maSGD;
        private int soLuongCP;

        public int MaCP { get => maCP; set => maCP = value; }
        public string TenCP { get => tenCP; set => tenCP = value; }
        public string DiaChi { get => diaChi; set => diaChi = value; }
        public string SDTCP { get => sdtcp; set => sdtcp = value; }
        public string Fax { get => fax; set => fax = value; }
        public string DiaChiWebsite { get => website; set => website = value; }
        public string Email { get => email; set => email = value; }
        public int SoLuongCP { get => soLuongCP; set => soLuongCP = value; }
        public string MaSGD { get => maSGD; set => maSGD = value; }
        
        public CoPhieu()
        {
            maCP = 0;
            tenCP = "";
            diaChi = "";
            sdtcp = "";
            fax = "";
            website = "";
            email = "";
            soLuongCP = 0;
            maSGD = "";
        }
    }
}
