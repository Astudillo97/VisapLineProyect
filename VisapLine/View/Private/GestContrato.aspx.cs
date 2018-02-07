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
        string wifi;

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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "nocontro();", true);
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
            ButtonGuardar.Visible = true;

            GridViewRow gridw = GridView1.SelectedRow;
            TextBox1identificacion.Text = gridw.Cells[2].Text;
            contrat.codigo = gridw.Cells[1].Text;
            dt = Validar.Consulta(contrat.ConsultarContratocodigo(contrat)).Rows[0];
            DropDownListestadocontrato.Text = dt["estadoc"].ToString();

            Labelidcontrato.Text = dt["idcontrato"].ToString();
            LabelNumcontra.Text = dt["codigo"].ToString();
            DropDownListplancontrato.DataSource = pn.ConsultarPlan();
            DropDownListplancontrato.DataTextField = "detalle";
            DropDownListplancontrato.DataValueField = "idplan";
            DropDownListplancontrato.DataBind();


            DropDownListtipocontrato.DataSource = tpcont.ConsultarTipoContrato();
            DropDownListtipocontrato.DataTextField = "Tipocontrato";
            DropDownListtipocontrato.DataValueField = "idtipocontrato";
            DropDownListtipocontrato.DataBind();



            barr.idbarrios = dt["idbarrios"].ToString();
            DataRow barri = Validar.Consulta(barr.ConsultarTodoporBarrio(barr)).Rows[0];
            barr.muninicio_idmunicipio = barri["municipio_idmunicipio"].ToString();

            DropDownList1.DataSource = Validar.Consulta(barr.ConsultarBarriosIdMunicipio(barr));
            DropDownList1.DataTextField = "barrios";
            DropDownList1.DataValueField = "idbarrios";
            DropDownList1.DataBind();

            DropDownListplancontrato.SelectedValue = dt["idplan"].ToString();
            DropDownListtipocontrato.Text = dt["idtipocontrato"].ToString();
            TextArea1.Value = dt["direnviofactura"].ToString();
            DropDownListenviofactura.Text = dt["enviofactura"].ToString();
            DropDownList1facuracuni.Text = dt["facturaunica"].ToString();
            DropDownList1.Text = dt["idbarrios"].ToString();
            TextBoxivacontrato.Text = dt["iva"].ToString();
            TextArea2.Value = dt["observacion"].ToString();
            wifi = dt["wifi"].ToString();
            if (wifi == "True")
            {
                DropDownList3.Text = "SI";
            }
            else
            {
                if (wifi == "False")
                {
                    DropDownList3.Text = "NO";
                }
            }
            DropDownList2.Text = dt["descuento"].ToString();



        }


        protected void ButtonGuardar_Click(object sender, EventArgs e)
        {

            try
            {
                contrat.idcontrato = Validar.validarlleno(Labelidcontrato.Text);
                contrat.estado = Validar.validarselected(DropDownListestadocontrato.Text);
                contrat.plan_idplan = Validar.validarselected(DropDownListplancontrato.SelectedValue);
                contrat.tipocontrato_idtipocontrato = Validar.validarselected(DropDownListtipocontrato.SelectedValue);
                contrat.direccionenviofact = Validar.validarlleno(TextArea1.Value.ToUpper());
                contrat.enviofactura = Validar.validarselected(DropDownListenviofactura.Text);
                contrat.facturaunica = Validar.validarselected(DropDownList1facuracuni.Text);

                contrat.barrio_idbarrio = Validar.validarselected(DropDownList1.SelectedValue);
                contrat.iva = Validar.validarlleno(TextBoxivacontrato.Text);
                contrat.observacion = Validar.validarlleno(TextArea2.Value.ToUpper());
                contrat.descuento = Validar.validarselected(DropDownList2.Text);
                Validar.validarselected(DropDownList3.Text);
                if (DropDownList3.Text == "SI")
                {
                    wifi = "true";
                }
                else
                {
                    if (DropDownList3.Text == "NO")
                    {
                        wifi = "false";
                    }
                }

                contrat.wifi = Validar.validarlleno(wifi);
                Validar.validartrue(contrat.updatecontrato(contrat));

                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert();", true);


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
            TextArea1.Disabled = false;
            DropDownListenviofactura.Enabled = true;
            DropDownList1facuracuni.Enabled = true;
            DropDownList1.Enabled = true;
            TextBoxivacontrato.Enabled = true;
            Buttoncancelar.Enabled = true;
            ButtonGuardar.Enabled = true;
            DropDownListestadocontrato.Enabled = true;
            DropDownList2.Enabled = true;
            TextArea2.Disabled = false;
            DropDownList3.Enabled = true;
            Buttoneditar.Enabled = false;
            Buttonservicio.Visible = true;
        }

        protected void Buttoncancelar_Click(object sender, EventArgs e)
        {
            DropDownListplancontrato.Enabled = false;
            DropDownListtipocontrato.Enabled = false;
            TextArea1.Disabled = true;
            DropDownListenviofactura.Enabled = false;
            DropDownList1facuracuni.Enabled = false;
            DropDownList1.Enabled = false;
            TextBoxivacontrato.Enabled = false;
            Buttoncancelar.Enabled = false;
            Buttoneditar.Enabled = true;
            ButtonGuardar.Enabled = false;
            DropDownListestadocontrato.Enabled = false;
            TextArea2.Disabled = true;
            DropDownList3.Enabled = false;
            DropDownList2.Enabled = false;
            Buttoneditar.Enabled = true;
        }

        protected void Buttonservicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("servicio.aspx?key=" + Labelidcontrato.Text);
        }




    }
}