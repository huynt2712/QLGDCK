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
using DevExpress.Utils.Extensions;
using DevExpress.XtraReports.UI;
using System.Globalization;

namespace QLGDCK
{
    public partial class FormNhaDauTu : DevExpress.XtraEditors.XtraForm
    {
        public FormNhaDauTu()
        {
            InitializeComponent();
        }

        private void FormNhaDauTu_Load(object sender, EventArgs e)
        {
            HienThi();
            loadTraCuuCP();
            loadTKNH();
            loadTraCuuCP1();
            loadTKNH1();
            loadTracuuTT();
            loadCPBaoCao();
        }

        private void HienThi()
        {
            LBMa.Text = Program.username;
            LBTen.Text = UserMain.Instance.layTenNDT(Program.username);
            LBQuyen.Text = Program.mGroup;
            LBCongty.Text = Program.Coso;
        }

        private void FormNhaDauTu_FormClosing(object sender, FormClosingEventArgs e)
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

        private void btnThoatDLM_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        public void loadTraCuuCP()
        {
            string query = "select * from COPHIEU";
            cmbMaCP.ValueMember = "TenCP";
            cmbMaCP.DisplayMember = "MaCP";
            cmbMaCP.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            txtMaDL.Text = SinhMaLenhDat();
            txtMaSGD.Enabled = false;
            txtMaDL.Enabled = false;
            txtTenLGD.Enabled = false;
            txtMaCTCK.Enabled = false;
            txtSoDu.Enabled = false;
            txtDLMua.Enabled = false;
            txtGiaTran.Enabled = false;
            txtGiaThamChieu.Enabled = false;
            txtGiaSan.Enabled = false;
            txtTenCP.Enabled = false;
            txtPhiGD.Enabled = false;
            txtTongTien.Enabled = false;
            txtMaCTCK.Text = Program.Coso == "Công ty chứng khoán số 1" ? "010" : "020";
        }
        public void loadTraCuuNgayCP()
        {
            string query = "select NgayGio from LICHSUGIA where MaCP ='" + int.Parse(cmbMaCP.Text.ToString()) + "' order by NgayGio DESC ";
            cmbNgayCP.DisplayMember = "NgayGio";
            cmbNgayCP.ValueMember = "NgayGio";
            cmbNgayCP.FormatString = "yyyy-MM-dd";
            cmbNgayCP.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        private void cmbMaCP_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbMaCP.ValueMember != "")
            {
                loadTraCuuNgayCP();
                txtTenCP.Text = cmbMaCP.SelectedValue.ToString();
            }
        }

