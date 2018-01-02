using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VisapLine.DataAccess.Data
{
    interface IData
    {
        bool OperarDatos(string sql);
        DataTable ConsultarDatos(string sql);
    }
}
