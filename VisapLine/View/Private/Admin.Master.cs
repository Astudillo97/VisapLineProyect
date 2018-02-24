using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using VisapLine.Model;
using System.Web.Script.Serialization;
using System.Web.Services;
namespace VisapLine.View.Private
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        Model.Menu men = new Model.Menu();
        Permisos perm = new Permisos();
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
                else
                {
                    Response.Redirect("../Login/login.aspx");
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
            menu.Controls.Clear();
            CargarMenu(Session["idrol"].ToString());
            Response.Redirect("index.aspx");
        }
        public void CargarMenu(string idrol)
        {
            try
            {

                DataTable permisos = perm.ConsultarRolPermisos(idrol);
                foreach (DataRow item in permisos.Rows)
                {
                    HtmlGenericControl li = new HtmlGenericControl("li");
                    if (!item["href"].ToString().Equals(""))
                    {
                        HtmlAnchor a = new HtmlAnchor();
                        a.HRef = item["href"].ToString();
                        HtmlGenericControl i = new HtmlGenericControl("i");
                        i.Attributes.Add("class", item["icono"].ToString());
                        HtmlGenericControl span = new HtmlGenericControl("span");
                        span.InnerHtml = item["nombre"].ToString();
                        HtmlGenericControl span1 = new HtmlGenericControl("span");
                        span1.Attributes.Add("class", "pull-right-container");
                        HtmlGenericControl i1 = new HtmlGenericControl("i");
                        i1.Attributes.Add("class", "fa fa-angle-left pull-right");
                        span1.Controls.Add(i1);
                        a.Controls.Add(i);
                        a.Controls.Add(span);
                        a.Controls.Add(span1);
                        li.Controls.Add(a);
                    }
                    else
                    {
                        HtmlAnchor a = new HtmlAnchor();
                        a.HRef = "#";
                        HtmlGenericControl i = new HtmlGenericControl("i");
                        i.Attributes.Add("class", item["icono"].ToString());
                        HtmlGenericControl span = new HtmlGenericControl("span");
                        span.InnerHtml = item["nombre"].ToString();
                        HtmlGenericControl span1 = new HtmlGenericControl("span");
                        span1.Attributes.Add("class", "pull-right-container");
                        HtmlGenericControl i1 = new HtmlGenericControl("i");
                        i1.Attributes.Add("class", "fa fa-angle-left pull-right");
                        span1.Controls.Add(i1);
                        a.Controls.Add(i);
                        a.Controls.Add(span);
                        a.Controls.Add(span1);
                        li.Controls.Add(a);
                        HtmlGenericControl ul = new HtmlGenericControl("ul");
                        ul.Attributes.Add("class", "treeview-menu");
                        li.Attributes.Add("class", "treeview");
                        men.menu_idmenusub = item["idmenu"].ToString();
                        DataTable submenus = men.ConsultarMenuSubmenu(men);
                        foreach (DataRow item1 in submenus.Rows)
                        {
                            HtmlGenericControl li1 = new HtmlGenericControl("li");
                            HtmlAnchor a1 = new HtmlAnchor();
                            a1.HRef = item1["href"].ToString();
                            a1.InnerHtml= item1["nombre"].ToString();
                            li1.Controls.Add(a1);
                            ul.Controls.Add(li1);
                        }
                        li.Controls.Add(ul);
                    }
                    menu.Controls.Add(li);
                }
            }
            catch (Exception ex)
            {

            }
        }
     
    }
}