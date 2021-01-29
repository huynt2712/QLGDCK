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

namespace QLGDCK
{
    public partial class FormSoGiaoDich : DevExpress.XtraEditors.XtraForm
    {
        int check = 0;
        public FormSoGiaoDich()
        {
            InitializeComponent();
        }

        private void FormSoGiaoDich_Load(object sender, EventArgs e)
        {
            HienThi();
            loadNV();
            loadNhanVien();
            loadCoPhieu();
            loadCapNhat();
            loadGiaCoPhieu();
            loadCP();
            loadLenhDat();
            loadKhopLenh();
        }

        private void FormSoGiaoDich_FormClosing(object sender, FormClosingEventArgs e)
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
        private void HienThi()
        {
            LBMa.Text = Program.username;
            LBTen.Text = Program.mHoten;
            LBQuyen.Text = Program.mGroup;
            LBSan.Text = Program.Coso;
        }

        private void btnXacNhanLG_Click(object sender, EventArgs e)
        {
            TaoLoginCongTy taoLoginCongTy = new TaoLoginCongTy();

            taoLoginCongTy.LgName = txtTenLG.Text;
            taoLoginCongTy.Username = cmbMaNV.Text;
            taoLoginCongTy.Pass = txtMKLG.Text;
            taoLoginCongTy.Role = txtQuyen.Text;

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
            txtQuyen.Enabled = false;
            string query = "select * from NHANVIENSAN";
            cmbMaNV.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            cmbMaNV.DisplayMember = "MaNV";
            cmbMaNV.ValueMember = "MaNV";
        }
        private void loadNhanVien()
        {
            NhanVienSan nhanVienSan = new NhanVienSan();
            UserSub.Instance.loadNVSan(dgvNhanVien, nhanVienSan);
            gbNhanVien.Enabled = false;
        }

        private void btnThemNV_Click(object sender, EventArgs e)
        {
            gbNhanVien.Enabled = true;
            btnXoaNV.Enabled = false;
            btnSuaNV.Enabled = false;
            btnThoatNV.Enabled = false;
            txtMaNV.Enabled = true;
            txtMaNV.Clear();
            txtMaNV.Text = "NV";
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

        private void dgvNhanVien_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow data = dgvNhanVien.CurrentRow;
            txtMaNV.Text = data.Cells["MaNV"].Value.ToString().Trim();
            txtHoNV.Text = data.Cells["HoNV"].Value.ToString().Trim();
            txtTenNV.Text = data.Cells["TenNV"].Value.ToString().Trim();
            phaiCheckedit.Checked = (bool)data.Cells["PhaiNV"].Value;
            dtpNgaysinhNV.Value = (DateTime)data.Cells["NgaySinhNV"].Value;
            txtDiachiNV.Text = data.Cells["DiaChiNV"].Value.ToString().Trim();
            txtSDT.Text = data.Cells["SoDT"].Value.ToString().Trim();
            nghiCheckEdit.Checked = (bool)data.Cells["DaNghiViec"].Value;
        }

        private void btnXoaNV_Click(object sender, EventArgs e)
        {
            txtMaNV.Enabled = false;
            gbNhanVien.Enabled = true;
            btnSuaNV.Enabled = false;
            btnThemNV.Enabled = false;
            btnThoatNV.Enabled = false;
            txtHoNV.Enabled = false;
            txtTenNV.Enabled = false;
            phaiCheckedit.Enabled = false;
            dtpNgaysinhNV.Enabled = false;
            txtDiachiNV.Enabled = false;
            txtSDT.Enabled = false;
            nghiCheckEdit.Enabled = false;
            check = 2;
        }

