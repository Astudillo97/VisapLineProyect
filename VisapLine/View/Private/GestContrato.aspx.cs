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


        protected void Page_Load(object sender, EventArgs e)
        {



        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            //for (int i = 0; i < 10000; i++)
            //{
            //    contrat.insertpruebaconexion();
            //}


            DataRow dat = Validar.Consulta(terc.ConsultarPersonaIdenti(texboxdni.Text)).Rows[0];
            DataRow datcont = Validar.Consulta(terc.ConsultarPersonaIdenti(dat["idterceros"].ToString())).Rows[0];

   

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cargartabla()
        {

        }
    }
}