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
    public partial class GestContrato : System.Web.UI.Page
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
        Plan pn = new Plan();
        TipoContrato tpoc = new TipoContrato();
        Sucursal scsal = new Sucursal();
        Contrato contrat = new Contrato();
        TipoContrato tpcont = new TipoContrato();
        DataRow dt;

        protected void Page_Load(object sender, EventArgs e)
        {
       

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            //for (int i = 0; i < 10000; i++)
            //{
            //    contrat.insertpruebaconexion();
            //}
            try
            {

                DataRow dat = Validar.Consulta(terc.ConsultarPersonaIdenti(texboxdni.Text)).Rows[0];
                contrat.terceros_idterceros = dat["idterceros"].ToString();
                DataTable datcont = Validar.Consulta(contrat.ConsultarContratoIdTercero(contrat));
                GridView1.DataSource = datcont;
                GridView1.DataBind();
                divtablagestcontr.Visible = true;

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ideditarcontrat.Visible = true;
            Buttoneditar.Visible = true;
            Buttoncancelar.Visible = true;
            Buttonmodal.Visible = true;
            GridViewRow gridw = GridView1.SelectedRow;
            TextBox1identificacion.Text = gridw.Cells[2].Text;
            contrat.codigo = gridw.Cells[1].Text;
            dt = Validar.Consulta(contrat.ConsultarContratocodigo(contrat)).Rows[0];
            DropDownListestadocontrato.Text = dt["estadoc"].ToString();

            Labelidcontrato.Text = dt["idcontrato"].ToString();

            DropDownListplancontrato.DataSource = pn.ConsultarPlan();
            DropDownListplancontrato.DataTextField = "detalle";
            DropDownListplancontrato.DataValueField = "idplan";
            DropDownListplancontrato.DataBind();


            DropDownListtipocontrato.DataSource = tpcont.ConsultarTipoContrato();
            DropDownListtipocontrato.DataTextField = "Tipocontrato";
            DropDownListtipocontrato.DataValueField = "idtipocontrato";
            DropDownListtipocontrato.DataBind();

            Sucursal.DataSource = scsal.Consultarsucursal(dt["terceros_idterceros_cont"].ToString());
            Sucursal.DataTextField = "nombre";
            Sucursal.DataValueField = "idsucursal";
            Sucursal.DataBind();




            barr.idbarrios = dt["idbarrios"].ToString();
            DataRow barri = Validar.Consulta(barr.ConsultarTodoporBarrio(barr)).Rows[0];
            barr.muninicio_idmunicipio = barri["municipio_idmunicipio"].ToString();

            DropDownList1.DataSource = Validar.Consulta(barr.ConsultarBarriosIdMunicipio(barr));
            DropDownList1.DataTextField = "barrios";
            DropDownList1.DataValueField = "idbarrios";
            DropDownList1.DataBind();

            DropDownListplancontrato.SelectedValue = dt["idplan"].ToString();
            DropDownListtipocontrato.Text = dt["idtipocontrato"].ToString();
            TextBoxdirreccionenvio.Text = dt["direnviofactura"].ToString();
            DropDownListenviofactura.Text = dt["enviofactura"].ToString();
            DropDownList1facuracuni.Text = dt["facturaunica"].ToString();
            Sucursal.SelectedValue = dt["idsucursal"].ToString();
            DropDownList1.Text = dt["idbarrios"].ToString();
            TextBoxivacontrato.Text = dt["iva"].ToString();




        }


        protected void ButtonGuardar_Click(object sender, EventArgs e)
        {

            try
            {
                contrat.idcontrato = Labelidcontrato.Text;
                contrat.estado = DropDownListestadocontrato.Text;
                contrat.plan_idplan = DropDownListplancontrato.SelectedValue;
                contrat.tipocontrato_idtipocontrato = DropDownListtipocontrato.SelectedValue;
                contrat.direccionenviofact = TextBoxdirreccionenvio.Text.ToUpper();
                contrat.enviofactura = DropDownListenviofactura.Text;
                contrat.facturaunica = DropDownList1facuracuni.Text;
                contrat.sucursal_idsucursal = Sucursal.SelectedValue;
                contrat.barrio_idbarrio = DropDownList1.SelectedValue;
                contrat.iva = TextBoxivacontrato.Text;
                Validar.validartrue(contrat.updatecontrato(contrat));
                Response.Redirect("GestContrato.aspx");
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }


        }

        protected void Buttoneditar_Click(object sender, EventArgs e)
        {
            DropDownListplancontrato.Enabled = true;
            DropDownListtipocontrato.Enabled = true;
            TextBoxdirreccionenvio.Enabled = true;
            DropDownListenviofactura.Enabled = true;
            DropDownList1facuracuni.Enabled = true;
            Sucursal.Enabled = true;
            DropDownList1.Enabled = true;
            TextBoxivacontrato.Enabled = true;
            Buttoncancelar.Enabled = true;
            Buttoneditar.Enabled = false;
            Buttonmodal.Enabled = true;
            DropDownListestadocontrato.Enabled = true;


        }

        protected void Buttoncancelar_Click(object sender, EventArgs e)
        {
            DropDownListplancontrato.Enabled = false;
            DropDownListtipocontrato.Enabled = false;
            TextBoxdirreccionenvio.Enabled = false;
            DropDownListenviofactura.Enabled = false;
            DropDownList1facuracuni.Enabled = false;
            Sucursal.Enabled = false;
            DropDownList1.Enabled = false;
            TextBoxivacontrato.Enabled = false;
            Buttoncancelar.Enabled = false;
            Buttoneditar.Enabled = true;
            ButtonGuardar.Enabled = false;
            DropDownListestadocontrato.Enabled = false;


        }



        protected void Buttonmodal_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "", "botonmodalgesti();", true);
        }


    }
}