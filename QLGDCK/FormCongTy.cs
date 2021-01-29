using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using DevExpress.ClipboardSource.SpreadsheetML;
using System.Data.SqlClient;
using DevExpress.XtraReports.UI;

namespace QLGDCK
{
    public partial class FormCongTy : DevExpress.XtraEditors.XtraForm
    {
        int check =0 ;
        public FormCongTy()
        {
            InitializeComponent();
        }

        private void FormCongTy_Load(object sender, EventArgs e)
        {
            HienThi();
            loadNhanVien();
            loadNhaDauTu();
            loadTraCuuNH();
            loadTraCuuNDT();
            loadTraCuuNDTSD();
            loadTKNH();
            loadPhiGD();
            loadMaLGD();
        }

        private void HienThi()
        {
            LBMa.Text = Program.username;
            LBTen.Text = Program.mHoten;
            LBQuyen.Text = Program.mGroup;
            LBCongty.Text = Program.Coso;
        }

        private void loadNhanVien()
        {
            NhanVien nhanVien = new NhanVien();
            UserSub.Instance.load(dgvNhanVien, nhanVien);
            gbNhanVien.Enabled = false;
        }

        private void FormCongTy_FormClosing(object sender, FormClosingEventArgs e)
        {
            FormLogin fr = new FormLogin();
            fr.FormClosed += F_FormClosed;

            fr.Show();

            this.Hide();
        }
        private void F_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Hide();
        }

