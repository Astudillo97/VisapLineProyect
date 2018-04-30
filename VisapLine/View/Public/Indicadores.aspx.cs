using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;

namespace VisapLine.View.Public
{
    public partial class Indicadores : System.Web.UI.Page
    {
        private Indicador ind = new Indicador();
        private DataTable datos;
        protected void Page_Load(object sender, EventArgs e)
        {
           AÑOS.DataSource =  ind.ConsultarAño();
           
            AÑOS.DataBind();
        }
      

        protected void AÑOS_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            int a;
           
            Repeater Hijo = (Repeater)e.Item.FindControl("trimestres");
            Label año = (Label)e.Item.FindControl("añoind");

            if (año.Text !="")
            {
                a = Int32.Parse(año.Text);
                Hijo.DataSource = ind.ConsultarPorAño(a);
                Hijo.DataBind();
            }
           

            // AÑOS.DataSource = datos;
            //AÑOS.DataBind();


        }

        protected void trimestres_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            Repeater nieto = (Repeater)e.Item.FindControl("trimestres");

        }
    }
}