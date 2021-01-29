using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLGDCK
{
    class DataProvider
    {
        private static DataProvider instance;

        public static DataProvider Instance
        {
            get
            {
                if (instance == null)
                    instance = new DataProvider();
                return instance;
            }

        }
        public int KetNoi()
        {


            if (Program.conn != null && Program.conn.State == ConnectionState.Open)
                Program.conn.Close();
            try
            {
                Program.connstr = "Data Source=" + Program.servername + ";Initial Catalog=" +
                Program.database + ";User ID=" +
                Program.mlogin + ";password=" + Program.password;
                Program.conn.ConnectionString = Program.connstr;
                Program.conn.Open();
                return 1;
            }

            catch (Exception e)
            {
                MessageBox.Show("Lỗi kết nối cơ sở dữ liệu.\nBạn xem lại user name và password.\n " + e.Message, "", MessageBoxButtons.OK);
                return 0;
            }

        }
        public DataTable ExecuteQuery(string query, CommandType type, object[] para = null, object[] para1 = null)
        {
            KetNoi();
            DataTable data = new DataTable();

            SqlCommand cm = new SqlCommand(query, Program.conn)
            {
                CommandType = type
            };
            if (para1 != null)
            {
                for (int i = 0; i < para1.Length; i++)
                {
                    cm.Parameters.AddWithValue(para[i].ToString(), para1[i]);
                }
            }

            SqlDataAdapter ap = new SqlDataAdapter(cm);
            ap.Fill(data);
            Program.conn.Close();
            return data;
        }
        public int ExecuteNonQuery(string query, CommandType type, object[] para = null, object[] para1 = null)
        {
            KetNoi();
            int accpect = 0;

            try
            {
                DataTable data = new DataTable();

                SqlCommand cm = new SqlCommand(query, Program.conn);

                cm.CommandType = type;
                if (para1 != null)
                {
                    for (int i = 0; i < para1.Length; i++)
                    {
                        cm.Parameters.AddWithValue(para[i].ToString(), para1[i]);
                    }
                }
                accpect = cm.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
                accpect = -100;
            }

            Program.conn.Close();
            return accpect;
        }

        public object ExecuteScalar(string query, CommandType type, object[] para = null, object[] para1 = null)
        {
            KetNoi();
            object accpect = 0;
            SqlCommand cm = new SqlCommand(query, Program.conn);

            cm.CommandType = type;
            if (para1 != null)
            {
                for (int i = 0; i < para1.Length; i++)
                {
                    cm.Parameters.AddWithValue(para[i].ToString(), para1[i]);
                }
            }
            accpect = cm.ExecuteScalar();
            Program.conn.Close();
            return accpect;
        }
        public bool Execute(string query)
        {
            KetNoi();
            DataTable data = new DataTable();

            SqlCommand cm = new SqlCommand(query, Program.conn);
            SqlDataAdapter ap = new SqlDataAdapter(cm);
            ap.Fill(data);
            if (Int32.Parse(data.Rows[0][0].ToString()) > 0)
                return false;

            return true;
        }
    }
}