        private void btnSuaNV_Click(object sender, EventArgs e)
        {
            txtMaNV.Enabled = false;
            gbNhanVien.Enabled = true;
            btnXoaNV.Enabled = false;
            btnThemNV.Enabled = false;
            btnThoatNV.Enabled = false;
            txtHoNV.Enabled = true;
            txtTenNV.Enabled = true;
            phaiCheckedit.Enabled = true;
            dtpNgaysinhNV.Enabled = true;
            txtDiachiNV.Enabled = true;
            txtSDT.Enabled = true;
            nghiCheckEdit.Enabled = true;
            DataGridViewRow data = dgvNhanVien.CurrentRow;
            NhanVienSan nhanVienSan = new NhanVienSan();
            txtMaNV.Enabled = false;
            txtMaNV.Text = data.Cells["MaNV"].Value.ToString().Trim();
            txtHoNV.Text = data.Cells["HoNV"].Value.ToString().Trim();
            txtTenNV.Text = data.Cells["TenNV"].Value.ToString().Trim();
            phaiCheckedit.Checked = (bool)data.Cells["PhaiNV"].Value;
            dtpNgaysinhNV.Value = (DateTime)data.Cells["NgaySinhNV"].Value;
            txtDiachiNV.Text = data.Cells["DiaChiNV"].Value.ToString().Trim();
            txtSDT.Text = data.Cells["SoDT"].Value.ToString().Trim();
            nghiCheckEdit.Checked = (bool)data.Cells["DaNghiViec"].Value;
            check = 1;
        }

        private void btnUndoNV_Click(object sender, EventArgs e)
        {
            gbNhanVien.Enabled = false;
            btnThemNV.Enabled = true;
            btnSuaNV.Enabled = true;
            btnXoaNV.Enabled = true;
            btnThoatNV.Enabled = true;
        }

        private void btnLamMoiNV_Click(object sender, EventArgs e)
        {
            loadNhanVien();
        }

