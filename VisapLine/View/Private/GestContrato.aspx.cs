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
        Permisos per = new Permisos();
        string idcontrato;
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
            if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
            {
                if (!IsPostBack)
                {
                    idcontrato = Convert.ToString(Request.QueryString["iCnt"]);
                    if (idcontrato != null)
                    {
                        buscador.Visible = false;
                        divtablagestcontr.Visible = false;
                        ideditarcontrat.Visible = true;
                        cargardatos(idcontrato);
                        cargarplanes();

                    }
                    string valor = Convert.ToString(Request.QueryString["key"]);
                    if (valor == "SI")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "gestdeletealert();", true);
                        valor = "";
                    }




                }
            }
            else
            {
                Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //for (int i = 0; i < 10000; i++)
            //{
            //    contrat.insertpruebaconexion();
            //}
            try
            {
                terc.identificacion = texboxdni.Text;
                DataRow dat = Validar.Consulta(terc.ConsultarTerceroDos(terc)).Rows[0];
                contrat.terceros_idterceros = dat["idterceros"].ToString();
                DataTable datcont = Validar.Consulta(contrat.ConsultarContratoIdTercero(contrat));
                GridView1.DataSource = datcont;
                GridView1.DataBind();
                divtablagestcontr.Visible = true;
                cargarplanes();



            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "nocontro();", true);
            }
        }
        protected void cargarplanes()
        {
            DropDownListplanes.DataSource = pn.ConsultarPlanconca();
            DropDownListplanes.DataTextField = "vardetalle";
          
            DropDownListplanes.DataValueField = "varidplan";
            DropDownListplanes.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
        protected void cargardatos(string idcon)
        {
            contrat.codigo = idcon;
            dt = Validar.Consulta(contrat.ConsultarContratocodigo(contrat)).Rows[0];
            DropDownListestadocontrato.Text = dt["estadoc"].ToString();
            terc.idterceros = dt["terceros_idterceros_cont"].ToString();
            DataRow tercerosnombre = Validar.Consulta(terc.ConsultarTercerosId(terc)).Rows[0];
            TextBox1identificacion.Text = tercerosnombre["nombre"].ToString();
            Labelidcontrato.Text = dt["idcontrato"].ToString();
            LabelNumcontra.Text = dt["codigo"].ToString();
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


            DropDownListtipocontrato.Text = dt["idtipocontrato"].ToString();
            TextArea1.Value = dt["direnviofactura"].ToString();
            DropDownListenviofactura.Text = dt["enviofactura"].ToString();
            DropDownList1facuracuni.Text = dt["facturaunica"].ToString();
            DropDownList1.Text = dt["idbarrios"].ToString();
            TextBoxivacontrato.Text = dt["iva"].ToString();
            TextArea2.Value = dt["observacion"].ToString();
            DropDownListplanes.SelectedValue = dt["idplan"].ToString();
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



            ideditarcontrat.Visible = true;
            Buttoneditar.Visible = true;
            Buttoncancelar.Visible = true;
            ButtonGuardar.Visible = true;
            try
            {
                TextBox1.Text = dt["descuento"].ToString();
            }
            catch (Exception)
            {

            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridViewRow gridw = GridView1.SelectedRow;
                TextBox1identificacion.Text = gridw.Cells[2].Text;
                contrat.codigo = gridw.Cells[1].Text;
                dt = Validar.Consulta(contrat.ConsultarContratocodigo(contrat)).Rows[0];
                DropDownListestadocontrato.Text = dt["estadoc"].ToString();

                Labelidcontrato.Text = dt["idcontrato"].ToString();
                LabelNumcontra.Text = dt["codigo"].ToString();
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


                DropDownListtipocontrato.Text = dt["idtipocontrato"].ToString();
                TextArea1.Value = dt["direnviofactura"].ToString();
                DropDownListenviofactura.Text = dt["enviofactura"].ToString();
                DropDownList1facuracuni.Text = dt["facturaunica"].ToString();
                DropDownList1.Text = dt["idbarrios"].ToString();
                TextBoxivacontrato.Text = dt["iva"].ToString();
                TextArea2.Value = dt["observacion"].ToString();
                DropDownListplanes.SelectedValue = dt["idplan"].ToString();
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

                ideditarcontrat.Visible = true;
                Buttoneditar.Visible = true;
                Buttoncancelar.Visible = true;
                ButtonGuardar.Visible = true;
                try
                {
                    TextBox1.Text = dt["descuento"].ToString();
                }
                catch (Exception)
                {

                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "errordatos();", true);

            }






        }


        protected void ButtonGuardar_Click(object sender, EventArgs e)
        {

            try
            {
                contrat.idcontrato = Validar.validarlleno(Labelidcontrato.Text);
                contrat.estado = Validar.validarselected(DropDownListestadocontrato.Text);

                contrat.tipocontrato_idtipocontrato = Validar.validarselected(DropDownListtipocontrato.SelectedValue);
                contrat.direccionenviofact = Validar.validarlleno(TextArea1.Value.ToUpper());
                contrat.enviofactura = Validar.validarselected(DropDownListenviofactura.Text);
                contrat.facturaunica = Validar.validarselected(DropDownList1facuracuni.Text);

                contrat.barrio_idbarrio = Validar.validarselected(DropDownList1.SelectedValue);
                contrat.iva = Validar.validarlleno(TextBoxivacontrato.Text);
                contrat.observacion = TextArea2.Value.ToUpper();
                contrat.descuento = TextBox1.Text;
                contrat.plan_idplan = Validar.validarselected(DropDownListplanes.SelectedValue);
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

                if (Validar.validartrue(contrat.updatecontrato(contrat)))
                {
                    string guardar = "SI";
                    Response.Redirect("gestcontrato.aspx?key=" + guardar);

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert();", true);


                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "nocontro();", true);


                }

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
            DropDownListtipocontrato.Enabled = true;
            TextArea1.Disabled = false;
            DropDownListenviofactura.Enabled = true;
            DropDownList1facuracuni.Enabled = true;
            DropDownList1.Enabled = true;
            TextBoxivacontrato.Enabled = true;
            Buttoncancelar.Enabled = true;
            ButtonGuardar.Enabled = true;
            DropDownListplanes.Enabled = true;
            DropDownListestadocontrato.Enabled = true;
            TextBox1.Enabled = true;
            TextArea2.Disabled = false;
            DropDownList3.Enabled = true;
            Buttoneditar.Enabled = false;
            Buttonservicio.Visible = true;
        }

        protected void Buttoncancelar_Click(object sender, EventArgs e)
        {
            DropDownListplanes.Enabled = false;
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
            TextBox1.Enabled = false;
            Buttoneditar.Enabled = true;
        }

        protected void Buttonservicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("servicio.aspx?key=" + Labelidcontrato.Text);
        }




    }
}