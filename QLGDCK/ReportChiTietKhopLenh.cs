using DevExpress.XtraReports.UI;
using System;
using System.Collections;
using System.ComponentModel;
using System.Drawing;

namespace QLGDCK
{
    public partial class ReportChiTietKhopLenh : DevExpress.XtraReports.UI.XtraReport
    {
        public ReportChiTietKhopLenh(int MaCP,string MaTK)
        {
            InitializeComponent();
            qlgdckDataSet1.EnforceConstraints = false;
            this.chitietkhoplenhTableAdapter1.Fill(qlgdckDataSet1.CHITIETKHOPLENH, MaCP, MaTK);
        }

    }
}