        private void btnThoatNV_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnGhi_Click(object sender, EventArgs e)
        {
            NhanVienSan nhanVienSan = new NhanVienSan();
            nhanVienSan.MaNV = txtMaNV.Text;
            nhanVienSan.Ho = txtHoNV.Text;
            nhanVienSan.Ten = txtTenNV.Text;
            nhanVienSan.Phai = phaiCheckedit.Checked;
            nhanVienSan.Ngaysinh = dtpNgaysinhNV.Value;
            nhanVienSan.Sdt = txtSDT.Text;
            nhanVienSan.Diachi = txtDiachiNV.Text;
            nhanVienSan.Danghiviec = nghiCheckEdit.Checked;
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
                if (UserSub.Instance.themNVSan(dgvNhanVien, nhanVienSan))
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
                if (UserSub.Instance.suaNVSan(nhanVienSan))
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
                if (UserSub.Instance.xoaNVSan(nhanVienSan))
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
        private void loadCoPhieu()
        {
            CoPhieu coPhieu = new CoPhieu();
            UserSub.Instance.loadCoPhieu(dgvCoPhieu, coPhieu);
            gbCoPhieu.Enabled = false;
        }
        private void loadCapNhat()
        {
            QuyDinh quyDinh = new QuyDinh();
            UserSub.Instance.loadQuyDinh(dgvCapNhat, quyDinh);
            gbQuyDinh.Enabled = false;
        }

        private void btnThemCP_Click(object sender, EventArgs e)
        {
            gbCoPhieu.Enabled = true;
            btnXoaCP.Enabled = false;
            btnSuaCP.Enabled = false;
            btnThoatCP.Enabled = false;
            txtMaCP.Enabled = true;
            txtTenCP.Enabled = true;
            txtDiaChiCT.Enabled = true;
            txtSDTCT.Enabled = true;
            txtFaxCT.Enabled = true;
            txtWebsiteCT.Enabled = true;
            txtEmail.Enabled = true;
            txtSoLuongCP.Enabled = true;
            txtMaCP.Clear();
            txtTenCP.Clear();
            txtDiaChiCT.Clear();
            txtSDTCT.Clear();
            txtFaxCT.Clear();
            txtWebsiteCT.Clear();
            txtEmail.Clear();
            txtSoLuongCP.Clear();
            check = 0;
        }

        private void btnXoaCP_Click(object sender, EventArgs e)
        {
            txtMaCP.Enabled = false;
            gbCoPhieu.Enabled = true;
            btnThemCP.Enabled = false;
            btnSuaCP.Enabled = false;
            btnThoatCP.Enabled = false;
            txtMaCP.Enabled = false;
            txtTenCP.Enabled = false;
            txtDiaChiCT.Enabled = false;
            txtSDTCT.Enabled = false;
            txtFaxCT.Enabled = false;
            txtEmail.Enabled = false;
            txtWebsiteCT.Enabled = false;
            txtSoLuongCP.Enabled = false;
            check = 1;
        }

        private void btnSuaCP_Click(object sender, EventArgs e)
        {
            txtMaCP.Enabled = false;
            gbCoPhieu.Enabled = true;
            btnThemCP.Enabled = false;
            btnXoaCP.Enabled = false;
            btnThoatCP.Enabled = false;
            txtTenCP.Enabled = true;
            txtDiaChiCT.Enabled = true;
            txtSDTCT.Enabled = true;
            txtFaxCT.Enabled = true;
            txtEmail.Enabled = true;
            txtWebsiteCT.Enabled = true;
            txtSoLuongCP.Enabled = true;
            CoPhieu coPhieu = new CoPhieu();
            DataGridViewRow data = dgvCoPhieu.CurrentRow;
            txtMaCP.Text = data.Cells["MaCP"].Value.ToString().Trim();
            txtTenCP.Text = data.Cells["TenCP"].Value.ToString().Trim();
            txtDiaChiCT.Text = data.Cells["DiaChiCP"].Value.ToString().Trim();
            txtSDTCT.Text = data.Cells["SDTCP"].Value.ToString().Trim();
            txtFaxCT.Text = data.Cells["Fax"].Value.ToString().Trim();
            txtWebsiteCT.Text = data.Cells["Website"].Value.ToString().Trim();
            txtEmail.Text = data.Cells["Email"].Value.ToString().Trim();
            txtSoLuongCP.Text = data.Cells["SoLuongCP"].Value.ToString().Trim();
            check = 2;
        }

        private void btnXacNhanCP_Click(object sender, EventArgs e)
        {
            CoPhieu coPhieu = new CoPhieu();

            coPhieu.MaCP = int.Parse(txtMaCP.Text);
            coPhieu.TenCP = txtTenCP.Text;
            coPhieu.DiaChi = txtDiaChiCT.Text;
            coPhieu.SDTCP = txtSDTCT.Text;
            coPhieu.Fax = txtFaxCT.Text;
            coPhieu.DiaChiWebsite = txtWebsiteCT.Text;
            coPhieu.Email = txtEmail.Text;
            coPhieu.MaSGD = Program.Coso = "HNX";
            coPhieu.SoLuongCP = int.Parse(txtSoLuongCP.Text);

            if (check == 0)
            {
                if (txtMaCP.Text.Trim() == "")
                {
                    MessageBox.Show("Mã cổ phiếu không được để trống!", "", MessageBoxButtons.OK);
                    txtMaCP.Focus();
                    return;
                }
                if (txtTenCP.Text.Trim() == "")
                {
                    MessageBox.Show("Tên cổ phiếu không được để trống!", "", MessageBoxButtons.OK);
                    txtTenCP.Focus();
                    return;
                }
                if (txtDiaChiCT.Text.Trim() == "")
                {
                    MessageBox.Show("Địa chỉ công ty không được để trống!", "", MessageBoxButtons.OK);
                    txtDiaChiCT.Focus();
                    return;
                }
                if (txtSDTCT.Text.Trim() == "")
                {
                    MessageBox.Show("Số điện thoại công ty không được để trống!", "", MessageBoxButtons.OK);
                    txtSDTCT.Focus();
                    return;
                }
                if (txtFaxCT.Text.Trim() == "")
                {
                    MessageBox.Show("Fax công ty không được để trống!", "", MessageBoxButtons.OK);
                    txtFaxCT.Focus();
                    return;
                }
                if (txtWebsiteCT.Text.Trim() == "")
                {
                    MessageBox.Show("Website công ty không được để trống!", "", MessageBoxButtons.OK);
                    txtWebsiteCT.Focus();
                    return;
                }
                if (txtSoLuongCP.Text.Trim() == "")
                {
                    MessageBox.Show("Số lượng cổ phiếu không được để trống!", "", MessageBoxButtons.OK);
                    txtSoLuongCP.Focus();
                    return;
                }
                if (UserSub.Instance.themCP(dgvCoPhieu, coPhieu))
                {
                    MessageBox.Show("Thêm thành công");
                    btnXoaCP.Enabled = true;
                    btnSuaCP.Enabled = true;
                    btnThoatCP.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Không thành công");
                    btnXoaCP.Enabled = true;
                    btnSuaCP.Enabled = true;
                    btnThoatCP.Enabled = true;
                }
            }
            if (check == 1)
            {
                if (UserSub.Instance.xoaCP(coPhieu))
                {
                    MessageBox.Show("Xóa thành công");
                    btnSuaCP.Enabled = true;
                    btnThemCP.Enabled = true;
                    btnThoatCP.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Không thành công");
                    btnSuaCP.Enabled = true;
                    btnThemCP.Enabled = true;
                    btnThoatCP.Enabled = true;
                }

            }
            if (check == 2)
            {
                if (txtTenCP.Text.Trim() == "")
                {
                    MessageBox.Show("Tên cổ phiếu không được để trống!", "", MessageBoxButtons.OK);
                    txtTenCP.Focus();
                    return;
                }
                if (txtDiaChiCT.Text.Trim() == "")
                {
                    MessageBox.Show("Địa chỉ công ty không được để trống!", "", MessageBoxButtons.OK);
                    txtDiaChiCT.Focus();
                    return;
                }
                if (txtSDTCT.Text.Trim() == "")
                {
                    MessageBox.Show("Số điện thoại công ty không được để trống!", "", MessageBoxButtons.OK);
                    txtSDTCT.Focus();
                    return;
                }
                if (txtFaxCT.Text.Trim() == "")
                {
                    MessageBox.Show("Fax công ty không được để trống!", "", MessageBoxButtons.OK);
                    txtFaxCT.Focus();
                    return;
                }
                if (txtWebsiteCT.Text.Trim() == "")
                {
                    MessageBox.Show("Website công ty không được để trống!", "", MessageBoxButtons.OK);
                    txtWebsiteCT.Focus();
                    return;
                }
                if (txtEmail.Text.Trim() == "")
                {
                    MessageBox.Show("Email công ty không được để trống!", "", MessageBoxButtons.OK);
                    txtEmail.Focus();
                    return;
                }
                if (txtSoLuongCP.Text.Trim() == "")
                {
                    MessageBox.Show("Số lượng cổ phiếu không được để trống!", "", MessageBoxButtons.OK);
                    txtSoLuongCP.Focus();
                    return;
                }
                if (UserSub.Instance.suaCP(coPhieu))
                {
                    MessageBox.Show("Không thành công");
                    btnXoaCP.Enabled = true;
                    btnThemCP.Enabled = true;
                    btnThoatCP.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Sửa thành công");
                    btnXoaCP.Enabled = true;
                    btnThemCP.Enabled = true;
                    btnThoatCP.Enabled = true;
                }

            }
            loadCoPhieu();
        }

        private void btnHuyCP_Click(object sender, EventArgs e)
        {
            gbCoPhieu.Enabled = false;
            btnXoaCP.Enabled = true;
            btnSuaCP.Enabled = true;
            btnThemCP.Enabled = true;
            btnThoatCP.Enabled = true;
        }

        private void btnThoatCP_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dgvCoPhieu_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            gbCoPhieu.Enabled = false;
            DataGridViewRow data = dgvCoPhieu.CurrentRow;
            txtMaCP.Text = data.Cells["MaCP"].Value.ToString().Trim();
            txtTenCP.Text = data.Cells["TenCP"].Value.ToString().Trim();
            txtDiaChiCT.Text = data.Cells["DiaChiCP"].Value.ToString().Trim();
            txtSDTCT.Text = data.Cells["SDTCP"].Value.ToString().Trim();
            txtFaxCT.Text = data.Cells["Fax"].Value.ToString().Trim();
            txtWebsiteCT.Text = data.Cells["Website"].Value.ToString().Trim();
            txtEmail.Text = data.Cells["Email"].Value.ToString().Trim();
            txtSoLuongCP.Text = data.Cells["SoLuongCP"].Value.ToString().Trim();
        }
        public void loadGiaCoPhieu()
        {
            GiaCoPhieu giaCoPhieu = new GiaCoPhieu();
            UserSub.Instance.loadGiaCP(dgvGiaCP, giaCoPhieu);
            gbGiaCP.Enabled = false;
        }

