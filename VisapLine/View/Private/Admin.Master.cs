using System;
using System.Collections.Generic;
using System.Data;
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
            try
            {
                if (Session["tercero"] != null && Session["roles"] != null)
                {

                    if (!IsPostBack)
                    {
                        DataTable listroels = (DataTable)Session["roles"];
                        listRoles.DataSource = listroels;
                        listRoles.DataValueField = "idrol";
                        listRoles.DataTextField = "rol";
                        listRoles.DataBind();

                        if (Session["idrol"] == null)
                        {
                            listRoles.SelectedIndex = 0;
                            Session["idrol"] = listRoles.SelectedValue;
                        }
                        listRoles.SelectedValue = Session["idrol"].ToString();
                    }
                    CargarMenu(Session["idrol"].ToString());
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void Salir(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/View/Login/login.aspx");
        }

        protected void listRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["idrol"] = listRoles.SelectedValue;
            CargarMenu(Session["idrol"].ToString());
        }
        public void CargarMenu(string idrol)
        {
            menu.InnerHtml = "";

        }
    }
}