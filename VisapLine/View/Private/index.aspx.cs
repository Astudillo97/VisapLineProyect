using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;

namespace VisapLine.View.Private
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //[WebMethod]
        //public static string GetChart()
        //{
        //    UsuarioL usu = new UsuarioL();
        //    DataTable dtTable = usu.contadordefacturas();
        //    StringBuilder sb = new StringBuilder();
        //    sb.Append("[");
        //    foreach (DataRow dtRow in dtTable.Rows)
        //    {
        //        sb.Append("{");
        //        System.Threading.Thread.Sleep(50);
        //        string color = String.Format("#{0:X6}", new Random().Next(0x1000000));
        //        sb.Append(string.Format("text :'{0}', value:{1}, color: '{2}'", dtRow[1].ToString(), dtRow[0].ToString(), color));
        //        sb.Append("},");
        //    }
        //    sb = sb.Remove(sb.Length - 1, 1);
        //    sb.Append("]");

        //    return sb.ToString();
        //}
    }
}
