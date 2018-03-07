using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;
using System.IO;
namespace VisapLine.View.Private
{
    
    public partial class gestsoportecliente : System.Web.UI.Page
    {
        Permisos per = new Permisos();
        Soportes sp = new Soportes();
        DataRow dat;
        protected void Page_Load(object sender, EventArgs e)
        {
            string valor = Convert.ToString(Request.QueryString["key"]);
            if (valor != null)
            {
                sp.contrato_idcontrato = valor;
                dat = sp.ConsultarSoportescargadosidcontrato(sp).Rows[0];


            }
            else
            {
                Response.Redirect("gestsoportecliente.aspx");
            }
        }
    }
}
