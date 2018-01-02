using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;

namespace VisapLine.View.Login
{
    public partial class login : System.Web.UI.Page
    {
        UsuarioL usua = new UsuarioL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login(object sender, EventArgs e)
        {
            usua.usuauser = user_.Value;
            usua.usuapassw = pas_.Value;
            try
            {
                DataRow data = Validar.Login(usua.ValidarUsuario(usua));
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }
    }
}