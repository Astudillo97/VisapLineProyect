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

using VisapLine.Exeption;

namespace VisapLine.View.Private
{
    public partial class index : System.Web.UI.Page
    {
        Contrato cont = new Contrato();
        Permisos per = new Permisos();
        Servicios ser = new Servicios();
        Incidencias inc = new Incidencias();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    Labeltime.Text = DateTime.Now.ToLongDateString();
                    DataTable tercer = (DataTable)Session["roles"];
                    string rol = tercer.Rows[0][7].ToString();

                    if (rol == "7")
                    {
                        administrador.Visible = true;
                        emple.Visible = false;
                    }
                    else
                    {
                        administrador.Visible = false;
                        emple.Visible = true;

                    }

                    DataRow cmescon = Validar.Consulta(cont.ConsultarContratosmes()).Rows[0];

                    Labelregtro.Text = cmescon["num"].ToString();
                    DataRow useractivos = Validar.Consulta(cont.Consultarusarioactivos()).Rows[0];
                    Label3.Text = useractivos["num"].ToString();
                    Repeater1.DataSource = Validar.Consulta(cont.Consultarestodoscontratos());
                    Repeater1.DataBind();
                    Repeater2.DataSource = Validar.Consulta(ser.consultarestadoservicio());
                    Repeater2.DataBind();
                    DataRow inciabierta = Validar.Consulta(inc.ConsultarIncidenciasidser()).Rows[0];
                    Label12.Text = inciabierta["num"].ToString();
                }

            }
            catch (Exception)
            {

            }

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