        private void dgvNhanVien_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow data = dgvNhanVien.CurrentRow;
            txtMaNV.Text = data.Cells["MaNV"].Value.ToString().Trim();
            txtHoNV.Text = data.Cells["HoNV"].Value.ToString().Trim();
            txtTenNV.Text = data.Cells["TenNV"].Value.ToString().Trim();
            phaiCheckedit.Checked = (bool)data.Cells["PhaiNV"].Value;
            dtpNgaysinhNV.Value = (DateTime)data.Cells["NgaySinhNV"].Value;
            txtDiachiNV.Text = data.Cells["DiaChiNV"].Value.ToString().Trim();
            txtSDT.Text = data.Cells["SoDTNV"].Value.ToString().Trim();
            nghiCheckEdit.Checked = (bool)data.Cells["DaNghiViec"].Value;
        }

        private void btnThemNV_Click(object sender, EventArgs e)
        {
            gbNhanVien.Enabled = true;
            btnXoaNV.Enabled = false;
            btnSuaNV.Enabled = false;
            btnThoatNV.Enabled = false;
            txtMaNV.Enabled = true;
            txtMaNV.Clear();
            if (Program.Coso == "Công ty chứng khoán số 1")
            {
                txtMaNV.Text = "010";
            }
            else
            {
                txtMaNV.Text = "020";
            }
            check = 0;
            txtHoNV.Clear();
            txtTenNV.Clear();
            txtDiachiNV.Clear();
            txtSDT.Clear();
            txtHoNV.Enabled = true;
            txtTenNV.Enabled = true;
            phaiCheckedit.Enabled = true;
            dtpNgaysinhNV.Enabled = true;
            txtDiachiNV.Enabled = true;
            txtSDT.Enabled = true;
            nghiCheckEdit.Enabled = true;
        }

        private void btnXoaNV_Click(object sender, EventArgs e)
        {
            txtMaNV.Enabled = false;
            gbNhanVien.Enabled = true;
            btnSuaNV.Enabled = false;
            btnThemNV.Enabled = false;
            btnThoatNV.Enabled = false;
            check = 2;
            txtHoNV.Enabled = false;
            txtTenNV.Enabled = false;
            phaiCheckedit.Enabled = false;
            dtpNgaysinhNV.Enabled = false;
            txtDiachiNV.Enabled = false;
            txtSDT.Enabled = false;
            nghiCheckEdit.Enabled = false;
        }

        private void btnSuaNV_Click(object sender, EventArgs e)
        {
            txtMaNV.Enabled = false;
            gbNhanVien.Enabled = true;
            btnXoaNV.Enabled = false;
            btnThemNV.Enabled = false;
            btnThoatNV.Enabled = false;
            DataGridViewRow data = dgvNhanVien.CurrentRow;
            NhanVien nhanVien = new NhanVien();
            txtMaNV.Enabled = false;
            txtHoNV.Enabled = true;
            txtTenNV.Enabled = true;
            phaiCheckedit.Enabled = true;
            dtpNgaysinhNV.Enabled = true;
            txtDiachiNV.Enabled = true;
            txtSDT.Enabled = true;
            nghiCheckEdit.Enabled = true;
            txtMaNV.Text = data.Cells["MaNV"].Value.ToString().Trim();
            txtHoNV.Text = data.Cells["HoNV"].Value.ToString().Trim();
            txtTenNV.Text = data.Cells["TenNV"].Value.ToString().Trim();
            phaiCheckedit.Checked = (bool) data.Cells["PhaiNV"].Value;
            dtpNgaysinhNV.Value = (DateTime)data.Cells["NgaySinhNV"].Value;
            txtDiachiNV.Text = data.Cells["DiaChiNV"].Value.ToString().Trim();
            txtSDT.Text = data.Cells["SoDTNV"].Value.ToString().Trim();
            nghiCheckEdit.Checked = (bool)data.Cells["DaNghiViec"].Value;
            check = 1;
        }

        private void btnGhi_Click(object sender, EventArgs e)
        {
            NhanVien nhanVien = new NhanVien();
            nhanVien.MaNV = txtMaNV.Text;
            nhanVien.Ho = txtHoNV.Text;
            nhanVien.Ten = txtTenNV.Text;
            nhanVien.Phai = phaiCheckedit.Checked;
            nhanVien.Ngaysinh = dtpNgaysinhNV.Value;
            nhanVien.Sdt = txtSDT.Text;
            nhanVien.MaCTCK = Program.Coso == "Công ty chứng khoán số 1" ? "010" : "020";
            nhanVien.Diachi = txtDiachiNV.Text;
            nhanVien.Danghiviec = nghiCheckEdit.Checked;
            if (check == 0)
            {
                for (int i = 0; i < dgvNhanVien.Rows.Count - 1; i++)
                {

                    if (dgvNhanVien.Rows[i].Cells["MaNV"].Value.ToString().Trim() == txtMaNV.Text)
                    {
                        MessageBox.Show("Mã nhân viên bị trùng");
                        txtMaNV.Focus();
                        return;
                    }

                }
                if (txtHoNV.Text.Trim() == "")
                {
                    MessageBox.Show("Họ nhân viên không được để trống!", "", MessageBoxButtons.OK);
                    txtHoNV.Focus();
                    return;
                }
                if (txtTenNV.Text.Trim() == "")
                {
                    MessageBox.Show("Tên nhân viên không được để trống!", "", MessageBoxButtons.OK);
                    txtTenNV.Focus();
                    return;
                }
                if (txtSDT.Text.Trim() == "")
                {
                    MessageBox.Show("Số điện thoại nhân viên không được để trống!", "", MessageBoxButtons.OK);
                    txtSDT.Focus();
                    return;
                }
                if (txtDiachiNV.Text.Trim() == "")
                {
                    MessageBox.Show("Địa chỉ nhân viên không được để trống!", "", MessageBoxButtons.OK);
                    txtDiachiNV.Focus();
                    return;
                }
                if (UserSub.Instance.them(dgvNhanVien, nhanVien))
                {
                    MessageBox.Show("Thêm thành công");
                    btnXoaNV.Enabled = true;
                    btnSuaNV.Enabled = true;
                    btnThoatNV.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Không thành công");
                    btnXoaNV.Enabled = true;
                    btnSuaNV.Enabled = true;
                    btnThoatNV.Enabled = true;
                }
            }
            if (check == 1)
            {
                if (txtMaNV.Text.Trim() == "")
                {
                    MessageBox.Show("Mã nhân viên không được để trống!", "", MessageBoxButtons.OK);
                    txtMaNV.Focus();
                    return;
                }
                if (txtHoNV.Text.Trim() == "")
                {
                    MessageBox.Show("Họ nhân viên không được để trống!", "", MessageBoxButtons.OK);
                    txtHoNV.Focus();
                    return;
                }
                if (txtTenNV.Text.Trim() == "")
                {
                    MessageBox.Show("Tên nhân viên không được để trống!", "", MessageBoxButtons.OK);
                    txtTenNV.Focus();
                    return;
                }
                if (txtSDT.Text.Trim() == "")
                {
                    MessageBox.Show("Số điện thoại nhân viên không được để trống!", "", MessageBoxButtons.OK);
                    txtSDT.Focus();
                    return;
                }
                if (txtDiachiNV.Text.Trim() == "")
                {
                    MessageBox.Show("Địa chỉ nhân viên không được để trống!", "", MessageBoxButtons.OK);
                    txtDiachiNV.Focus();
                    return;
                }
                if (UserSub.Instance.sua(nhanVien))
                {
                    MessageBox.Show("không thành công");
                    btnXoaNV.Enabled = true;
                    btnThoatNV.Enabled = true;
                    btnThemNV.Enabled = true;
                }
                else
                {
                    MessageBox.Show("sửa thành công");
                    btnXoaNV.Enabled = true;
                    btnThoatNV.Enabled = true;
                    btnThemNV.Enabled = true;
                }
            }
            if (check == 2)
            {
                if (UserSub.Instance.xoa(nhanVien))
                {
                    MessageBox.Show("không thành công");
                    btnSuaNV.Enabled = true;
                    btnThoatNV.Enabled = true;
                    btnThemNV.Enabled = true;
                }
                else
                {
                    MessageBox.Show("xóa thành công");
                    btnSuaNV.Enabled = true;
                    btnThoatNV.Enabled = true;
                    btnThemNV.Enabled = true;
                }
            }
            loadNhanVien();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            gbNhanVien.Enabled = false;
            btnXoaNV.Enabled = true;
            btnSuaNV.Enabled = true;
            btnThoatNV.Enabled = true;
            btnThemNV.Enabled = true;
        }

        private void btnLamMoiNV_Click(object sender, EventArgs e)
        {
            loadNhanVien();
        }

        private void btnUndoNV_Click(object sender, EventArgs e)
        {
            gbNhanVien.Enabled = false;
            btnThemNV.Enabled = true;
            btnSuaNV.Enabled = true;
            btnXoaNV.Enabled = true;
            btnThoatNV.Enabled = true;
        }

        private void btnThoatNV_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void loadNhaDauTu()
        {
            NhaDauTu nhaDauTu = new NhaDauTu();
            UserSub.Instance.loadNDT(dgvNhaDauTu, nhaDauTu);
            gbNhaDauTu.Enabled = false;
        }
        private void dgvNhaDauTu_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow data = dgvNhaDauTu.CurrentRow;
            txtMaNDT.Text = data.Cells["MaTK"].Value.ToString().Trim();
            txtHoNDT.Text = data.Cells["HoNDT"].Value.ToString().Trim();
            txtTenNDT.Text = data.Cells["TenNDT"].Value.ToString().Trim();
            dtpNgaysinhNDT.Value = (DateTime)data.Cells["NgaySinhNDT"].Value;
            phaicheckEditNDT.Checked = (bool)data.Cells["PhaiNDT"].Value;
            txtDiachiNDT.Text = data.Cells["DiaChiNDT"].Value.ToString().Trim();
            txtEmailNDT.Text = data.Cells["Email"].Value.ToString().Trim();
            txtSDTNDT.Text = data.Cells["SoDTNDT"].Value.ToString().Trim();
            txtCMND.Text = data.Cells["CMND"].Value.ToString().Trim();
            txtPassport.Text = data.Cells["Passport"].Value.ToString().Trim();
            dtpNgayCap.Value = (DateTime)data.Cells["NgayCap"].Value;
            txtQuocgia.Text = data.Cells["QuocGia"].Value.ToString().Trim();
            txtMKDL.Text = data.Cells["MKDatLenh"].Value.ToString().Trim();
            txtMKGD.Text = data.Cells["MKGiaoDich"].Value.ToString().Trim();
        }

        private void btnThemNDT_Click(object sender, EventArgs e)
        {
            gbNhaDauTu.Enabled = true;
            btnXoaNDT.Enabled = false;
            btnSuaNDT.Enabled = false;
            btnThoatNDT.Enabled = false;
            check = 0;
            txtMaNDT.Enabled = false;
            txtMaNDT.Text = SinhMaTuDong();
            txtHoNDT.Clear();
            txtTenNDT.Clear();
            txtSDTNDT.Clear();
            txtDiachiNDT.Clear();
            txtEmailNDT.Clear();
            txtCMND.Clear();
            txtPassport.Clear();
            txtQuocgia.Clear();
            txtMKDL.Clear();
            txtMKGD.Clear();
            txtHoNDT.Enabled = true;
            txtTenNDT.Enabled = true;
            txtEmailNDT.Enabled = true;
            dtpNgaysinhNDT.Enabled = true;
            txtDiachiNDT.Enabled = true;
            txtSDTNDT.Enabled = true;
            phaicheckEditNDT.Enabled = true;
            txtCMND.Enabled = true;
            txtPassport.Enabled = true;
            dtpNgayCap.Enabled = true;
            txtQuocgia.Enabled = true;
            txtMKDL.Enabled = true;
            txtMKGD.Enabled = true;
        }

        private void btnXoaNDT_Click(object sender, EventArgs e)
        {
            txtMaNDT.Enabled = false;
            gbNhaDauTu.Enabled = true;
            btnSuaNDT.Enabled = false;
            btnThemNDT.Enabled = false;
            btnThoatNDT.Enabled = false;
            txtHoNDT.Enabled = false;
            txtTenNDT.Enabled = false;
            txtEmailNDT.Enabled = false;
            dtpNgaysinhNDT.Enabled = false;
            txtDiachiNDT.Enabled = false;
            txtSDTNDT.Enabled = false;
            phaicheckEditNDT.Enabled = false;
            txtCMND.Enabled = false;
            txtPassport.Enabled = false;
            dtpNgayCap.Enabled = false;
            txtQuocgia.Enabled = false;
            txtMKDL.Enabled = false;
            txtMKGD.Enabled = false;
            NhaDauTu nhaDauTu = new NhaDauTu();
            nhaDauTu.MaTK = txtMaNDT.Text;
            check = 2;
        }

        private void btnSuaNDT_Click(object sender, EventArgs e)
        {
            txtMaNDT.Enabled = false;
            gbNhaDauTu.Enabled = true;
            btnXoaNDT.Enabled = false;
            btnThemNDT.Enabled = false;
            btnThoatNDT.Enabled = false;
            txtHoNDT.Enabled = true;
            txtTenNDT.Enabled = true;
            txtEmailNDT.Enabled = true;
            dtpNgaysinhNDT.Enabled = true;
            txtDiachiNDT.Enabled = true;
            txtSDTNDT.Enabled = true;
            phaicheckEditNDT.Enabled = true;
            txtCMND.Enabled = true;
            txtPassport.Enabled = true;
            dtpNgayCap.Enabled = true;
            txtQuocgia.Enabled = true;
            txtMKDL.Enabled = true;
            txtMKGD.Enabled = true;
            DataGridViewRow data = dgvNhaDauTu.CurrentRow;
            NhaDauTu nhaDauTu = new NhaDauTu();
            txtMaNDT.Enabled = false;
            txtMaNDT.Text = data.Cells["MaTK"].Value.ToString().Trim();
            txtHoNDT.Text = data.Cells["HoNDT"].Value.ToString().Trim();
            txtTenNDT.Text = data.Cells["TenNDT"].Value.ToString().Trim();
            dtpNgaysinhNDT.Value = (DateTime)data.Cells["NgaySinhNDT"].Value;
            phaicheckEditNDT.Checked =(bool) data.Cells["PhaiNDT"].Value;
            txtDiachiNDT.Text = data.Cells["DiaChiNDT"].Value.ToString().Trim();
            txtEmailNDT.Text = data.Cells["Email"].Value.ToString().Trim();
            txtSDTNDT.Text = data.Cells["SoDTNDT"].Value.ToString().Trim();
            txtCMND.Text = data.Cells["CMND"].Value.ToString().Trim();
            txtPassport.Text = data.Cells["Passport"].Value.ToString().Trim();
            dtpNgayCap.Value = (DateTime)data.Cells["NgayCap"].Value;
            txtQuocgia.Text = data.Cells["QuocGia"].Value.ToString().Trim();
            txtMKDL.Text = data.Cells["MKDatLenh"].Value.ToString().Trim();
            txtMKGD.Text = data.Cells["MKGiaoDich"].Value.ToString().Trim();
            check = 1;
        }

        private void btnUndoNDT_Click(object sender, EventArgs e)
        {
            gbNhaDauTu.Enabled = false;
            btnThemNDT.Enabled = true;
            btnSuaNDT.Enabled = true;
            btnXoaNDT.Enabled = true;
            btnThoatNDT.Enabled = true;
        }

        private void btnRefreshNDT_Click(object sender, EventArgs e)
        {
            loadNhaDauTu();
        }

        private void btnThoatNDT_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        public string SinhMaTuDong()
        {
            int coso = 0;
            if (dgvNhaDauTu.Rows.Count == 0)
            {
                coso = 1;
            }
            if ((dgvNhaDauTu.Rows.Count - 1) == 1 && int.Parse(dgvNhaDauTu.Rows[0].Cells["MaTK"].Value.ToString().Substring(3, 7)) == 1)
            {
                coso = 2;
            }
            else if ((dgvNhaDauTu.Rows.Count-1) == 1 && int.Parse(dgvNhaDauTu.Rows[0].Cells["MaTK"].Value.ToString().Substring(3, 7)) > 1)
            {
                coso = 1;
            }
            else
            {
                for (int i = 0; i < dgvNhaDauTu.Rows.Count - 2; i++)
                {
                    if (int.Parse(dgvNhaDauTu.Rows[i+1].Cells["MaTK"].Value.ToString().Substring(3, 7)) - int.Parse(dgvNhaDauTu.Rows[i].Cells["MaTK"].Value.ToString().Substring(3, 7)) > 1)
                    {
                        coso = int.Parse(dgvNhaDauTu.Rows[i].Cells["MaTK"].Value.ToString().Substring(3, 7)) + 1;
                        break;
                    }
                    coso = int.Parse(dgvNhaDauTu.Rows[i+1].Cells["MaTK"].Value.ToString().Substring(3, 7)) + 1;
                }
            }
            if (coso < 10 && Program.Coso == "Công ty chứng khoán số 1")
                return "010000000" + coso;
            else if (coso < 10 && Program.Coso == "Công ty chứng khoán số 2")
                return "020000000" + coso;
            else if (coso < 100 && Program.Coso == "Công ty chứng khoán số 1")
                return "01000000" + coso;
            else if (coso < 100 && Program.Coso == "Công ty chứng khoán số 2")
                return "02000000" + coso;
            else if (coso < 1000 && Program.Coso == "Công ty chứng khoán số 1")
                return "0100000" + coso;
            else if (coso < 1000 && Program.Coso == "Công ty chứng khoán số 2")
                return "0200000" + coso;
            else if (coso < 10000 && Program.Coso == "Công ty chứng khoán số 1")
                return "010000" + coso;
            else if (coso < 10000 && Program.Coso == "Công ty chứng khoán số 2")
                return "010000" + coso;
            else if (coso < 100000 && Program.Coso == "Công ty chứng khoán số 1")
                return "01000" + coso;
            else if (coso < 100000 && Program.Coso == "Công ty chứng khoán số 2")
                return "01000" + coso;
            else if (coso < 1000000 && Program.Coso == "Công ty chứng khoán số 1")
                return "0100" + coso;
            else if (coso < 1000000 && Program.Coso == "Công ty chứng khoán số 2")
                return "0100" + coso;
            else if (coso < 10000000 && Program.Coso == "Công ty chứng khoán số 1")
                return "010" + coso;
            else return "020" + coso; 
        }
        private void btnGhiNDT_Click(object sender, EventArgs e)
        { 
            NhaDauTu nhaDauTu = new NhaDauTu();
            nhaDauTu.MaTK = txtMaNDT.Text;
            nhaDauTu.Ho = txtHoNDT.Text;
            nhaDauTu.Ten = txtTenNDT.Text;
            nhaDauTu.NgaySinh = dtpNgaysinhNDT.Value;
            nhaDauTu.Phai = phaicheckEditNDT.Checked;
            nhaDauTu.DiaChi = txtDiachiNDT.Text;
            nhaDauTu.Email = txtEmailNDT.Text;
            nhaDauTu.SoDT = txtSDTNDT.Text;
            nhaDauTu.MaCTCK = Program.Coso == "Công ty chứng khoán số 1" ? "010" : "020";
            nhaDauTu.CMND = txtCMND.Text;
            nhaDauTu.Passport = txtPassport.Text;
            nhaDauTu.NgayCap = dtpNgayCap.Value;
            nhaDauTu.QuocGia = txtQuocgia.Text;
            nhaDauTu.MKGiaoDich = txtMKGD.Text;
            nhaDauTu.MKDatLenh = txtMKDL.Text;
            if (check == 0)
            {
                if (txtHoNDT.Text.Trim() == "")
                {
                    MessageBox.Show("Họ nhà đầu tư không được để trống!", "", MessageBoxButtons.OK);
                    txtHoNDT.Focus();
                    return;
                }
                if (txtTenNDT.Text.Trim() == "")
                {
                    MessageBox.Show("Tên nhà đầu tư không được để trống!", "", MessageBoxButtons.OK);
                    txtTenNDT.Focus();
                    return;
                }
                if (txtSDTNDT.Text.Trim() == "")
                {
                    MessageBox.Show("Số điện thoại nhà đầu tư không được để trống!", "", MessageBoxButtons.OK);
                    txtSDTNDT.Focus();
                    return;
                }
                if (txtDiachiNDT.Text.Trim() == "")
                {
                    MessageBox.Show("Địa chỉ nhà đầu tư không được để trống!", "", MessageBoxButtons.OK);
                    txtDiachiNDT.Focus();
                    return;
                }
                if(txtCMND.Text.Trim()=="")
                {
                    MessageBox.Show("Chứng minh nhân dân không được để trống!", "", MessageBoxButtons.OK);
                    txtCMND.Focus();
                    return;
                }
                if (txtPassport.Text.Trim() == "")
                {
                    MessageBox.Show("Passport không được để trống!", "", MessageBoxButtons.OK);
                    txtPassport.Focus();
                    return;
                }
                if (txtMKDL.Text.Trim() == "")
                {
                    MessageBox.Show("Mật khẩu đặt lệnh không được để trống!", "", MessageBoxButtons.OK);
                    txtMKDL.Focus();
                    return;
                }
                if (txtMKGD.Text.Trim() == "")
                {
                    MessageBox.Show("Mật khẩu giao dịch không được để trống!", "", MessageBoxButtons.OK);
                    txtMKDL.Focus();
                    return;
                }
                if (UserSub.Instance.themNDT(dgvNhaDauTu, nhaDauTu))
                {
                    MessageBox.Show("thêm thành công");
                    btnSuaNDT.Enabled = true;
                    btnXoaNDT.Enabled = true;
                    btnThoatNDT.Enabled = true;
                }
                else
                {
                    MessageBox.Show("không thành công");
                    btnSuaNDT.Enabled = true;
                    btnXoaNDT.Enabled = true;
                    btnThoatNDT.Enabled = true;
                }
            }
            if (check == 1)
            {
                if (txtHoNDT.Text.Trim() == "")
                {
                    MessageBox.Show("Họ nhà đầu tư không được để trống!", "", MessageBoxButtons.OK);
                    txtHoNDT.Focus();
                    return;
                }
                if (txtTenNDT.Text.Trim() == "")
                {
                    MessageBox.Show("Tên nhà đầu tư không được để trống!", "", MessageBoxButtons.OK);
                    txtTenNV.Focus();
                    return;
                }
                if (txtSDTNDT.Text.Trim() == "")
                {
                    MessageBox.Show("Số điện thoại nhà đầu tư không được để trống!", "", MessageBoxButtons.OK);
                    txtSDTNDT.Focus();
                    return;
                }
                if (txtDiachiNDT.Text.Trim() == "")
                {
                    MessageBox.Show("Địa chỉ nhà đầu tư không được để trống!", "", MessageBoxButtons.OK);
                    txtDiachiNDT.Focus();
                    return;
                }
                if (txtCMND.Text.Trim() == "")
                {
                    MessageBox.Show("Chứng minh nhân dân không được để trống!", "", MessageBoxButtons.OK);
                    txtCMND.Focus();
                    return;
                }
                if (txtPassport.Text.Trim() == "")
                {
                    MessageBox.Show("Passport không được để trống!", "", MessageBoxButtons.OK);
                    txtPassport.Focus();
                    return;
                }
                if (txtMKDL.Text.Trim() == "")
                {
                    MessageBox.Show("Mật khẩu đặt lệnh không được để trống!", "", MessageBoxButtons.OK);
                    txtMKDL.Focus();
                    return;
                }
                if (txtMKGD.Text.Trim() == "")
                {
                    MessageBox.Show("Mật khẩu giao dịch không được để trống!", "", MessageBoxButtons.OK);
                    txtMKDL.Focus();
                    return;
                }
                if (UserSub.Instance.suaNDT(nhaDauTu))
                {
                    MessageBox.Show("không thành công");
                    btnThemNDT.Enabled = true;
                    btnXoaNDT.Enabled = true;
                    btnThoatNDT.Enabled = true;
                }
                else
                {
                    MessageBox.Show("sửa thành công");
                    btnThemNDT.Enabled = true;
                    btnXoaNDT.Enabled = true;
                    btnThoatNDT.Enabled = true;
                }
            }
            if (check == 2)
            {
                if (UserSub.Instance.xoaNDT(nhaDauTu))
                {
                    MessageBox.Show("đã xóa thành công");
                    btnThemNDT.Enabled = true;
                    btnSuaNDT.Enabled = true;
                    btnThoatNDT.Enabled = true;
                }
                else
                {
                    MessageBox.Show("không thành công");
                    btnThemNDT.Enabled = true;
                    btnSuaNDT.Enabled = true;
                    btnThoatNDT.Enabled = true;
                }
            }
            loadNhaDauTu();
        }

        private void btnHuyNDT_Click(object sender, EventArgs e)
        {
            gbNhaDauTu.Enabled = false;
            btnXoaNDT.Enabled = true;
            btnSuaNDT.Enabled = true;
            btnThoatNDT.Enabled = true;
            btnThemNDT.Enabled = true;
        }

        private void btnThemTKNH_Click(object sender, EventArgs e)
        {
            gbTKNH.Enabled = true;
            btnXoaTKNH.Enabled = false;
            btnSuaTKNH.Enabled = false;
            btnThoatTKNH.Enabled = false;
            check = 0;
            txtMaTKNH.Enabled = true;
            txtMaTKNH.Clear();
            txtSodu.Clear();
            cmbNH.Enabled = true;
            txtSodu.Enabled = true;
            cmbNDTNH.Enabled = true;
        }

        private void btnXoaTKNH_Click(object sender, EventArgs e)
        {
            txtMaTKNH.Enabled = false;
            gbTKNH.Enabled = true;
            btnSuaTKNH.Enabled = false;
            btnThemTKNH.Enabled = false;
            btnThoatTKNH.Enabled = false;
            txtMaTKNH.Enabled = false;
            cmbNH.Enabled = false;
            txtSodu.Enabled = false;
            cmbNDTNH.Enabled = false;
            txtTenNH.Enabled = false;
            TaiKhoanNganHang taiKhoanNganHang = new TaiKhoanNganHang();
            taiKhoanNganHang.MaTKNH = txtMaTKNH.Text;
            check = 2;
        }

        private void btnSuaTKNH_Click(object sender, EventArgs e)
        {
            gbTKNH.Enabled = true;
            btnXoaTKNH.Enabled = false;
            btnThemTKNH.Enabled = false;
            btnThoatTKNH.Enabled = false;
            txtMaTKNH.Enabled = false;
            cmbNH.Enabled = true;
            txtSodu.Enabled = true;
            cmbNDTNH.Enabled = true;
            DataGridViewRow data = dgvTKNH.CurrentRow;
            TaiKhoanNganHang taiKhoanNganHang = new TaiKhoanNganHang();
            txtMaTKNH.Text = data.Cells["MaTKNH"].Value.ToString().Trim();
            cmbNH.Text = data.Cells["MaNH"].Value.ToString().Trim();
            txtSodu.Text = data.Cells["SoDuTKNH"].Value.ToString().Trim();
            cmbNDTNH.Text = data.Cells["MaTKSD"].Value.ToString().Trim();
            check = 1;
        }

        private void cmbNH_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbNH.ValueMember != "")
            {
                txtTenNH.Text = cmbNH.SelectedValue.ToString();
            }
        }
        private void loadTraCuuNH()
        {
            string query = "select * from NGANHANG";

            cmbNH.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            cmbNH.DisplayMember = "MaNH";
            cmbNH.ValueMember = "TenNH";
            txtTenNH.Text = cmbNH.SelectedValue.ToString();
        }
        public void loadTraCuuNDT()
        {
            string query = "select * from NHADAUTU";

            cmbNDTNH.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            cmbNDTNH.DisplayMember = "MaTK";
            cmbNDTNH.ValueMember = "MaTK";
        }

        private void dgvTKNH_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            gbTKNH.Enabled = false;
            DataGridViewRow data = dgvTKNH.CurrentRow;
            txtMaTKNH.Text = data.Cells["MaTKNH"].Value.ToString().Trim();
            cmbNH.Text = data.Cells["MaNH"].Value.ToString().Trim();
            cmbNDTNH.Text = data.Cells["MaTKSD"].Value.ToString().Trim();
            txtSodu.Text = data.Cells["SoDuTKNH"].Value.ToString().Trim();
        }
        private void loadTKNH()
        {
            TaiKhoanNganHang taiKhoanNganHang = new TaiKhoanNganHang();
            UserSub.Instance.loadTKNH(dgvTKNH, taiKhoanNganHang);
            gbTKNH.Enabled = false;
        }

        private void btnUndoTKNH_Click(object sender, EventArgs e)
        {
            gbTKNH.Enabled = false;
            btnThemTKNH.Enabled = true;
            btnXoaTKNH.Enabled = true;
            btnSuaTKNH.Enabled = true;
            btnThoatTKNH.Enabled = true;
        }

        private void btnRefreshTKNH_Click(object sender, EventArgs e)
        {
            loadTKNH();
        }

        private void btnThoatTKNH_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnHuyTKNH_Click(object sender, EventArgs e)
        {
            gbTKNH.Enabled = false;
            btnXoaTKNH.Enabled = true;
            btnSuaTKNH.Enabled = true;
            btnThoatTKNH.Enabled = true;
            btnThemTKNH.Enabled = true;
        }

        private void btnGhiTKNH_Click(object sender, EventArgs e)
        {
            TaiKhoanNganHang taiKhoanNganHang = new TaiKhoanNganHang();
            taiKhoanNganHang.MaTKNH = txtMaTKNH.Text;
            taiKhoanNganHang.MaNH = cmbNH.Text;
            taiKhoanNganHang.SoduTKNH = Double.Parse(txtSodu.Text);
            taiKhoanNganHang.MaTK = cmbNDTNH.Text;
            if (check == 0)
            {
                if (txtMaTKNH.Text.Trim() == "")
                {
                    MessageBox.Show("Mã tài khoản ngân hàng không được để trống!", "", MessageBoxButtons.OK);
                    txtMaTKNH.Focus();
                    return;
                }
                if (txtSodu.Text.Trim() == "")
                {
                    MessageBox.Show("Số dư tài khoản ngân hàng không được để trống!", "", MessageBoxButtons.OK);
                    txtTenNV.Focus();
                    return;
                }
                if (UserSub.Instance.themTKNH(dgvTKNH, taiKhoanNganHang))
                {
                    MessageBox.Show("Thêm thành công");
                    btnXoaTKNH.Enabled = true;
                    btnSuaTKNH.Enabled = true;
                    btnThoatTKNH.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Không thành công");
                    btnXoaTKNH.Enabled = true;
                    btnSuaTKNH.Enabled = true;
                    btnThoatTKNH.Enabled = true;
                }
            }
            if (check == 1)
            {
                if (UserSub.Instance.suaTKNH(taiKhoanNganHang))
                {
                    MessageBox.Show("Không thành công");
                    btnXoaTKNH.Enabled = true;
                    btnThoatTKNH.Enabled = true;
                    btnThemTKNH.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Sửa thành công");
                    btnXoaTKNH.Enabled = true;
                    btnThoatTKNH.Enabled = true;
                    btnThemTKNH.Enabled = true;
                }
            }
            if (check == 2)
            {
                if (UserSub.Instance.xoaTKNH(taiKhoanNganHang))
                {
                    MessageBox.Show("Xóa thành công");
                    btnSuaTKNH.Enabled = true;
                    btnThoatTKNH.Enabled = true;
                    btnThemTKNH.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Không thàng công");
                    btnSuaTKNH.Enabled = true;
                    btnThoatTKNH.Enabled = true;
                    btnThemTKNH.Enabled = true;
                }
            }
            loadTKNH();
        }
        public void loadTraCuuNDTSD()
        {
            string query = "select * from NHADAUTU";

            cmbNDT.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            cmbNDT.DisplayMember = "MaTK";
            cmbNDT.ValueMember = "MaTK";
            txtTenNDTSD.Enabled = false;
            txtMaTKNHSD.Enabled = false;
            txtSoduGD.Enabled = false;
            txtTenNHSD.Enabled = false;
        }
        private void cmbNDT_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable data = new DataTable();
            data = UserMain.Instance.laythongtin(cmbNDT.SelectedValue.ToString().Trim());
            foreach (DataRow item in data.Rows)
            {
                txtTenNDTSD.Text = item.ItemArray[0].ToString().Trim();
                txtSoduGD.Text = item.ItemArray[3].ToString().Trim();
                txtMaTKNHSD.Text = item.ItemArray[1].ToString().Trim();
                string query = "select TAIKHOANNGANHANG.MaNH,MaTKNH,TenNH from TAIKHOANNGANHANG,NGANHANG where TAIKHOANNGANHANG.MaNH = NGANHANG.MaNH and MaTK = '" + cmbNDT.SelectedValue.ToString() + "'";
                cmbMaNH.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
                cmbMaNH.DisplayMember = "MaNH";
                cmbMaNH.ValueMember = "TenNH";
                txtTenNHSD.Text = cmbMaNH.SelectedValue.ToString();
            }

            UserSub.Instance.laythongtinCP(dgvTraCuuCP, cmbNDT.SelectedValue.ToString().Trim());
        }

        private void cmbMaNH_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable data = new DataTable();
            data = UserMain.Instance.laythongtinNH(cmbMaNH.Text,cmbNDT.Text);
            foreach (DataRow item in data.Rows)
            {
                txtSoduGD.Text = item.ItemArray[1].ToString().Trim();
                txtMaTKNHSD.Text = item.ItemArray[0].ToString().Trim();
            }
            if (cmbMaNH.ValueMember != "")
            {
                txtTenNHSD.Text = cmbMaNH.SelectedValue.ToString();
            }
        }

        private void btnThoatSD_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnXacNhanLG_Click(object sender, EventArgs e)
        {
            TaoLoginCongTy taoLoginCongTy = new TaoLoginCongTy();

            taoLoginCongTy.LgName = txtTenLG.Text;
            taoLoginCongTy.Username = cmbMaNV.Text;
            taoLoginCongTy.Pass = txtMKLG.Text;
            taoLoginCongTy.Role = cmbNhom.Text;

            if (UserSub.Instance.loadLogin(taoLoginCongTy) == -100)
            {
                MessageBox.Show("không thành công!!");
            }
            else
            {
                MessageBox.Show("thành công");
            }
        }
        private void loadNV()
        {
            string query = "select * from NHANVIEN";

            cmbMaNV.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            cmbMaNV.DisplayMember = "MaNV";
            cmbMaNV.ValueMember = "MaNV";
        }
        private void loadNDT()
        {
            string query = "select * from NHADAUTU";

            cmbMaNV.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            cmbMaNV.DisplayMember = "MaTK";
            cmbMaNV.ValueMember = "MaTK";
        }
        private void cmbNhom_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbNhom.Text == "CONGTY")
            {
                loadNV();
            }
            else
            {
                loadNDT();
            }
        }
        private void btnThoatLG_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        //private void btnRefresh_Click(object sender, EventArgs e)
        //{
        //    loadNV();
        //    loadNDT();
        //}
        public void loadPhiGD()
        {
            PhiGiaoDich phiGiaoDich = new PhiGiaoDich();
            UserSub.Instance.loadPhiGD(dgvPGD, phiGiaoDich);
            gbPGD.Enabled = false;
        }
        public void loadMaLGD()
        {
            string query = "select * from LOAIGIAODICH";
            cmbMaLGD.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            cmbMaLGD.DisplayMember = "MaLGD";
            cmbMaLGD.ValueMember = "MaLGD";
        }
        private void dgvPGD_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            gbPGD.Enabled = false;
            DataGridViewRow data = dgvPGD.CurrentRow;
            cmbMaLGD.Text = data.Cells["MaLGD"].Value.ToString().Trim();
            dtpPGD.Value = (DateTime)data.Cells["NgayGio"].Value;
            txtGiaPhi.Text = data.Cells["GiaPhi"].Value.ToString().Trim();
        }

        private void btnThemPGD_Click(object sender, EventArgs e)
        {
            gbPGD.Enabled = true;
            btnSuaPGD.Enabled = false;
            btnThoatPGD.Enabled = false;
            check = 0;
            dtpPGD.Enabled = true;
            cmbMaLGD.Enabled = true;
            txtGiaPhi.Clear();
            
        }

        private void btnSuaPGD_Click(object sender, EventArgs e)
        {
            gbPGD.Enabled = true;
            dtpPGD.Enabled = false;
            btnThemPGD.Enabled = false;
            btnThoatPGD.Enabled = false;
            cmbMaLGD.Enabled = false;
            txtGiaPhi.Enabled = true;
            DataGridViewRow data = dgvPGD.CurrentRow;
            PhiGiaoDich phiGiaoDich = new PhiGiaoDich();
            cmbMaLGD.Text = data.Cells["MaLGD"].Value.ToString().Trim();
            dtpPGD.Value = (DateTime)data.Cells["NgayGio"].Value;
            txtGiaPhi.Text = data.Cells["GiaPhi"].Value.ToString().Trim();
            check = 1;
        }

        private void btnUndoPGD_Click(object sender, EventArgs e)
        {
            gbPGD.Enabled = false;
            btnThemPGD.Enabled = true;
            btnSuaPGD.Enabled = true;
        }

        private void btnRefreshPGD_Click(object sender, EventArgs e)
        {
            loadPhiGD();
        }

        private void btnThoatPGD_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnGhiPGD_Click(object sender, EventArgs e)
        {
            PhiGiaoDich phiGiaoDich = new PhiGiaoDich();
            phiGiaoDich.MaLGD = cmbMaLGD.Text;
            phiGiaoDich.MaCTCK = Program.Coso == "Công ty chứng khoán số 1" ? "010" : "020";
            phiGiaoDich.NgayGio = dtpPGD.Value;
            phiGiaoDich.GiaPhi = double.Parse(txtGiaPhi.Text);
            if (check == 0)
            {
                if (txtGiaPhi.Text.Trim() == "")
                {
                    MessageBox.Show("Giá phí giao dịch không được để trống!", "", MessageBoxButtons.OK);
                    txtGiaPhi.Focus();
                    return;
                }
                if (UserSub.Instance.themPhiGD(dgvPGD, phiGiaoDich))
                {
                    MessageBox.Show("Thêm thành công");
                    btnSuaPGD.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Không thành công");
                    btnSuaPGD.Enabled = true;
                }
            }
            if (check == 1)
            {
                if (UserSub.Instance.suaPhiGD(phiGiaoDich))
                {
                    MessageBox.Show("Không thành công");
                    btnThemPGD.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Sửa thành công");
                    btnThemPGD.Enabled = true;
                }
            }
            loadPhiGD();
        }

        private void btnHuyPGD_Click(object sender, EventArgs e)
        {
            gbPGD.Enabled = false;
            btnThemPGD.Enabled = true;
            btnSuaPGD.Enabled = true;
        }

        private void btnRP_Click(object sender, EventArgs e)
        {
            ReportLietKeCPNDT rp = new ReportLietKeCPNDT(cmbNDT.SelectedValue.ToString().Trim());
            rp.lbMa.Text = cmbNDT.Text;
            rp.lbTen.Text = txtTenNDTSD.Text;
            ReportPrintTool print = new ReportPrintTool(rp);
            print.ShowPreviewDialog();
        }
    }
}