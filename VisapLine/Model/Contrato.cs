﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Contrato
    {
        IData data = new Data();
        public string idcontrato { get; set; }
        public string terceros_idterceros { get; set; }
        public string codigo { get; set; }
        public string fechacontrato { get; set; }
        public string fechaactivacion { get; set; }
        public string fechafacturacion { get; set; }
        public string estado { get; set; }
        public string tipocontrato_idtipocontrato { get; set; }
        public string plan_idplan { get; set; }
        public string iva { get; set; }
        public string correo { get; set; }
        public string enviofactura { get; set; }
        public string facturaunica { get; set; }
        public string personal_idpersonal { get; set; }

        public string sucursal_idsucursal { get; set; }

        public string observaciondirec { get; set; }

        public string direccionenviofact { get; set; }

        public string barrio_idbarrio { get; set; }
        public string observacion { get; set; }
        public string wifi { get; set; }
        public string descuento { get; set; }


        public DataTable estratoymegas(int contrato){
            return data.ConsultarDatos("select plan.subida,terceros.estrato from contrato inner join terceros on terceros_idterceros_cont=idterceros inner join plan on plan_idplan = idplan where idcontrato="+ contrato + "");
        }
        public DataTable ConsultarContratoIdTercero(Contrato cont)
        {
            return data.ConsultarDatos("select * from pr_consultarcontratoidallter('"+cont.terceros_idterceros+"')");
        }

        public DataTable RegistrarContrato(Contrato cont)
        {
            return data.ConsultarDatos("select * from pr_insertarcontrato('" + cont.terceros_idterceros+"','"+cont.codigo+"','"+cont.fechacontrato+"','"+cont.fechafacturacion+ "','" + cont.estado + "','" + cont.tipocontrato_idtipocontrato+"','"+cont.plan_idplan+"','"+cont.iva+"','"+cont.enviofactura+"','"+cont.facturaunica+"','"+cont.personal_idpersonal+"',"+cont.sucursal_idsucursal+",'"+cont.observaciondirec+"','"+cont.direccionenviofact+"','"+cont.barrio_idbarrio+"','"+cont.wifi+"')");
        }

        public DataTable consultadeserciciodeplancontratado(int contrato) {
            return data.ConsultarDatos("select * from pr_consultarserviciosdelplancontratado("+ contrato + ")");
        }
        
        public DataTable ConsultarContratoidtercero(Contrato cont)
        {
            return data.ConsultarDatos("select * from pr_consultarcontratoidallter("+cont.terceros_idterceros+")");
        }
        public DataTable ConsultarContratoidcontrato(Contrato cont)
        {
            return data.ConsultarDatos("select * from pr_consultarcontratoidall(" + cont.idcontrato + ")");
        }

        public bool insertpruebaconexion()
        {
            return data.OperarDatos("select * from pr_insertarpruebaconexion('varaaaada','aedewdqw',123122)");

        }
        public DataTable ConsultarContratocodigo(Contrato cont)
        {
            return data.ConsultarDatos("select * from pr_consultarcontratoidallcodigo(" + cont.codigo + ")");
        }

        public bool updatecontrato(Contrato cont)
        {
            return data.OperarDatos("Select * from pr_actualizarcontrato('"+cont.idcontrato+"','"+cont.estado+"','"+cont.tipocontrato_idtipocontrato+"','"+cont.plan_idplan+"','"+cont.iva+"','"+cont.direccionenviofact+"','"+cont.enviofactura+"','"+cont.facturaunica+"','"+cont.observacion+"','"+cont.descuento+ "','" + cont.barrio_idbarrio + "','" + cont.wifi + "')");
        }

        public DataTable ConsultarContratolistado()
        {
            return data.ConsultarDatos("select* from pr_consultarcontratolistado()");
        }
        public DataTable ConsultarContratosmes()
        {
            return data.ConsultarDatos("select * From pr_consultarcontratosmes()");
        }
        public DataTable Consultarultimocodigo()
        {
            return data.ConsultarDatos("select * from pr_consultarultimocontrat()");
        }
        public DataTable Consultarusarioactivos()
        {
            return data.ConsultarDatos("  select * from pr_consultarcontratossactivos()");

        }

        public DataTable Consultarestodoscontratos()
        {
            return data.ConsultarDatos("select * from pr_consultarestadoscontratos()");

        }
        public bool ActaulizarFechaActivacion(string idcontrat,string fecha, string caso)
        {
            return data.OperarDatos("select * from pr_actualizarprorateo("+idcontrat+",'"+fecha+"',"+caso+")");
        }
       
    }
}