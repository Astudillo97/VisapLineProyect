﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;

namespace VisapLine.View.Private
{
    public partial class GestCaja : System.Web.UI.Page
    {
        Egreso eg = new Egreso();
        Ingreso ig = new Ingreso();
        Permisos per = new Permisos();
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
            if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
            {
                if (!IsPostBack)
                {
                    string valor = Convert.ToString(Request.QueryString["key"]);
                    if (valor == null)
                    {
                        Response.Redirect("pagcaja.aspx");
                    }
                    else
                    {
                        try
                        {
                            ig.caja_idcaja_egre = valor;
                            DataTable dtig = Validar.Consulta(ig.consultaringresos(ig));
                            GridView1.DataSource = dtig;
                            GridView1.DataBind();
                        }
                        catch (Exception)
                        {
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
                        }

                        try
                        {
                            eg.caja_idcaja_egre = valor;
                            DataTable dteg = Validar.Consulta(eg.consultaregresos(eg));
                            GridView2.DataSource = dteg;
                            GridView2.DataBind();
                        }
                        catch (Exception)
                        {

                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}