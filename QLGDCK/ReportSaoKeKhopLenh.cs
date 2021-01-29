using DevExpress.XtraReports.UI;
using System;
using System.Collections;
using System.ComponentModel;
using System.Drawing;

namespace QLGDCK
{
    public partial class ReportSaoKeKhopLenh : DevExpress.XtraReports.UI.XtraReport
    {
        public ReportSaoKeKhopLenh(string MaTK,DateTime TuNgay,DateTime DenNgay)
        {
            InitializeComponent();
            qlgdckDataSet1.EnforceConstraints = false;
            this.saokekhoplenhTableAdapter1.Fill(qlgdckDataSet1.SAOKEKHOPLENH, MaTK, TuNgay, DenNgay);
        }

    }
}