        private void dgvCapNhat_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            gbQuyDinh.Enabled = false;
            DataGridViewRow data = dgvCapNhat.CurrentRow;
            txtMaSan.Text = data.Cells["MaSGD"].Value.ToString().Trim();
            dtpNgayGio.Value = (DateTime)data.Cells["Ngay"].Value;
            cmbQuyDinh.Text = data.Cells["MoTaQuyDinh"].Value.ToString().Trim();
            txtGiaQuyDinh.Text = data.Cells["GiaQuyDinh"].Value.ToString().Trim();
        }

        private void btnThemQuyDinh_Click(object sender, EventArgs e)
        {
            gbQuyDinh.Enabled = true;
            txtMaSan.Enabled = false;
            btnSuaQuyDinh.Enabled = false;
            cmbQuyDinh.Enabled = true;
            txtGiaQuyDinh.Enabled = true;
            dtpNgayGio.Enabled = true;
            txtGiaQuyDinh.Clear();
            check = 0;
        }

        private void btnSuaQuyDinh_Click(object sender, EventArgs e)
        {
            gbQuyDinh.Enabled = true;
            btnThemQuyDinh.Enabled = false;
            txtMaSan.Enabled = false;
            cmbQuyDinh.Enabled = false;
            dtpNgayGio.Enabled = false;
            QuyDinh quyDinh = new QuyDinh();
            DataGridViewRow data = dgvCapNhat.CurrentRow;
            txtMaSan.Text = data.Cells["MaSGD"].Value.ToString().Trim();
            dtpNgayGio.Value = (DateTime)data.Cells["Ngay"].Value;
            cmbQuyDinh.Text = data.Cells["MoTaQuyDinh"].Value.ToString().Trim();
            txtGiaQuyDinh.Text = data.Cells["GiaQuyDinh"].Value.ToString().Trim();
            check = 1;
        }

