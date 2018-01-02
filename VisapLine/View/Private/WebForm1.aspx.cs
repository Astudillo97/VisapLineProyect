using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Exeption;

namespace VisapLine.View.Private
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            string ent1;
            string ent2;
            string ent3;
            try
            {
                ent1 = Validar.validarlleno(_1.Value);
                ent2 = Validar.validarnumero(_2.Value);
                ent3 = Validar.validarlleno(Validar.validarnumero(_3.Value));
                Alerta.CssClass = "alert alert-success";
                Alerta.Visible = true;
                textError.InnerHtml = ent1;
            }
            catch (Exception ex)
            {
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                textError.InnerHtml = ex.Message;
            }
        }

        protected void Unnamed_ServerClick1(object sender, EventArgs e)
        {

        }

        protected void Unnamed_ServerClick2(object sender, EventArgs e)
        {

        }

        protected void Unnamed_ServerClick3(object sender, EventArgs e)
        {

        }

        protected void Unnamed_ServerClick4(object sender, EventArgs e)
        {

        }
    }
}