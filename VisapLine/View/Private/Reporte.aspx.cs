using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;

namespace VisapLine.View.Private
{
    public partial class Reporte : System.Web.UI.Page
    {
        reporte report = new reporte();
        DataTable data = new DataTable();
        static string casos;
        static string fecha1;
        static string fecha2;
        static string estad;
        static string sald;
        static string barr;
        static string pla;
        static string tip;
        static string metenvio;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BUSCAR_ServerClick(object sender, EventArgs e)
        {
            casos = Validar.ConvertVarchar(caso.SelectedValue);
            fecha1 = Validar.ConvertDate(fechainicio.Text);
            fecha2 = Validar.ConvertDate(fechafin.Text);
            estad = Validar.ConvertVarchar(estado.SelectedValue);
            sald = Validar.ConvertNumber(saldo.Text);
            barr = Validar.ConvertNumber(barrio.SelectedValue);
            pla = Validar.ConvertVarchar(plan.SelectedValue);
            tip = Validar.ConvertVarchar(tipo.SelectedValue);
            metenvio = Validar.ConvertVarchar(methenvio.SelectedValue);
            data = report.ConsultaAvanzada(casos, fecha1, fecha2, estad, sald, barr, pla,tip,metenvio);
            repetidors.DataSource = data;
            repetidors.DataBind();
        }
    }
}