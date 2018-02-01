using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VisapLine.View.Private
{
    public partial class GestPagos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            factservicio.Focus();
            string codig = Convert.ToString(Request.QueryString["codigo"]);
            if (codig != null)
            {
                cod.InnerHtml = codig;
            }
            Page.SetFocus(factservicio);
        }

        protected void btnConsultar(object sender, EventArgs e)
        {
            string dat = factservicio.Text;
            int cont = 1;
            string idterc = "";
            string codfactura = "";
            char[] values = dat.ToCharArray();
            for (int i = 0; i < values.Length; i++)
            {
                if (values[i].Equals('-') && cont==1)
                {
                    cont++;
                    idterc = dat.Substring(0, i);
                }
                else if(values[i].Equals('-') && cont == 2)
                {
                    codfactura = dat.Substring(i+1);
                    break;
                }
            }
        }

        protected void btnRegistrarpago(object sender, EventArgs e)
        {

        }
    }
}