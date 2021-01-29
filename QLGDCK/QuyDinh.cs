using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLGDCK
{
    class QuyDinh
    {
        private string maSGD;
        private string motaquydinh;
        private Double giaquydinh;
        private DateTime ngay;

        public string MaSGD { get => maSGD; set => maSGD = value; }
        public string MoTaQuyDinh { get => motaquydinh; set => motaquydinh = value; }
        public double GiaQuyDinh { get => giaquydinh; set => giaquydinh = value; }
        public DateTime Ngay { get => ngay; set => ngay = value; }
        public QuyDinh()
        {
            maSGD = "";
            motaquydinh = "";
            giaquydinh = 0;
            ngay = DateTime.Now;
        }
    }
}
