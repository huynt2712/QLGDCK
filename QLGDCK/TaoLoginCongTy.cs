using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLGDCK
{
    class TaoLoginCongTy
    {
        private string lgName;
        private string pass;
        private string username;
        private string role;


        public string LgName { get => lgName; set => lgName = value; }
        public string Pass { get => pass; set => pass = value; }
        public string Username { get => username; set => username = value; }
        public string Role { get => role; set => role = value; }

        public TaoLoginCongTy()
        {
            lgName = "";
            pass = "";
            username = "";
            role = "";
        }
    }
}
