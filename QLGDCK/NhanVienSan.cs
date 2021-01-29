using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLGDCK
{
    class NhanVienSan
    {
        private string maNV;
        private string ho;
        private string ten;
        private bool phai;
        private DateTime ngaysinh;
        private string diachi;
        private string sdt;
        private bool danghiviec;
        private string maSGD;

        public string MaNV { get => maNV; set => maNV = value; }
        public string Ho { get => ho; set => ho = value; }
        public string Ten { get => ten; set => ten = value; }
        public DateTime Ngaysinh { get => ngaysinh; set => ngaysinh = value; }
        public string Diachi { get => diachi; set => diachi = value; }
        public string Sdt { get => sdt; set => sdt = value; }
        public bool Danghiviec { get => danghiviec; set => danghiviec = value; }
        public string MaSGD { get => maSGD; set => maSGD = value; }
        public bool Phai { get => phai; set => phai = value; }

        public NhanVienSan()
        {
            maNV = "";
            ho = "";
            ten = "";
            _ = phai;
            ngaysinh = DateTime.Now;
            diachi = "";
            sdt = "";
            _ = danghiviec;
            maSGD = "";
        }
    }
}
