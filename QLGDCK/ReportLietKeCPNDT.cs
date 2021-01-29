using DevExpress.XtraReports.UI;
using System;
using System.Collections;
using System.ComponentModel;
using System.Drawing;

namespace QLGDCK
{
    public partial class ReportLietKeCPNDT : DevExpress.XtraReports.UI.XtraReport
    {
        public ReportLietKeCPNDT(string MaTK)
        {
            InitializeComponent();
            qlgdckDataSet1.EnforceConstraints = false;
            this.lIETKECPNDTTableAdapter.Fill(qlgdckDataSet1.LIETKECPNDT, MaTK);
        }

    }
}