        private void btnXacNhanQD_Click(object sender, EventArgs e)
        {
            QuyDinh quyDinh = new QuyDinh();
            quyDinh.MaSGD = Program.Coso = "HNX";
            quyDinh.Ngay = dtpNgayGio.Value;
            quyDinh.MoTaQuyDinh = cmbQuyDinh.Text;
            quyDinh.GiaQuyDinh = Double.Parse(txtGiaQuyDinh.Text);

            if (check == 0)
            {
                if (txtGiaQuyDinh.Text.Trim() == "")
                {
                    MessageBox.Show("Giá quy định không được để trống!", "", MessageBoxButtons.OK);
                    txtGiaQuyDinh.Focus();
                    return;
                }
                if (UserSub.Instance.themQD(dgvCapNhat, quyDinh))
                {
                    MessageBox.Show("Thêm thành công");
                    btnSuaQuyDinh.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Không thành công");
                    btnSuaQuyDinh.Enabled = true;
                }
            }
            if (check == 1)
            {
                if (txtGiaQuyDinh.Text.Trim() == "")
                {
                    MessageBox.Show("Giá quy định không được để trống!", "", MessageBoxButtons.OK);
                    txtGiaQuyDinh.Focus();
                    return;
                }
                if (UserSub.Instance.suaQD(quyDinh))
                {
                    MessageBox.Show("Không thành công");
                    btnThemQuyDinh.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Thêm thành công");
                    btnThemQuyDinh.Enabled = true;
                }
            }
            loadCapNhat();
        }

