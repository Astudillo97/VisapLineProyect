using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;

namespace VisapLine.View.Private
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Persona"] != null && Session["Usuario"] != null)
            //{
            //    string sat = "";
            //    switch (sat)
            //    {
            //        case "1":
            //            Response.Redirect("Error.aspx?error=Error: El modulo de clientes");
            //            break;
            //        case "2":
                        
            //            break;
            //        case "3":
                       
            //            break;
            //        default:
            //            Response.Redirect("Error.aspx?error=Tipo de Usuario no Incluido");
            //            break;
            //    }
            //}
            //else
            //{
            //    Response.Redirect("../../visapline/Private/login.aspx");
            //}
        }

        protected void Salir(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/View/Private/login.aspx");
        }
    }
}