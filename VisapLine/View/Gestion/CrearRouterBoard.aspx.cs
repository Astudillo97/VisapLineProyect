using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using System.Data;
using System.Web.Services;

namespace VisapLine.View.Gestion
{
    public partial class CrearRouterBoard : System.Web.UI.Page
    {
        MK dispositivo = new MK();
        protected void Page_Load(object sender, EventArgs e)
        {

            Zonas zn = new Zonas();
            dropdownzonas.DataSource = zn.ConsultarzonasAll();
            dropdownzonas.DataTextField = "zonas";
            dropdownzonas.DataValueField = "idzonas";
            dropdownzonas.DataBind();
        }

        protected void btncrear_Click(object sender, EventArgs e)
        {
            dispositivo.nombrerout = textnombre.Text;
            dispositivo.userrout = textuser.Text;
            dispositivo.passrout = textpass.Text;
            dispositivo.iprout = textipaddress.Text;
            dispositivo.apirout = textapiport.Text;
            dispositivo.zonarout = int.Parse(dropdownzonas.SelectedValue);
            if (dispositivo.crearequipo()) {

            } else {
            }
        }
    }
}