using DevExpress.Data.Filtering.Helpers;
using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLGDCK
{
    class NhaDauTu
    {
        private string maTK;
        private string ho;
        private string ten;
        private DateTime ngaysinh;
        private string diachi;
        private bool phai;
        private string email;
        private string sdt;
        private string cmnd;
        private string passport;
        private DateTime ngaycap;
        private string quocgia;
        private string mkgiaodich;
        private string mkdatlenh;
        private string maCTCK;

        public string MaTK{get => maTK; set => maTK = value;}
        public string Ho { get => ho; set => ho = value; }
        public string Ten { get => ten; set => ten = value; }
        public DateTime NgaySinh { get => ngaysinh; set => ngaysinh = value; }
        public string DiaChi { get => diachi; set => diachi = value; }
        public bool Phai { get => phai; set => phai = value; }
        public string Email { get => email; set => email = value; }
        public string SoDT { get => sdt; set => sdt = value; }
        public string CMND { get => cmnd; set => cmnd = value; }
        public string Passport { get => passport; set => passport = value; }
        public DateTime NgayCap { get => ngaycap; set => ngaycap = value; }
        public string QuocGia { get => quocgia; set => quocgia = value; }
        public string MKDatLenh { get => mkdatlenh; set => mkdatlenh = value; }
        public string MKGiaoDich { get => mkgiaodich; set => mkgiaodich = value; }
        public string MaCTCK { get => maCTCK; set => maCTCK = value; }
        public NhaDauTu()
        {
            maTK = "";
            ho = "";
            ten = "";
            ngaysinh = DateTime.Now;
            diachi = "";
            _ = phai;
            email = "";
            sdt = "";
            cmnd = "";
            passport = "";
            ngaycap = DateTime.Now;
            quocgia = "";
            mkdatlenh = "";
            mkgiaodich = "";
            maCTCK = "";
        }

    }
}