        private void dgvGiaCP_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            gbGiaCP.Enabled = false;
            DataGridViewRow data = dgvGiaCP.CurrentRow;
            cmbCP.Text = data.Cells["MaCP1"].Value.ToString().Trim();
            dtpNgay1.Value = (DateTime)data.Cells["NgayGio"].Value;
            txtGiaTran.Text = data.Cells["GiaTran"].Value.ToString().Trim();
            txtGiaThamChieu.Text = data.Cells["GiaThamChieu"].Value.ToString().Trim();
            txtGiaSan.Text = data.Cells["GiaSan"].Value.ToString().Trim();
            txtGiaDongCua.Text = data.Cells["GiaDongCua"].Value.ToString().Trim();
        }

        private void btnThemGia_Click(object sender, EventArgs e)
        {
            gbGiaCP.Enabled = true;
            cmbCP.Enabled = true;
            dtpNgay1.Enabled = true;
            btnSuaCP.Enabled = false;
            txtGiaTran.Clear();
            txtGiaThamChieu.Clear();
            txtGiaSan.Clear();
            txtGiaDongCua.Clear();
            check = 0;
        }

        private void btnSuaGia_Click(object sender, EventArgs e)
        {
            cmbCP.Enabled = false;
            dtpNgay1.Enabled = false;
            gbGiaCP.Enabled = true;
            GiaCoPhieu giaCoPhieu = new GiaCoPhieu();
            DataGridViewRow data = dgvGiaCP.CurrentRow;
            cmbCP.Text = data.Cells["MaCP1"].Value.ToString().Trim();
            dtpNgay1.Value = (DateTime)data.Cells["NgayGio"].Value;
            txtGiaTran.Text = data.Cells["GiaTran"].Value.ToString().Trim();
            txtGiaThamChieu.Text = data.Cells["GiaThamChieu"].Value.ToString().Trim();
            txtGiaSan.Text = data.Cells["GiaSan"].Value.ToString().Trim();
            txtGiaDongCua.Text = data.Cells["GiaDongCua"].Value.ToString().Trim();
            check = 1;
        }

        private void btnXacNhanGia_Click(object sender, EventArgs e)
        {
            GiaCoPhieu giaCoPhieu = new GiaCoPhieu();
            giaCoPhieu.MaCP = int.Parse(cmbCP.Text);
            giaCoPhieu.Ngay = dtpNgay1.Value;
            giaCoPhieu.GiaTran = Double.Parse(txtGiaTran.Text);
            giaCoPhieu.GiaThamChieu = Double.Parse(txtGiaThamChieu.Text);
            giaCoPhieu.GiaSan = Double.Parse(txtGiaSan.Text);
            giaCoPhieu.GiaDongCua = Double.Parse(txtGiaDongCua.Text);

            if (check == 0)
            {
                if (txtGiaTran.Text.Trim() == "")
                {
                    MessageBox.Show("Giá trần không được để trống!", "", MessageBoxButtons.OK);
                    txtGiaTran.Focus();
                    return;
                }
                if (txtGiaThamChieu.Text.Trim() == "")
                {
                    MessageBox.Show("Giá tham chiếu không được để trống!", "", MessageBoxButtons.OK);
                    txtGiaThamChieu.Focus();
                    return;
                }
                if (txtGiaSan.Text.Trim() == "")
                {
                    MessageBox.Show("Giá sàn không được để trống!", "", MessageBoxButtons.OK);
                    txtGiaSan.Focus();
                    return;
                }
                if (txtGiaDongCua.Text.Trim() == "")
                {
                    MessageBox.Show("Giá đóng cửa không được để trống!", "", MessageBoxButtons.OK);
                    txtGiaDongCua.Focus();
                    return;
                }
                if (UserSub.Instance.themGiaCP(dgvGiaCP, giaCoPhieu))
                {
                    MessageBox.Show("Thêm thành công");
                    btnSuaGia.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Không thành công");
                    btnSuaGia.Enabled = true;
                }
            }
            if (check == 1)
            {
                if (txtGiaTran.Text.Trim() == "")
                {
                    MessageBox.Show("Giá trần không được để trống!", "", MessageBoxButtons.OK);
                    txtGiaTran.Focus();
                    return;
                }
                if (txtGiaThamChieu.Text.Trim() == "")
                {
                    MessageBox.Show("Giá tham chiếu không được để trống!", "", MessageBoxButtons.OK);
                    txtGiaThamChieu.Focus();
                    return;
                }
                if (txtGiaSan.Text.Trim() == "")
                {
                    MessageBox.Show("Giá sàn không được để trống!", "", MessageBoxButtons.OK);
                    txtGiaSan.Focus();
                    return;
                }
                if (txtGiaDongCua.Text.Trim() == "")
                {
                    MessageBox.Show("Giá đóng cửa không được để trống!", "", MessageBoxButtons.OK);
                    txtGiaDongCua.Focus();
                    return;
                }
                if (UserSub.Instance.suaGiaCP(giaCoPhieu))
                {
                    MessageBox.Show("Không thành công");
                    btnThemGia.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Sửa thành công");
                    btnThemGia.Enabled = true;
                }
            }
            loadGiaCoPhieu();
        }
        public void loadCP()
        {
            string query = "select * from COPHIEU";
            cmbCP.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            cmbCP.DisplayMember = "MaCP";
            cmbCP.ValueMember = "MaCP";
        }

        private void btnHuyQD_Click(object sender, EventArgs e)
        {
            btnThemQuyDinh.Enabled = true;
            btnSuaQuyDinh.Enabled = true;
            gbQuyDinh.Enabled = false;
        }

        private void btnHuyGiaCP_Click(object sender, EventArgs e)
        {
            btnThemGia.Enabled = true;
            btnSuaGia.Enabled = true;
            gbGiaCP.Enabled = false;
        }
        private void btnRefreshGiaCP_Click(object sender, EventArgs e)
        {
            loadCP();
        }
        private void loadLenhDat()
        {
            LenhDat lenhDat = new LenhDat();
            UserSub.Instance.loadLenhDat(dgvLenhDat, lenhDat);
            for (int i = 0; i < dgvLenhDat.Rows.Count - 1; i++)
            {
                for (int j = 0; j < dgvKhopLenh.Rows.Count - 1; j++)
                {
                    if (dgvLenhDat.Rows[i].Cells["MaLD"].Value == dgvKhopLenh.Rows[j].Cells["MaLD1"].Value || dgvLenhDat.Rows[i].Cells["MaLD"].Value == dgvKhopLenh.Rows[j].Cells["MaKL"].Value)
                    {
                        dgvLenhDat.Rows[i].Cells["SoLuongDat"].Value = (int.Parse(dgvLenhDat.Rows[i].Cells["SoLuongDat"].Value.ToString()) + int.Parse(dgvKhopLenh.Rows[j].Cells["SoLuongKhop"].Value.ToString()));
                        MessageBox.Show(dgvLenhDat.Rows[i].Cells["SoLuongDat"].Value.ToString());
                    }
                }
            }
        }
        private void loadKhopLenh()
        {
            KhopLenh khopLenh = new KhopLenh();
            UserSub.Instance.loadKhopLenh(dgvKhopLenh, khopLenh);
        }

        private void btnThoatLG_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            loadLenhDat();
            loadKhopLenh();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}