        private void cmbNgayCP_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable data = new DataTable();
            data = UserMain.Instance.thongtinCP(int.Parse(cmbMaCP.Text.ToString()), DateTime.Parse(cmbNgayCP.SelectedValue.ToString()));
            foreach (DataRow item in data.Rows)
            {
                txtGiaTran.Text = (float.Parse(item.ItemArray[2].ToString()) * 1000).ToString("#,#", CultureInfo.InvariantCulture);
                txtGiaThamChieu.Text = (float.Parse(item.ItemArray[3].ToString()) * 1000).ToString("#,#", CultureInfo.InvariantCulture);
                txtGiaSan.Text = (float.Parse(item.ItemArray[4].ToString()) * 1000).ToString("#,#", CultureInfo.InvariantCulture);
            }
        }
        public string SinhMaLenhDat()
        {
            string query = "SELECT * FROM LENHDAT";
            DataTable dt = new DataTable();
            dt = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            int code = 0;
            if (dt.Rows.Count == 0)
            {
                code = 1;
            }
            if (dt.Rows.Count == 1 && int.Parse(dt.Rows[0]["MaLD"].ToString().Remove(dt.Rows[0]["MaLD"].ToString().Length - 3, 3)) == 1)
            {
                code = 2;
            }
            else if (dt.Rows.Count == 1 && int.Parse(dt.Rows[0]["MaLD"].ToString().Remove(dt.Rows[0]["MaLD"].ToString().Length - 3, 3)) > 1)
            {
                code = 1;
            }
            else
            {
                for (int i = 0; i < dt.Rows.Count - 1; i++)
                {
                    code = int.Parse(dt.Rows[i + 1]["MaLD"].ToString().Remove(dt.Rows[i + 1]["MaLD"].ToString().Length - 3, 3)) + 1;
                }
            }
            if (Program.Coso == "Công ty chứng khoán số 1")
                return code + "010";
            else return code + "020";
        }
        public void loadTKNH()
        {
            string query = "select MaTKNH,SoDuTKNH from TAIKHOANNGANHANG where MaTK = '" + Program.username + "'";
            cmbTKNH.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            cmbTKNH.DisplayMember = "MaTKNH";
            cmbTKNH.ValueMember = "SoDuTKNH";
            txtSoDu.Text = cmbTKNH.SelectedValue.ToString();
        }
        private void btnDL_Click(object sender, EventArgs e)
        {
            if (rbLenhLO.Checked == false && rbLenhMP.Checked == false)
            {
                MessageBox.Show("Chưa chọn loại lệnh muốn đặt", "", MessageBoxButtons.OK);
                return;
            }
            if (txtSoLuongDat.Text.Trim() == "")
            {
                MessageBox.Show("Số lượng đặt mua không được để trống", "", MessageBoxButtons.OK);
                txtSoLuongDat.Focus();
                return;
            }
            if (txtGiaDat.Text.Trim() == "")
            {
                MessageBox.Show("Giá đặt mua không được để trống", "", MessageBoxButtons.OK);
                txtGiaDat.Focus();
                return;
            }
            string query = "select MKDatLenh from NHADAUTU where MaTK='" + Program.username + "'";
            DataTable dt = new DataTable();
            dt = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            LenhDat lenhDat = new LenhDat();
            lenhDat.MaLD = int.Parse(txtMaDL.Text);
            lenhDat.MaCP = int.Parse(cmbMaCP.Text);
            lenhDat.NgayGio = dtpNgayDat.Value;
            lenhDat.MaLGD = txtDLMua.Text;
            lenhDat.SoLuongDat = int.Parse(txtSoLuongDat.Text);
            lenhDat.GiaDat = Double.Parse(txtGiaDat.Text);
            if (rbLenhLO.Checked == true)
            {
                lenhDat.MaLL = "LO";
            }
            else if (rbLenhMP.Checked == true)
            {
                lenhDat.MaLL = "MP";
            }
            txtTongTien.Text = (Double.Parse(txtPhiGD.Text) / 100 * Double.Parse(txtGiaDat.Text) * Double.Parse(txtSoLuongDat.Text) + Double.Parse(txtGiaDat.Text) * Double.Parse(txtSoLuongDat.Text)).ToString();
            lenhDat.MaTKNH = cmbTKNH.Text;
            lenhDat.MaCTCK = Program.Coso == "Công ty chứng khoán số 1" ? "010" : "020";
            if (txtMKDL.Text == dt.Rows[0]["MKDatLenh"].ToString())
            {
                if (UserSub.Instance.themLenhDat(lenhDat))
                {
                    MessageBox.Show("Thêm thành công");
                }
                else
                {
                    MessageBox.Show("Không thành công");
                }
            }
            else
            {
                MessageBox.Show("Sai mật khẩu vui lòng nhập lại", "", MessageBoxButtons.OK);
                txtMKDL.Focus();
                return;
            }
            loadTraCuuCP();
            loadTracuuTT();
            loadTKNH();
            loadTKNH1();
        }

        private void cmbTKNH_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTKNH.ValueMember != "")
            {
                txtSoDu.Text = cmbTKNH.SelectedValue.ToString();
            }
        }

        //private void btnRefresh_Click(object sender, EventArgs e)
        //{
        //    loadTraCuuCP();
        //    txtSoLuongDat.Clear();
        //    txtGiaDat.Clear();
        //    txtPhiGD.Clear();
        //    txtTongTien.Clear();
        //    txtMKDL.Clear();
        //}

        private void dtpNgayDat_ValueChanged(object sender, EventArgs e)
        {
            DataTable data = new DataTable();
            data = UserMain.Instance.thongtinPhi(txtMaCTCK.Text, dtpNgayDat.Value, txtDLMua.Text);
            foreach (DataRow item in data.Rows)
            {
                txtPhiGD.Text = item.ItemArray[0].ToString().Trim();
            }
        }

        private void btnThanhTien_Click(object sender, EventArgs e)
        {
            txtTongTien.Text = (Double.Parse(txtPhiGD.Text) / 100 * Double.Parse(txtGiaDat.Text) * Double.Parse(txtSoLuongDat.Text) + Double.Parse(txtGiaDat.Text) * Double.Parse(txtSoLuongDat.Text)).ToString();
        }

        public void loadTraCuuCP1()
        {
            string query = "select * from COPHIEU";
            cmbMaCPBan.ValueMember = "TenCP";
            cmbMaCPBan.DisplayMember = "MaCP";
            cmbMaCPBan.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            txtMaDLBan.Text = SinhMaLenhDat();
            txtMaSGDBan.Enabled = false;
            txtMaDLBan.Enabled = false;
            txtTenLGDBan.Enabled = false;
            txtMaCTCKBan.Enabled = false;
            txtSoDuBan.Enabled = false;
            txtDLBan.Enabled = false;
            txtGiaTranBan.Enabled = false;
            txtGiaThamChieuBan.Enabled = false;
            txtGiaSanBan.Enabled = false;
            txtTenCPBan.Enabled = false;
            txtPhiGDBan.Enabled = false;
            txtTongTienBan.Enabled = false;
            txtMaCTCKBan.Text = Program.Coso == "Công ty chứng khoán số 1" ? "010" : "020";
        }
        public void loadTraCuuNgayCP1()
        {
            string query = "select NgayGio from LICHSUGIA where MaCP ='" + int.Parse(cmbMaCPBan.Text.ToString()) + "' order by NgayGio DESC ";
            cmbNgayCPBan.DisplayMember = "NgayGio";
            cmbNgayCPBan.ValueMember = "NgayGio";
            cmbNgayCPBan.FormatString = "yyyy-MM-dd";
            cmbNgayCPBan.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
        }
        private void cmbMaCPBan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbMaCPBan.ValueMember != "")
            {
                loadTraCuuNgayCP1();
                txtTenCPBan.Text = cmbMaCPBan.SelectedValue.ToString();
            }
        }

        private void cmbNgayCPBan_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable data = new DataTable();
            data = UserMain.Instance.thongtinCP(int.Parse(cmbMaCPBan.Text.ToString()), DateTime.Parse(cmbNgayCPBan.SelectedValue.ToString()));
            foreach (DataRow item in data.Rows)
            {
                txtGiaTranBan.Text = (float.Parse(item.ItemArray[2].ToString()) * 1000).ToString("#,#", CultureInfo.InvariantCulture);
                txtGiaThamChieuBan.Text = (float.Parse(item.ItemArray[3].ToString()) * 1000).ToString("#,#", CultureInfo.InvariantCulture);
                txtGiaSanBan.Text = (float.Parse(item.ItemArray[4].ToString()) * 1000).ToString("#,#", CultureInfo.InvariantCulture);
            }
        }
        public void loadTKNH1()
        {
            string query = "select MaTKNH,SoDuTKNH from TAIKHOANNGANHANG where MaTK = '" + Program.username + "'";
            cmbTKNHBan.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            cmbTKNHBan.DisplayMember = "MaTKNH";
            cmbTKNHBan.ValueMember = "SoDuTKNH";
            txtSoDuBan.Text = cmbTKNHBan.SelectedValue.ToString();
        }

        private void cmbTKNHBan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTKNHBan.ValueMember != "")
            {
                txtSoDuBan.Text = cmbTKNHBan.SelectedValue.ToString();
            }
        }

        private void dtpNgayDatBan_ValueChanged(object sender, EventArgs e)
        {
            DataTable data = new DataTable();
            data = UserMain.Instance.thongtinPhi(txtMaCTCKBan.Text, dtpNgayDatBan.Value, txtDLBan.Text);
            foreach (DataRow item in data.Rows)
            {
                txtPhiGDBan.Text = item.ItemArray[0].ToString().Trim();
            }
        }

        private void btnThanhtienBan_Click(object sender, EventArgs e)
        {
            txtTongTienBan.Text = (Double.Parse(txtPhiGDBan.Text) / 100 * Double.Parse(txtGiaDatBan.Text) * Double.Parse(txtSoLuongDatBan.Text) + Double.Parse(txtGiaDatBan.Text) * Double.Parse(txtSoLuongDatBan.Text)).ToString();
        }

        //private void btnRefreshBan_Click(object sender, EventArgs e)
        //{
        //    loadTraCuuCP1();
        //    txtSoLuongDatBan.Clear();
        //    txtGiaDatBan.Clear();
        //    txtPhiGDBan.Clear();
        //    txtTongTienBan.Clear();
        //    txtMKDLBan.Clear();
        //}

        private void btnDLBan_Click(object sender, EventArgs e)
        {
            if (rbLenhLOBan.Checked == false && rbLenhMPBan.Checked == false)
            {
                MessageBox.Show("Chưa chọn loại lệnh muốn đặt", "", MessageBoxButtons.OK);
                return;
            }
            if (txtSoLuongDatBan.Text.Trim() == "")
            {
                MessageBox.Show("Số lượng đặt mua không được để trống", "", MessageBoxButtons.OK);
                txtSoLuongDatBan.Focus();
                return;
            }
            if (txtGiaDatBan.Text.Trim() == "")
            {
                MessageBox.Show("Giá đặt mua không được để trống", "", MessageBoxButtons.OK);
                txtGiaDatBan.Focus();
                return;
            }
            string query = "select MKDatLenh from NHADAUTU where MaTK='" + Program.username + "'";
            DataTable dt = new DataTable();
            dt = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            LenhDat lenhDat = new LenhDat();
            lenhDat.MaLD = int.Parse(txtMaDLBan.Text);
            lenhDat.MaCP = int.Parse(cmbMaCPBan.Text);
            lenhDat.NgayGio = dtpNgayDatBan.Value;
            lenhDat.MaLGD = txtDLBan.Text;
            lenhDat.SoLuongDat = int.Parse(txtSoLuongDatBan.Text);
            lenhDat.GiaDat = Double.Parse(txtGiaDatBan.Text);
            if (rbLenhLOBan.Checked == true)
            {
                lenhDat.MaLL = "LO";
            }
            else if (rbLenhMPBan.Checked == true)
            {
                lenhDat.MaLL = "MP";
            }
            txtTongTienBan.Text = (Double.Parse(txtPhiGDBan.Text) / 100 * Double.Parse(txtGiaDatBan.Text) * Double.Parse(txtSoLuongDatBan.Text) + Double.Parse(txtGiaDatBan.Text) * Double.Parse(txtSoLuongDatBan.Text)).ToString();
            lenhDat.MaTKNH = cmbTKNHBan.Text;
            lenhDat.MaCTCK = Program.Coso == "Công ty chứng khoán số 1" ? "010" : "020";
            if (txtMKDLBan.Text == dt.Rows[0]["MKDatLenh"].ToString())
            {
                if (UserSub.Instance.themLenhDat(lenhDat))
                {
                    MessageBox.Show("Thêm thành công");
                }
                else
                {
                    MessageBox.Show("Không thành công");
                }
            }
            else
            {
                MessageBox.Show("Sai mật khẩu vui lòng nhập lại", "", MessageBoxButtons.OK);
                txtMKDLBan.Focus();
                return;
            }
            loadTraCuuCP1();
            loadTracuuTT();
            loadTKNH();
            loadTKNH1();
        }

        private void btnThoatBan_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void loadTracuuTT()
        {
            txtTenNDTSD.Enabled = false;
            txtMaTKNHSD.Enabled = false;
            txtSoduGD.Enabled = false;
            txtTenNHSD.Enabled = false;
            DataTable data = new DataTable();
            data = UserMain.Instance.laythongtin(Program.username);
            foreach (DataRow item in data.Rows)
            {
                txtTenNDTSD.Text = item.ItemArray[0].ToString().Trim();
                txtSoduGD.Text = item.ItemArray[3].ToString().Trim();
                txtMaTKNHSD.Text = item.ItemArray[1].ToString().Trim();
                cmbMaNH.Text = item.ItemArray[2].ToString().Trim();
                string query = "select TAIKHOANNGANHANG.MaNH,MaTKNH,TenNH from TAIKHOANNGANHANG,NGANHANG where TAIKHOANNGANHANG.MaNH = NGANHANG.MaNH and MaTK = '" + Program.username + "'";
                cmbMaNH.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
                cmbMaNH.DisplayMember = "MaNH";
                cmbMaNH.ValueMember = "TenNH";
                txtTenNHSD.Text = cmbMaNH.SelectedValue.ToString();
            }

            UserSub.Instance.laythongtinCP(dgvTraCuu, Program.username);
            for (int i = 0; i < dgvTraCuu.Rows.Count - 1; i++)
            {
                if (dgvTraCuu.Rows[i].Cells["SoLuongKhop"].Value == DBNull.Value && dgvTraCuu.Rows[i].Cells["GiaKhop"].Value == DBNull.Value)
                {
                    dgvTraCuu.Rows[i].Cells["SoLuongKhop"].Value = 0;
                    dgvTraCuu.Rows[i].Cells["GiaKhop"].Value = 0;
                }
                dgvTraCuu.Rows[i].Cells["SoLuongDat"].Value = (int.Parse(dgvTraCuu.Rows[i].Cells["SoLuongDat"].Value.ToString()) + int.Parse(dgvTraCuu.Rows[i].Cells["SoLuongKhop"].Value.ToString()));
            }
        }
        private void cmbMaNH_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable data = new DataTable();
            data = UserMain.Instance.laythongtinNH(cmbMaNH.Text, Program.username);
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
        private void btnThoatNDT_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnXemBaoCao_Click(object sender, EventArgs e)
        {
            ReportLietKeCPNDT rp = new ReportLietKeCPNDT(Program.username);
            rp.lbMa.Text = Program.username;
            rp.lbTen.Text = txtTenNDTSD.Text;
            ReportPrintTool print = new ReportPrintTool(rp);
            print.ShowPreviewDialog();
        }

        private void loadCPBaoCao()
        {
            string query = "select * from COPHIEU";
            cmbMaCPBC.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            cmbMaCPBC.DisplayMember = "MaCP";
            cmbMaCPBC.ValueMember = "TenCP";
            txtTenCPBC.Text = cmbMaCPBC.SelectedValue.ToString();
        }

        private void cmbMaCPBC_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbMaCPBC.ValueMember != "")
            {
                txtTenCPBC.Text = cmbMaCPBC.SelectedValue.ToString();
            }
        }
        private void btnBaoCaoSaoKe_Click(object sender, EventArgs e)
        {
            ReportSaoKeKhopLenh rp = new ReportSaoKeKhopLenh(Program.username, dtpTuNgay.Value, dtpDenNgay.Value);
            rp.lbMa.Text = Program.username;
            rp.lbTen.Text = LBTen.Text;
            ReportPrintTool print = new ReportPrintTool(rp);
            print.ShowPreviewDialog();
        }

        private void btnBaoCaoChiTiet_Click(object sender, EventArgs e)
        {
            ReportChiTietKhopLenh rp = new ReportChiTietKhopLenh(int.Parse(cmbMaCPBC.Text), Program.username);
            rp.lbMa.Text = Program.username;
            rp.lbTen.Text = LBTen.Text;
            ReportPrintTool print = new ReportPrintTool(rp);
            print.ShowPreviewDialog();
        }


    }
}