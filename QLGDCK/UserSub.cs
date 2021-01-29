using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLGDCK
{
    class UserSub
    {
        private static UserSub instance;
        public static UserSub Instance
        {
            get
            {
                if (instance == null)
                    instance = new UserSub();
                return instance;
            }

        }
        public void load(DataGridView data, NhanVien nhanVien)
        {
            data.DataSource = UserMain.Instance.load(nhanVien);
        }
        public bool them(DataGridView data, NhanVien nhanvien)
        {
            return UserMain.Instance.them(nhanvien);
        }
        public bool sua( NhanVien nhanvien)
        {
            return UserMain.Instance.sua(nhanvien);
        }
        public bool xoa(NhanVien nhanvien)
        {
            return UserMain.Instance.xoa(nhanvien);
        }
        public void loadNDT(DataGridView data,NhaDauTu nhaDauTu)
        {
            data.DataSource = UserMain.Instance.loadNDT(nhaDauTu);
        }
        public bool themNDT(DataGridView data, NhaDauTu nhaDauTu)
        {
            return UserMain.Instance.themNDT(nhaDauTu);
        }
        public bool suaNDT(NhaDauTu nhaDauTu)
        {
            return UserMain.Instance.suaNDT(nhaDauTu);
        }
        public bool xoaNDT(NhaDauTu nhaDauTu)
        {
            return UserMain.Instance.xoaNDT(nhaDauTu);
        }
        public void loadTKNH(DataGridView data, TaiKhoanNganHang taiKhoanNganHang)
        {
            data.DataSource = UserMain.Instance.loadTKNH(taiKhoanNganHang);
        }
        public bool themTKNH(DataGridView data, TaiKhoanNganHang taiKhoanNganHang)
        {
            return UserMain.Instance.themTKNH(taiKhoanNganHang);
        }
        public bool suaTKNH(TaiKhoanNganHang taiKhoanNganHang)
        {
            return UserMain.Instance.suaTKNH(taiKhoanNganHang);
        }
        public bool xoaTKNH(TaiKhoanNganHang taiKhoanNganHang)
        {
            return UserMain.Instance.xoaTKNH(taiKhoanNganHang);
        }
        public void laythongtinCP(DataGridView data, string MaTK)
        {
            data.DataSource = UserMain.Instance.laythongtinCP(MaTK);
        }
        public int loadLogin(TaoLoginCongTy taoLoginCongTy)
        {
            return UserMain.Instance.loadLogin(taoLoginCongTy);
        }
        public void loadNVSan(DataGridView data ,NhanVienSan nhanVienSan)
        {
            data.DataSource = UserMain.Instance.loadNVSan(nhanVienSan);
        }
        public bool themNVSan(DataGridView data, NhanVienSan nhanVienSan)
        {
            return UserMain.Instance.themNVSan(nhanVienSan);
        }
        public bool suaNVSan(NhanVienSan nhanVienSan)
        {
            return UserMain.Instance.suaNVSan(nhanVienSan);
        }
        public bool xoaNVSan(NhanVienSan nhanVienSan)
        {
            return UserMain.Instance.xoaNVSan(nhanVienSan);
        }
        public void loadCoPhieu(DataGridView data, CoPhieu coPhieu)
        {
            data.DataSource = UserMain.Instance.loadCoPhieu(coPhieu);
        }
        public void loadQuyDinh(DataGridView data, QuyDinh quyDinh)
        {
            data.DataSource = UserMain.Instance.loadQuyDinh(quyDinh);
        }
        public bool themCP(DataGridView data, CoPhieu coPhieu)
        {
            return UserMain.Instance.themCP(coPhieu);
        }
        public bool suaCP(CoPhieu coPhieu)
        {
            return UserMain.Instance.suaCP(coPhieu);
        }
        public bool xoaCP(CoPhieu coPhieu)
        {
            return UserMain.Instance.xoaCP(coPhieu);
        }
        public void loadGiaCP(DataGridView data, GiaCoPhieu giaCoPhieu)
        {
            data.DataSource = UserMain.Instance.loadGiaCP(giaCoPhieu);
        }
        public bool themQD(DataGridView data,QuyDinh quyDinh)
        {
            return UserMain.Instance.themCapNhat(quyDinh);
        }
        public bool suaQD(QuyDinh quyDinh)
        {
            return UserMain.Instance.suaCapNhat(quyDinh);
        }
        public bool themGiaCP(DataGridView data, GiaCoPhieu giaCoPhieu)
        {
            return UserMain.Instance.themGiaCP(giaCoPhieu);
        }
        public bool suaGiaCP(GiaCoPhieu giaCoPhieu)
        {
            return UserMain.Instance.suaGiaCP(giaCoPhieu);
        }
        public void loadPhiGD(DataGridView data, PhiGiaoDich phiGiaoDich)
        {
            data.DataSource= UserMain.Instance.loadPhiGD(phiGiaoDich);
        }
        public bool themPhiGD(DataGridView data, PhiGiaoDich phiGiaoDich)
        {
            return UserMain.Instance.themPhiGD(phiGiaoDich);
        }
        public bool suaPhiGD(PhiGiaoDich phiGiaoDich)
        {
            return UserMain.Instance.suaPhiGD(phiGiaoDich);
        }
        public bool themLenhDat(LenhDat lenhDat)
        {
            return UserMain.Instance.themLenhDat(lenhDat);
        }
        public void loadLenhDat(DataGridView data,LenhDat lenhDat)
        {
            data.DataSource = UserMain.Instance.loadLenhDat(lenhDat);
        }
        public void loadKhopLenh(DataGridView data,KhopLenh khopLenh)
        {
            data.DataSource = UserMain.Instance.loadKhopLenh(khopLenh);
        }
    }
}
