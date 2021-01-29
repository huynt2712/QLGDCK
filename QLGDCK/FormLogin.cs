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
    public partial class FormLogin : DevExpress.XtraEditors.XtraForm
    {
        public FormLogin()
        {
            InitializeComponent();
        }

        private void FormLogin_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'qLGDCKDataSet.V_DS_PHANMANH' table. You can move, or remove it, as needed.
            Program.servername = @"HUY-COMPUTER";
            Program.mlogin = "sa";
            Program.password = "1";
            string query = "select * From V_DS_PHANMANH";
            cmbCoSo.DataSource = DataProvider.Instance.ExecuteQuery(query, CommandType.Text);
            cmbCoSo.DisplayMember = "TENCN";
            cmbCoSo.ValueMember = "TENSERVER";
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            Program.servername = cmbCoSo.SelectedValue.ToString();
            Program.mlogin = txtTenDangNhap.Text;
            Program.password = txtMatKhau.Text;
            Program.Coso = cmbCoSo.Text;
            if (DataProvider.Instance.KetNoi() == 1)
            {
                DataTable dataTable = new DataTable();
                try
                {
                    string query = "";
                    object[] para = new object[] { "@TENLOGIN" };
                    object[] para1 = new object[] { Program.mlogin };
                    if (cmbCoSo.Text == "Sàn giao dịch HNX")
                    {
                        query = "SP_DANGNHAPSAN";
                    }
                    else
                    {
                        query = "SP_DANGNHAP";
                    }

                    dataTable = DataProvider.Instance.ExecuteQuery(query, CommandType.StoredProcedure, para, para1);

                    Program.username = dataTable.Rows[0][0].ToString();
                    Program.mHoten = dataTable.Rows[0][1].ToString();
                    Program.mGroup = dataTable.Rows[0][2].ToString();
                    if (string.Compare(dataTable.Rows[0][2].ToString(), "SANGIAODICH") == 0)
                    {
                        FormSoGiaoDich f = new FormSoGiaoDich();
                        f.FormClosed += F_FormClosed;


                        f.StartPosition = FormStartPosition.CenterScreen;

                        f.Show();
                        this.Visible = false;
                    }
                    else
                    if (string.Compare(dataTable.Rows[0][2].ToString(), "CONGTY") == 0)
                    {
                        FormCongTy f = new FormCongTy();
                        f.FormClosed += F_FormClosed;


                        f.StartPosition = FormStartPosition.CenterScreen;

                        f.Show();
                        this.Visible = false;
                    }
                    else if (string.Compare(dataTable.Rows[0][2].ToString(), "NHADAUTU") == 0)
                    {
                        FormNhaDauTu f = new FormNhaDauTu();
                        f.FormClosed += F_FormClosed;


                        f.StartPosition = FormStartPosition.CenterScreen;

                        f.Show();
                        this.Visible = false;
                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xảy ra: " + ex.Message);
                }

            }
            //this.Hide();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void F_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Hide();
        }

        private void FormLogin_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }
    }
}