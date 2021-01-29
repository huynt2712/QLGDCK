using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLGDCK
{
    class UserMain
    {
        private string query;
        private static UserMain instance;
        public static UserMain Instance
        {
            get
            {
                if (instance == null)
                    instance = new UserMain();
                return instance;
            }
        }
        public string layTenNDT(string MaTK)
        {
            query = "select Ho+' '+Ten from NHADAUTU where MaTK = '" + MaTK + "'";
            return DataProvider.Instance.ExecuteScalar(query, CommandType.Text).ToString();
        }
        public DataTable load(NhanVien nhanVien)
        {
            query = "select MaNV, Ho, Ten, Phai, NgaySinh, DiaChi, SoDT, DaNghiViec from NHANVIEN";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);

        }
        public bool them(NhanVien nhanVien)
        {
            query = "SP_THEMNHANVIEN";
            object[] para = new object[] { "@MaNV", "@Ho", "@Ten", "@DiaChi", "@NgaySinh", "@Phai", "@SoDT", "@MaCTCK", "@DaNghiViec" };
            object[] para1 = new object[] { nhanVien.MaNV, nhanVien.Ho, nhanVien.Ten, nhanVien.Diachi, nhanVien.Ngaysinh, nhanVien.Phai, nhanVien.Sdt, nhanVien.MaCTCK, nhanVien.Danghiviec };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool xoa(NhanVien nhanVien)
        {
            query = "SP_XOANHANVIEN";
            object[] para = new object[] { "@MaNV" };
            object[] para1 = new object[] { nhanVien.MaNV };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool sua(NhanVien nhanVien)
        {
            query = "SP_HIEUCHINHNHANVIEN";
            object[] para = new object[] { "@MaNV", "@Ho", "@Ten", "@DiaChi", "@NgaySinh", "@Phai", "@SoDT", "@DaNghiViec" };
            object[] para1 = new object[] { nhanVien.MaNV, nhanVien.Ho, nhanVien.Ten, nhanVien.Diachi, nhanVien.Ngaysinh, nhanVien.Phai, nhanVien.Sdt, nhanVien.Danghiviec };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public DataTable loadNDT(NhaDauTu nhaDauTu)
        {
            query = "select MaTK,Ho,Ten,NgaySinh,Phai,DiaChi,Email,SoDT,CMND,Passport,NgayCap,QuocGia,MKGiaoDich,MKDatLenh from NHADAUTU";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        public bool themNDT(NhaDauTu nhaDauTu)
        {
            query = "SP_THEMNHADAUTU";
            object[] para = new object[] { "@MaTK", "@Ho", "@Ten", "@NgaySinh", "@Phai", "@DiaChi", "@Email", "@SoDT", "@CMND", "@Passport", "@NgayCap", "@QuocGia", "@MKGiaoDich", "@MKDatLenh", "@MaCTCK" };
            object[] para1 = new object[] { nhaDauTu.MaTK, nhaDauTu.Ho, nhaDauTu.Ten, nhaDauTu.NgaySinh, nhaDauTu.Phai, nhaDauTu.DiaChi, nhaDauTu.Email, nhaDauTu.SoDT, nhaDauTu.CMND, nhaDauTu.Passport, nhaDauTu.NgayCap, nhaDauTu.QuocGia, nhaDauTu.MKGiaoDich, nhaDauTu.MKDatLenh, nhaDauTu.MaCTCK };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool suaNDT(NhaDauTu nhaDauTu)
        {
            query = "SP_HIEUCHINHNHADAUTU";
            object[] para = new object[] { "@MaTK", "@Ho", "@Ten", "@NgaySinh", "@Phai", "@DiaChi", "@Email", "@SoDT", "@CMND", "@Passport", "@NgayCap", "@QuocGia", "@MKGiaoDich", "@MKDatLenh" };
            object[] para1 = new object[] { nhaDauTu.MaTK, nhaDauTu.Ho, nhaDauTu.Ten, nhaDauTu.NgaySinh, nhaDauTu.Phai, nhaDauTu.DiaChi, nhaDauTu.Email, nhaDauTu.SoDT, nhaDauTu.CMND, nhaDauTu.Passport, nhaDauTu.NgayCap, nhaDauTu.QuocGia, nhaDauTu.MKGiaoDich, nhaDauTu.MKDatLenh };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool xoaNDT(NhaDauTu nhaDauTu)
        {
            query = "SP_XOANHADAUTU";
            object[] para = new object[] { "@MaTK" };
            object[] para1 = new object[] { nhaDauTu.MaTK };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public DataTable loadTKNH(TaiKhoanNganHang taiKhoanNganHang)
        {
            query = "select MaTKNH, MaTK, SoDuTKNH, MaNH from TAIKHOANNGANHANG";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        public bool themTKNH(TaiKhoanNganHang taiKhoanNganHang)
        {
            query = "SP_THEMTAIKHOANNGANHANG";
            object[] para = new object[] { "@MaTKNH", "@SoDuTKNH", "@MaTK", "@MaNH" };
            object[] para1 = new object[] { taiKhoanNganHang.MaTKNH, taiKhoanNganHang.SoduTKNH, taiKhoanNganHang.MaTK, taiKhoanNganHang.MaNH };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool suaTKNH(TaiKhoanNganHang taiKhoanNganHang)
        {
            query = "SP_HIEUCHINHTAIKHOANNGANHANG";
            object[] para = new object[] { "@MaTKNH", "@MaNH", "@SoDuTKNH" };
            object[] para1 = new object[] { taiKhoanNganHang.MaTKNH, taiKhoanNganHang.MaNH, taiKhoanNganHang.SoduTKNH };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool xoaTKNH(TaiKhoanNganHang taiKhoanNganHang)
        {
            query = "SP_XOATAIKHOANNGANHANG";
            object[] para = new object[] { "@MaTKNH" };
            object[] para1 = new object[] { taiKhoanNganHang.MaTKNH };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public DataTable laythongtin(string MaTK)
        {
            query = "select n.Ho +' '+ n.Ten as HoTen, MaTKNH, MaNH, t.SoDuTKNH from TAIKHOANNGANHANG as t, NHADAUTU as n  where t.MaTK = n.MaTK and t.MaTK = '" + MaTK + "'";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        public DataTable laythongtinNH(string MaNH, string MaTK)
        {
            query = "select MaTKNH, SoDuTKNH from TAIKHOANNGANHANG where MaNH = '" + MaNH + "' AND MaTK ='" + MaTK + "'";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        public DataTable laythongtinCP(string MaTK)
        {
            query = "SP_XEMSODUCOPHIEU";
            object[] para = new object[] { "@MaTK" };
            object[] para1 = new object[] { MaTK };
            return DataProvider.Instance.ExecuteQuery(query, CommandType.StoredProcedure, para, para1);
        }
        public int loadLogin(TaoLoginCongTy taoLoginCongTy)
        {
            query = "SP_TAOTAIKHOAN";
            object[] para = new object[] { "@LGNAME", "@PASS", "@USERNAME", "@ROLE" };
            object[] para1 = new object[] { taoLoginCongTy.LgName, taoLoginCongTy.Pass, taoLoginCongTy.Username, taoLoginCongTy.Role };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1);
        }
        public DataTable loadNVSan(NhanVienSan nhanVienSan)
        {
            query = "select MaNV, Ho, Ten, Phai, NgaySinh, DiaChi, SoDT, DaNghiViec from NHANVIENSAN";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        public bool themNVSan(NhanVienSan nhanVienSan)
        {
            query = "SP_THEMNHANVIENSAN";
            object[] para = new object[] { "@MaNV", "@Ho", "@Ten", "@DiaChi", "@NgaySinh", "@Phai", "@SoDT", "@DaNghiViec" };
            object[] para1 = new object[] { nhanVienSan.MaNV, nhanVienSan.Ho, nhanVienSan.Ten, nhanVienSan.Diachi, nhanVienSan.Ngaysinh, nhanVienSan.Phai, nhanVienSan.Sdt, nhanVienSan.Danghiviec };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool xoaNVSan(NhanVienSan nhanVienSan)
        {
            query = "SP_XOANHANVIENSAN";
            object[] para = new object[] { "@MaNV" };
            object[] para1 = new object[] { nhanVienSan.MaNV };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool suaNVSan(NhanVienSan nhanVienSan)
        {
            query = "SP_HIEUCHINHNHANVIENSAN";
            object[] para = new object[] { "@MaNV", "@Ho", "@Ten", "@DiaChi", "@NgaySinh", "@Phai", "@SoDT", "@DaNghiViec" };
            object[] para1 = new object[] { nhanVienSan.MaNV, nhanVienSan.Ho, nhanVienSan.Ten, nhanVienSan.Diachi, nhanVienSan.Ngaysinh, nhanVienSan.Phai, nhanVienSan.Sdt, nhanVienSan.Danghiviec };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public DataTable loadCoPhieu(CoPhieu coPhieu)
        {
            query = "select MaCP, TenCP,DiaChi, SoDT, Fax, DiaChiWebsite,Email, SoLuongCP from COPHIEU";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        public DataTable loadQuyDinh(QuyDinh capNhat)
        {
            query = "select MaSGD, Ngay, MoTaQuyDinh,GiaQuyDinh from QUYDINHCHUNG";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        public bool themCP(CoPhieu coPhieu)
        {
            query = "SP_THEMCOPHIEU";
            object[] para = new object[] { "@MaCP", "@TenCP", "@DiaChi", "@Fax", "@SDT", "@Website", "@Email", "@SoLuongCP", "@MaSGD" };
            object[] para1 = new object[] { coPhieu.MaCP, coPhieu.TenCP, coPhieu.DiaChi, coPhieu.Fax, coPhieu.SDTCP, coPhieu.DiaChiWebsite, coPhieu.Email, coPhieu.SoLuongCP, coPhieu.MaSGD };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool xoaCP(CoPhieu coPhieu)
        {
            query = "SP_XOACOPHIEU";
            object[] para = new object[] { "@MaCP" };
            object[] para1 = new object[] { coPhieu.MaCP };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool suaCP(CoPhieu coPhieu)
        {
            query = "SP_HIEUCHINHCOPHIEU";
            object[] para = new object[] { "@MaCP", "@TenCP", "@DiaChi", "@SDT", "@Fax", "@Website", "@Email", "@SoLuongCP" };
            object[] para1 = new object[] { coPhieu.MaCP, coPhieu.TenCP, coPhieu.DiaChi, coPhieu.SDTCP, coPhieu.Fax, coPhieu.DiaChiWebsite, coPhieu.Email, coPhieu.SoLuongCP };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool themCapNhat(QuyDinh capNhat)
        {
            query = "SP_THEMQUYDINHCHUNG";
            object[] para = new object[] { "@MaSGD", "@Ngay", "@MoTaQuyDinh", "@GiaQuyDinh" };
            object[] para1 = new object[] { capNhat.MaSGD, capNhat.Ngay, capNhat.MoTaQuyDinh, capNhat.GiaQuyDinh };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool suaCapNhat(QuyDinh capNhat)
        {
            query = "SP_HIEUCHINHQUYDINHCHUNG";
            object[] para = new object[] { "@MaSGD", "@Ngay", "@MoTaQuyDinh", "@GiaQuyDinh" };
            object[] para1 = new object[] { capNhat.MaSGD, capNhat.Ngay, capNhat.MoTaQuyDinh, capNhat.GiaQuyDinh };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public DataTable loadGiaCP(GiaCoPhieu giaCoPhieu)
        {
            query = "select MaCP,NgayGio,GiaTran,GiaThamChieu,GiaSan,GiaDongCua from LICHSUGIA";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        public bool themGiaCP(GiaCoPhieu giaCoPhieu)
        {
            query = "SP_THEMGIACOPHIEU";
            object[] para = new object[] { "@MaCP", "@NgayGio", "@GiaTran", "@GiaThamChieu", "@GiaSan", "@GiaDongCua" };
            object[] para1 = new object[] { giaCoPhieu.MaCP, giaCoPhieu.Ngay, giaCoPhieu.GiaTran, giaCoPhieu.GiaThamChieu, giaCoPhieu.GiaSan, giaCoPhieu.GiaDongCua };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool suaGiaCP(GiaCoPhieu giaCoPhieu)
        {
            query = "SP_HIEUCHINHGIACOPHIEU";
            object[] para = new object[] { "@MaCP", "@NgayGio", "@GiaTran", "@GiaThamChieu", "@GiaSan", "@GiaDongCua" };
            object[] para1 = new object[] { giaCoPhieu.MaCP, giaCoPhieu.Ngay, giaCoPhieu.GiaTran, giaCoPhieu.GiaThamChieu, giaCoPhieu.GiaSan, giaCoPhieu.GiaDongCua };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public DataTable loadPhiGD(PhiGiaoDich phiGiaoDich)
        {
            query = "select MaLGD,NgayGio,GiaPhi from THAYDOIGIA";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        public bool themPhiGD(PhiGiaoDich phiGiaoDich)
        {
            query = "SP_THEMPHIGIAODICH";
            object[] para = new object[] { "@MaLGD", "@MaCTCK", "@NgayGio", "@GiaPhi" };
            object[] para1 = new object[] { phiGiaoDich.MaLGD, phiGiaoDich.MaCTCK, phiGiaoDich.NgayGio, phiGiaoDich.GiaPhi };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public bool suaPhiGD(PhiGiaoDich phiGiaoDich)
        {
            query = "SP_HIEUCHINHPHIGIAODICH";
            object[] para = new object[] { "@MaLGD", "@MaCTCK", "@NgayGio", "@GiaPhi" };
            object[] para1 = new object[] { phiGiaoDich.MaLGD, phiGiaoDich.MaCTCK, phiGiaoDich.NgayGio, phiGiaoDich.GiaPhi };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public DataTable thongtinCP(int MaCP, DateTime NgayGio)
        {
            query = "select l.MaCP, TenCP, GiaTran, GiaThamChieu, GiaSan from COPHIEU as c, LICHSUGIA as l  where c.MaCP = l.MaCP and l.MaCP = '" + MaCP + "'and NgayGio = '" + NgayGio + "'";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        public bool themLenhDat(LenhDat lenhDat)
        {
            query = "SP_KHOPLENH";
            object[] para = new object[] { "@MaLD", "@MaCP", "@Ngay", "@LoaiGD", "@SoluongMB", "@GiaDatMB", "@loailenh", "@MaTKNH", "@MaCTCK" };
            object[] para1 = new object[] { lenhDat.MaLD, lenhDat.MaCP, lenhDat.NgayGio, lenhDat.MaLGD, lenhDat.SoLuongDat, lenhDat.GiaDat, lenhDat.MaLL, lenhDat.MaTKNH, lenhDat.MaCTCK };
            return DataProvider.Instance.ExecuteNonQuery(query, CommandType.StoredProcedure, para, para1) > 0;
        }
        public DataTable thongtinPhi(string MaCTCK, DateTime NgayGio, string MaLGD)
        {
            query = "select GiaPhi from THAYDOIGIA where MaCTCK = '" + MaCTCK + "'AND MaLGD = '" + MaLGD + "'AND DAY(NgayGio) = '" + NgayGio.Day + "'AND MONTH(NgayGio) = '" + NgayGio.Month + "'AND YEAR(NgayGio) = '" + NgayGio.Year + "' ";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        public DataTable loadLenhDat(LenhDat lenhDat)
        {
            query = "select LD.MaLD, LD.NgayGio, MaTKNH, MaLGD = (select TenLoaiGiaoDich from LOAIGIAODICH as lgd where lgd.MaLGD = LD.MaLGD),(SoLuongDat + SoLuongKhop) as SoLuongDat,GiaDat, MaLL, MaCP, MaTT = (select TenTrangThai from TRANGTHAI as tt where tt.MaTT = LD.MaTT) from LENHDAT as LD LEFT JOIN KHOPLENH as KL ON LD.MaLD = KL.MaLD OR LD.MaLD = KL.MaKL ";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        public DataTable loadKhopLenh(KhopLenh khopLenh)
        {
            query = "select MaKL, NgayGio, SoLuongKhop, PhiGiaoDich, GiaKhop, MaLD from KHOPLENH";
            return DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
    }
}
