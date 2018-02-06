using System;
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
    public partial class RegistroTerceros : System.Web.UI.Page
    {
        Terceros terc = new Terceros();
        TipoTercero ttr = new TipoTercero();
        Pais pais = new Pais();
        Departamento depart = new Departamento();
        Municipio munic = new Municipio();
        Barrios barr = new Barrios();
        TipoFactura tpfact = new TipoFactura();
        TipoResidencia tpres = new TipoResidencia();
        TipoDoc tpdoc = new TipoDoc();
        Telefono tlf = new Telefono();
        CargoTercero ctg = new CargoTercero();
        static DataTable listtelefono = new DataTable();
        static DataTable listtelefonocorpo = new DataTable();
        static DataTable listtelefonoempre = new DataTable();
        static DataTable listsucursalcorpo = new DataTable();
        static DataTable listsucursalempre = new DataTable();
        Plan pn = new Plan();
        TipoContrato tpoc = new TipoContrato();
        Sucursal scsal = new Sucursal();
        Contrato contrat = new Contrato();
        string idplancontr;
        protected void Page_Load(object sender, EventArgs e)
        {



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                DataRow datcont = Validar.Consulta(terc.ConsultarPersonaIdenti(texboxdni.Text)).Rows[0];
                if (datcont["nombre"].ToString() == "")
                {


                }
                else
                {

                    Response.Redirect("Form2.aspx?key=" + datcont["identificacion"].ToString());
                }

            }
            catch (Exception ex)
            {
                tipotercero.DataSource = ttr.ConsultarTipoTercero();
                tipotercero.DataTextField = "tipoterceros";
                tipotercero.DataValueField = "idtipotercero";
                tipotercero.DataBind();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "nocontro();", true);
                tipopersona.Visible = true;

            }
        }

        protected void tipotercero_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargardiv();
        }

        protected void cargardiv()
        {
            if (tipotercero.SelectedItem.Text == "ESPECIAL")
            {
                //iddivnatural.Visible = false;
                //iddivcorporativo.Visible = false;
      

            }
            else
            {
                if (tipotercero.SelectedItem.Text == "NATURAL")
                {
                    //iddivcorporativo.Visible = false;
                    iddivnatural.Visible = true;
      
                }
                else
                {
                    if (tipotercero.SelectedItem.Text == "CORPORATIVO")
                    {
                   
                        //    iddivcorporativo.Visible = true;
                        //    iddivnatural.Visible = false;
                    }
                }
            }
        }

        protected void textboxtelefonoplus_Click(object sender, EventArgs e)
        {

        }

        protected void telefonos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void telefonos_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void DropDownListpais_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownListdepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownListmunicipio_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}

